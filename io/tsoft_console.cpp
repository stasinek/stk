//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_console.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../threads/tsoft_threads.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

void (__stdcall *ts::console::print_handler)(const char*)  = &ts::console::stdout_handler;
char (__stdcall *ts::console::getch_handler)() = &ts::console::stdin_handler;
void (__stdcall *ts::console::error_handler)(const char*)  = &ts::console::stderr_handler;

//---------------------------------------------------------------------------

void __stdcall ts::console::set_console_handlers(char (__stdcall *a_getch_event_handler)(void),
                                                 void (__stdcall *a_print_event_handler)(const char*),
                                                 void (__stdcall *a_error_event_handler)(const char*)
                                                 )
{
    if (a_getch_event_handler!=NULL) ts::console::getch_handler = a_getch_event_handler;
    if (a_print_event_handler!=NULL) ts::console::print_handler = a_print_event_handler;
    if (a_error_event_handler!=NULL) ts::console::error_handler = a_error_event_handler;
}
//---------------------------------------------------------------------------

void  __stdcall ts::console::stdout_handler(const char* a_text)
{
    fputs(a_text,stdout);
}
//---------------------------------------------------------------------------

char __stdcall ts::console::stdin_handler(void)
{
    return (char)getchar();
}
//---------------------------------------------------------------------------

void  __stdcall ts::console::stderr_handler(const char* a_text)
{
    fputs(a_text,stderr);
}
//---------------------------------------------------------------------------

void  __stdcall ts::console::print(const char* atext)
{
    if (print_handler!=NULL) print_handler(atext);
    else stdout_handler(atext);
}
//---------------------------------------------------------------------------
static uint32_t buffer_size = 0; static char *print_buffer = NULL;
//---------------------------------------------------------------------------

void  __cdecl ts::console::print_repeated(const char* atext,__int8 an_times)
{
ATOMIC(1)
__int32 atext_len = ts::cstr::len(atext);
if (atext_len==0 || an_times==0)
return;

ATOMIC_LOCK(1)
register uint32_t buffer_neaded = an_times *(atext_len) + 1;
if (buffer_size < buffer_neaded) {
if (buffer_size==0) {
    print_buffer = (char*)ts::cstr::alloc(buffer_neaded);
    }
else {
    print_buffer = (char*)ts::cstr::realloc(print_buffer,buffer_neaded);
    }
buffer_size = an_times *(atext_len) + 1;
}
print_buffer[0]='\0';
for (__int32 i = 0; i< an_times; i++) { ts::cstr::cat(print_buffer,atext);
    }
print(print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

void __cdecl  ts::console::__destructor(void)
{
if (print_buffer!=NULL && buffer_size>0)
delete print_buffer;
}
//---------------------------------------------------------------------------

void  __cdecl ts::console::print_formated(const char* __restrict__ aformat, ...)
{
ATOMIC(1)
#define VA_DEFAULT_SIZE 512
ATOMIC_LOCK(1)
if (buffer_size==0) {
    print_buffer = (char*)ts::cstr::alloc(VA_DEFAULT_SIZE);
    buffer_size =VA_DEFAULT_SIZE;
    atexit(&ts::console::__destructor);
    }
#include <stdarg.h>
do {
va_list  param;
va_start(param,aformat);
uint32_t needed_size = vsnprintf(print_buffer,buffer_size,aformat,param) + 1;
va_end(param);

 if (needed_size > buffer_size)
    {buffer_size = needed_size;
     print_buffer = (char*)ts::cstr::realloc(print_buffer,buffer_size);
     continue;
    }
 else break;
} while (1);
print(print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

char __stdcall ts::console::getch(void)
{
    if (getch_handler!=NULL) return getch_handler();
    else return stdin_handler();
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
