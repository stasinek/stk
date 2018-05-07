//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017---------------
//---------------------------------------------------------------------------
#ifndef __stk_huff_H
#define __stk_huff_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace compression {
//---------------------------------------------------------------------------
/********** Huffman compression **********/
//---------------------------------------------------------------------------
class __huff_compressor {
//---------------------------------------------------------------------------
public:
		uint32_t *son; // pointers to child nodes (son[], son[] + 1)
		uint32_t *freq_values; // frequency table
		uint32_t *dad; // pointers to parent nodes, except for the
	// elements [TREE..TREE + N_CHAR - 1] which are used to get the positions of leaves corresponding to the codes.
//---------------------------------------------------------------------------
	STK_IMPEXP  __stdcall  __huff_compressor(void);
	STK_IMPEXP  __stdcall ~__huff_compressor();
//---------------------------------------------------------------------------
	void STK_IMPEXP  __stdcall reconstruct(void);
	void STK_IMPEXP  __stdcall update(const int8_t axdata_uncoded);
	void STK_IMPEXP  __stdcall initialize(void);
//---------------------------------------------------------------------------
		int8_t STK_IMPEXP  __stdcall encode(int8_t *a_code_ptr, const int8_t a_code_ptr_bit, const int8_t axdata_uncoded);
		int8_t STK_IMPEXP  __stdcall decode(int8_t *alpdata_uncoded, const int8_t *a_code_ptr, const int8_t a_code_ptr_bit);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------


