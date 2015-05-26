//---------------------------------------------------------------------------
#ifndef __tsoft_STDIO_H__
#define __tsoft_STDIO_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#define PRINT_I64(val)	printf(#val "= %1lld\n"	,	val);
#define PRINT_UI64(val)	printf(#val "= %1llu\n"	,	val);
#define PRINT_L(val)	printf(#val "= %1ld\n"	,	val);
#define PRINT_UL(val)	printf(#val "= %1lu\n"	,	val);
#define PRINT_I(val)	printf(#val "= %1d\n"	,	val);
#define PRINT_UI(val)	printf(#val "= %1u\n"	,	val);
#define PRINT_F(val)	printf(#val "= %1f\n"	,	val);
#define PRINT_S(val)	printf(#val "= %1s\n"	,	val);
#define PRINT(val)		printf(#val);

namespace ts { namespace console {
//---------------------------------------------------------------------------
extern char		__stdcall	getch			(void);
extern void		__cdecl 	print_formated	(const char* __restrict__ a_format, ...);
extern void		__cdecl		print_repeated	(const char*  __restrict__ atext, __int8 an_times);
extern void		__stdcall	print			(const char* __restrict__ atext);

extern void		__stdcall 	set_console_handlers(char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(const char*),void (__stdcall *a_error_event_handler)(const char*));
extern char	   (__stdcall  *getch_handler)	(void);
extern void	   (__stdcall  *print_handler)	(const char* a_text);
extern void	   (__stdcall  *error_handler)	(const char* a_text);

extern char		 __stdcall	stdin_handler	(void);
extern void		__stdcall 	stdout_handler	(const char* a_text);
extern void		__stdcall	stderr_handler	(const char* a_text);
extern void		__cdecl  	__destructor	(void);
//---------------------------------------------------------------------------

/*
#define SELECT_10TH(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, ...) a10
#define NUM(...) SELECT_10TH(__VA_ARGS__,\
	TWOORMORE, TWOORMORE, TWOORMORE, TWOORMORE, TWOORMORE,\
	TWOORMORE, TWOORMORE, TWOORMORE, ONE, ARGTS_EON)
#define REST_HELPER_TWOORMORE(first, ...),__VA_ARGS__
#define REST_HELPER_ONE(first)
#define REST_HELPER_2(qt, ...) REST_HELPER_##qt(__VA_ARGS__)
#define REST_HELPER_1(qt, ...) REST_HELPER_2(qt,__VA_ARGS__)
#define REST(...) REST_HELPER_1(NUM(__VA_ARGS__),__VA_ARGS__)
#define FIRST_HELPER(first, ...) first
#define FIRST(...) FIRST_HELPER(__VA_ARGS__,ARGTS_EON)
#define PRINT(...) printf(FIRST(__VA_ARGS__) REST(__VA_ARGS__))
*/
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
/*
class __print_buffer {
public:
char *ptr; static const int size = 4096;
 __print_buffer (void) { ptr = new char[4096]; }
~__print_buffer (void) { delete ptr; }
};*/

#endif
