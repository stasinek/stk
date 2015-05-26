//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_STDIO_H__
#define __tsoft_STDIO_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace console {
//---------------------------------------------------------------------------
extern void		__stdcall  classic_print_handler( char* a_text);
extern int		__stdcall  classic_getch_handler( void);
extern void	   (__stdcall *print_handler)(char* a_text);
extern int	   (__stdcall *getch_handler)(void);
extern void		__stdcall set_console_handlers(int (__stdcall *agetcheventhandler)(void),void (__stdcall *aprinteventhandler)(char*));
extern void		__stdcall print(char* __restrict__ atext);
extern void		__stdcall print_formated(const char* __restrict__ a_format, ...);
extern int		__stdcall getch(void);
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
