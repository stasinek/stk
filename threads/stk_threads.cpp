//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#pragma hdrstop
#include "./../mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_threads.h"
//---------------------------------------------------------------------------
volatile int32_t stk::thread::__barier = 0, stk::thread::__barier_locker = 0;
//---------------------------------------------------------------------------

int __stdcall stk::thread::ssthread_arg_wrapper_t::request(char a_setget, int a_request_command, time_t a_request_time)
{
    static int *request_command;
    static time_t *request_time;
    static int request_count;
    if (a_setget=='s') {}
    if (a_setget=='g') {}
    return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::thread::cmpxchg4(int32_t *addr, int32_t o, int32_t n)
{
        int32_t was = *addr;
        if (was == o) *addr = n;
        return was;
    }
//---------------------------------------------------------------------------

int64_t __stdcall stk::thread::cmpxchg8(int64_t *addr, int64_t o, int64_t n)
{
        int64_t was = *addr;
        if (was == o) *addr = n;
        return was;
    }
//---------------------------------------------------------------------------

unsigned long __stdcall stk::thread::this_id(void)
{
#if defined(__WIN32__)
unsigned long r = ::GetCurrentThreadId();
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

void __stdcall stk::thread::quit(unsigned long a_exitcode)
{
#if defined(__WIN32__)
::ExitThread(a_exitcode);
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

bool __stdcall stk::thread::yeld(void)
{
#if defined(__WIN32__)
unsigned long r = ::SwitchToThread();
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

unsigned long __stdcall stk::thread::onexit_common(void *a_arg)
{
#if defined(__WIN32__)
//miejsce dla desruktorow utworzonych dodatkowych obiektow przy inicjalizacji?
::CloseHandle((HANDLE)a_arg);
return 0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

bool __stdcall stk::thread::create(struct ssthread_t *a_thread, ssthread_routine_t a_func,void *a_func_arg)
{
#if defined(__WIN32__)
a_thread->func = a_func;
a_thread->func_arg = a_func_arg;
a_thread->onexit = NULL;
a_thread->onexit_arg = NULL;
a_thread->attr.detached = false;
a_thread->attr.terminated = false;
a_thread->attr.active = false;
a_thread->handle = (void*)::CreateThread(NULL,0,a_func,a_func_arg,CREATE_SUSPENDED,&(a_thread->id));
if (a_thread->handle==NULL)
return false;
else return true;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

bool __stdcall stk::thread::run(struct ssthread_t *a_thread)
{
#if defined(__WIN32__)
if (a_thread->handle==NULL || a_thread->attr.detached==true)
return false;
unsigned long r = ::ResumeThread(a_thread->handle)!=0xFFFFFFFF;
a_thread->attr.active = r;
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

bool __stdcall stk::thread::suspend(struct ssthread_t *a_thread)
{
#if defined(__WIN32__)
if (a_thread->handle==NULL || a_thread->attr.detached==true)
return false;
unsigned long r = ::SuspendThread(a_thread->handle)!=0xFFFFFFFF;
a_thread->attr.active = !r;
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

bool __stdcall stk::thread::terminate(struct ssthread_t *a_thread,unsigned long a_exitcode)
{
#if defined(__WIN32__)
// TODO sprawdzenie czy on jeszcze pracuje czy byl juz terminated
if (a_thread->handle==NULL || a_thread->attr.detached==true)
return false;
if (a_thread->attr.terminated==true)
return true;
bool r =  ::TerminateThread(a_thread->handle, a_exitcode)!=0;
if (r==true) {
    if (::GetExitCodeThread(a_thread->handle,&a_exitcode) ? a_exitcode==STILL_ACTIVE : false)
        ::WaitForSingleObject(a_thread->handle, INFINITE);
    else return false;
    a_thread->attr.terminated = true;
    a_thread->attr.active = false;
    if (a_thread->onexit!=NULL) a_thread->onexit(a_thread->onexit_arg);
    onexit_common(a_thread->handle);
}
return r;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

unsigned long __stdcall stk::thread::id(struct ssthread_t *a_thread)
{
#if defined(__WIN32__)
if (a_thread->handle==NULL) return 0;
return a_thread->id;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

bool __stdcall stk::thread::active(struct ssthread_t *a_thread)
{
#if defined(__WIN32__)
unsigned long r;
if (a_thread->handle==NULL)
return false;
if (a_thread->attr.active==false)
return false;
if (a_thread->attr.terminated==false && a_thread->attr.detached==false) {
    if (::GetExitCodeThread(a_thread->handle,&r))
    if (r==STILL_ACTIVE) {
        a_thread->attr.active = true;
        return true;
       }
   }
#else
// POSIX thread
#endif
a_thread->attr.active = false;
return false;
}
//---------------------------------------------------------------------------

bool __stdcall stk::thread::joinable(struct stk::thread::ssthread_t *a_thread)
{
#if defined(__WIN32__)
if (id(a_thread)!=::stk::thread::this_id())
return stk::thread::active(a_thread);
#else
// POSIX thread
#endif
return false;
}
//---------------------------------------------------------------------------

void __stdcall stk::thread::join(struct stk::thread::ssthread_t *a_thread)
{
#if defined(__WIN32__)
if (a_thread->handle==NULL)
return;
if (a_thread->attr.terminated==false && a_thread->attr.detached==false) {
    if (::WaitForSingleObject(a_thread->handle, INFINITE))
        a_thread->attr.active = false;
    if (a_thread->onexit!=NULL) a_thread->onexit(a_thread->onexit_arg);
        onexit_common(a_thread->handle);
}
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

void __stdcall stk::thread::detach(struct stk::thread::ssthread_t *a_thread)
{
#if defined(__WIN32__)
// TODO.. wymaga sprawdzenia o co kaman w detach() z std::thread
// w C++11 nie istnieje attach() z tego wynika ze gdy wywolywacz konczy zywot struktura thread ulega zniszczeniu ale uchwyt i jego dzialanie powinien byæ nietkniety
// Zatem powinna istnieæ funkcja attach/open podobna do create ktora jest w stanie na podstawie ID lub uchwytu odtworzyæ informacje o watku i uaktywniæ join() na jego podstawie
if (a_thread->handle==NULL)
return;
a_thread->attr.detached = true;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------

void __stdcall stk::thread::onexit(struct stk::thread::ssthread_t *a_thread,ssthread_routine_t a_onexit,void *a_onexit_arg)
{
ATOMIC(1)
ATOMIC_LOCK(1)
#if defined(__WIN32__)
assert(a_onexit!=NULL);
a_thread->onexit = a_onexit;
a_thread->onexit_arg = a_onexit_arg;
#else
// POSIX thread
#endif
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------
