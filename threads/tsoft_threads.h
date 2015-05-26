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

//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
