//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_console.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

void (__stdcall *ts::console::print_handler)(char*)  = &ts::console::classic_print_handler;
int  (__stdcall *ts::console::getch_handler)() = &ts::console::classic_getch_handler;

//---------------------------------------------------------------------------

void __stdcall ts::console::set_console_handlers(int (__stdcall *agetcheventhandler)(void),void (__stdcall *aprinteventhandler)(char*))
{
		if (agetcheventhandler!=NULL) ts::console::getch_handler = agetcheventhandler;
		if (aprinteventhandler!=NULL) ts::console::print_handler = aprinteventhandler;
}
//---------------------------------------------------------------------------

void  __stdcall ts::console::classic_print_handler(char* a_text)
{
	fputs(a_text,stdout);
}
//---------------------------------------------------------------------------

int  __stdcall ts::console::classic_getch_handler(void)
{
	return getchar();
}
//---------------------------------------------------------------------------

void  __stdcall ts::console::print(char* atext)
{
	if (print_handler!=NULL) print_handler(atext);
	else classic_print_handler(atext);
}
//---------------------------------------------------------------------------

void  __stdcall ts::console::print_formated(const char* __restrict__ aformat, ...)
{
static char print_buffer[1024];
#include <stdarg.h>
/* Replace with your best guesstimate of the max total unnamed argument size */
#define VA_MAX_SIZE 1024
struct _va_block_s { char _d[VA_MAX_SIZE];};
#define va_pass(args) va_arg(args, struct _va_block_s)
va_list  param;
va_start(param,aformat);
	snprintf(print_buffer,1024,aformat,va_pass(param));
va_end(param);
	print(print_buffer);
}
//---------------------------------------------------------------------------

int __stdcall ts::console::getch(void)
{
	if (getch_handler!=NULL) return getch_handler();
	else return classic_getch_handler();
}

/*
void  __stdcall ts::console::print(const char* a_format,...){
char x_ch[50];
 int x_precission = 0, x_with_sign = 0, x_justify = 0, x_no_sign = 0, x_alternate = 0, x_minimum_digits = 0, x_type = 0;
 int x_num_of_par = 0;

 register int i;
 register int format_len;
 for (i = 0; a_format[i]!='\0'; i++);
char *format = new char[format_len]; ts::io32::strmove(format,(char*)a_format);
 va_list  par;
 for (i = 0; i < format_len;i++) if (format[i]=='%') x_num_of_par++;
 va_start(par, x_num_of_par);

 for (i = 0; i < format_len;i++) {
 	 if (format[i]!='%')
	  continue;
		 format[i]='\0';
		 i++;
		 print_handler(&format[i]);

	 if (format[i]=='.') x_precission =

	 }}

	int a = va_arg(par, int);
va_end(par);


for (i=0;i<format_len;i++) {

}

print_handler("print\n");
}
//---------------------------------------------------------------------------

char  __stdcall ts::console::getch(){

return getch_handler();
}
//---------------------------------------------------------------------------
*/
