//---------------------------------------------------------------------------
#ifndef tsoft_time_h
#define tsoft_time_h
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace time {
//------------------------------------
extern double		    	__stdcall	clock_us(void);
extern double			    __stdcall	clock_ms(void);
extern void 		        __stdcall	wait_us(const __int32 a_microseconds);
extern void 		        __stdcall	wait_ms(const __int32 a_milliseconds);

time_t __stdcall FILETIME_to_time_t(FILETIME const& ft);
FILETIME* __stdcall time_t_to_FILETIME(time_t t, LPFILETIME pft);
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

