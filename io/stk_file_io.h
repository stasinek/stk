//---------------------------------------------------------------------------
#ifndef __stk_file_io_H__
#define __stk_file_io_H__
//---------------------------------------------------------------------------
#include <stk_main.h>
//---------------------------------------------------------------------------
#ifndef WIN32
    typedef bool BOOL;
    typedef int32_t DWORD;
    typedef int32_t* LPDWORD;
    typedef int32_t HANDLE;
    typedef char* LPCSTR;
    typedef char* LPCTSTR;
    typedef void* LPCVOID;
    typedef void* LPVOID;
    typedef void* PVOID;
    #define WINAPI __stdcall
    #define ULONG_PTR long*
    #define SIZE_T size_t
    #define TCHAR char*
    #define MAX_PATH 260

        typedef struct _FILETIME {
        DWORD dwLowDateTime;
        DWORD dwHighDateTime;
    } FILETIME, *PFILETIME;
    typedef struct _OVERLAPPED {
        ULONG_PTR Internal;
        ULONG_PTR InternalHigh;
        union {
            struct {
            DWORD Offset;
            DWORD OffsetHigh;
            };
            PVOID  Pointer;
        };
        HANDLE    hEvent;
    } OVERLAPPED, *LPOVERLAPPED;
    typedef struct _SECURITY_ATTRIBUTES {
        DWORD  nLength;
        LPVOID lpSecurityDescriptor;
        BOOL   bInheritHandle;
    } SECURITY_ATTRIBUTES, *PSECURITY_ATTRIBUTES, *LPSECURITY_ATTRIBUTES;
    typedef struct _WIN32_FIND_DATAA {
        DWORD    dwFileAttributes;
        FILETIME ftCreationTime;
        FILETIME ftLastAccessTime;
        FILETIME ftLastWriteTime;
        DWORD    nFileSizeHigh;
        DWORD    nFileSizeLow;
        DWORD    dwReserved0;
        DWORD    dwReserved1;
        TCHAR    cFileName[MAX_PATH];
        TCHAR    cAlternateFileName[14];
     } WIN32_FIND_DATAA, *PWIN32_FIND_DATAA, *LPWIN32_FIND_DATAA;
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace file {
#endif
//---------------------------------------------------------------------------
#define SSC_CHECKSUM_SIG "SSC1"
typedef struct {
        int8_t s[4];
        int8_t s_data_range_from[10], s_data_range_to[10];
        int8_t s_unix_time_t[8];
        int8_t s_crc32[8];
        int8_t ssc_bits_count[4];
        int8_t ssc1024_itoa_in_hex[32];
} __ssc_readable_checksum_struct;
//------------------------------------
typedef struct {
        void *hand;
        WIN32_FIND_DATAA data;
        int next;
} __find_data_struct;
//------------------------------------
typedef struct {
        uint32_t size;
        void *ptr;
        uint32_t offset;
} __file_buffer_struct;
//------------------------------------
typedef struct {
        uint32_t index, previous_index;
        __file_buffer_struct map[32];
        uint32_t count;
} __file_buffer_struct_map;
//------------------------------------
typedef struct {
        __find_data_struct find_data;
        HANDLE hand, hand_map;
        __file_buffer_struct buffer;
        uint32_t readed, size;
} __file_open_struct;
//---------------------------------------------------------------------------

extern STK_IMPEXP HANDLE WINAPI create(
           LPCSTR lpFileName,
           DWORD dwDesiredAccess,
           DWORD dwShareMode,
        LPSECURITY_ATTRIBUTES lpSecurityAttributes,
                DWORD dwCreationDisposition,
                DWORD dwFlagsAndAttributes,
        HANDLE hTemplateFile
);
//---------------------------------------------------------------------------

extern STK_IMPEXP BOOL WINAPI write(
                   HANDLE hFile,
                   LPCVOID lpBuffer,
                  DWORD nNumberOfBytesToWrite,
          LPDWORD lpNumberOfBytesWritten,
        LPOVERLAPPED lpOverlapped
);
//---------------------------------------------------------------------------

extern STK_IMPEXP BOOL WINAPI read(
                   HANDLE hFile,
                  LPVOID lpBuffer,
                   DWORD nNumberOfBytesToRead,
          LPDWORD lpNumberOfBytesRead,
        LPOVERLAPPED lpOverlapped
);
//---------------------------------------------------------------------------

extern STK_IMPEXP HANDLE WINAPI create_map(
                HANDLE hFile,
        LPSECURITY_ATTRIBUTES lpAttributes,
                DWORD flProtect,
                DWORD dwMaximumSizeHigh,
                DWORD dwMaximumSizeLow,
        LPCTSTR lpName
);
//---------------------------------------------------------------------------

extern STK_IMPEXP LPVOID WINAPI create_map_view(
   HANDLE hFileMappingObject,
        DWORD dwDesiredAccess,
        DWORD dwFileOffsetHigh,
        DWORD dwFileOffsetLow,
        SIZE_T dwNumberOfBytesToMap
);
//---------------------------------------------------------------------------

extern STK_IMPEXP BOOL WINAPI flush_map_view(
        LPCVOID lpBaseAddress,
        SIZE_T dwNumberOfBytesToFlush
);
//---------------------------------------------------------------------------

extern STK_IMPEXP BOOL WINAPI close_map_view(
        LPCVOID lpBaseAddress
);
//---------------------------------------------------------------------------

extern STK_IMPEXP BOOL WINAPI close(
        HANDLE hObject
);
//---------------------------------------------------------------------------

extern STK_IMPEXP BOOL WINAPI close_map(
        HANDLE hObject
);
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}//namespace stk,file
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

