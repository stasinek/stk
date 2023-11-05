//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
//#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#ifdef __BORLANDC__
    #pragma hdrstop
#endif
#include "./../text/stk_cstr_utils.h"
#include "./../mem/stk_mem.h"
#include "./../io/stk_console.h"
//---------------------------------------------------------------------------
#include "stk_rs232.h"
//---------------------------------------------------------------------------
#ifdef FREEBSD
char __com_dev[] = "/dev/cuaa0"
int8_t __com_opened = 0;
#endif
//---------------------------------------------------------------------------
#ifdef LINUX
char __com_dev[] = "/dev/ttyS0"
int8_t __com_fd = 0;
#endif
//---------------------------------------------------------------------------
#ifdef __WIN32__
char __com_dev[] = "COM1";
HANDLE __com_handle[255];
#endif
//---------------------------------------------------------------------------

int32_t __stdcall stk::com::open(const int8_t com_num, const int32_t baud, const char parity, const char data_bits, const char stop_bits)
{
#ifdef __DEBUG_RS232__
__DEBUG_CALLED("")
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

#ifdef __WIN32__
        DCB dcb;
        stk::mem::set(&dcb,0,sizeof(dcb));
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
        __com_handle[(int32_t)com_num] = CreateFileA(__com_dev,GENERIC_WRITE | GENERIC_READ,0,NULL,OPEN_EXISTING,0,NULL);
        SetCommState(__com_handle[(int32_t)com_num],&dcb);
#else
        __com_dev[9] = com_num;
        if(__com_opened)
                stk::com::close(com_num);
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

int32_t __stdcall stk::com::close(const int8_t com_num)
{
#ifdef __DEBUG_RS232__
__DEBUG_CALLED("")
#endif
        DWORD i;
#ifdef __WIN32__
  i = CloseHandle(__com_handle[(int32_t)com_num]);
#else
        if(__com_opened) i = close(__com_fd);
        else i = 0;
#endif
  return i;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::com::send(const int8_t com_num,void *data,const int32_t len)
{
#ifdef __DEBUG_RS232__
__DEBUG_CALLED("")
#endif
  DWORD i;
#ifdef __WIN32__
  WriteFile(__com_handle[(int32_t)com_num],(LPVOID)data,(DWORD)len,&i,NULL);
#else
  i = write(__com_fd,data,len);
#endif
  return i;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::com::recv(int8_t com_num,void *data,int32_t len)
{
#ifdef __DEBUG_RS232__
__DEBUG_CALLED("")
#endif
  DWORD i;
#ifdef __WIN32__
  ReadFile(__com_handle[(int32_t)com_num],(LPVOID)data,(DWORD)len,&i,NULL);
#else
  i = read(__com_fd,data,len); break;
#endif
  return i;
}
//---------------------------------------------------------------------------
