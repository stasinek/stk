//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_journal.h"
//---------------------------------------------------------------------------
#include "./../io/tsoft_console.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../mem/tsoft_mem.h"
#include "./../ssthreads/tsoft_threads.h"
//---------------------------------------------------------------------------
#include <time.h>
#include  <dos.h>

#define VA_DEFAULT_SIZE 512

__stdcall ts::__journal:: __journal()
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    f_write_buffer = new char[VA_DEFAULT_SIZE];
    f_buffer_size = VA_DEFAULT_SIZE;
    f_stream = NULL;
    f_stream_name = ts::cstr::alloc(MAX_PATH+1);
    f_stream_name[0]='\0';
}
//---------------------------------------------------------------------------

const FILE *__stdcall ts::__journal::create()
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    char *module_name = new char[MAX_PATH];
    int32_t s = ::GetModuleFileNameA( NULL, module_name, MAX_PATH);
    if (s!=0) {
        ts::cstr::mov(f_stream_name,module_name);
        strcat(f_stream_name,"_");
    } else {
        getcwd(f_stream_name, 256);
        strcat(f_stream_name,"\\");
    }
    ::time(&f_current_time);
    f_current_time_info = localtime (&f_current_time);
    strftime(f_current_time_asci,20,"%Y-%m-%d",f_current_time_info);
    strcat(f_stream_name,f_current_time_asci);
    strcat(f_stream_name,".txt");
    f_stream = fopen(f_stream_name,"a+");
    if (!f_stream) {
        ts::con::prints("ERROR CREATING ssts::LOGFILE");
        ts::con::getch();
        return NULL;
    } else fprintf(f_stream,"[ssts::JOURNAL_FILEv0.1]\n");
    delete module_name;
    return f_stream;
}
//---------------------------------------------------------------------------
const FILE	*__stdcall ts::__journal::get_stream(void)
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    return f_stream;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__journal::write_line(const char *aline)
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    int32_t line_len = ts::cstr::len(aline);
    if (line_len==0) return 0;
    ::time(&f_current_time);
    f_current_time_info = localtime (&f_current_time);
    strftime(f_current_time_asci,20,"[%F]\r\n%X=",f_current_time_info);
    fwrite(f_current_time_asci,ts::cstr::len(f_current_time_asci),1,f_stream);
    fwrite(aline,line_len,1,f_stream);
    fwrite("\r\n",2,1,f_stream);
    return line_len;
}
//---------------------------------------------------------------------------
#include <stdarg.h>
//---------------------------------------------------------------------------

int32_t __stdcall ts::__journal::write_formated_line(const char* __restrict__ a_format, ...)
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
do {
va_list  param;
va_start(param,a_format);
    uint32_t sprinted = vsnprintf(f_write_buffer,f_buffer_size,a_format,param);
va_end(param);
 if (sprinted + 1 > f_buffer_size)
    {f_buffer_size  = sprinted + 1;
     f_write_buffer = (char*)ts::cstr::realloc(f_write_buffer,f_buffer_size);
     continue;
    }
 else break;
} while (1);
return this->write_line(f_write_buffer);
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__journal::get_first_line(const time_t attime)
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    return -1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__journal::get_next_line(void)
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    return -1;
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__journal::read_line(const uint32_t aline_number)
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
return "";
}
//---------------------------------------------------------------------------

void __stdcall ts::__journal::close()
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    if (f_stream!=NULL) fclose(f_stream);
    f_stream = NULL;
    f_stream_name[0] = '\0';
}
//---------------------------------------------------------------------------

__stdcall ts::__journal::~__journal()
{
#ifdef __DEBUG_JOURNAL__
__DEBUG_FUNC_CALLED("")
#endif
    if (f_stream!=NULL) this->close();
    delete f_write_buffer;
    f_buffer_size = 0;
    delete f_stream_name;
}
//---------------------------------------------------------------------------

