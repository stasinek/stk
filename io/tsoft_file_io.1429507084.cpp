//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015---------------
//---------------------------------------------------------------------------
#include "tsoft_file_io.h"
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
return MapViewOfFile(hFileMappingObject,dwDesiredAccess,dwFileOffsetHigh,dwFileOffsetLow,dwNumberOfBytesToMap);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::flush_map_view(
		LPCVOID lpBaseAddress,
		SIZE_T dwNumberOfBytesToFlush
)
{
return FlushViewOfFile(lpBaseAddress,dwNumberOfBytesToFlush);

}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::close_map_view(
		LPCVOID lpBaseAddress
)
{
return UnmapViewOfFile(lpBaseAddress);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::close(
		HANDLE hObject
)
{
return CloseHandle(hObject);
}
//---------------------------------------------------------------------------

BOOL WINAPI ts::file::close_map(
		HANDLE hObject
)
{
return CloseHandle(hObject);
}
//---------------------------------------------------------------------------

int ts::file::send(int file_num,void *data,unsigned long int len)
{
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
  DWORD i = 0;
#ifdef WIN32
  //read(__file_handle,(LPVOID)data,(DWORD)len,&i,NULL);
#else
//  i = ::read(__file_fd,data,len); break;
#endif
  return i;
}
//---------------------------------------------------------------------------
