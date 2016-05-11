//---------------------------------------------------------------------------
#ifndef tsoft_threads_h
#define tsoft_threads_h
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../time/tsoft_time.h"
#include "./../cpu/tsoft_cpu.h"
//---------------------------------------------------------------------------
//#include "./../../pthreads-w32-2-9-1-release/pthreads.2/include/pthread.h"
//---------------------------------------------------------------------------
namespace ts { namespace thread {
//---------------------------------------------------------------------------
#ifdef _WIN32
#include <limits.h>
#else
#include <stdint.h>
#endif

#define ATOMIC(num)\
__int64 __unique##num;\
volatile static __int64 __shared##num = 0;

#define ATOMIC_LOCK(num)\
while (__shared##num !=0) ts::time::wait_us(0); \
__unique##num = ts::cpu::rdtsc();\
__shared##num = __unique##num;\
asm("mfence");\
while(__shared##num !=0 ? __shared##num != __unique##num : false) { ts::time::wait_us(0); }\
printf("ATOMIC_LOCK: %lld\n",__unique##num);

#define ATOMIC_UNLOCK(num)\
printf("ATOMIC_UNLOCK: %lld\n",__unique##num);\
__shared##num = 0;

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
//---------------------------------------------------------------------------
extern __int32 __stdcall cmpxchg4(__int32 *addr, __int32 o, __int32 n);
extern __int64 __stdcall cmpxchg8(__int64 *addr, __int64 o, __int64 n);
//---------------------------------------------------------------------------
typedef unsigned long __stdcall (*ssthread_routine_t)(void*);
typedef unsigned long __stdcall (*ssthread_char_routine_t)(char*);
typedef unsigned long __stdcall (*ssthread_char_const_routine_t)(const char*);
//---------------------------------------------------------------------------
struct ssthread_attr_t {
unsigned long timeout, active, detached, terminated;
};
//---------------------------------------------------------------------------
struct ssthread_t {
    unsigned long id;
    union {
            ssthread_routine_t func;
            ssthread_char_routine_t func_c;
            ssthread_char_const_routine_t func_cc;
    };
    union {
            void *func_arg;
            char *func_arg_c;
            char const *func_arg_cc;
    };
    struct ssthread_attr_t attr;
    void *handle;
    ssthread_routine_t onexit;
    void *onexit_arg;
};
//---------------------------------------------------------------------------
extern unsigned long    __stdcall onexit_common(void *arg);
extern bool             __stdcall create(struct ssthread_t *a_thread, ssthread_routine_t a_func,void *a_func_arg);
extern inline bool      __stdcall create(struct ssthread_t *a_thread, ssthread_char_routine_t a_func,char *a_func_arg) {
return create(a_thread, (ssthread_routine_t)a_func, static_cast<void*>(const_cast<char*>(a_func_arg)));
}
extern inline bool      __stdcall create(struct ssthread_t *a_thread, ssthread_char_const_routine_t a_func,const char* a_func_arg) {
return create(a_thread, (ssthread_routine_t)a_func, static_cast<void*>(const_cast<char*>(a_func_arg)));
}
extern bool             __stdcall run(struct ssthread_t *a_thread);
extern bool             __stdcall suspend(struct ssthread_t *a_thread);
extern bool             __stdcall terminate(struct ssthread_t *a_thread,unsigned long a_exitcode);
extern unsigned long    __stdcall get_id(struct ssthread_t *a_thread);
extern bool             __stdcall joinable(struct ssthread_t *a_thread);
extern void             __stdcall join(struct ssthread_t *a_thread);
extern void             __stdcall detach(struct ssthread_t *a_thread);
extern void             __stdcall atexit(struct ssthread_t *a_thread,ssthread_routine_t a_onexit,void *a_onexit_arg);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
namespace ts { namespace this_thread {
//---------------------------------------------------------------------------
extern unsigned long    __stdcall get_id(void);
extern void             __stdcall quit(unsigned long a_exitcode);
extern bool             __stdcall yeld(void);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
