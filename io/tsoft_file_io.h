//---------------------------------------------------------------------------
#ifndef __tsoft_file_io_H__
#define __tsoft_file_io_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace file {
//---------------------------------------------------------------------------
#define SSC_CHECKSUM_SIG "SSC1"
typedef struct {
		__int8 s[4];
		__int8 s_data_range_from[10], s_data_range_to[10];
		__int8 s_unix_time_t[8];
		__int8 s_crc32[8];
		__int8 ssc_bits_count[4];
		__int8 ssc1024_itoa_in_hex[32];
} __ssc_readable_checksum_struct;

//------------------------------------
typedef struct {
		void *hand;
		WIN32_FIND_DATAA data;
		int next;
} __find_data_struct;
//------------------------------------
typedef struct {
		__int32 size;
		void *ptr;
		__int32 offset;
} __file_buffer_struct;
//------------------------------------
typedef struct {
		__int32 index, previous_index;
		__file_buffer_struct map[32];
		__int32 count;
} __file_buffer_struct_map;
//------------------------------------
typedef struct {
		__find_data_struct find_data;
		HANDLE hand, hand_map;
		__file_buffer_struct buffer;
		__int32 readed, size;
} __file_open_struct;
//---------------------------------------------------------------------------

extern HANDLE WINAPI create(
		   LPCSTR lpFileName,
		   DWORD dwDesiredAccess,
		   DWORD dwShareMode,
		LPSECURITY_ATTRIBUTES lpSecurityAttributes,
				DWORD dwCreationDisposition,
				DWORD dwFlagsAndAttributes,
		HANDLE hTemplateFile
);
//---------------------------------------------------------------------------

extern BOOL WINAPI write(
				   HANDLE hFile,
				   LPCVOID lpBuffer,
				  DWORD nNumberOfBytesToWrite,
		  LPDWORD lpNumberOfBytesWritten,
		LPOVERLAPPED lpOverlapped
);
//---------------------------------------------------------------------------

extern BOOL WINAPI read(
				   HANDLE hFile,
				  LPVOID lpBuffer,
				   DWORD nNumberOfBytesToRead,
		  LPDWORD lpNumberOfBytesRead,
		LPOVERLAPPED lpOverlapped
);
//---------------------------------------------------------------------------

extern HANDLE WINAPI create_map(
				HANDLE hFile,
		LPSECURITY_ATTRIBUTES lpAttributes,
				DWORD flProtect,
				DWORD dwMaximumSizeHigh,
				DWORD dwMaximumSizeLow,
		LPCTSTR lpName
);
//---------------------------------------------------------------------------

extern LPVOID WINAPI create_map_view(
   HANDLE hFileMappingObject,
		DWORD dwDesiredAccess,
		DWORD dwFileOffsetHigh,
		DWORD dwFileOffsetLow,
		SIZE_T dwNumberOfBytesToMap
);
//---------------------------------------------------------------------------

extern BOOL WINAPI flush_map_view(
		LPCVOID lpBaseAddress,
		SIZE_T dwNumberOfBytesToFlush
);
//---------------------------------------------------------------------------

extern BOOL WINAPI close_map_view(
		LPCVOID lpBaseAddress
);
//---------------------------------------------------------------------------

extern BOOL WINAPI close(
		HANDLE hObject
);
//---------------------------------------------------------------------------

extern BOOL WINAPI close_map(
		HANDLE hObject
);
//---------------------------------------------------------------------------

extern int send(int com_num,void *data,unsigned long int len);
extern int recv(int com_num,void *data,unsigned long int len);
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

