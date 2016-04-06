//---------------------------------------------------------------------------
#ifndef __tsoft_time_H__
#define __tsoft_time_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace time {
//------------------------------------
extern uint64_t			__stdcall	clock_us(void);
extern uint64_t			__stdcall	clock_ms(void);
extern void 			__stdcall	wait_us(__int32 a_microseconds);
extern void 			__stdcall	wait_ms(__int32 a_milliseconds);
time_t __stdcall FILETIME_to_time_t(FILETIME const& ft);
FILETIME* __stdcall time_t_to_FILETIME(time_t t, LPFILETIME pft);
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

