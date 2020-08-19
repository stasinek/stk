//---------------------------------------------------------------------------
//-- Stanislaw Stasiak, sstsoft.pl 2001-2016 --------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_static_huff_H__
#define __stk_static_huff_H__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace compression {
#endif
//---------------------------------------------------------------------------
/********** STATICC Huffman compression BASED ON DYNAMIC VERSION**********/
// ON PROGRESS! WARNING: NOT WORKING & NOT TESTED YET!
//---------------------------------------------------------------------------
class STK_IMPEXP __static_huff_compressor {
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
    void      __stdcall reconstruct(void);
    void      __stdcall update(const char axdata_uncoded);
    void      __stdcall initialize(void);
//---------------------------------------------------------------------------
    char      __stdcall encode(char *a_code_ptr, const char a_code_ptr_bit, const char axdata_uncoded);
    char      __stdcall decode(char *alpdata_uncoded, const char *a_code_ptr, const char a_code_ptr_bit);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}
#endif
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

