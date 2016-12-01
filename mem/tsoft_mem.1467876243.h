//---------------------------------------------------------------------------
#ifndef tsoft_mem32_h
#define tsoft_mem32_h
#pragma once
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace mem32 {
//---------------------------------------------------------------------------
        extern int64_t        __stdcall allocated           (void);
// must be SIGNED for mem leak detection ;)
		extern size_t         __stdcall size                (const void *a_ptr);
		extern void          *__stdcall alloc	            (const size_t a_count);
		extern void          *__stdcall realloc             (void *a_dst_ptr, const size_t a_count);
		extern void           __stdcall free                (void *a_dst_ptr);
//---------------------------------------------------------------------------
		void                 *__stdcall mov                 (void *a_dst_ptr, const void *a_src_ptr, const size_t a_count);
		extern void          *__stdcall rev                 (void *a_dst_ptr, const void *a_src_ptr, const size_t a_count);
		extern void          *__stdcall swap                (void *a_ptr, const size_t a_head_count, const size_t a_tail_count);
		//---------------------------------------------------------------------------
        extern int32_t        __stdcall cmp                 (const void *a_ptr1, const void *a_ptr2, const size_t a_count);
		//---------------------------------------------------------------------------
		extern void          *__stdcall set                 (void *a_dst_ptr, const unsigned char a_znak_B, const size_t a_count);
		extern void          *__stdcall set                 (void *a_dst_ptr, const unsigned char a_znak_B, const size_t a_count);
        extern void          *__stdcall setex               (void *a_dst_ptr, const void *a_src_ptr, const int8_t a_element_size, const size_t a_count);
		//---------------------------------------------------------------------------
		extern void          *__stdcall shr                 (void *a_dst_ptr, const size_t a_count);
		extern void          *__stdcall shl                 (void *a_dst_ptr, const size_t a_count);
		extern void          *__stdcall ror                 (void *a_dst_ptr, const size_t a_count);
		extern void          *__stdcall rol                 (void *a_dst_ptr, const size_t a_count);
		//---------------------------------------------------------------------------
        extern int32_t        __stdcall chr                 (const void *a_src_ptr, const char a_znak_B, const size_t a_count);
        extern int32_t        __stdcall chrr                (const void *a_src_ptr, const char a_znak_B, const size_t a_count);
//---------------------------------------------------------------------------
        extern int32_t        __stdcall pos                 (const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_pattern_ptr, const size_t a_pattern_size);
        extern int32_t        __stdcall posr                (const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_pattern_ptr, const size_t a_pattern_size);
        extern int32_t        __stdcall pos_kmp 		    (const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_pattern_ptr, const size_t a_pattern_size);

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
        extern  void            __stdcall bit_mov              (void *a_dst_ptr, const uint8_t a_bit_dst, const void *a_src_ptr, const uint8_t a_bit_src, const size_t a_bit_num);
        extern  void            __stdcall bit_setex            (void *a_dst_ptr, const uint8_t a_bit_dst, const void *a_src_ptr, const uint8_t a_bit_src, const uint8_t a_src_elelent_size, const size_t a_dst_count);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#if defined(__clang__)
inline void* __cdecl operator new (const size_t a_count)
{	return ts::mem32::alloc(a_count); }
inline void* __cdecl operator new [] (const size_t a_count)
{	return ts::mem32::alloc(a_count); }
inline void __cdecl operator delete (void *a_ptr)
{	ts::mem32::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr)
{	ts::mem32::free(a_ptr); }
#else
#if defined (__GNUC__)
#include <new>
inline void* __cdecl operator new(const size_t a_count) _GLIBCXX_THROW (std::bad_alloc)
  {	return ts::mem32::alloc(a_count); }
inline void* __cdecl operator new(const size_t a_count, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {	return ts::mem32::alloc(a_count); }
inline void* __cdecl operator new [](const size_t a_count) _GLIBCXX_THROW (std::bad_alloc)
  {	return ts::mem32::alloc(a_count); }
inline void* __cdecl operator new [](const size_t a_count, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {	return ts::mem32::alloc(a_count); }

inline void __cdecl operator delete (void *a_ptr) _GLIBCXX_USE_NOEXCEPT
  {  ts::mem32::free(a_ptr); }
inline void __cdecl operator delete (void *a_ptr, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {  ts::mem32::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr) _GLIBCXX_USE_NOEXCEPT
  {  ts::mem32::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr, const std::nothrow_t&) _GLIBCXX_USE_NOEXCEPT
  {  ts::mem32::free(a_ptr); }
#else
inline void* __cdecl operator new (const size_t a_count)
{	return ts::mem32::alloc(a_count); }
inline void* __cdecl operator new [] (const size_t a_count)
{	return ts::mem32::alloc(a_count); }
inline void __cdecl operator delete (void *a_ptr)
{	ts::mem32::free(a_ptr); }
inline void __cdecl operator delete[] (void *a_ptr)
{	ts::mem32::free(a_ptr); }
#endif
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

