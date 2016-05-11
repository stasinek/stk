//---------------------------------------------------------------------------
#ifndef tsoft_console_h
#define tsoft_console_h
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#define PRINT_I64(val)  ts::con::prints(#val "= %1lld\n" ,       val);
#define PRINT_UI64(val) ts::con::prints(#val "= %1llu\n" ,       val);
#define PRINT_L(val)    ts::con::prints(#val "= %1ld\n"  ,       val);
#define PRINT_UL(val)   ts::con::prints(#val "= %1lu\n"  ,       val);
#define PRINT_I(val)    ts::con::prints(#val "= %1d\n"   ,       val);
#define PRINT_UI(val)   ts::con::prints(#val "= %1u\n"   ,       val);
#define PRINT_F(val)    ts::con::prints(#val "= %1f\n"   ,       val);
#define PRINT_S(val)    ts::con::prints(#val "= %1s\n"   ,       val);
#define PRINT(val)      ts::con::prints(#val);

namespace ts { namespace con {
//---------------------------------------------------------------------------
extern char             __stdcall       getch                   (void);
extern void             __stdcall       error                   (const char* __restrict__ atext);
extern void             __stdcall       print                   (const char* __restrict__ atext);
extern void             __stdcall       debug                   (const char* __restrict__ atext);

extern void             __cdecl         prints  (const char* __restrict__ a_format, ...);
extern void             __cdecl         printr  (const char* __restrict__ atext, __int8 an_times);
extern void             __cdecl         printe  (const char* __restrict__ a_format, ...);

typedef char       (__stdcall  __getch_handler) (void);
typedef void       (__stdcall  __print_handler) (const char* a_text);
typedef void       (__stdcall  __error_handler) (const char* a_text);
typedef void       (__stdcall  __debug_handler) (const char* a_text);

extern void             __stdcall       set_console_handlers(char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(const char*),void (__stdcall *a_error_event_handler)(const char*));
extern __getch_handler *getch_handler;
extern __print_handler *print_handler;
extern __error_handler *error_handler;
extern __debug_handler *debug_handler;

extern char             __stdcall       stdinp_handler  (void);
extern void             __stdcall       stdout_handler  (const char* a_text);
extern void             __stdcall       stderr_handler  (const char* a_text);
extern void             __stdcall       stddbg_handler  (const char* a_text);
#ifdef __WATCOMC__
extern void             atexit    (void);
#else
extern void             __cdecl         atexit(void);
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
#define PRINT(...) ts::con::prints(FIRST(__VA_ARGS__) REST(__VA_ARGS__))
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
