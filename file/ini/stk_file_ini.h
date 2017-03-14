//---------------------------------------------------------------------------
#ifndef stk_file_ini_h
#define stk_file_ini_h
//---------------------------------------------------------------------------
#include "./../../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace file {
extern DWORD __cdecl get_wchar_value_at_ini_section(wchar_t *lpSection, wchar_t *lpValue,
		   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile);
extern DWORD __cdecl get_value_at_ini_section(wchar_t *lpSection, wchar_t *lpValue,
		   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
