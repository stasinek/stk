#ifndef __tsoft_file_ini_h__
#define __tsoft_file_ini_h__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include <windows.h>
//---------------------------------------------------------------------------
namespace ts { namespace file {
extern DWORD __cdecl get_wchar_value_at_section(wchar_t *lpSection, wchar_t *lpValue,
	   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile);
extern DWORD __cdecl get_value_at_section(wchar_t *lpSection, wchar_t *lpValue,
	   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
