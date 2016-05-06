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
		__int32 *son; // pointers to child nodes (son[], son[] + 1)
		__int32 *freq_values; // frequency table
		__int32 *dad; // pointers to parent nodes, except for the
	// elements [TREE..TREE + N_CHAR - 1] which are used to get the positions of leaves corresponding to the codes.
//---------------------------------------------------------------------------
	__stdcall  __huff_compressor(void);
	__stdcall ~__huff_compressor();
//---------------------------------------------------------------------------
	void __stdcall reconstruct(void);
	void __stdcall update(const __int8 axdata_uncoded);
	void __stdcall initialize(void);
//---------------------------------------------------------------------------
		__int8 __stdcall encode(__int8 *a_code_ptr, const __int8 a_code_ptr_bit, const __int8 axdata_uncoded);
		__int8 __stdcall decode(__int8 *alpdata_uncoded, const __int8 *a_code_ptr, const __int8 a_code_ptr_bit);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------


