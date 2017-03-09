//---------------------------------------------------------------------------
#ifndef tsoft_file_ini_h
#define tsoft_file_ini_h
//---------------------------------------------------------------------------
#include "./../../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace file {
extern DWORD __cdecl get_wchar_value_at_ini_section(wchar_t *lpSection, wchar_t *lpValue,
		   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile);
extern DWORD __cdecl get_value_at_ini_section(wchar_t *lpSection, wchar_t *lpValue,
		   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
