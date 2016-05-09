//---------------------------------------------------------------------------
#ifndef tsoft_threads_h
#define tsoft_threads_h
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../time/tsoft_time.h"
//---------------------------------------------------------------------------
//#include "./../../pthreads-w32-2-9-1-release/pthreads.2/include/pthread.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
namespace thread {
#ifdef _WIN32
#include <limits.h>
#else
#include <stdint.h>
#endif

int __stdcall cmpxchg(int *addr, int o, int n) {
	    int was = *addr;
	    if (was == o) *addr = n;
	    return was;
	}
#define ATOMIC(num) static volatile bool __locker##num = 0;
#define ATOMIC_LOCK(num)\
while (__locker##num==1) ts::time::wait_us(0); \
__locker##num = 1;
// MSDN: Windows Sleep(0)
// A value of zero causes the thread to relinquish the remainder of its time slice to any other thread that is ready to run
// Linux - there is sleep_us() so it would wait for minimum 1us and also ^^ ;)
#define ATOMIC_UNLOCK(num) __locker##num = 0;
#define ATOMIC_COPY(TYPENAME, name) TYPENAME atomic_##name = name;
#define ATOMIC_SAVE(name) name = atomic_##name;
static volatile __int32 __barier = 0, __barier_locker = 0;
#define BARIER_ADD()\
while(__barier_locker==1) ts::time::wait_us(0);\
__barier_locker = 1; __barier++;\
__barier_locker = 0;

#define BARIER_WAIT()\
while (__barier > 0) ts::time::wait_us(0);
#define BARIER_REMOVE()\
while(__barier_locker==1) ts::time::wait_us(0);\
__barier_locker = 1; __barier--;\
__barier_locker = 0;
}
//---------------------------------------------------------------------------
namespace thread {
//---------------------------------------------------------------------------
typedef unsigned long __stdcall (*ssthread_routine_t)(void*);

struct ssthread_attr_t {
unsigned long timeout, active, detached, terminated;
};
//---------------------------------------------------------------------------
struct ssthread_t {
unsigned long id;
ssthread_routine_t func;
void *func_arg;
struct ssthread_attr_t attr;
void *handle;
ssthread_routine_t atexit;
void *atexit_arg;
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
namespace this_thread {
//---------------------------------------------------------------------------
unsigned long __stdcall get_id(void) {
#if defined(__WIN32__)
unsigned long r = ::GetCurrentThreadId();
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
void __stdcall quit(unsigned long a_exitcode) {
#if defined(__WIN32__)
::ExitThread(a_exitcode);
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
bool __stdcall yeld(void) {
#if defined(__WIN32__)
unsigned long r = ::SwitchToThread();
return r!=0;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
namespace thread {
//---------------------------------------------------------------------------
unsigned long __stdcall atexit_common(void *arg)
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
bool __stdcall create(struct ssthread_t *a_thread, ssthread_routine_t a_func,void *a_func_arg) {
#if defined(__WIN32__)
a_thread->func = a_func;
a_thread->func_arg = a_func_arg;
a_thread->atexit = NULL;
a_thread->atexit_arg = NULL;
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
bool __stdcall run(struct ssthread_t *a_thread) {
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
bool __stdcall suspend(struct ssthread_t *a_thread) {
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
bool __stdcall terminate(struct ssthread_t *a_thread,unsigned long a_exitcode) {
#if defined(__WIN32__)
// TODO sprawdzenie czy on jeszcze pracuje czy by³ ju¿ terminated
if (a_thread->handle==NULL)
return false;
if (a_thread->attr.terminated==true) return true;
unsigned long r = ::TerminateThread(a_thread->handle,a_exitcode)!=0xFFFFFFFF;
::WaitForSingleObject(a_thread->handle, INFINITE);
a_thread->attr.active = r;
if (r==true) {
    a_thread->attr.terminated = true;
    if (a_thread->atexit!=NULL) a_thread->atexit(a_thread->atexit_arg);
    atexit_common(a_thread->handle);
}
return r;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
unsigned long __stdcall get_id(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
if (a_thread->handle==NULL) return 0;
return a_thread->id;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
bool __stdcall joinable(struct ssthread_t *a_thread) {
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
void __stdcall join(struct ssthread_t *a_thread) {
#if defined(__WIN32__)
if (a_thread->handle==NULL)
return;
if (::WaitForSingleObject(a_thread->handle, INFINITE))
    a_thread->attr.active==false;
if (a_thread->attr.terminated==false && a_thread->attr.detached==false) {
    if (a_thread->atexit!=NULL) a_thread->atexit(a_thread->atexit_arg);
    atexit_common(a_thread->handle);
}
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
void __stdcall detach(struct ssthread_t *a_thread) {
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
void __stdcall atexit(struct ssthread_t *a_thread,ssthread_routine_t a_atexit,void *a_atexit_arg) {
#if defined(__WIN32__)
assert(a_atexit!=NULL);
a_thread->atexit = a_atexit;
a_thread->atexit_arg = a_atexit_arg;
#else
// POSIX thread
#endif
}
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
