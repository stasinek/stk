//---------------------------------------------------------------------------
// SET ENCODING / RUNTIME
//---------------------------------------------------------------------------
//#define __STRICT_ANSI__
#ifndef UNICODE
#define UNICODE
#endif
//---------------------------------------------------------------------------
// DETECT OS
//---------------------------------------------------------------------------
#if !defined(__BSD__) && (defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || \
	 defined(__APPLE__) || defined(__bsdi__) || defined(__DragonFly__) || defined(BSD))
	 #define __BSD__
#endif
#if !defined(__LINUX__) && (defined(__LINUX) || defined(__ANDROID__) || defined(__gnu_linux__))
	 #define __LINUX__
#endif
#if !defined(__WIN32__) && (defined(WIN32) || defined(_WIN32) || defined(__WINDOWS__))
	 #define __WIN32__
	 #define WIN32
#endif
#if !defined(__WIN64__) && (defined(WIN64) || defined(_WIN64))
	 #define __WIN64__
#endif
#if !defined(WIN32) && (defined(__WIN32__))
	 #define WIN32
	 #define WIN32_LEAN_AND_MEAN
#endif
//---------------------------------------------------------------------------
// DETECT CPU TYPE
//---------------------------------------------------------------------------
#if !defined(__i386__) && (defined(__i386) || defined(i386) || defined(_M_IX86) || \
	 defined(__X86__) || defined(_X86_) || defined(__I86__))
	 #define __i386__
#endif

#if !defined(__x86_64__) && (defined(_M_X64) || defined(_M_AMD64) || \
     defined(__amd64__) || defined(__amd64))
	 #define __x86_64__
#endif

#if !defined(__arm__) && (defined(_ARM) || defined(_M_ARM) || \
     defined(__arm) || defined(__TARGET_ARCH_ARM))
	 #define __arm__
#endif
#if !defined(__arm__) && (defined(_ARM) || defined(_M_ARM) || \
     defined(__arm) || defined(__TARGET_ARCH_ARM))
	 #define __arm__
#endif
//---------------------------------------------------------------------------
#if !defined(__MMX__) && (defined(__DUPA__))
     #define __MMX__
#endif
#if !defined(__SSE__) && (defined(__DUPA__))
     #define __SSE__
#endif
#if !defined(__ASN_OPT__) && (defined(__DUPA__))
     #define __ASM_OPT__
#endif
#if !defined(__DEBUG__) && (defined(__DUPA__))
     #define __DEBUG__
#endif
//---------------------------------------------------------------------------
// DETECT MEMORY ORDER
//---------------------------------------------------------------------------
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
//#define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
//#define __BYTE_ORDER__ __ORDER_PDP_ENDIAN__
//---------------------------------------------------------------------------



//---------------------------------------------------------------------------
// PLATFORM SPECISIC COMMON INCLUDES
//---------------------------------------------------------------------------
#ifdef __WIN32__
    #ifdef __WATCOMC__
    #define NOMINMAX
    #endif
    #include <winsock2.h>
    #include <cstddef>
    #include <windows.h>
#endif
//---------------------------------------------------------------------------
// STDC COMMON INCLUDES
//---------------------------------------------------------------------------
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>
//---------------------------------------------------------------------------
#include <time.h>
//---------------------------------------------------------------------------
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <direct.h>
//---------------------------------------------------------------------------
#include <fcntl.h>
//---------------------------------------------------------------------------
// COMPILER SPECIFIC DEFINES
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
//---------------------------------------------------------------------------
// Borland C++
//---------------------------------------------------------------------------
#define __restrict__
#define __restrict __restrict__
//---------------------------------------------------------------------------
#elif __WATCOMC__
//---------------------------------------------------------------------------
// OpenWatrom C++
//---------------------------------------------------------------------------
#define restrict
#define __restrict__
#define __restrict __restrict__
//---------------------------------------------------------------------------
#elif _MSC_VER
//---------------------------------------------------------------------------
// Microsoft Visual Studio Compiler
//---------------------------------------------------------------------------
#define __restrict__ __restrict
#define restrict __restrict__
//---------------------------------------------------------------------------
// Peles C
//---------------------------------------------------------------------------
#elif __POCC__
//---------------------------------------------------------------------------
#define __restrict__ restrict
#define __restrict __restrict__
//---------------------------------------------------------------------------
#elif _UCC
//---------------------------------------------------------------------------
// Ultimate++ BSD licensed C++ framework
//---------------------------------------------------------------------------
#define __restrict__ __restrict
#define restrict __restrict__
//---------------------------------------------------------------------------
#elif __clang__
//#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-register"
//#pragma clang diagnostic pop
#elif __GNUC__
//---------------------------------------------------------------------------
// GCC etc.
//---------------------------------------------------------------------------
#include <inttypes.h>
#include <omp.h>

#ifndef __int8
typedef __int8  BYTE;
typedef __int8 UBYTE;
#endif
#define __i8 __int8
#ifndef int8
#define int8 __int8
#endif

#if !defined(__int16) && defined(SHORT)
typedef __int16  SHORT;
typedef __int16 USHORT;
#endif
#if !defined(__int16) && defined(short)
typedef __int16  short;
typedef __int16 (unsigned short);
#endif
#if !defined(__int16) && defined(int16_t)
typedef __int16  int16_t;
typedef __int16 (uint16_t);
#endif
#define __i16 __int16
#ifndef int16
#define int16 __int16
#endif

#ifndef __int32
typedef __int32  LONG;
typedef __int32 ULONG;
#endif
#define __i32 __int32
#ifndef int32
#define int32 __int32
#endif

#ifndef __int64
typedef __int64   LONGLONG;
typedef uint64_t ULONGLONG;
#endif
#define __i64 __int64
#ifndef int64
#define int64 __int64
#endif

//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
// DEBUG OR NOT DEBUG
//---------------------------------------------------------------------------
#if defined(__DEBUG__)
//---------------------------------------------------------------------------
//#define __DEBUG_MEM32__
//#define __DEBUG_MEM32_ALLOC__
//#define __DEBUG_CSTR__
//#define __DEBUG_CSTR_CLASS__
//#define __DEBUG_CSTR_STACK__
#define __DEBUG_DATABASE_ITEMS__
#define __DEBUG_DATABASE__
#define __DEBUG_KOP32_CLASS__
#define __DEBUG_KOP32_CONSOLE__
#define __DEBUG_KOP32_PROGRESS_CONTROLER__
#define __DEBUG_PHARSER__
#define __DEBUG_MATH_PHARSER__
#define __DEBUG_VECTOR__
#define __DEBUG_LIST__
#define __DEBUG_HASH_CHAIN__
#define __DEBUG_SET__
#define __DEBUG_LINKED_VECTOR__
#define __DEBUG_HASHED_LINKED_VECTOR__
#define __DEBUG_COMPRESSOR_API__
#define __DEBUG_LZSS_COMPRESSOR__
#define __DEBUG_HUFF_COMPRESSOR__
#define __DEBUG_STATIC_HUFF_COMPRESSOR__
#define __DEBUG_ARI_COMPRESSOR__
#define __DEBUG_CIPHER_API__
#define __DEBUG_MTF_CIPHER__
#define __DEBUG_XOR_CIPHER__
#define __DEBUG_ROT_CIPHER__
#define __DEBUG_HASHER_API__
#define __DEBUG_CRC32_HASHER__
#define __DEBUG_MD5_HASHER__
#define __DEBUG_SSC1_HASHER__
#define __DEBUG_SOCKET__
#define __DEBUG_RS232__
#define __DEBUG_FILE_IO__
#define __DEBUG_FILE_INI__
//#define __DEBUG_TIME__
#define __DEBUG_FUNC_ENTER__
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
// DEBUG MACROS
//---------------------------------------------------------------------------
#if defined(__DEBUG_FUNC_ENTER__)
#include "./time/tsoft_time.h"
#ifndef __func__ // specific to Microsoft Visual Studio
#define __func__ ""
#endif
#define __DEBUG_FUNC_CALLED__\
        static __int64 __time_1 = ts::time::clock_ms();\
        static const  int __entered_line = __LINE__;\
        static int __entered_time = 1;\
        char *__file__ = __FILE__;\
        char *__file_name__ = ::strrchr(__file__,'/');\
          if (__file_name__==NULL) __file_name__ = ::strrchr(__file__,'\\');\
          if (__file_name__==NULL) __file_name__ = __file__;\
        printf("DEBUG: %s: Enter function: %s@%d line, count: %d\n",__file_name__,__func__,__entered_line,__entered_time++);
//
#define RETURN(var)\
		do {         __int64 __time_2 = ts::time::clock_ms - __time_1;\
        printf("DEBUG: Return from function: %d, at: %d, spent %ldms:\n",__file_name__,__entered_line,__LINE__,__int64(__time_2));\
		return var; } while(0); return var;
#else
#define __DEBUG_FUNC_CALLED__
#define RETURN(var) return var;
#endif

//---------------------------------------------------------------------------
// ASM MACROS
//---------------------------------------------------------------------------
#if !defined(__GNUC__) && !defined(__clang__)
#ifdef __BORLANDC__
#define __builtin_prefetch(x1,x2,x3)   asm { push esi; mov esi,x1; prefetchnta esi+0; pop esi; };
#define __builtin___clear_cache(x1,x2) asm { SFENCE; };
#define __PTRDIFF_TYPE__ __int8*
#define __PTRDIFF_MAX__ ((__PTRDIFF_TYPE__)(~0))
#else
#define __builtin_prefetch(x1,x2,x3)
#define __builtin___clear_cache(x1,x2)
#define __PTRDIFF_TYPE__ __int8*
#define __PTRDIFF_MAX__ ((__PTRDIFF_TYPE__)(~0))
#endif
#endif
//---------------------------------------------------------------------------
// C MACROS
//---------------------------------------------------------------------------
#define HEXATOR(h) 0x##h
//  BYTE B(1010,1001)
#define  B(h1,h2) ((((HEXATOR(h1)>>12) & 0x0001)<<7) + (((HEXATOR(h1)>>8) & 0x0001)<<6) + (((HEXATOR(h1)>>4) & 0x0001)<<5) + (((HEXATOR(h1)>>0) & 0x0001)<<4) + (((HEXATOR(h2)>>12) & 0x0001)<<3) + (((HEXATOR(h2)>>8) & 0x0001)<<2) + (((HEXATOR(h2)>>4) & 0x0001)<<1) + (((HEXATOR(h2)>>0) & 0x0001)<<0))
//  WORD W(1010,1001,0110, etc)
#define  W(h1,h2,h3,h4) (B(h1,h2)<<8 + B(h3,h4))
#define  D(h1,h2,h3,h4,h5,h6,h7,h8) (W(h1,h2,h3,h4)<<16 + W(h5,h6,h7,h8))
#define  Q(h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15) (D(h1,h2,h3,h4,h5,h6,h7,h8)<<16 + D(h9,h10,h11,h12,h13,h14,h15))
#define SBI(val,bit) (val |  (0x00000001<<bit))
#define CBI(val,bit) (val & ~(0x00000001<<bit))
#define GBI(val,bit) (val &  (0x00000001<<bit))
#ifndef MAKEWORD
#define MAKEWORD(a,b)   ((WORD)(((BYTE)(a))|(((WORD)((BYTE)(b)))<<8)))
#endif
//---------------------------------------------------------------------------
// UNICODE MACROS
//---------------------------------------------------------------------------
#ifndef __x
#define __x(s) L ## s
#endif

#ifndef _T
#define _T(s) __x(s)
#endif

#ifndef _TEXT
#define _TEXT(s) __T(s)
#endif

#ifndef _TEOF
#define _TEOF EOF
#endif
//---------------------------------------------------------------------------
// OS TYPEDEF TUNE
//---------------------------------------------------------------------------
#if defined(__BSD__)
#endif
#if defined(__LINUX__)
#endif
#if defined(__WIN32__)
#endif
#if defined(__WIN64__)
#endif
#if defined(__BEOS__)
#endif
//---------------------------------------------------------------------------
// SSTSOFT INCLUDES
//---------------------------------------------------------------------------
#include "./incbin/__incbin.h"
#define __STASM_DO_NOT_WARN__
#include "./stasm/__stasm.h"
//---------------------------------------------------------------------------


