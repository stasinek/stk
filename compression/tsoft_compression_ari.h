//---------------------------------------------------------------------------
//-----------------Stanis�aw Stasiak "tsoft, where?" 2001-2002---------------
//---------------------------------------------------------------------------
#ifndef __tsoft_ari_H__
#define __tsoft_ari_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace compression {
//---------------------------------------------------------------------------
/********** Arithmetic compression **********/
//---------------------------------------------------------------------------
class  __ari_compressor {
//---------------------------------------------------------------------------
		__int32  underflow_bits;		  /* counts for magnifying low and high around Q2 */
		__int32  low, high, value;
		__int32 *char_to_symb;
		__int32 *symb_to_char;
		__int32 *symb_freq;		  /* frequency for symbbols */
		__int32 *symb_cumf;		  /* cumulative freq for symbbols */
//---------------------------------------------------------------------------
public:
//---------------------------------------------------------------------------
	__ari_compressor(void);
	~__ari_compressor();
//---------------------------------------------------------------------------
		__int32 __stdcall Search(const __int32 x);
	void __stdcall initialize(void);
		void __stdcall update(const __int32 axdata_uncoded);
//---------------------------------------------------------------------------
	void __stdcall initialize_encoder(void);
		char __stdcall encode(__int32 *a_code_ptr, __int8 a_code_ptr_bit, const char axdata_uncoded);
		char __stdcall flush_encoder(__int32 *a_code_ptr, const __int8 a_code_ptr_bit);
//---------------------------------------------------------------------------
		char __stdcall initialize_decoder(const __int32 *a_code_ptr, const __int8 a_code_ptr_bit);
		char __stdcall decode(char *alpdata_uncoded, const __int32 *a_code_ptr, const __int8 a_code_ptr_bit);
	void __stdcall flush_decoder(void);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

