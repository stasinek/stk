//---------------------------------------------------------------------------
//-----------------Stanislaw Stasiak "stk_, where?" 2001-2002---------------
//---------------------------------------------------------------------------
#ifndef DLLstk_FileRamH
#define DLLstk_FileRamH
#include <windows.h>
#pragma hdrstop
#include "DLLstk_DlaChara.h"
#define USED 'U'
#define FREE 'F'
//---------------------------------------------------------------------------
/*struct __mft
  { long icnt;
  };
struct __mft_node
  { long hash;
    long link;
  };
*/
struct __node
  { char    null;
    char    attr;
    void **lpdad;
    char    used; long next, prev, size;
  };
//---------------------------------------------------------------------------
class stk_FileRam
{
public:
//---------------------------------------------------------------------------
private:
//---------------------------------------------------------------------------
struct __maciez
  {
    char *FName;
    HANDLE FHand, FHMap;
    long  FCurrSize, FRealSize, FFixdSize;
  } maciez;
//------------------------------------
__declspec(dllexport) void __stdcall SetName  (char *AName);
//------------------------------------
__declspec(dllexport) long __stdcall Resize    (long ASize);
//------------------------------------
public:
//------------------------------------
__declspec(dllexport) __stdcall stk_FileRam   (void);
__declspec(dllexport) __stdcall stk_FileRam   (char *AName);
 //------------------------------------
__property            char           *Name   ={read=maciez.FName, write=SetName};
__declspec(dllexport) bool  __stdcall Open     ();
__declspec(dllexport) void  __stdcall Close    ();
__declspec(dllexport) void  __stdcall Flush    (void *ptr, long size);
__declspec(dllexport) void  __stdcall Defrag   ();
//------------------------------------
__declspec(dllexport) void *__stdcall Alloc    (long  Aptr_size);
__declspec(dllexport) void *__stdcall ReAlloc  (void *Aptr, long Aptr_size);
__declspec(dllexport) void  __stdcall Free     (void *Aptr);
__declspec(dllexport) void  __stdcall Push     (void *Aptr, long Aptr_size);
__declspec(dllexport) void  __stdcall Pop      ();
__declspec(dllexport) void           *Base;
//------------------------------------
__declspec(dllexport) __stdcall ~stk_FileRam  (void);
//------------------------------------
};
//---------------------------------------------------------------------------
#endif

