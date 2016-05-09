//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../threads/tsoft_threads.h"
#include "tsoft_console.h"
//---------------------------------------------------------------------------

void (__stdcall *ts::con::print_handler)(const char*)  = &ts::con::stdout_handler;
char (__stdcall *ts::con::getch_handler)() = &ts::con::stdinp_handler;
void (__stdcall *ts::con::error_handler)(const char*)  = &ts::con::stderr_handler;

//---------------------------------------------------------------------------

void __stdcall ts::con::set_console_handlers(char (__stdcall *a_getch_event_handler)(void),
                                             void (__stdcall *a_print_event_handler)(const char*),
                                             void (__stdcall *a_error_event_handler)(const char*))
{
    if (a_getch_event_handler!=NULL) ts::con::getch_handler = a_getch_event_handler;
    if (a_print_event_handler!=NULL) ts::con::print_handler = a_print_event_handler;
    if (a_error_event_handler!=NULL) ts::con::error_handler = a_error_event_handler;
}
//---------------------------------------------------------------------------

void  __stdcall ts::con::stdout_handler(const char* a_text)
{
    fputs(a_text,stdout);
}
//---------------------------------------------------------------------------

char __stdcall ts::con::stdinp_handler(void)
{
    return (char)getchar();
}
//---------------------------------------------------------------------------

void  __stdcall ts::con::stderr_handler(const char* a_text)
{
    fputs(a_text,stderr);
}
//---------------------------------------------------------------------------

void  __stdcall ts::con::print(const char* a_text)
{
    if (print_handler!=NULL) print_handler(a_text);
    else stdout_handler(a_text);
}
//---------------------------------------------------------------------------
static uint32_t s_print_buffer_size = 0; static char *s_print_buffer = NULL;
//---------------------------------------------------------------------------

#ifdef __WATCOMC__
void  ts::con::atexit(void)
#else
void __cdecl  ts::con::atexit(void)
#endif
{
if (s_print_buffer!=NULL && s_print_buffer_size > 0)
    delete s_print_buffer;
}
//---------------------------------------------------------------------------

void  __cdecl ts::con::printe(const char* __restrict__ a_format, ...)
{
ATOMIC(1)
#define VA_DEFAULT_SIZE 512
ATOMIC_LOCK(1)
if (s_print_buffer_size==0) {
    ::atexit(&ts::con::atexit);
    s_print_buffer = (char*)ts::cstr::alloc(VA_DEFAULT_SIZE);
    assert(s_print_buffer!=NULL);
    s_print_buffer_size =VA_DEFAULT_SIZE;
    }
#include <stdarg.h>
do {
va_list  param;
va_start(param,a_format);
uint32_t needed_size = vsnprintf(s_print_buffer,s_print_buffer_size,a_format,param) + 1;
va_end(param);

 if (needed_size > s_print_buffer_size)
    {s_print_buffer = (char*)ts::cstr::realloc(s_print_buffer,s_print_buffer_size);
     assert(s_print_buffer!=NULL);
     s_print_buffer_size = needed_size;
     continue;
    }
 else break;
} while (1);
ts::con::stderr_handler(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

void  __cdecl ts::con::prints(const char* __restrict__ a_format, ...)
{
ATOMIC(1)
#define VA_DEFAULT_SIZE 512
ATOMIC_LOCK(1)
if (s_print_buffer_size==0) {
    ::atexit(&ts::con::atexit);
    s_print_buffer = (char*)ts::cstr::alloc(VA_DEFAULT_SIZE);
    assert(s_print_buffer!=NULL);
    s_print_buffer_size =VA_DEFAULT_SIZE;
    }
#include <stdarg.h>
do {
va_list  param;
va_start(param,a_format);
uint32_t needed_size = vsnprintf(s_print_buffer,s_print_buffer_size,a_format,param) + 1;
va_end(param);

 if (needed_size > s_print_buffer_size)
    {s_print_buffer = (char*)ts::cstr::realloc(s_print_buffer,s_print_buffer_size);
     assert(s_print_buffer!=NULL);
     s_print_buffer_size = needed_size;
     continue;
    }
 else break;
} while (1);
ts::con::stdout_handler(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

void  __cdecl ts::con::printr(const char* a_text,__int8 an_times)
{
ATOMIC(1)
__int32 a_text_len = ts::cstr::len(a_text);
if (a_text_len==0 || an_times==0)
return;

ATOMIC_LOCK(1)
register uint32_t f_buffer_neaded = an_times *(a_text_len) + 1;
if (s_print_buffer_size < f_buffer_neaded) {
if (s_print_buffer_size==0) {
    s_print_buffer = (char*)ts::cstr::alloc(f_buffer_neaded);
    }
else {
    s_print_buffer = (char*)ts::cstr::realloc(s_print_buffer,f_buffer_neaded);
    }
s_print_buffer_size = an_times *(a_text_len) + 1;
}
s_print_buffer[0]='\0';
for (__int32 i = 0; i< an_times; i++) { ts::cstr::cat(s_print_buffer,a_text);
    }
ts::con::stdout_handler(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

char __stdcall ts::con::getch(void)
{
    if (getch_handler!=NULL) return getch_handler();
    else return stdinp_handler();
}

/*
void  __stdcall ts::con::prints(const char* a_format,...){
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

char  __stdcall ts::con::getch(){

return getch_handler();
}
//---------------------------------------------------------------------------
*/
