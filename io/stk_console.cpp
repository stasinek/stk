//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../text/stk_cstr_utils.h"
#include "./../sthreads/stk_threads.h"
#include "stk_console.h"
//---------------------------------------------------------------------------
static int s_print_buffer_size = 0; static char *s_print_buffer = NULL;
//---------------------------------------------------------------------------
char (__stdcall *stk::con::getch_handler)() = &stk::con::stdinp_handler;
void (__stdcall *stk::con::print_handler)(const char*)  = &stk::con::stdout_handler;
void (__stdcall *stk::con::error_handler)(const char*)  = &stk::con::stderr_handler;

//---------------------------------------------------------------------------

void __stdcall stk::con::set_console_handlers(char (__stdcall *a_getch_event_handler)(void),
                                             void (__stdcall *a_print_event_handler)(const char*),
                                             void (__stdcall *a_error_event_handler)(const char*))
{
    if (a_getch_event_handler!=NULL) stk::con::getch_handler = a_getch_event_handler;
    if (a_print_event_handler!=NULL) stk::con::print_handler = a_print_event_handler;
    if (a_error_event_handler!=NULL) stk::con::error_handler = a_error_event_handler;
}
//---------------------------------------------------------------------------

char __stdcall stk::con::stdinp_handler(void)
{
    return (char)fgetc(stdin);
}
//---------------------------------------------------------------------------

void  __stdcall stk::con::stdout_handler(const char* a_text)
{
    fputs(a_text,stdout);
}
//---------------------------------------------------------------------------

void  __stdcall stk::con::stderr_handler(const char* a_text)
{
    fputs(a_text,stderr);
}
//---------------------------------------------------------------------------

char __stdcall stk::con::getch(void)
{
    if (getch_handler!=NULL) return getch_handler();
    else return stdinp_handler();
}
//---------------------------------------------------------------------------

void  __stdcall stk::con::print(const char* a_text)
{
    if (print_handler!=NULL) print_handler(a_text);
    else stdout_handler(a_text);
}
//---------------------------------------------------------------------------

void  __stdcall stk::con::error(const char* a_text)
{
    if (error_handler!=NULL) error_handler(a_text);
    else stderr_handler(a_text);
}
//---------------------------------------------------------------------------

#ifdef __WATCOMC__
void  stk::con::con_atexit(void)
#else
void __cdecl  stk::con::con_atexit(void)
#endif
{
if (s_print_buffer!=NULL && s_print_buffer_size > 0)
    { delete s_print_buffer; s_print_buffer = NULL; s_print_buffer_size = 0;
    }
}
//---------------------------------------------------------------------------

#include <stdarg.h>
void  __cdecl stk::con::prints(const char* __restrict__ a_format, ...)
{
#define VA_DEFAULT_SIZE 4096
ATOMIC(1)
ATOMIC_LOCK(1)
if (s_print_buffer_size==0) {
    s_print_buffer = (char*)stk::cstr::alloc(VA_DEFAULT_SIZE);
    assert(s_print_buffer!=NULL);
    s_print_buffer_size = VA_DEFAULT_SIZE; //vsnprintf nsize is passed without terminator
    ::atexit(&stk::con::con_atexit);
    }

    do {
    va_list  __va_param;
    va_start(__va_param,a_format);
    register int needed_size = ::vsnprintf(s_print_buffer,s_print_buffer_size-1,a_format,__va_param) + 1; //minimum needed
    va_end(__va_param);

    if (needed_size > s_print_buffer_size) {
        s_print_buffer = (char*)stk::cstr::realloc(s_print_buffer,needed_size);
        assert(s_print_buffer!=NULL);
        s_print_buffer_size = needed_size;
        continue;
        }
    else
    if (needed_size < VA_DEFAULT_SIZE ? s_print_buffer_size > VA_DEFAULT_SIZE :false) {
        s_print_buffer = (char*)stk::cstr::realloc(s_print_buffer,VA_DEFAULT_SIZE);
        assert(s_print_buffer!=NULL);
        s_print_buffer_size = VA_DEFAULT_SIZE;
        continue;
    }
    else {
            break;
    }

} while (1);
stk::con::print(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

void  __cdecl stk::con::printr(const char*  __restrict__ a_text, const char an_times)
{
register int a_text_len = stk::cstr::len(a_text);
if (a_text_len==0 || an_times==0)
return;
register int f_buffer_needed = (an_times *a_text_len) + 1;
ATOMIC(1)
ATOMIC_LOCK(1)
if (s_print_buffer_size < f_buffer_needed) {
if (s_print_buffer_size==0) {
    s_print_buffer = (char*)stk::cstr::alloc(f_buffer_needed);
    }
else
    {
    s_print_buffer = (char*)stk::cstr::realloc(s_print_buffer,f_buffer_needed);
    }
s_print_buffer_size = (an_times *a_text_len) + 1;
}
s_print_buffer[0]='\0';
for (int i = 0; i < f_buffer_needed; i+=a_text_len) { stk::mem::mov((void*)&s_print_buffer[i],(void*)a_text,a_text_len);
    }
s_print_buffer[f_buffer_needed-1]='\0';
stk::con::print(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

#include <stdarg.h>
void  __cdecl stk::con::printe(const char* __restrict__ a_format, ...)
{
ATOMIC(1)
#define VA_DEFAULT_SIZE 4096
ATOMIC_LOCK(1)
if (s_print_buffer_size==0) {
    ::atexit(&stk::con::con_atexit);
    s_print_buffer = (char*)stk::cstr::alloc(VA_DEFAULT_SIZE);
    assert(s_print_buffer!=NULL);
    s_print_buffer_size =VA_DEFAULT_SIZE;
    }
do {
va_list  param;
va_start(param,a_format);
int needed_size = vsnprintf(s_print_buffer,s_print_buffer_size,a_format,param) + 8;
va_end(param);

 if (needed_size > s_print_buffer_size)
    {s_print_buffer = (char*)stk::cstr::realloc(s_print_buffer,s_print_buffer_size);
     assert(s_print_buffer!=NULL);
     s_print_buffer_size = needed_size;
     continue;
    }
 else break;
} while (1);
stk::con::error(s_print_buffer);
ATOMIC_UNLOCK(1)
}
//---------------------------------------------------------------------------

/*
void __stdcall stk::con::format(char *a_dst, const char* a_format,...){
char x_ch[50];
 int x_precission = 0, x_with_sign = 0, x_justify = 0, x_no_sign = 0, x_alternate = 0, x_minimum_digits = 0, x_type = 0;
 int x_num_of_par = 0;

 register int i;
 register int format_len;
 for (i = 0; a_format[i]!='\0'; i++);
char *format = new char[format_len]; stk::io32::strmove(format,(char*)a_format);
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
