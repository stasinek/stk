//---------------------------------------------------------------------------
#ifndef __tsoft_mime_types_H__
#define __tsoft_mime_types_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace file { namespace mime {
//---------------------------------------------------------------------------
extern char *__stdcall decode(char* a_file_name);
#ifdef __WATCOMC__
extern void  __destructor(void);
#else
extern void __cdecl  __destructor(void);
#endif
//---------------------------------------------------------------------------
}}}
//---------------------------------------------------------------------------
#endif
