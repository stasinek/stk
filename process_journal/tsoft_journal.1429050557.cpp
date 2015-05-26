//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_journal.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_text_manipulation.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------
#include <direct.h>
#include <dos.h>
#include <io.h>
#include <fcntl.h>
#include <windows.h>
//---------------------------------------------------------------------------
__stdcall ts::__journal:: __journal()
{
	stream = NULL;
	stream_name = new char[MAX_PATH+1];
	stream_name[0]='\0';
}
//---------------------------------------------------------------------------

FILE *__stdcall ts::__journal::create()
{
	char module_name[MAX_PATH];
	__int32 s = ::GetModuleFileNameA( NULL, module_name, MAX_PATH);
	if (s!=0) {
		ts::cstr::mov(stream_name,module_name);
		strcat(stream_name,"_");
	} else {
		getcwd(stream_name, 256);
		strcat(stream_name,"\\");
	}
	time(&current_time);
	current_time_info = localtime (&current_time);
	strftime(current_time_asci,20,"%Y-%m-%d",current_time_info);
	strcat(stream_name,current_time_asci);
	strcat(stream_name,".txt");
	stream = fopen(stream_name,"a+");
	if (!stream) {
		ts::console::print_formated("ERROR CREATING ssts::LOGFILE");
				ts::console::getch();
		return NULL;
	} else fprintf(stream,"[ssts::JOURNAL_FILEv0.1]\n");
	return stream;
}
//---------------------------------------------------------------------------
FILE	*__stdcall ts::__journal::get_stream(void)
{
	return stream;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__journal::write_line(char *aline)
{
	__int32 line_len = ts::cstr::len(aline);
	if (line_len==0)
		return 0;
	time(&current_time);
	current_time_info = localtime (&current_time);
	strftime(current_time_asci,20,"[%F]\r\n%X=",current_time_info);
	fwrite(current_time_asci,ts::cstr::len(current_time_asci),1,stream);
	fwrite(aline,line_len,1,stream);
	fwrite("\r\n",2,1,stream);
	return line_len;
}
//---------------------------------------------------------------------------

__int32  __stdcall ts::__journal::write_formated_line(const char* __restrict__ aformat, ...)
{
		static char write_buffer[1024];
#include <stdarg.h>
/* Replace with your best guesstimate of the max total unnamed argument size */
#define VA_MAX_SIZE 1024
		struct _va_block_s {char _d[VA_MAX_SIZE];};
#define va_pass(args) va_arg(args, struct _va_block_s)
va_list  param; 
va_start(param,aformat);
	snprintf(write_buffer,1024,aformat,va_pass(param));
va_end(param);
		return this->write_line(write_buffer);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__journal::get_first_line(time_t attime)
{
		return -1;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__journal::get_next_line(void)
{
		return -1;
}
//---------------------------------------------------------------------------

char 	*__stdcall ts::__journal::read_line(__int32 aline_number)
{
return "";
}
//---------------------------------------------------------------------------

void __stdcall ts::__journal::close()
{
	if (stream!=NULL) fclose(stream);
	stream = NULL;
	stream_name[0] = '\0';
}
//---------------------------------------------------------------------------

__stdcall ts::__journal::~__journal()
{
	if (stream!=NULL) this->close();
	delete stream_name;
}
//---------------------------------------------------------------------------

