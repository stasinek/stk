//---------------------------------------------------------------------------
#ifndef __stk_threads_H__
#define __stk_threads_H__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
#include "./../time/stk_time.h"
#include "./../cpu/stk_cpu.h"
//#include "./../../pthreads-w32-2-9-1-release/pthreads.2/include/pthread.h"
#ifdef __WIN32__
    #include <limits.h>
#else
    #include <stdint.h>
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace thread {
#endif
//---------------------------------------------------------------------------
#define ATOMIC(num)\
int64_t __unique##num;\
volatile static int64_t __shared##num = 0;

#define ATOMIC_LOCK(num)\
    while (__shared##num !=0) { ::stk::time::wait_us(0); }\
    __unique##num = stk::cpu::rdtsc(); __shared##num = __unique##num;\
    asm("mfence");\
    while(__shared##num !=0 ? __shared##num != __unique##num : false) { ::stk::time::wait_us(0); }
//    printf("ATOMIC_LOCK: %lld\n",__unique##num);

#define ATOMIC_UNLOCK(num)\
    __shared##num = 0;
//    printf("ATOMIC_UNLOCK: %lld\n",__unique##num);
//    __shared##num = 0;
//---------------------------------------------------------------------------

#ifdef __cplusplus
extern "C" {
#endif
extern volatile int32_t __barier, __barier_locker;
#ifdef __cplusplus
}
#endif

#define BARIER_ADD()\
    while(__barier_locker==0) { stk::time::wait_us(0); }\
    do {\
        uint32_t __barier_unique = stk::cpu::rdtsc(); __barier_locker = __barier_unique;\
        asm("mfence");\
        while(__barier_locker !=0 ? __barier_locker != __barier_unique : false) { stk::time::wait_us(0); }\
        __barier++;\
        printf("BARIER_ADD: %d\n",__barier);\
        __barier_locker = 0;\
    } while(0);

#define BARIER_WAIT()\
    printf("BARIER_WAIT: %d\n",__barier);\
    while (__barier > 0) { stk::time::wait_us(0); }

#define BARIER_REMOVE()\
    while(__barier_locker!=0) { stk::time::wait_us(0); }\
    do {\
        uint32_t __barier_unique = stk::cpu::rdtsc(); __barier_locker = __barier_unique;\
        asm("mfence");\
        while(__barier_locker !=0 ? __barier_locker != __barier_unique : false) { stk::time::wait_us(0); }\
        __barier--;\
        printf("BARIER_REMOVE: %d\n",__barier);\
        __barier_locker = 0;\
        } while(0);
//---------------------------------------------------------------------------
typedef unsigned long (__stdcall *ssthread_routine_t)(void*);
typedef unsigned long (__stdcall *ssthread_char_routine_t)(char*);
typedef unsigned long (__stdcall *ssthread_char_const_routine_t)(const char*);
//---------------------------------------------------------------------------
struct STK_IMPEXP ssthread_arg_wrapper_t {
    int     argc;
    void**  argv;
    void*   contex_ptr;
    void*   ptr;
    int __stdcall request(char a_setget, int a_request_command, time_t a_request_time);
};
//---------------------------------------------------------------------------
struct STK_IMPEXP ssthread_attr_t {
    bool active, idle, detached, terminated;
    uint64_t creation_time, user_time, system_time, end_time;
    uint32_t exit_code;
};
//---------------------------------------------------------------------------
struct STK_IMPEXP ssthread_t {
    unsigned long id;
    void *handle;
    struct  ssthread_attr_t attr;
    union { ssthread_routine_t func;
            ssthread_char_routine_t func_c;
            ssthread_char_const_routine_t func_cc;
    };
    union { char const *func_arg_cc;
            char *func_arg_c;
            void *func_arg_v, *func_arg;
            struct ssthread_arg_wrapper_t *func_arg_w;
    };
    ssthread_routine_t onexit;
    union { void *onexit_arg_v, *onexit_arg;
    };
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
extern "C" {
#endif
extern STK_IMPEXP unsigned long      __stdcall onexit_common    (void *arg);
//---------------------------------------------------------------------------
extern STK_IMPEXP int32_t            __stdcall cmpxchg4         (int32_t *addr, int32_t o, int32_t n);
extern STK_IMPEXP int64_t            __stdcall cmpxchg8         (int64_t *addr, int64_t o, int64_t n);
//---------------------------------------------------------------------------
extern STK_IMPEXP bool               __stdcall create           (struct ssthread_t *a_thread, ssthread_routine_t a_func,void *a_func_arg);
extern STK_IMPEXP bool               __stdcall run              (struct ssthread_t *a_thread);
extern STK_IMPEXP bool               __stdcall suspend          (struct ssthread_t *a_thread);
extern STK_IMPEXP bool               __stdcall terminate        (struct ssthread_t *a_thread,unsigned long a_exitcode);
extern STK_IMPEXP unsigned long      __stdcall id               (struct ssthread_t *a_thread);
extern STK_IMPEXP bool               __stdcall joinable         (struct ssthread_t *a_thread);
extern STK_IMPEXP bool               __stdcall active           (struct ssthread_t *a_thread);
extern STK_IMPEXP void               __stdcall join             (struct ssthread_t *a_thread);
extern STK_IMPEXP void               __stdcall detach           (struct ssthread_t *a_thread);
extern STK_IMPEXP void               __stdcall atexit           (struct ssthread_t *a_thread,ssthread_routine_t a_onexit,void *a_onexit_arg);
extern STK_IMPEXP unsigned long      __stdcall this_id          (void);
extern STK_IMPEXP bool               __stdcall yeld             (void);
extern STK_IMPEXP void               __stdcall quit             (unsigned long a_exitcode);
#ifdef __cplusplus
} //extern "C"
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace stk,thread
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus // ONLY FOR C+++
namespace stk { namespace thread {
        inline bool  __stdcall create(struct ssthread_t *a_thread, ssthread_char_routine_t a_func,char *a_func_arg)
        { return create(a_thread, reinterpret_cast<ssthread_routine_t>(a_func), static_cast<void*>(const_cast<char*>(a_func_arg))); }
        inline bool  __stdcall create(struct ssthread_t *a_thread, ssthread_char_const_routine_t a_func,const char* a_func_arg)
        { return create(a_thread, reinterpret_cast<ssthread_routine_t>(a_func), static_cast<void*>(const_cast<char*>(a_func_arg))); }
}} //namespace stk,thread
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
