//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_hash_crc32_H__
#define __stk_hash_crc32_H__
//---------------------------------------------------------------------------
#include <stk_main.h>
//---------------------------------------------------------------------------
namespace stk { namespace hash { namespace crc32 {
//---------------------------------------------------------------------------
extern STK_IMPEXP void       __stdcall reset_CRC32(void);
//---------------------------------------------------------------------------
extern STK_IMPEXP uint32_t   __stdcall calc_CRC32(const void *a_dst_ptr, const uint32_t a_count);
extern STK_IMPEXP uint32_t   __stdcall calc_CRC32(const void *a_dst_ptr, const uint32_t a_count,const uint32_t a_previous);
extern STK_IMPEXP uint32_t   __stdcall calc_CRC32_bitwise(const void *a_dst_ptr, const uint32_t a_count,const uint32_t a_previous);
extern STK_IMPEXP bool       __stdcall test_CRC32(bool a_reset_table);
//---------------------------------------------------------------------------
}}}
namespace stk { namespace hash { namespace adler32 {
extern STK_IMPEXP uint32_t   __stdcall calc_ADLER32(const void *a_dst_ptr, const uint32_t a_count);
}}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

