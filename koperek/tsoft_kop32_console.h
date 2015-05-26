//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_API_H__
#define __tsoft_kop32_API_H__
//---------------------------------------------------------------------------
#include "tsoft_kop32_class.h"
//---------------------------------------------------------------------------
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------
extern ts::__kop32_class *kop32;
extern ts::__progress_controler *Progress;
//---------------------------------------------------------------------------
int __stdcall Start_kop32_in_gui_mode(char *args, ts::__kop32_class::External_callback_event_handler_ptr *akop32eventhandler,ts::console::print_handler *aprinthandler,ts::console::getch_handler *agetchhandler)
int __stdcall Start_kop32_in_text_mode(char *args, ts::console::print_handler *aprinthandler,ts::console::getch_handler *agetchhandler);
int __stdcall Start_kop32_in_text_mode(char *args, );
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
