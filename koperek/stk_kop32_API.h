//---------------------------------------------------------------------------
#ifndef __stk_kop32_API_H
#define __stk_kop32_API_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
#include "stk_kop32_class.h"
//---------------------------------------------------------------------------
namespace stk { namespace __kop32 {
//---------------------------------------------------------------------------
extern "C" STK_IMPEXP void __stdcall set_text_handlers( char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(const char*),void (__stdcall *a_error_event_handler)(const char*));
extern "C" STK_IMPEXP const char* __stdcall text_event_handler(stk::__kop32_class *akop,const char *a_event, const char *a_code, const char *a_code_ex);
extern "C" STK_IMPEXP int32_t __stdcall text_monitor_proc(stk::__kop32_class *akop);
extern "C" STK_IMPEXP int32_t __stdcall start_in_text_mode(const char *args);
extern "C" STK_IMPEXP int32_t __stdcall start(const char *args, const char* (__stdcall *a_kop32_event_handler)(stk::__kop32_class*,const char*,const char*,const char*));
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
