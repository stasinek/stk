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
		int32_t  underflow_bits;		  /* counts for magnifying low and high around Q2 */
		int32_t  low, high, value;
		int32_t *char_to_symb;
		int32_t *symb_to_char;
		int32_t *symb_freq;		  /* frequency for symbbols */
		int32_t *symb_cumf;		  /* cumulative freq for symbbols */
//---------------------------------------------------------------------------
public:
//---------------------------------------------------------------------------
	__ari_compressor(void);
	~__ari_compressor();
//---------------------------------------------------------------------------
		int32_t __stdcall Search(const int32_t x);
	void __stdcall initialize(void);
		void __stdcall update(const int32_t axdata_uncoded);
//---------------------------------------------------------------------------
	void __stdcall initialize_encoder(void);
		char __stdcall encode(int32_t *a_code_ptr, int8_t a_code_ptr_bit, const char axdata_uncoded);
		char __stdcall flush_encoder(int32_t *a_code_ptr, const int8_t a_code_ptr_bit);
//---------------------------------------------------------------------------
		char __stdcall initialize_decoder(const int32_t *a_code_ptr, const int8_t a_code_ptr_bit);
		char __stdcall decode(char *alpdata_uncoded, const int32_t *a_code_ptr, const int8_t a_code_ptr_bit);
	void __stdcall flush_decoder(void);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

