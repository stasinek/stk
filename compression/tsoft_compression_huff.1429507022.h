//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002---------------
//---------------------------------------------------------------------------
#ifndef __tsoft_huff_H__
#define __tsoft_huff_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace compression {
//---------------------------------------------------------------------------
/********** Huffman compression **********/
//---------------------------------------------------------------------------
class __huff_compressor {
//---------------------------------------------------------------------------
public:
		int32_t *son; // pointers to child nodes (son[], son[] + 1)
		int32_t *freq_values; // frequency table
		int32_t *dad; // pointers to parent nodes, except for the
	// elements [TREE..TREE + N_CHAR - 1] which are used to get the positions of leaves corresponding to the codes.
//---------------------------------------------------------------------------
	__stdcall  __huff_compressor(void);
	__stdcall ~__huff_compressor();
//---------------------------------------------------------------------------
	void __stdcall reconstruct(void);
		void __stdcall update(const char axdata_uncoded);
	void __stdcall initialize(void);
//---------------------------------------------------------------------------
		char __stdcall encode(char *a_code_ptr, const int8_t a_code_ptr_bit, const char axdata_uncoded);
		char __stdcall decode(char *alpdata_uncoded, const char *a_code_ptr, const int8_t a_code_ptr_bit);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------


