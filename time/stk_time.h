//---------------------------------------------------------------------------
#ifndef __stk_time_h
#define __stk_time_h
#ifdef __BORLANDC__
#pragma once
#endif
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace time {
#endif
//---------------------------------------------------------------------------
extern uint64_t		   	STK_IMPEXP  __stdcall	time_us(void);
extern uint64_t          STK_IMPEXP  __stdcall	time_ms(void);
extern void 		        STK_IMPEXP  __stdcall	wait_us(const uint64_t a_microseconds);
extern void 		        STK_IMPEXP  __stdcall	wait_ms(const uint64_t a_milliseconds);
extern void 		        STK_IMPEXP  __stdcall	wait_until(time_t a_time);
extern time_t            STK_IMPEXP  __stdcall   wait_idle(const time_t a_prev_time, const double a_percent_of_idle);
#ifdef __WIN32__
extern time_t            STK_IMPEXP  __stdcall FILETIME_to_time_t(const FILETIME *ft);
extern FILETIME*         STK_IMPEXP  __stdcall time_t_to_FILETIME(time_t t, FILETIME *ft);
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}//namespace stk,time
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

