//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_static_huff_H__
#define __tsoft_static_huff_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace compression {
//---------------------------------------------------------------------------
/********** STATICC Huffman compression BASED ON DYNAMIC VERSION**********/
///ON PROGRESS! NOT WORKING!
//---------------------------------------------------------------------------
class __static_huff_compressor {
//---------------------------------------------------------------------------
public:
		__int32 *son; // pointers to child nodes (son[], son[] + 1)
		__int32 *dad; // pointers to parent nodes, except for the
	// elements [TREE..TREE + N_CHAR - 1] which are used to get the positions of leaves corresponding to the codes.
		__int32 *frq; // frequency table
//---------------------------------------------------------------------------
	__static_huff_compressor(void);
	~__static_huff_compressor();
//---------------------------------------------------------------------------
	void __stdcall reconstruct(void);
		void __stdcall update(const char axdata_uncoded);
	void __stdcall initialize(void);
//---------------------------------------------------------------------------
		char __stdcall encode(char *a_code_ptr, const char a_code_ptr_bit, const char axdata_uncoded);
		char __stdcall decode(char *alpdata_uncoded, const char *a_code_ptr, const char a_code_ptr_bit);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

