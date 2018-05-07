//---------------------------------------------------------------------------
#ifndef __stk_mem_h
#define __stk_mem_h
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace mem {
#endif
//---------------------------------------------------------------------------
        extern intmax_t       STK_IMPEXP  __stdcall allocated           (void);
        //     ^^ must be SIGNED for mem leak detection ;)
        extern size_t         STK_IMPEXP  __stdcall size                (const void *a_ptr);
        extern void           STK_IMPEXP *__stdcall calloc	           (char a_size, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall alloc	           (const size_t a_count);
//        extern void           STK_IMPEXP  *__stdcall crealloc            (char a_znak,void *a_dst_ptr, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall realloc             (void *a_dst_ptr, const size_t a_count);
        extern void           STK_IMPEXP  __stdcall free                (void *a_dst_ptr);
//---------------------------------------------------------------------------
        extern void           STK_IMPEXP *__stdcall mov                 (void *a_dst_ptr, const void *a_src_ptr, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall rev                 (void *a_dst_ptr, const void *a_src_ptr, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall swap                (void *a_ptr, const size_t a_head_count, const size_t a_tail_count);
        //---------------------------------------------------------------------------
        extern intmax_t       STK_IMPEXP  __stdcall cmp                 (const void *a_ptr1, const void *a_ptr2, const size_t a_count);
        //---------------------------------------------------------------------------
        extern void           STK_IMPEXP *__stdcall set                 (void *a_dst_ptr, const unsigned char a_znak_B, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall setex               (void *a_dst_ptr, const void *a_src_ptr, const int8_t a_element_size, const size_t a_count);
        //---------------------------------------------------------------------------
        extern void           STK_IMPEXP *__stdcall shr                 (void *a_dst_ptr, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall shl                 (void *a_dst_ptr, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall ror                 (void *a_dst_ptr, const size_t a_count);
        extern void           STK_IMPEXP *__stdcall rol                 (void *a_dst_ptr, const size_t a_count);
        //---------------------------------------------------------------------------
        extern intmax_t       STK_IMPEXP  __stdcall chr                 (const void *a_src_ptr, const char a_znak_B, const size_t a_count);
        extern intmax_t       STK_IMPEXP  __stdcall chrr                (const void *a_src_ptr, const char a_znak_B, const size_t a_count);
//---------------------------------------------------------------------------
        extern intmax_t       STK_IMPEXP  __stdcall pos                 (const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_pattern_ptr, const size_t a_pattern_size);
        extern intmax_t       STK_IMPEXP  __stdcall posr                (const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_pattern_ptr, const size_t a_pattern_size);
        extern intmax_t       STK_IMPEXP  __stdcall pos_kmp	           (const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_pattern_ptr, const size_t a_pattern_size);

//---------------------------------------------------------------------------
#define membit(val,b) (((char*)val)[b/8] &   (0x01<<(b%8)));
#define memsbi(val,b)  ((char*)val)[b/8] |=  (0x01<<(b%8));
#define memcbi(val,b)  ((char*)val)[b/8] &= ~(0x01<<(b%8));
#define bit(val,b) (val & (0x00000001<<b));
#define sbi(val,b) val = (val |  (0x00000001<<b));
#define cbi(val,b) val = (val & ~(0x00000001<<b));

inline uint8_t bitcount(uint32_t i)
{
        i = ((i & 0xAAAAAAAAL) >>  1) + (i & 0x55555555L);
        i = ((i & 0xCCCCCCCCL) >>  2) + (i & 0x33333333L);
        i = ((i & 0xF0F0F0F0L) >>  4) + (i & 0x0F0F0F0FL);
        i = ((i & 0xFF00FF00L) >>  8) + (i & 0x00FF00FFL);
        i = ((i & 0xFFFF0000L) >> 16) + (i & 0x0000FFFFL);
        return (uint8_t)i;
}
        extern  void          STK_IMPEXP  __stdcall bit_mov             (void *a_dst_ptr, const uint8_t a_bit_dst, const void *a_src_ptr, const uint8_t a_bit_src, const size_t a_bit_num);
        extern  void          STK_IMPEXP  __stdcall bit_setex           (void *a_dst_ptr, const uint8_t a_bit_dst, const void *a_src_ptr, const uint8_t a_bit_src, const uint8_t a_src_elelent_size, const size_t a_dst_count);
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace tsoft,mem
#endif
//---------------------------------------------------------------------------
#if defined(__CLANG__)
inline void* __cdecl operator new (const size_t a_count)
{	return stk::mem::alloc(a_count); }
inline void* __cdecl operator new [] (const size_t a_count)
{	return stk::mem::alloc(a_count); }
inline void __cdecl operator delete (void *a_ptr)
{	stk::mem::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr)
{	stk::mem::free(a_ptr); }
#else
#if defined (__GNUC__)
#include <new>
inline void* __cdecl operator new(const size_t a_count) _GLIBCXX_THROW (std::bad_alloc)
  {	return stk::mem::alloc(a_count); }
inline void* __cdecl operator new(const size_t a_count, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {	return stk::mem::alloc(a_count); }
inline void* __cdecl operator new [](const size_t a_count) _GLIBCXX_THROW (std::bad_alloc)
  {	return stk::mem::alloc(a_count); }
inline void* __cdecl operator new [](const size_t a_count, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {	return stk::mem::alloc(a_count); }

inline void __cdecl operator delete (void *a_ptr) _GLIBCXX_USE_NOEXCEPT
  {  stk::mem::free(a_ptr); }
inline void __cdecl operator delete (void *a_ptr, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {  stk::mem::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr) _GLIBCXX_USE_NOEXCEPT
  {  stk::mem::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {  stk::mem::free(a_ptr); }
#else
inline void* __cdecl operator new (const size_t a_count)
{	return stk::mem::alloc(a_count); }
inline void* __cdecl operator new [] (const size_t a_count)
{	return stk::mem::alloc(a_count); }
inline void __cdecl operator delete (void *a_ptr)
{	stk::mem::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr)
{	stk::mem::free(a_ptr); }
#endif
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

