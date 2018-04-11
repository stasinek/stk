//---------------------------------------------------------------------------
#ifndef __stk_kop32_API_H
#define __stk_kop32_API_H
//---------------------------------------------------------------------------
#include "stk_kop32_class.h"
//---------------------------------------------------------------------------
#include "./../io/stk_console.h"
//---------------------------------------------------------------------------
extern stk::__kop32_class *kop32;
extern stk::__kop32_class_progress_controler *progress;
//---------------------------------------------------------------------------
int __stdcall start_kop32_in_gui_mode(const char *args, const stk::__kop32_class_progress_controler::__callback_event_handler*, const stk::con::__print_handler*, const stk::con::__getch_handler*);
int __stdcall start_kop32_in_text_mode(const char *args, const stk::con::__print_handler*, const stk::con::__getch_handler*);
int __stdcall start_kop32_in_text_mode(const char *args);
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
