//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_API_H__
#define __tsoft_kop32_API_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "../io/tsoft_console.h"
#include "tsoft_kop32_class.h"
//---------------------------------------------------------------------------
namespace ts { namespace kop32 {
extern ts::__kop32_class *kop32;
//---------------------------------------------------------------------------
extern void __stdcall set_console_handlers( char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(char*));

extern const char* __stdcall console_event_handler(char *a_event, char *a_code, char *a_code_ex);
extern __int32 __stdcall console_monitor_proc();

extern __int32 __stdcall start_in_console_mode(char *args);
extern __int32 __stdcall start(char *args, const char* (__stdcall *a_kop32_event_handler)(char*,char*,char*));
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
