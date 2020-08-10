#ifndef __stk_main_H__
#define __stk_main_H__
//---------------------------------------------------------------------------
// C++ Compiler name "redefinition"
//---------------------------------------------------------------------------
#if defined(__clang__)
#define __CLANG__ __clang__
#elif defined(_MSC_VER)
#define __MSVC__ _MSC_VER
#endif
//---------------------------------------------------------------------------
#ifdef __MSVC__
#pragma once
#endif
//---------------------------------------------------------------------------
// IMPORT/EXPORT define what're You doing LINK LIBRARY or BUILD_STK_LIBRARY
//---------------------------------------------------------------------------
#if !defined(__EXPORT)
    #ifdef __GNUC__
        #define __EXPORT //__attribute__((dllexport)) //__attribute__((visibility("default")))
    #else
        #define __EXPORT __declspec(dllexport)
    #endif
#define STK_EXPORT __EXPORT
#endif /* __EXPORT */
#if !defined(__IMPORT)
    #ifdef __GNUC__
        #define __IMPORT //__attribute__((dllimport))//__attribute__((visibility("default")))
    #else
        #define __IMPORT __declspec(dllimport)
    #endif
#define STK_IMPORT __IMPORT
#endif /* __IMPORT */
//---------------------------------------------------------------------------
#ifdef BUILD_STK_LIBRARY
    #define STK_IMPEXP __EXPORT
#else /* !BUILD_STK_LIBRARY */
    #define STK_IMPEXP __IMPORT
#endif /* BUILD_STK_LIBRARY */
//---------------------------------------------------------------------------
//
// C++ WARNINGS/ERRORS
//
//---------------------------------------------------------------------------
#if defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Waggregate-return"
#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 6)
#pragma GCC diagnostic push
#endif // > gcc 4.6
#pragma GCC diagnostic ignored "-Wunknown-pragmas"
#pragma GCC diagnostic ignored "-Weffc++"
#pragma GCC diagnostic ignored "-Wstrict-overflow"
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
#pragma GCC diagnostic ignored "-Wmissing-declarations"
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Winline"
#pragma GCC diagnostic ignored "-Wlong-long"
#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 6)
#pragma GCC diagnostic ignored "-Wzero-as-null-pointer-constant"
#endif // > gcc 4.6
#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 7)
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#endif // > gcc 4.7
#if __GNUC__ > 5 || (__GNUC__ == 5 && __GNUC_MINOR__ > 3)
#pragma GCC diagnostic ignored "-Wuseless-cast"
#endif // > gcc 5.3
#endif //__GNUC__
//---------------------------------------------------------------------------
#if defined(__CLANG__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnon-virtual-dtor"
#pragma clang diagnostic ignored "-Wweak-vtables"
#pragma clang diagnostic ignored "-Wpadded"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wunused-local-typedef"
#pragma clang diagnostic ignored "-Wzero-as-null-pointer-constant"
#pragma clang diagnostic ignored "-Wc++11-long-long"
#endif // __CLANG__
//---------------------------------------------------------------------------
#if defined(__MSVC__)
#pragma warning(push)
#pragma warning(disable : 4244) // Conversion from __int64 to double potential data lost
#pragma warning(disable : 4996) // The compiler encountered a deprecated declaration
#pragma warning(disable : 4706) // assignment within conditional expression
#pragma warning(disable : 4512) // 'class' : assignment operator could not be generated
#pragma warning(disable : 4127) // conditional expression is constant
#endif // __MSVC__
//---------------------------------------------------------------------------
// SET DEBUG
//---------------------------------------------------------------------------
#if !defined(__DEBUG__)
     #define __DEBUG__ 1
     #define __DEBUG __DEBUG__
     #define   DEBUG __DEBUG__
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
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// OPERATING SYSTEM DETECTION
//---------------------------------------------------------------------------
#if !defined(__BSD__) && (defined(__bsdi__) || defined(BSD) ||\
         defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__) ||\
         defined(__APPLE__))
     #define __BSD__
#endif
#if !defined(__LINUX__) && (defined(__LINUX) || defined(__ANDROID__) || defined(__gnu_linux__))
     #define __LINUX__
#endif
#if !defined(__WIN64__) && (defined(WIN64) || defined(_WIN64))
     #define __WIN64__
#endif
#if !defined(__WIN32__) && (defined(WIN32) || defined(_WIN32) || defined(__WINDOWS__) || defined(__WIN64__))
     #define __WIN32__
#endif
//---------------------------------------------------------------------------
#if !defined(WIN32) && (defined(_WIN32) || defined(_WIN64))
     #define WIN32
     #define WIN32_LEAN_AND_MEAN
#endif
//---------------------------------------------------------------------------
// CPU TYPE DETECTION
//---------------------------------------------------------------------------
#if !defined(__i386__) && (defined(__i386) || defined(i386) || defined(_M_IX86) || \
     defined(__X86__) || defined(_X86_) || defined(__I86__))
     #define __i386__
#endif
#if !defined(__x86_64__) && (defined(_M_X64) || defined(_M_AMD64) || \
     defined(__amd64__) || defined(__amd64))
         #if !defined(__MMX__)
                  #define __MMX__
         #endif
         #if !defined(__SSE__)
                  #define __SSE__ 2
         #endif
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
#if !defined(__ASM_OPT__) & (defined(__MMX__) & defined(__SSE__))
     #define __ASM_OPT__
#endif
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// SET ENCODING / RUNTIME
//---------------------------------------------------------------------------
//#define __STRICT_ANSI__
#if !defined(UNICODE)
#define __UNICODE__
#define __UNICODE
#define   UNICODE
#endif
//---------------------------------------------------------------------------
// MEMORY ORDER DETECTION
//---------------------------------------------------------------------------
// LITTLE ENDIAN short HL -> RAM 0x01h Hbyte 0x00h Lbyte
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
// BIG ENDIAN short HL -> RAM 0x00h Lbyte 0x01h Hbyte
//#define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
// BOTH ^^
//#define __BYTE_ORDER__ __ORDER_PDP_ENDIAN__
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// PLATFORM AND COMPILER SPECIFIC COMMON INCLUDES
//---------------------------------------------------------------------------
#if defined(__WIN32__)
    #if defined(__WATCOMC__)
                #define   NOMINMAX
    #endif
    #include <winsock2.h>
    #include <windows.h>
    #include <conio.h>
    #include <io.h>
    #include <direct.h>
#endif
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// STD_C++ COMMON INCLUDES
//---------------------------------------------------------------------------
#if defined(__BORLANDC__) || defined(__MSVC__)
    #if _MSC_VER >= 1600
        #include <cstdint>
    #else
        typedef __int8              int8_t;
        typedef unsigned __int8     uint8_t;
        typedef __int16             int16_t;
        typedef unsigned __int16    uint16_t;
        typedef __int32             int32_t;
        typedef unsigned __int32    uint32_t;
    #endif
    #if !defined(_STD_USING)
		typedef __int64             int64_t;
        typedef unsigned __int64    uint64_t;
        typedef  __int64            intmax_t;
        typedef unsigned __int64    uintmax_t;
	#endif
#elif (__GNUC__ >= 3) || defined(__CLANG__)
//    #include <stddef>
    #include <stdint.h>
#elif defined(__WATCOMC__)
    #include <cstddef>
    #include <cstdint>
    typedef  int64_t         intmax_t;
    typedef uint64_t        uintmax_t;
#endif
#include <stdlib.h>
#include <assert.h>
//---------------------------------------------------------------------------
#include <time.h>
//---------------------------------------------------------------------------
#include <stdio.h>
//---------------------------------------------------------------------------
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// COMPILER SPECIFIC DEFINES
//---------------------------------------------------------------------------
#if   defined(__BORLANDC__)
//---------------------------------------------------------------------------
// Borland C++
//---------------------------------------------------------------------------
#define __restrict__
#define __restrict __restrict__
#define   restrict __restrict__
//---------------------------------------------------------------------------
#elif defined(__MSVC__)
//---------------------------------------------------------------------------
// Microsoft Visual Studio Compiler
//---------------------------------------------------------------------------
#define __restrict__ __restrict
#define restrict __restrict__
//---------------------------------------------------------------------------
#elif defined(__CLANG__)
//---------------------------------------------------------------------------
// LLVM Clang
//---------------------------------------------------------------------------
//#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-register"
//#pragma clang diagnostic pop
//---------------------------------------------------------------------------
// GNU Compiler
//---------------------------------------------------------------------------
#elif defined(__GNUC__)
//---------------------------------------------------------------------------
#include <inttypes.h>
#include <omp.h>
//---------------------------------------------------------------------------
#elif defined(__WATCOMC__)
//---------------------------------------------------------------------------
// OpenWatrom C++
//---------------------------------------------------------------------------
#define restrict
#define __restrict__
#define __restrict __restrict__
//---------------------------------------------------------------------------
#elif defined(__POCC__)
//---------------------------------------------------------------------------
// Peles C
//---------------------------------------------------------------------------
#define __restrict__ restrict
#define __restrict __restrict__
//---------------------------------------------------------------------------
#elif defined(_UCC)
//---------------------------------------------------------------------------
// Ultimate++ BSD licensed C++ framework
//---------------------------------------------------------------------------
#define __restrict__ __restrict
#define restrict __restrict__
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// DEBUG MACROS
//---------------------------------------------------------------------------
#if defined(__DEBUG_FUNC_ENTER__)

#include "./time/stk_time.h"
#include "./text/stk_cstr_utils.h"

#define __DEBUG_CALLED(__func)\
        static const int __entered_line = __LINE__;\
        static double __time_1 = stk::time::time_ms();\
        static int __entered_time = 1;\
        char *__file__ = __FILE__, *__file_name__;\
        int64_t slash = stk::cstr::chrr(__file__,'/');\
        if (slash < 0) slash = stk::cstr::chrr(__file__,'\\');\
        if (slash < 0) __file_name__ = __file__;\
        else __file_name__ = &__file__[slash+1];\
        stk::con::prints("DEBUG: %s: Enter function: %s@%d line, for %d time\n\0",__file_name__,__func,__entered_line,++__entered_time);
//
#define __DEBUG_RETURN(var)\
        {double __time_2 = stk::time::time_ms() - __time_1;\
        stk::con::prints("DEBUG: Return from function: %d, at: %d, spent %lfms:\n\0",__file_name__,__entered_line,__LINE__,__time_2);\
        } return var;
#else
#define __DEBUG_CALLED("")
#define __DEBUG_RETURN(var) return var;
#endif
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// ASM MACROS
//---------------------------------------------------------------------------
#if defined(__POCC__) | defined(__BORLAND__) ? (__BORLANDC__ > 0x551) : 0
#define __builtin_prefetch(x1,x2,x3)                    \
                __asm { push ESI; mov ESI, x1; prefetchnta ESI+0; pop ESI; }
#define __builtin___clear_cache(x1,x2)                  \
                __asm { SFENCE; }
#define __PTRDIFF_TYPE__ int8_t*
#define __PTRDIFF_MAX__ ((__PTRDIFF_TYPE__)(~0))
#elif !defined(__GNUC__) && !defined(__CLANG__)
#if defined(__MSVC__)
inline void __builtin_prefetch(void *x1,int x2,int x3)
{
    __asm push ESI;
    __asm mov ESI, x1;
    __asm prefetchnta [ESI];
    __asm pop ESI;
}
inline void __builtin___clear_cache(void *x1, void *x2)
{
    __asm SFENCE;
}
#else
#define __builtin_prefetch(x1,x2,x3)
#define __builtin___clear_cache(x1,x2)
#endif
#define __PTRDIFF_TYPE__ int8_t*
#define __PTRDIFF_MAX__ ((__PTRDIFF_TYPE__)(~0))
#endif
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
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
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// UNICODE MACROS
//---------------------------------------------------------------------------
#ifndef __T
#define __T(s) L ## s
#endif

#ifndef  _TEXT
#define  _TEXT(s) __T(s)
#endif

#ifndef  _TEOF
#define  _TEOF EOF
#endif
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// OS TYPEDEF TUNE
//---------------------------------------------------------------------------
#if defined(__LINUX__)
#endif
#if defined(__WIN32__)
#endif
#if defined(__WIN64__)
#endif
#if defined(__HAIKU__)
#endif
//---------------------------------------------------------------------------
// **************************************************************************
// **************************************************************************
// **************************************************************************
//---------------------------------------------------------------------------
// SSTSOFT INCLUDES
//---------------------------------------------------------------------------
#define __STASM_DO_NOT_WARN__
#include "./stasm/stk_stasm.h"
//#include "./incbin/stk_incbin.h"
//---------------------------------------------------------------------------
#endif
