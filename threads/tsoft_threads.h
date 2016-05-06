//---------------------------------------------------------------------------
#ifndef __tsoft_threads_H__
#define __tsoft_threads_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../time/tsoft_time.h"
//---------------------------------------------------------------------------
//#include "./../../pthreads-w32-2-9-1-release/pthreads.2/include/pthread.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
namespace threads {
#ifdef _WIN32
#include <limits.h>
#else
#include <stdint.h>
#endif

#define ATOMIC(num) static volatile bool blocker##num = 0;

#define ATOMIC_LOCK(num)\
while (blocker##num == 1) ts::time::wait_us(1); \
blocker##num = 1;
// MSDN: Windows Sleep(0)
// A value of zero causes the thread to relinquish the remainder of its time slice to any other thread that is ready to run
// Linux - there is sleep_us() so it would wait for minimum 1us and also ^^ ;)
#define ATOMIC_UNLOCK(num) blocker##num = 0;

#define ATOMIC_COPY(TYPENAME, name) TYPENAME atomic_##name = name;
#define ATOMIC_SAVE(name) name = atomic_##name;

/*
 * locked:                      ; The lock variable. 1 = locked, 0 = unlocked.
     dd      0

spin_lock:
     mov     eax, 1          ; Set the EAX register to 1.

     xchg    eax, [locked]   ; Atomically swap the EAX register with
                             ;  the lock variable.
                             ; This will always store 1 to the lock, leaving
                             ;  the previous value in the EAX register.

     test    eax, eax        ; Test EAX with itself. Among other things, this will
                             ;  set the processor's Zero Flag if EAX is 0.
                             ; If EAX is 0, then the lock was unlocked and
                             ;  we just locked it.
                             ; Otherwise, EAX is 1 and we didn't acquire the lock.

     jnz     spin_lock       ; Jump back to the MOV instruction if the Zero Flag is
                             ;  not set; the lock was previously locked, and so
                             ; we need to spin until it becomes unlocked.

     ret                     ; The lock has been acquired, return to the calling
                             ;  function.

spin_unlock:
     mov     eax, 0          ; Set the EAX register to 0.

     xchg    eax, [locked]   ; Atomically swap the EAX register with
                             ;  the lock variable.

     ret                     ; The lock has been released.

*/

//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
