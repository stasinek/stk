//---------------------------------------------------------------------------
//-- Stanislaw Stasiak, sstsoft.pl 2001-2016 --------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_static_huff_h
#define __stk_static_huff_h
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace compression {
//---------------------------------------------------------------------------
/********** STATICC Huffman compression BASED ON DYNAMIC VERSION**********/
///ON PROGRESS! WARNING NOT WORKING & NOT TESTED YET!
//---------------------------------------------------------------------------
class __static_huff_compressor {
//---------------------------------------------------------------------------
public:
	uint32_t *son; // pointers to child nodes (son[], son[] + 1)
	uint32_t *dad; // pointers to parent nodes, except for the
	// elements [TREE..TREE + N_CHAR - 1] which are used to get the positions of leaves corresponding to the codes.
	uint32_t *frq; // frequency table
//---------------------------------------------------------------------------
	        __static_huff_compressor(void);
	       ~__static_huff_compressor();
//---------------------------------------------------------------------------
	void    STK_IMPEXP  __stdcall reconstruct(void);
	void    STK_IMPEXP  __stdcall update(const char axdata_uncoded);
	void    STK_IMPEXP  __stdcall initialize(void);
//---------------------------------------------------------------------------
	char    STK_IMPEXP  __stdcall encode(char *a_code_ptr, const char a_code_ptr_bit, const char axdata_uncoded);
	char    STK_IMPEXP  __stdcall decode(char *alpdata_uncoded, const char *a_code_ptr, const char a_code_ptr_bit);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

