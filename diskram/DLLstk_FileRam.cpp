//---------------------------------------------------------------------------
#include <windows.h>
#pragma hdrstop
#include "DLLstk_FileRam.h"
#pragma link "DLLstk_DlaChara.obj"
//---------------------------------------------------------------------------
//DATABASE
//---------------------------------------------------------------------------

__stdcall stk_FileRam::stk_FileRam(void)
{
maciez.FName = strAllocEx(1,"");
maciez.FHand = INVALID_HANDLE_VALUE;
maciez.FHMap = INVALID_HANDLE_VALUE;
this->Base  = NULL;
maciez.FRealSize  = 0;
maciez.FCurrSize  = 0;
}
//---------------------------------------------------------------------------

__stdcall stk_FileRam::stk_FileRam(char *AName)
{
maciez.FName = strDup(AName);
maciez.FHand = INVALID_HANDLE_VALUE;
maciez.FHMap = INVALID_HANDLE_VALUE;
maciez.FRealSize = 0;
maciez.FCurrSize = 0;
this->Base  = NULL;
}
//---------------------------------------------------------------------------

void __stdcall stk_FileRam::SetName(char *AName)
{
maciez.FName = strReDup(maciez.FName,AName);
}
//---------------------------------------------------------------------------

bool __stdcall stk_FileRam::Open()
{
if (strLen(maciez.FName)==0)
    return 0;

Close(); maciez.FHand = CreateFile(maciez.FName,
                          GENERIC_READ|GENERIC_WRITE,FILE_SHARE_DELETE,NULL,OPEN_ALWAYS,
                          FILE_ATTRIBUTE_NORMAL,NULL);
if (maciez.FHand==INVALID_HANDLE_VALUE)
    return 0;

BYTE  RootPathName[3] = "C:";
RootPathName[0] = maciez.FName[0];
DWORD BytesPerSector  = 512, SectorsPerCluster = 1;
GetDiskFreeSpace(RootPathName,&SectorsPerCluster,&BytesPerSector,NULL,NULL);
maciez.FFixdSize = SectorsPerCluster * BytesPerSector * 8;
maciez.FCurrSize = GetFileSize(maciez.FHand,NULL);
maciez.FRealSize = maciez.FCurrSize + maciez.FFixdSize - maciez.FCurrSize % maciez.FFixdSize;

maciez.FHMap = CreateFileMapping(maciez.FHand,NULL,
                                 PAGE_READWRITE|SEC_RESERVE|SEC_NOCACHE,
                                 0,maciez.FRealSize, "stk_FileMem");
if (maciez.FHMap==INVALID_HANDLE_VALUE)
    return -1;
this->Base = MapViewOfFile(maciez.FHMap,FILE_MAP_ALL_ACCESS,0,0,maciez.FRealSize);
if (this->Base==NULL)
   {CloseHandle(maciez.FHMap);
    maciez.FHMap =INVALID_HANDLE_VALUE;
    return -1;
   }
if (maciez.FCurrSize==0)
   {maciez.FCurrSize =sizeof(__node);
    __node *ptr_dad = (__node*)this->Base;
    ptr_dad->next = 0;
    ptr_dad->prev = 0;
    ptr_dad->size = 0;
    ptr_dad->attr = 0;
    ptr_dad->used = USED;
   }
return 1;
}
//---------------------------------------------------------------------------

void __stdcall stk_FileRam::Close()
{
if (this->Base!=NULL)
   {FlushViewOfFile(this->Base,maciez.FCurrSize);
    UnmapViewOfFile(this->Base);
    this->Base =NULL;
   }
if (maciez.FHMap!=INVALID_HANDLE_VALUE)
   {CloseHandle(maciez.FHMap);
    maciez.FHMap =INVALID_HANDLE_VALUE;
   }
if (maciez.FHand!=INVALID_HANDLE_VALUE)
   {SetFilePointer(maciez.FHand, maciez.FCurrSize,0,FILE_BEGIN); SetEndOfFile(maciez.FHand);
    CloseHandle(maciez.FHand);
    maciez.FHand =INVALID_HANDLE_VALUE;
   }
maciez.FRealSize = maciez.FCurrSize = 0;
}
//---------------------------------------------------------------------------

long __stdcall stk_FileRam::Resize(long ASize)
{
if (maciez.FCurrSize==ASize)
    return ASize;
if (maciez.FRealSize>=ASize && ASize>=maciez.FRealSize-maciez.FFixdSize)
   {return maciez.FCurrSize = ASize;
   }
else
   {maciez.FRealSize =ASize + maciez.FFixdSize-ASize % maciez.FFixdSize;
   }
if (this->Base!=NULL)
   {FlushViewOfFile(this->Base,maciez.FCurrSize);
    UnmapViewOfFile(this->Base);
    this->Base =NULL;
   }
if (maciez.FHMap!=INVALID_HANDLE_VALUE)
   {CloseHandle(maciez.FHMap);
    maciez.FHMap =INVALID_HANDLE_VALUE;
   }
if (maciez.FHand!=INVALID_HANDLE_VALUE)
   {SetFilePointer(maciez.FHand,maciez.FRealSize,0,FILE_BEGIN); SetEndOfFile(maciez.FHand);
   }
maciez.FHMap = CreateFileMapping(maciez.FHand,NULL,
                                 PAGE_READWRITE|SEC_RESERVE|SEC_NOCACHE,
                                 0,maciez.FRealSize, "stk_FileMem");
if (maciez.FHMap==INVALID_HANDLE_VALUE)
    return -1;
this->Base = MapViewOfFile(maciez.FHMap,FILE_MAP_ALL_ACCESS,0,0,maciez.FRealSize);
if (this->Base==NULL)
   {CloseHandle(maciez.FHMap);
    maciez.FHMap =INVALID_HANDLE_VALUE;
    maciez.FCurrSize = 0;
    return -1;
   }
return maciez.FCurrSize = ASize;
}
//---------------------------------------------------------------------------

void *__stdcall stk_FileRam::Alloc(long Aptr_size)
{
__node *bgn = (__node*)this->Base;
__node *cur = bgn;
__node *dad;
__node *son;

for ( ;; )
{
if (cur->next==0)
    break;
if (cur->used==FREE && cur->size >= Aptr_size+sizeof(__node))
   {dad = cur;
   long old_size = dad->size;
    dad->size = Aptr_size;
    cur = (__node*)((ULONG)dad + sizeof(__node)+dad->size);
   long old_next = dad->next;
    dad->next = (ULONG)cur-(ULONG)bgn;
    cur->size = old_size - sizeof(__node) - dad->size;
    cur->next = old_next;
    cur->prev = (ULONG)dad-(ULONG)bgn;
    cur->used = FREE;
    return (void*)((ULONG)cur + sizeof(__node));
   }
dad = cur;
cur = (__node*)((ULONG)bgn + dad->next);
}
if (cur->used==FREE)
   {cur->size =Aptr_size;
    cur->used =USED;
   long new_size = (ULONG)cur-(ULONG)bgn + sizeof(__node)+Aptr_size;
    if (new_size > maciez.FCurrSize)
        Resize(new_size);
    cur = (__node*)((ULONG)this->Base + (ULONG)cur-(ULONG)bgn);
    bgn = (__node*)this->Base;
   }
else
   {dad = cur;
    dad->next = (ULONG)dad-(ULONG)bgn + sizeof(__node)+dad->size;
   long new_size = dad->next + sizeof(__node)+Aptr_size;
    if (new_size > maciez.FCurrSize)
        Resize(new_size);
    dad = (__node*)((ULONG)this->Base + (ULONG)dad-(ULONG)bgn);
    bgn = (__node*)this->Base;
    cur = (__node*)((ULONG)bgn + dad->next);
    cur->size = Aptr_size;
    cur->next = 0;
    cur->prev = (ULONG)dad-(ULONG)bgn;
    cur->used = USED;
   }
return (void*)((ULONG)cur + sizeof(__node));
}
//---------------------------------------------------------------------------

void *__stdcall stk_FileRam::ReAlloc(void *ptr, long Aptr_size)
{
__node *bgn = (__node*)this->Base;
__node *cur = (__node*)((ULONG)ptr - sizeof(__node));
__node *dad = (__node*)((ULONG)bgn + cur->prev);
__node *son = (__node*)((ULONG)bgn + cur->next);

if (cur->size==Aptr_size)
    return ptr;
if (cur->prev!=0 && dad->used==FREE)
   {dad->size+= sizeof(__node)+cur->size;
    dad->next = cur->next;
    cur = dad;
    dad = (__node*)((ULONG)bgn + cur->prev);
   }
if (cur->next!=0 && son->used==FREE)
   {cur->size+= sizeof(__node)+son->size;
    cur->next = son->next;
    son = (__node*)((ULONG)bgn + cur->next);
   }
if (cur->next!=0)
   {son->prev =(ULONG)cur-(ULONG)bgn;
   }
if (cur->size >= Aptr_size+sizeof(__node))
   {dad = cur;
   long old_size = dad->size;
    dad->size = Aptr_size;
    cur = (__node*)((ULONG)dad + sizeof(__node)+dad->size);
   long old_next = dad->next;
    dad->next = (ULONG)cur-(ULONG)bgn;
    cur->size = old_size - sizeof(__node) - dad->size;
    cur->next = old_next;
    cur->prev = (ULONG)dad-(ULONG)bgn;
    cur->used = FREE;
    if (cur->next==0)
        return ptr;
    son = (__node*)((ULONG)bgn + cur->next);
    son->prev = (ULONG)cur-(ULONG)bgn;
    return ptr;
   }
else
   {cur->used = FREE;
    return memmove(Alloc(Aptr_size),(void*)((ULONG)cur + sizeof(__node)), Aptr_size);
   }
}
//---------------------------------------------------------------------------

void __stdcall stk_FileRam::Free(void *ptr)
{
__node *bgn = (__node*)this->Base;
__node *cur = (__node*)((ULONG)ptr - sizeof(__node));
__node *dad = (__node*)((ULONG)bgn + cur->prev);
__node *son = (__node*)((ULONG)bgn + cur->next);

if (cur->prev!=0 && dad->used==FREE)
   {dad->size+= sizeof(__node)+cur->size;
    dad->next = cur->next;
    cur = dad;
    dad = (__node*)((ULONG)bgn + cur->prev);
   }
if (cur->next!=0 && son->used==FREE)
   {cur->size+= sizeof(__node)+son->size;
    cur->next = son->next;
    son = (__node*)((ULONG)bgn + cur->next);
   }
if (cur->next!=0)
   {son->prev =(ULONG)cur - (ULONG)bgn;
   }
else
   {dad->next =0;
    return;
   }
cur->used = FREE;
}
//---------------------------------------------------------------------------

void __stdcall stk_FileRam::Defrag()
{
__node *bgn = (__node*)this->Base;
__node *cur = (__node*)bgn;
__node *dad;
__node *son;

for ( ;; )
{
if (cur->next==0)
    break;
son = (__node*)((ULONG)bgn+cur->next);

if (cur->used==FREE && son->used==FREE)
   {cur->size+=sizeof(__node)+son->size;
    cur->next =son->next;
    if (cur->next==0)
        break;
    son = (__node*)((ULONG)bgn + cur->next);
    son->prev = (ULONG)cur-(ULONG)bgn;
   }
if (cur->used==FREE)
   {long old_size = cur->size;
    long old_son_next = son->next;
    cur->size = son->size;
    cur->next = (ULONG)cur-(ULONG)bgn + sizeof(__node)+cur->size;
    cur->used = USED;
    memmove((void*)((ULONG)cur + sizeof(__node)),(void*)((ULONG)son + sizeof(__node)),son->size);
    dad = cur;
    cur = (__node*)((ULONG)bgn + dad->next);
    cur->size = old_size;
    cur->next = old_son_next;
    cur->prev = (ULONG)dad-(ULONG)bgn;
    cur->used = FREE;
    if (cur->next==0)
        break;
    son = (__node*)((ULONG)bgn + cur->next);
    son->prev = (ULONG)cur-(ULONG)bgn;
    continue;
   }
cur = son;
}
if (cur->used==USED)
   {int new_size = (ULONG)cur-(ULONG)bgn + sizeof(__node)+cur->size;
    Resize(new_size);
    return;
   }
else
   {int new_size = (ULONG)cur-(ULONG)bgn;
    Resize(new_size);
    return;
   }
}
//---------------------------------------------------------------------------

void __stdcall stk_FileRam::Flush(void *ptr, long size)
{
FlushViewOfFile(ptr,size);
}
//---------------------------------------------------------------------------

__stdcall stk_FileRam::~stk_FileRam(void)
{
Close();
strFree(maciez.FName);
}
//---------------------------------------------------------------------------

