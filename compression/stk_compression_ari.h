//---------------------------------------------------------------------------
//-----------------Stanis�aw Stasiak "sstsoft.pl 2001-2017---------------
//---------------------------------------------------------------------------
#ifndef __stk_ari_H__
#define __stk_ari_H__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace compression {
#endif
//---------------------------------------------------------------------------
/********** Arithmetic compression **********/
//---------------------------------------------------------------------------
class STK_IMPEXP __ari_compressor {
//---------------------------------------------------------------------------
        uint32_t  underflow_bits;		  /* counts for magnifying low and high around Q2 */
        uint32_t  low, high, value;
        uint32_t *char_to_symb;
        uint32_t *symb_to_char;
        uint32_t *symb_freq;		  /* frequency for symbbols */
        uint32_t *symb_cumf;		  /* cumulative freq for symbbols */
//---------------------------------------------------------------------------
public:
//---------------------------------------------------------------------------
    __ari_compressor(void);
    ~__ari_compressor();
//---------------------------------------------------------------------------
    uint32_t      __stdcall search(const uint32_t x);
    void          __stdcall initialize(void);
    void          __stdcall update(const uint32_t axdata_uncoded);
//---------------------------------------------------------------------------
    void          __stdcall initialize_encoder(void);
    uint8_t       __stdcall encode(uint32_t *a_code_ptr, const uint8_t a_code_ptr_bit, const uint8_t axdata_uncoded);
    uint8_t       __stdcall flush_encoder(uint32_t *a_code_ptr, const uint8_t a_code_ptr_bit);
//---------------------------------------------------------------------------
    uint8_t       __stdcall initialize_decoder(const uint32_t *a_code_ptr, const uint8_t a_code_ptr_bit);
    uint8_t       __stdcall decode(char *alpdata_uncoded, const uint32_t *a_code_ptr, const uint8_t a_code_ptr_bit);
    void          __stdcall flush_decoder(void);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace stk,compression
#endif
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

