//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_cipher_API_h__
#define __stk_cipher_API_h__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
#include "./../file/eno/stk_file_lzss_header.h"
//---------------------------------------------------------------------------
namespace stk { namespace cipher {
//---------------------------------------------------------------------------
extern STK_IMPEXP void   __stdcall	  cript_MTF(void *a_dst_ptr, const uint32_t a_count);
extern STK_IMPEXP void   __stdcall	uncript_MTF(void *a_dst_ptr, const uint32_t a_count);
//---------------------------------------------------------------------------
extern STK_IMPEXP void   __stdcall	  cript_XOR(void *a_dst_ptr, const uint32_t a_count, const char *a_haslo, const uint32_t a_haslo_count);
extern STK_IMPEXP void   __stdcall	uncript_XOR(void *a_dst_ptr, const uint32_t a_count, const char *a_haslo, const uint32_t a_haslo_count);
//---------------------------------------------------------------------------
extern STK_IMPEXP void   __stdcall	  cript_ROT(void *a_dst_ptr, const uint32_t a_count, const uint32_t a_haslo_count);
extern STK_IMPEXP void   __stdcall	uncript_ROT(void *a_dst_ptr, const uint32_t a_count, const uint32_t a_haslo_count);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

