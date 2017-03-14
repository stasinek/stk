//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_hash_crc32_H
#define __stk_hash_crc32_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace hash { namespace crc32 {
//---------------------------------------------------------------------------
extern void __stdcall reset_CRC32(void);
//---------------------------------------------------------------------------
extern uint32_t __stdcall calc_CRC32(const void *a_dst_ptr, const uint32_t a_count);
extern uint32_t __stdcall calc_CRC32(const void *a_dst_ptr, const uint32_t a_count,const uint32_t a_previous);
extern uint32_t __stdcall calc_CRC32_bitwise(const void *a_dst_ptr, const uint32_t a_count,const uint32_t a_previous);
extern bool __stdcall test_CRC32(bool a_reset_table);
//---------------------------------------------------------------------------
}}}
namespace stk { namespace hash { namespace adler32 {
extern uint32_t __stdcall calc_ADLER32(const void *a_dst_ptr, const uint32_t a_count);
}}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

