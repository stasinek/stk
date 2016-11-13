//---------------------------------------------------------------------------
#ifndef tsoft_MAIN_H
#define tsoft_MAIN_H
//---------------------------------------------------------------------------
//asm(".intel_syntax noprefix\n\t");
#ifndef WIN32
#define WIN32
#endif
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#ifndef UNICODE
#define UNICODE
#endif
#include <winsock2.h>
#include <cstddef>

//---------------------------------------------------------------------------
#ifdef __BORLANDC__
//---------------------------------------------------------------------------
#define __restrict__
// Borland C++
// ...
// ...
//---------------------------------------------------------------------------
#else
//---------------------------------------------------------------------------
// GCC etc.
// ...
// ...
#include <inttypes.h>
#ifndef int32_t
typedef int32_t LONG;
typedef int32_t ULONG;
#endif

#ifndef int64_t
typedef int64_t LONGLONG;
typedef unsigned int64_t ULONGLONG; //Portable unsigned long integer 8 bytes
#endif

#include <omp.h>

//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
// UNICODE
// ...

#ifndef __x
#define __x(s) L ## s
#endif
#ifndef __T
#define __T(__x)				  __x(s)
#endif
#ifndef _TEXT
#define _TEXT(__x)				__T(__x)
#endif
#ifndef TEXT
#define TEXT(__x)				 __T(__x)
#endif
#ifndef _T
#define _T(__x)				   __T(__x)
#endif
#ifndef _TEOF
#define _TEOF				   EOF
#endif

//---------------------------------------------------------------------------
// INCLUDE
// ...
// ...
//---------------------------------------------------------------------------
#include <stdlib.h>
#include <stdint.h>
#include <new>
#include <stack>
//---------------------------------------------------------------------------
#include <time.h>
#include <sys/types.h>
//---------------------------------------------------------------------------
#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <direct.h>
#include <sys/stat.h>
#include <iostream>
//---------------------------------------------------------------------------
#include <fcntl.h>
//---------------------------------------------------------------------------
#include <windows.h>
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
