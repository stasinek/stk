//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_API_H__
#define __tsoft_kop32_API_H__
//---------------------------------------------------------------------------
#include "tsoft_kop32_class.h"
//---------------------------------------------------------------------------
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------
extern ts::__kop32_class *kop32;
extern ts::__kop32_class_progress_controler *progress;
//---------------------------------------------------------------------------
int __stdcall start_kop32_in_gui_mode(const char *args, const ts::__kop32_class_progress_controler::__callback_event_handler*, const ts::con::__print_handler*,ts::con::__getch_handler*);
int __stdcall start_kop32_in_text_mode(const char *args, const ts::con::__print_handler*, const ts::con::__getch_handler*);
int __stdcall start_kop32_in_text_mode(const char *args);
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
