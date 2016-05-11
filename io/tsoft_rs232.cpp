//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
//#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
//---------------------------------------------------------------------------
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../io/tsoft_console.h"
#include "tsoft_rs232.h"
//---------------------------------------------------------------------------
#ifdef FREEBSD
char __com_dev[] = "/dev/cuaa0"
__int8 __com_opened = 0;
#endif
//---------------------------------------------------------------------------
#ifdef LINUX
char __com_dev[] = "/dev/ttyS0"
__int8 __com_fd = 0;
#endif
//---------------------------------------------------------------------------
#ifdef WIN32
char __com_dev[] = "COM1";
HANDLE __com_handle[255];
#endif
//---------------------------------------------------------------------------

__int32 ts::com::open(__int8 com_num, __int32 baud, char parity, char data_bits, char stop_bits)
{
#ifdef __DEBUG_RS232__
__DEBUG_FUNC_CALLED__
#endif
		if( (com_num < 1) || (com_num > 9)
				||
				((baud != 110) &&
				 (baud != 300) &&
				 (baud != 600) &&
				 (baud != 1200) &&
				 (baud != 2400) &&
				 (baud != 4800) &&
				 (baud != 9600))
				||
				((parity != COM_PARITY_NONE) &&
				 (parity != COM_PARITY_EVEN) &&
				 (parity != COM_PARITY_ODD))
				||
				((data_bits != 7) &&
				 (data_bits != 8))
				||
				((stop_bits != 1) &&
				 (stop_bits != 2)))
		return 0;

#ifdef WIN32
		DCB dcb;
		memset(&dcb,0,sizeof(dcb));
		dcb.DCBlength = sizeof(dcb);
		dcb.BaudRate = baud;
		dcb.StopBits = stop_bits;
		dcb.ByteSize = data_bits;

		switch(parity) {
				case COM_PARITY_NONE:
						dcb.fParity = FALSE;
						dcb.Parity = NOPARITY;
				break;
				case COM_PARITY_EVEN:
						dcb.fParity = TRUE;
						dcb.Parity = EVENPARITY;
				break;
				case COM_PARITY_ODD:
						dcb.fParity = TRUE;
						dcb.Parity = ODDPARITY;
				break;
		}
		__com_dev[3] = com_num;
		__com_handle[(__int32)com_num] = CreateFileA(__com_dev,GENERIC_WRITE | GENERIC_READ,0,NULL,OPEN_EXISTING,0,NULL);
		SetCommState(__com_handle[(__int32)com_num],&dcb);
#else
		__com_dev[9] = com_num;
		if(__com_opened)
				ts::com::close(com_num);
		__com_fd = open(COM_DEV,O_RDWR|O_NDELAY|O_NOCTTY);
		if(__com_fd == -1)
				return 0;
		fcntl(__com_fd,F_SETFL,0);
		__com_opened = 1;
		struct termios options;
		tcgetattr(__com_fd,&options);
		cfsetispeed(&options,baud);
		cfsetospeed(&options,baud);
		options.c_cflag &= ~CSIZE;

		switch(data_bits) {
				case 7:
						options.c_cflag |= CS7;
				break;
				case 8:
						options.c_cflag |= CS8;
				break;
		}
		switch(stop_bits) {
				case 1:
						options.c_cflag &= ~CSTOPB;
				break;
				case 2:
						options.c_cflag |= CSTOPB;
				break;
		}
		switch(parity) {
				case COM_PARITY_NONE:
						options.c_cflag &= ~PARENB;
				break;
				case COM_PARITY_EVEN:
						options.c_cflag |= PARENB;
						options.c_cflag &= ~PARODD;
				break;
				case COM_PARITY_ODD:
						options.c_cflag |= PARENB;
						options.c_cflag |= PARODD;
				break;
		}
		tcsetattr(__com_fd,TCSANOW,&options);
#endif
		return com_num;
}
//---------------------------------------------------------------------------

__int32 ts::com::close(__int8 com_num)
{
#ifdef __DEBUG_RS232__
__DEBUG_FUNC_CALLED__
#endif
		DWORD i;
#ifdef WIN32
  i = CloseHandle(__com_handle[(__int32)com_num]);
#else
		if(__com_opened) i = close(__com_fd);
		else i = 0;
#endif
  return i;
}
//---------------------------------------------------------------------------

__int32 ts::com::send(__int8 com_num,void *data,uint32_t len)
{
#ifdef __DEBUG_RS232__
__DEBUG_FUNC_CALLED__
#endif
  DWORD i;
#ifdef WIN32
  WriteFile(__com_handle[(__int32)com_num],(LPVOID)data,(DWORD)len,&i,NULL);
#else
  i = write(__com_fd,data,len);
#endif
  return i;
}
//---------------------------------------------------------------------------

__int32 ts::com::recv(__int8 com_num,void *data,uint32_t len)
{
#ifdef __DEBUG_RS232__
__DEBUG_FUNC_CALLED__
#endif
  DWORD i;
#ifdef WIN32
  ReadFile(__com_handle[(__int32)com_num],(LPVOID)data,(DWORD)len,&i,NULL);
#else
  i = read(__com_fd,data,len); break;
#endif
  return i;
}
//---------------------------------------------------------------------------
