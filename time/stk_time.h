//---------------------------------------------------------------------------
#ifndef STK_TIME_H
#define STK_TIME_H
#ifdef __BORLANDC__
#pragma once
#endif
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace time {
#endif
//---------------------------------------------------------------------------
extern STK_IMPEXP uint64_t  __stdcall time_us(void);
extern STK_IMPEXP uint64_t  __stdcall time_ms(void);
extern STK_IMPEXP void 		__stdcall wait_us(const uint64_t a_microseconds);
extern STK_IMPEXP void 		__stdcall wait_ms(const uint64_t a_milliseconds);
extern STK_IMPEXP void 		__stdcall wait_until(time_t a_time);
extern STK_IMPEXP time_t    __stdcall wait_idle(const time_t a_prev_time, const double a_percent_of_idle);
#ifdef __WIN32__
extern STK_IMPEXP time_t    __stdcall FILETIME_to_time_t(const FILETIME *ft);
extern STK_IMPEXP FILETIME* __stdcall time_t_to_FILETIME(time_t t, FILETIME *ft);
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}//namespace stk,time
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

