//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_API_H__
#define __tsoft_kop32_API_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "tsoft_kop32_class.h"
//---------------------------------------------------------------------------
namespace ts { namespace __kop32 {
//---------------------------------------------------------------------------
extern void __stdcall set_console_handlers( char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(const char*),void (__stdcall *a_error_event_handler)(const char*));

extern const char* __stdcall console_event_handler(ts::__kop32_class *akop,const char *a_event, const char *a_code, const char *a_code_ex);
extern int32_t __stdcall console_monitor_proc(ts::__kop32_class *akop);

extern int32_t __stdcall start_in_console_mode(const char *args);
extern int32_t __stdcall start(const char *args, const char* (__stdcall *a_kop32_event_handler)(ts::__kop32_class*,const char*,const char*,const char*));
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
