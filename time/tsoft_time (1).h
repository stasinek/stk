//---------------------------------------------------------------------------
#ifndef tsoft_time_h
#define tsoft_time_h
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace time {
//------------------------------------
extern double		    	__stdcall	time_us(void);
extern double			    __stdcall	time_ms(void);
extern void 		        __stdcall	wait_us(const uint32_t a_microseconds);
extern void 		        __stdcall	wait_ms(const uint32_t a_milliseconds);
extern void 		        __stdcall	wait_until(time_t a_time);
extern time_t               __stdcall   wait_idle(const time_t a_prev_time,const double a_percent_of_idle);

time_t __stdcall FILETIME_to_time_t(FILETIME const& ft);
FILETIME* __stdcall time_t_to_FILETIME(time_t t, LPFILETIME pft);
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

