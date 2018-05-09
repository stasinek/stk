//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017---------------
//---------------------------------------------------------------------------
#ifndef __stk_huff_H
#define __stk_huff_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace compression {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __huff_compressor {
//---------------------------------------------------------------------------
public:
        uint32_t *son; // pointers to child nodes (son[], son[] + 1)
        uint32_t *freq_values; // frequency table
        uint32_t *dad; // pointers to parent nodes, except for the
    // elements [TREE..TREE + N_CHAR - 1] which are used to get the positions of leaves corresponding to the codes.
//---------------------------------------------------------------------------
      __stdcall  __huff_compressor(void);
      __stdcall ~__huff_compressor();
//---------------------------------------------------------------------------
    void   __stdcall reconstruct(void);
    void   __stdcall update(const int8_t axdata_uncoded);
    void   __stdcall initialize(void);
//---------------------------------------------------------------------------
        int8_t   __stdcall encode(int8_t *a_code_ptr, const int8_t a_code_ptr_bit, const int8_t axdata_uncoded);
        int8_t   __stdcall decode(int8_t *alpdata_uncoded, const int8_t *a_code_ptr, const int8_t a_code_ptr_bit);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace stk,compression
#endif
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------


