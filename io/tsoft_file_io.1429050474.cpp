//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015---------------
//---------------------------------------------------------------------------
#include "tsoft_file_io.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------

time_t __stdcall ts::file::FILETIME_to_time_t(FILETIME const& ft)
{
	ULARGE_INTEGER ull;
	ull.HighPart = ft.dwHighDateTime;
	ull.LowPart = ft.dwLowDateTime;
	return (ull.QuadPart / 10000000ULL) - 11644473600ULL;
}

FILETIME* __stdcall ts::file::time_t_to_FILETIME(time_t t, LPFILETIME pft)
{
// Note that LONGLONG is a 64-bit value
	LONGLONG ull;
	ull = (LONGLONG)(((LONGLONG)(LONG)t) * (LONGLONG)((LONG)10000000) + 116444736000000000);
	pft->dwLowDateTime = (DWORD)ull;
	pft->dwHighDateTime = ull >> 32;
	return pft;
}

//---------------------------------------------------------------------------
#include "tsoft_rs232.h"
//---------------------------------------------------------------------------
#include <windows.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
//---------------------------------------------------------------------------
#ifdef WIN32
char __file_dev[] = "file1";
HANDLE __file_handle = NULL;
#elif FREEBSD
char __file_dev[] = "/dev/cuaa0"
int __file_opened = 0;
#elif LINUX
char __file_dev[] = "/dev/ttyS0"
int __file_fd = 0;
#else
char __file_dev[] = "file1";
HANDLE __file_handle = NULL;
int __file_opened = 0;
int __file_fd = 0;

#ifndef O_NDELAY
#define O_NDELAY 0
#endif
#ifndef O_NOCTTY
#define O_NOCTTY (int)0
#endif
#endif

//---------------------------------------------------------------------------

int ts::file::open(int file_num,int baud,int parity,int data_bits,int stop_bits)
{
		if( (file_num < 1) || (file_num > 9))
		return 0;

#ifdef WIN32
		DCB dcb;
		memset(&dcb,0,sizeof(dcb));
		dcb.DCBlength = sizeof(dcb);
		dcb.BaudRate = baud;
		dcb.StopBits = stop_bits;
		dcb.ByteSize = data_bits;

		__file_dev[3] = file_num;
		__file_handle = CreateFileA(__file_dev,GENERIC_WRITE | GENERIC_READ,0,NULL,OPEN_EXISTING,0,NULL);
#else
		__file_dev[9] = file_num;
		if(__file_opened)
				ts::file::close(file_num);
		__file_fd = ::open(__file_dev,O_RDWR|O_NDELAY|O_NOCTTY);
		if(__file_fd == -1)
				return 0;
		::fcntl(__file_fd,F_SETFL,0);
		__file_opened = 1;
		struct termios options;
		tcgetattr(__file_fd,&options);
		cfsetispeed(&options,baud);
		cfsetospeed(&options,baud);
		options.c_cflag &= ~CSIZE;

		tcsetattr(__file_fd,TCSANOW,&options);
#endif
		return file_num;
}
//---------------------------------------------------------------------------

int ts::file::close(int file_num)
{
		DWORD i = 0;
#ifdef WIN32
  i = CloseHandle(__file_handle);
#else
		if(__file_opened)
				i = ::close(__file_fd);
#endif
  return i;
}
//---------------------------------------------------------------------------

int ts::file::send(int file_num,void *data,unsigned long int len)
{
  DWORD i = 0;
#ifdef WIN32
  WriteFile(__file_handle,(LPVOID)data,(DWORD)len,&i,NULL);
#else
  i = ::write(__file_fd,data,len);
#endif
  return i;
}
//---------------------------------------------------------------------------

int ts::file::recv(int file_num,void *data,unsigned long int len)
{
  DWORD i = 0;
#ifdef WIN32
  ReadFile(__file_handle,(LPVOID)data,(DWORD)len,&i,NULL);
#else
  i = ::read(__file_fd,data,len); break;
#endif
  return i;
}
//---------------------------------------------------------------------------
