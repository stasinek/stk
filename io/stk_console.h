//---------------------------------------------------------------------------
#ifndef __stk_console_h
#define __stk_console_h
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#define PRINT_I64(val)  stk::con::prints(#val "= %1lld\n" ,       val);
#define PRINT_UI64(val) stk::con::prints(#val "= %1llu\n" ,       val);
#define PRINT_L(val)    stk::con::prints(#val "= %1ld\n"  ,       val);
#define PRINT_UL(val)   stk::con::prints(#val "= %1lu\n"  ,       val);
#define PRINT_I(val)    stk::con::prints(#val "= %1d\n"   ,       val);
#define PRINT_UI(val)   stk::con::prints(#val "= %1u\n"   ,       val);
#define PRINT_F(val)    stk::con::prints(#val "= %1f\n"   ,       val);
#define PRINT_S(val)    stk::con::prints(#val "= %1s\n"   ,       val);
#define PRINT(val)      stk::con::prints(#val);

//---------------------------------------------------------------------------
namespace stk { namespace con {
//---------------------------------------------------------------------------
extern "C" STK_IMPEXP char             __stdcall   getch                   (void);
extern "C" STK_IMPEXP void             __stdcall   print                   (const char* __restrict__ atext);
extern "C" STK_IMPEXP void             __stdcall   error                   (const char* __restrict__ atext);

extern "C" STK_IMPEXP void             __cdecl     prints  				(const char* __restrict__ a_format, ...);
extern "C" STK_IMPEXP void             __cdecl     printe  				(const char* __restrict__ a_format, ...);
extern "C" STK_IMPEXP void             __cdecl     printr  				(const char* __restrict__ a_text, const char an_times);

typedef char       		(__stdcall  __getch_handler)		(void);
typedef void       		(__stdcall  __print_handler)		(const char* a_text);
typedef void       		(__stdcall  __error_handler)		(const char* a_text);

extern "C" STK_IMPEXP __getch_handler *getch_handler;
extern "C" STK_IMPEXP __print_handler *print_handler;
extern "C" STK_IMPEXP __error_handler *error_handler;

extern "C" STK_IMPEXP void             __stdcall   set_console_handlers	(char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(const char*),void (__stdcall *a_error_event_handler)(const char*));
extern "C" STK_IMPEXP char             __stdcall   stdinp_handler  		(void);
extern "C" STK_IMPEXP void             __stdcall   stdout_handler  		(const char* a_text);
extern "C" STK_IMPEXP void             __stdcall   stderr_handler  		(const char* a_text);

#ifdef __WATCOMC__
extern "C" STK_IMPEXP void                         con_atexit(void);
#else
extern "C" STK_IMPEXP void             __cdecl     con_atexit(void);
#endif
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
#define PRINT(...) stk::con::prints(FIRST(__VA_ARGS__) REST(__VA_ARGS__))
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
