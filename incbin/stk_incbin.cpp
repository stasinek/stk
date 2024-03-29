//---------------------------------------------------------------------------
#ifdef __GNUC__
#include <stdint.h>
#endif
#ifdef __WIN32__
#include <windows.h>
#endif
#pragma hdrstop
//---------------------------------------------------------------------------
#include "stk_incbin.h"
//---------------------------------------------------------------------------
char test[] = { "Test1\nTest2\n" };
//---------------------------------------------------------------------------
#ifdef __WIN32__
#ifndef GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS
    #define GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS 0x00000004
#endif
#ifdef __WATCOMC__
    HMODULE WINAPI GetCurrentModule()
    {
        HMODULE h_module = NULL;
        h_module = GetModuleHandle(NULL);
    return h_module;
    }
#elif __BORLANDC__ <= 0x551
    HMODULE WINAPI GetModuleHandleEx(DWORD flag,LPCTSTR name,void *handle)
    {
        HMODULE h_module = NULL;
        h_module = GetModuleHandle(name);
    return h_module;
    }
#else
HMODULE WINAPI GetCurrentModule()
{
        HMODULE h_module = NULL;
        GetModuleHandleEx(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS,
    (LPCTSTR)GetCurrentModule,
    &h_module);
    return h_module;
}
#endif
int __stdcall incbin_rc(char** resource_data, int RESOURCE_ID)
{
    HRSRC       resource;
    HGLOBAL     resource_handle;
    DWORD       resource_size;
    // GetCurrentModule() not available prior to Windows XP
    resource = ::FindResource(NULL, MAKEINTRESOURCE(RESOURCE_ID), RT_RCDATA);
    if (resource==0)
        return 0;
    resource_handle = ::LoadResource(NULL, resource);
    if (resource_handle==0)
        return 0 ;
    *resource_data = (char*)LockResource(resource_handle);
     resource_size = ::SizeofResource(NULL, resource);
    return resource_size;
}
#else // NOT WIN32, Linux, BSD, etc.
//---------------------------------------------------------------------------
int __stdcall incbin_rc(char** resource_data, int RESOURCE_ID)
{
//TODO: incbin_rc - Not yet implemented
}
#endif
//---------------------------------------------------------------------------

