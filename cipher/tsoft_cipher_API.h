//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_cipher_API_H__
#define __tsoft_cipher_API_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../io/tsoft_file_lzss_header.h"
//---------------------------------------------------------------------------
namespace ts { namespace cipher {
//---------------------------------------------------------------------------
extern void __stdcall	  cript_MTF(void *a_dst_ptr, const uint32_t a_count);
extern void __stdcall	uncript_MTF(void *a_dst_ptr, const uint32_t a_count);
//---------------------------------------------------------------------------
extern void __stdcall	  cript_XOR(void *a_dst_ptr, const uint32_t a_count, const char *a_haslo, const uint32_t a_haslo_count);
extern void __stdcall	uncript_XOR(void *a_dst_ptr, const uint32_t a_count, const char *a_haslo, const uint32_t a_haslo_count);
//---------------------------------------------------------------------------
extern void __stdcall	  cript_ROT(void *a_dst_ptr, const uint32_t a_count, const uint32_t a_haslo_count);
extern void __stdcall	uncript_ROT(void *a_dst_ptr, const uint32_t a_count, const uint32_t a_haslo_count);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

