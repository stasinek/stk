//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../text/tsoft_cstr_utils.h"
#include "./../sthreads/tsoft_threads.h"
#include "tsoft_console.h"
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
static int s_print_buffer_size = 0; static char *s_print_buffer = NULL;
//---------------------------------------------------------------------------
char (__stdcall *ts::con::getch_handler)() = &ts::con::stdinp_handler;
void (__stdcall *ts::con::print_handler)(const char*)  = &ts::con::stdout_handler;
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

char __stdcall ts::con::stdinp_handler(void)
{
    return (char)fgetc(stdin);
}
//---------------------------------------------------------------------------

void  __stdcall ts::con::stdout_handler(const char* a_text)
{
    fputs(a_text,stdout);
}
//---------------------------------------------------------------------------

void  __stdcall ts::con::stderr_handler(const char* a_text)
{
    fputs(a_text,stderr);
}
//---------------------------------------------------------------------------

char __stdcall ts::con::getch(void)
{
    if (getch_handler!=NULL) return getch_handler();
    else return stdinp_handler();
}
//---------------------------------------------------------------------------

void  __stdcall ts::con::print(const char* a_text)
{
    if (print_handler!=NULL) print_handler(a_text);
    else stdout_handler(a_text);
}
//---------------------------------------------------------------------------

void  __stdcall ts::con::error(const char* a_text)
{
    if (error_handler!=NULL) error_handler(a_text);
    else stderr_handler(a_text);
}
//---------------------------------------------------------------------------

#ifdef __WATCOMC__
void  ts::con::atexit(void)
#else
void __cdecl  ts::con::atexit(void)
#endif
{
if (s_print_buffer!=NULL && s_print_buffer_size > 0)
    { delete s_print_buffer; s_print_buffer = NULL; s_print_buffer_size = 0;
    }
}
//---------------------------------------------------------------------------

#include <stdarg.h>
void  __cdecl ts::con::prints(const char* __restrict__ a_format, ...)
{
#define VA_DEFAULT_SIZE 4096
ATOMIC(1)
ATOMIC_LOCK(1)
if (s_print_buffer_size==0) {
    s_print_buffer = (char*)ts::cstr::alloc(VA_DEFAULT_SIZE);
    assert(s_print_buffer!=NULL);
    s_print_buffer_size = VA_DEFAULT_SIZE; //vsnprintf nsize is passed without terminator
    ::atexit(&ts::con::atexit);
    }

    do {
    va_list  __va_param;
    va_start(__va_param,a_format);
    register int needed_size = ::vsnprintf(s_print_buffer,s_print_buffer_size-1,a_format,__va_param) + 1; //minimum needed
    va_end(__va_param);

    if (needed_size > s_print_buffer_size) {
        s_print_buffer = (char*)ts::cstr::realloc(s_print_buffer,needed_size);
        assert(s_print_buffer!=NULL);
        s_print_buffer_size = needed_size;
        continue;
        }
    else
    if (needed_size < VA_DEFAULT_SIZE ? s_print_buffer_size > VA_DEFAULT_SIZE :false) {
        s_print_buffer = (char*)ts::cstr::realloc(s_print_buffer,VA_DEFAULT_SIZE);
        assert(s_print_buffer!=NULL);
        s_print_buffer_size = VA_DEFAULT_SIZE;
        continue;
    }
    else {
            break;
    }

} while (1);
ts::con::print(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

void  __cdecl ts::con::printr(const char*  __restrict__ a_text, const char an_times)
{
register int a_text_len = ts::cstr::len(a_text);
if (a_text_len==0 || an_times==0)
return;
register int f_buffer_needed = (an_times *a_text_len) + 1;
ATOMIC(1)
ATOMIC_LOCK(1)
if (s_print_buffer_size < f_buffer_needed) {
if (s_print_buffer_size==0) {
    s_print_buffer = (char*)ts::cstr::alloc(f_buffer_needed);
    }
else
    {
    s_print_buffer = (char*)ts::cstr::realloc(s_print_buffer,f_buffer_needed);
    }
s_print_buffer_size = (an_times *a_text_len) + 1;
}
s_print_buffer[0]='\0';
for (int i = 0; i < f_buffer_needed; i+=a_text_len) { ts::mem::mov((void*)&s_print_buffer[i],(void*)a_text,a_text_len);
    }
s_print_buffer[f_buffer_needed-1]='\0';
ts::con::print(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

#include <stdarg.h>
void  __cdecl ts::con::printe(const char* __restrict__ a_format, ...)
{
ATOMIC(1)
#define VA_DEFAULT_SIZE 4096
ATOMIC_LOCK(1)
if (s_print_buffer_size==0) {
    ::atexit(&ts::con::atexit);
    s_print_buffer = (char*)ts::cstr::alloc(VA_DEFAULT_SIZE);
    assert(s_print_buffer!=NULL);
    s_print_buffer_size =VA_DEFAULT_SIZE;
    }
do {
va_list  param;
va_start(param,a_format);
int needed_size = vsnprintf(s_print_buffer,s_print_buffer_size,a_format,param) + 8;
va_end(param);

 if (needed_size > s_print_buffer_size)
    {s_print_buffer = (char*)ts::cstr::realloc(s_print_buffer,s_print_buffer_size);
     assert(s_print_buffer!=NULL);
     s_print_buffer_size = needed_size;
     continue;
    }
 else break;
} while (1);
ts::con::error(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

/*
void __stdcall ts::con::format(char *a_dst, const char* a_format,...){
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
*/
