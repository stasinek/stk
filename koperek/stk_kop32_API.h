//---------------------------------------------------------------------------
#ifndef __stk_kop32_API_H__
#define __stk_kop32_API_H__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
#include "stk_kop32_class.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace __kop32 {
#endif
//---------------------------------------------------------------------------
void         STK_IMPEXP  __stdcall set_text_handlers( char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(const char*),void (__stdcall *a_error_event_handler)(const char*));
const char   STK_IMPEXP *__stdcall text_event_handler(stk::__kop32_class *akop,const char *a_event, const char *a_code, const char *a_code_ex);
int32_t      STK_IMPEXP  __stdcall text_monitor_proc(stk::__kop32_class *akop);
int32_t      STK_IMPEXP  __stdcall start_in_text_mode(const char *args);
int32_t      STK_IMPEXP  __stdcall start(const char *args, const char* (__stdcall *a_kop32_event_handler)(stk::__kop32_class*,const char*,const char*,const char*));
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
