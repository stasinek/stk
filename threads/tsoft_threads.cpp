//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_threads.h"
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
__int32 __stdcall ts::thread::cmpxchg4(__int32 *addr, __int32 o, __int32 n) {
	    __int32 was = *addr;
	    if (was == o) *addr = n;
	    return was;
	}
//---------------------------------------------------------------------------
__int64 __stdcall ts::thread::cmpxchg8(__int64 *addr, __int64 o, __int64 n) {
	    __int64 was = *addr;
	    if (was == o) *addr = n;
	    return was;
	}
//---------------------------------------------------------------------------
unsigned long __stdcall ts::this_thread::get_id(void) {
#if defined(__WIN32__)
unsigned long r = ::GetCurrentThreadId();
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
void __stdcall ts::this_thread::quit(unsigned long a_exitcode) {
#if defined(__WIN32__)
::ExitThread(a_exitcode);
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
bool __stdcall ts::this_thread::yeld(void) {
#if defined(__WIN32__)
unsigned long r = ::SwitchToThread();
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
unsigned long __stdcall ts::thread::onexit_common(void *arg)
{
#if defined(__WIN32__)
//miejsce dla desruktorów utworzonych dodatkowych obiektów przy inicjalizacji?
::CloseHandle((HANDLE)arg);
return 0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
bool __stdcall ts::thread::create(struct ssthread_t *a_thread, ssthread_routine_t a_func,void *a_func_arg) {
#if defined(__WIN32__)
a_thread->func = a_func;
a_thread->func_arg = a_func_arg;
a_thread->onexit = NULL;
a_thread->onexit_arg = NULL;
a_thread->attr.terminated = false;
a_thread->attr.detached = false;
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
bool __stdcall ts::thread::run(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
if (a_thread->handle==NULL)
return false;
unsigned long r = ::ResumeThread(a_thread->handle)!=0xFFFFFFFF;
a_thread->attr.active = r;
return r;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
bool __stdcall ts::thread::suspend(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
if (a_thread->handle==NULL)
return false;
unsigned long r = ::SuspendThread(a_thread->handle)!=0xFFFFFFFF;
a_thread->attr.active = r;
return r;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
bool __stdcall ts::thread::terminate(struct ssthread_t *a_thread,unsigned long a_exitcode) {
#if defined(__WIN32__)
// TODO sprawdzenie czy on jeszcze pracuje czy by³ ju¿ terminated
if (a_thread->handle==NULL)
return false;
if (a_thread->attr.terminated==true) return true;
unsigned long r = ::TerminateThread(a_thread->handle,a_exitcode)!=(long)0xFFFFFFFF;
::WaitForSingleObject(a_thread->handle, INFINITE);
a_thread->attr.active = r;
if (r==true) {
    a_thread->attr.terminated = true;
    if (a_thread->onexit!=NULL) a_thread->onexit(a_thread->onexit_arg);
    onexit_common(a_thread->handle);
}
return r;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
unsigned long __stdcall ts::thread::get_id(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
if (a_thread->handle==NULL) return 0;
return a_thread->id;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
bool __stdcall ts::thread::joinable(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
unsigned long r;
if (a_thread->handle==NULL)
return false;
if (a_thread->attr.terminated==false && a_thread->attr.detached==false && get_id(a_thread)!=::ts::this_thread::get_id()) {
    if (::GetExitCodeThread(a_thread->handle,&r))
        if (r==STILL_ACTIVE) return true;
}
#else
// POSIX thread
#endif
return false;
}
//---------------------------------------------------------------------------
void __stdcall ts::thread::join(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
if (a_thread->handle==NULL)
return;
if (::WaitForSingleObject(a_thread->handle, INFINITE))
    a_thread->attr.active==false;
if (a_thread->attr.terminated==false && a_thread->attr.detached==false) {
    if (a_thread->onexit!=NULL) a_thread->onexit(a_thread->onexit_arg);
    onexit_common(a_thread->handle);
}
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
void __stdcall ts::thread::detach(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
// TODO.. wymaga sprawdzenia o co kaman w detach() z std::thread, jeœli przez to join ma byæ nieaktywne to dobrze
// w takim razie czy istnieje attach by zrobiæ join w innym w¹tku?
// czyli trzeba zapamiêtaæ listê ID w¹tków które wywo³a³y deatch i pomin¹æ join jedynie w nich?
if (a_thread->handle==NULL)
return;
a_thread->attr.detached = true;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
void __stdcall ts::thread::atexit(struct ssthread_t *a_thread,ssthread_routine_t a_onexit,void *a_onexit_arg) {
#if defined(__WIN32__)
assert(a_onexit!=NULL);
a_thread->onexit = a_onexit;
a_thread->onexit_arg = a_onexit_arg;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
