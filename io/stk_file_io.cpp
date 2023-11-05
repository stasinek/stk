//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
    #pragma hdrstop
#endif
#include "./../mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_file_io.h"
//---------------------------------------------------------------------------

HANDLE WINAPI stk::file::create(
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
__DEBUG_CALLED("")
#endif
return ::CreateFileA(lpFileName,dwDesiredAccess,dwShareMode,lpSecurityAttributes,dwCreationDisposition,dwFlagsAndAttributes,hTemplateFile);
}
//---------------------------------------------------------------------------

BOOL WINAPI stk::file::write(
        HANDLE hFile,
        LPCVOID lpBuffer,
        DWORD nNumberOfBytesToWrite,
        LPDWORD lpNumberOfBytesWritten,
        LPOVERLAPPED lpOverlapped
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return WriteFile(hFile,lpBuffer,nNumberOfBytesToWrite,lpNumberOfBytesWritten,lpOverlapped);
}
//---------------------------------------------------------------------------

BOOL WINAPI stk::file::read(
        HANDLE hFile,
        LPVOID lpBuffer,
        DWORD nNumberOfBytesToRead,
        LPDWORD lpNumberOfBytesRead,
        LPOVERLAPPED lpOverlapped
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return ReadFile(hFile,lpBuffer,nNumberOfBytesToRead,lpNumberOfBytesRead,lpOverlapped);
}
//---------------------------------------------------------------------------

HANDLE WINAPI stk::file::create_map(
        HANDLE hFile,
        LPSECURITY_ATTRIBUTES lpAttributes,
        DWORD flProtect,
        DWORD dwMaximumSizeHigh,
        DWORD dwMaximumSizeLow,
        LPCTSTR lpName
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return CreateFileMapping(hFile,lpAttributes,flProtect,dwMaximumSizeHigh,dwMaximumSizeLow,lpName);
}
//---------------------------------------------------------------------------

LPVOID WINAPI stk::file::create_map_view(
        HANDLE hFileMappingObject,
        DWORD dwDesiredAccess,
        DWORD dwFileOffsetHigh,
        DWORD dwFileOffsetLow,
        SIZE_T dwNumberOfBytesToMap
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return MapViewOfFile(hFileMappingObject,dwDesiredAccess,dwFileOffsetHigh,dwFileOffsetLow,dwNumberOfBytesToMap);
}
//---------------------------------------------------------------------------

BOOL WINAPI stk::file::flush_map_view(
        LPCVOID lpBaseAddress,
        SIZE_T dwNumberOfBytesToFlush
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return FlushViewOfFile(lpBaseAddress,dwNumberOfBytesToFlush);

}
//---------------------------------------------------------------------------

BOOL WINAPI stk::file::close_map_view(
        LPCVOID lpBaseAddress
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return UnmapViewOfFile(lpBaseAddress);
}
//---------------------------------------------------------------------------

BOOL WINAPI stk::file::close(
        HANDLE hObject
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return CloseHandle(hObject);
}
//---------------------------------------------------------------------------

BOOL WINAPI stk::file::close_map(
        HANDLE hObject
)
{
#ifdef __DEBUG_FILE_IO_
__DEBUG_CALLED("")
#endif
return CloseHandle(hObject);
}
//---------------------------------------------------------------------------
