//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_file_io.h"
#include "./../mem/tsoft_mem.h"
//---------------------------------------------------------------------------
HANDLE WINAPI ts::file::create(
        LPCSTR lpFileName,
        DWORD dwDesiredAccess,
        DWORD dwShareMode,
        LPSECURITY_ATTRIBUTES lpSecurityAttributes,
        DWORD dwCreationDisposition,
        DWORD dwFlagsAndAttributes,
        HANDLE hTemplateFile
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return CreateFileA(lpFileName,dwDesiredAccess,dwShareMode,lpSecurityAttributes,dwCreationDisposition,dwFlagsAndAttributes,hTemplateFile);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::write(
        HANDLE hFile,
        LPCVOID lpBuffer,
        DWORD nNumberOfBytesToWrite,
        LPDWORD lpNumberOfBytesWritten,
        LPOVERLAPPED lpOverlapped
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return WriteFile(hFile,lpBuffer,nNumberOfBytesToWrite,lpNumberOfBytesWritten,lpOverlapped);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::read(
        HANDLE hFile,
        LPVOID lpBuffer,
        DWORD nNumberOfBytesToRead,
        LPDWORD lpNumberOfBytesRead,
        LPOVERLAPPED lpOverlapped
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return ReadFile(hFile,lpBuffer,nNumberOfBytesToRead,lpNumberOfBytesRead,lpOverlapped);
}
//---------------------------------------------------------------------------

HANDLE WINAPI ts::file::create_map(
        HANDLE hFile,
        LPSECURITY_ATTRIBUTES lpAttributes,
        DWORD flProtect,
        DWORD dwMaximumSizeHigh,
        DWORD dwMaximumSizeLow,
        LPCTSTR lpName
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return CreateFileMapping(hFile,lpAttributes,flProtect,dwMaximumSizeHigh,dwMaximumSizeLow,lpName);
}
//---------------------------------------------------------------------------

LPVOID WINAPI ts::file::create_map_view(
        HANDLE hFileMappingObject,
        DWORD dwDesiredAccess,
        DWORD dwFileOffsetHigh,
        DWORD dwFileOffsetLow,
        SIZE_T dwNumberOfBytesToMap
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return MapViewOfFile(hFileMappingObject,dwDesiredAccess,dwFileOffsetHigh,dwFileOffsetLow,dwNumberOfBytesToMap);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::flush_map_view(
        LPCVOID lpBaseAddress,
        SIZE_T dwNumberOfBytesToFlush
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return FlushViewOfFile(lpBaseAddress,dwNumberOfBytesToFlush);

}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::close_map_view(
        LPCVOID lpBaseAddress
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return UnmapViewOfFile(lpBaseAddress);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::close(
        HANDLE hObject
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return CloseHandle(hObject);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::close_map(
        HANDLE hObject
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
return CloseHandle(hObject);
}
//---------------------------------------------------------------------------

int ts::file::send(int file_num,void *data,unsigned long int len)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
  DWORD i = 0;
#ifdef WIN32
//  write(__file_handle,(LPVOID)data,(DWORD)len,&i,NULL);
#else
//  i = ::write(__file_fd,data,len);
#endif
  return i;
}
//---------------------------------------------------------------------------

int ts::file::recv(int file_num,void *data,unsigned long int len)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_FUNC_CALLED("")
#endif
  DWORD i = 0;
#ifdef WIN32
  //read(__file_handle,(LPVOID)data,(DWORD)len,&i,NULL);
#else
//  i = ::read(__file_fd,data,len); break;
#endif
  return i;
}
//---------------------------------------------------------------------------
