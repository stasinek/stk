//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_file_lzst_header.h"
//---------------------------------------------------------------------------
#ifdef  LZSSv4_HEAD

// Little Endian 0x03020100L -> [0]:0x00L, [1]:0x01L, [2]:0x02L, [3]:0x03L

int8_t __stdcall stk::file_header::__lzstv4_header_coder::plain_price(const uint32_t axdata_uncoded_len)
{
//minimum code size for uncoded data header, just pass throught
                register uint32_t l = axdata_uncoded_len;
                if (l<=PLAIN_LEN_N) {
                                return 1;
                }
                else {
                                return 2;
                }
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::plain_encode(void *a_code_ptr, const uint32_t axdata_uncoded_len)
{
// 00LLLLLL
// <<2
// LLLLLL00
// 000000XX
// =
// LLLLLLXX = 1B
// or in extended version LLLLLLLL + LLLLLLXX = 2B

                register uint32_t l = axdata_uncoded_len;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                if (l<=PLAIN_LEN_N) {
                                l = l <<N_BITS;
                                l = l | N_PLAIN_CODE;
                                ((uint8_t*)code)[0] = l;
                                return 1;
                } else {
                                l = l <<E_BITS;
                                l = l | E_PLAIN_CODE;
                                ((uint8_t*)code)[0] = l;
                                l = l >>8;
                                ((uint8_t*)code)[1] = l;
                                return 2;
                }
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::plain_decode(uint32_t *a_data_uncoded_len, const void *a_code_ptr)
{
// if N_CODE detected
// LLLLLLXX
// >>2
// ??LLLLLL & 00111111
// =
// 00LLLLLL
// or in extended mode 
// LLLLXXXX
// >>4
// ????LLLL & 00001111
// LLLLLLLL >> 4 | 0000LLLL
// =
// 0000LLLL LLLLLLLL
//
                register uint32_t l;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint8_t  c0, c1;
                c0 = ((uint8_t*)code)[0];
                register uint8_t h = c0 & N_CODE_MASK;
                if (h==N_PLAIN_CODE) {
                                c0 = c0 >> N_BITS;
                                l  = c0;
                                l  = l  >> N_BITS;
                                a_data_uncoded_len[0] = l;
                                return 1;
                }
                else {
                                c1 = ((uint8_t*)code)[1];
                                l  = c1;
                                l  = l  << (8 - E_BITS);
                                c0 = c0 >> E_BITS;
                                l = l | c0;
                                a_data_uncoded_len[0] = l;
                                return 2;
                }
return 0;
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::pattern_price(const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsize)
{
//minimum code size for data header, one byte for lenght and code second byte for RLE-byte
                register uint32_t l = axdata_uncoded_counte;
                register uint32_t e = axdata_uncoded_elsize;
                if (l<=PATTERN_LEN_N) {
                                return 1;
                }
                else {
                                return 2;
                }
return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzstv4_header_coder::check_pattern_match_cost(const uint32_t alen, const uint32_t apattern_counte, const uint32_t apattern_elsize)
{
                register uint32_t t;
                register uint32_t pattern_elsize = apattern_elsize;
                register uint32_t pattern_counte = apattern_counte;
                register uint32_t pattern_len = pattern_elsize * pattern_counte;
                t = alen;
                register uint32_t price =t;
                while (t > PLAIN_LEN_MAX) {
                                price+= plain_price(PLAIN_LEN_MAX);
                                t -= PLAIN_LEN_MAX;
                }
                if (t)
                                price+= plain_price(t);
//--------------------
                price+= pattern_price(pattern_counte,pattern_elsize);
                price+= pattern_elsize;
//--------------------
                t = alen + pattern_len;
                register uint32_t  repl = t;
                while (t > PLAIN_LEN_MAX) {
                                repl+= plain_price(PLAIN_LEN_MAX);
                                t -= PLAIN_LEN_MAX;
                }
                if (t)
                                repl+= plain_price(t);
//--------------------
return repl-price;
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::pattern_encode(void *a_code_ptr, const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsize)
{
// L - LENGTH
// 00LLLLLL
// <<2
// LLLLLL00
// 000000XX
// =
// LLLLLLXX
// OUT 1 BYTE LENGTH RLE 1 OF BYTES
                register uint32_t l = axdata_uncoded_counte;
                register uint32_t e = axdata_uncoded_elsize;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint32_t t;
                if (l<= PATTERN_LEN_N) {
                                t = l;
                                e = e - 1;
                                t = t <<2;
                                t = t | e;
                                t = t <<2;
                                t = t | N_PATTERN_CODE;
                                ((uint8_t*)code)[0] = t;
                                return 1;
                } else {
                                t = l;
                                e = e - 1;
                                t = t <<2;
                                t = t | e;
                                t = t <<4;
                                t = t | E_PATTERN_CODE;
                                ((uint8_t*)code)[0] = t;
                                t = t >>8;
                                ((uint8_t*)code)[1] = t;
                                return 2;
                }
//return 0;
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::pattern_decode(uint32_t *a_data_uncoded_counte, uint32_t *a_data_uncoded_elsize, const void *a_code_ptr)
{
                register uint32_t l, e;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint8_t  c0, c1;
                c0 = ((uint8_t*)code)[0];
                uint8_t h = c0 & N_CODE_MASK;
                if (h==N_PATTERN_CODE) {
                                c0 = c0 >>2;
                                e  = c0 & 0x03L;
                                e  = e + 1;
                                a_data_uncoded_elsize[0] = e;
                                c0 = c0 >>2;
                                l  = c0;
                                a_data_uncoded_counte[0] = l;
                                return 1;
                } else {
                                c0 = c0 >>4;
                                e  = c0 & 0x03L;
                                e  = e + 1;
                                a_data_uncoded_elsize[0] = e;
                                c0 = c0 >>2;
                                l  = c0;
                                c1 = ((uint8_t*)code)[1];
                                c1 = c1 <<2;
                                l  = l | c1;
                                l  = l;
                                a_data_uncoded_counte[0] = l;
                                return 2;
                }
//return 0;
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::dup_price(const  uint32_t axdata_uncoded_len, const uint32_t axdata_uncoded_offset)
{
                register uint32_t l = axdata_uncoded_len;
                register uint32_t o = axdata_uncoded_offset;
                if (l<=DUP_LEN_N) {
                                if (o<=DUP_OFFSET_1) return 1+1;
                                else if (o<=DUP_OFFSET_2) return 1+2;
                                else return 1+3;
                }
                else {
                                if (o<=DUP_OFFSET_1) return 2+1;
                                else if (o<=DUP_OFFSET_2) return 2+2;
                                else return 2+3;
                }
//return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzstv4_header_coder::check_dup_match_cost(const uint32_t aplain_len, const uint32_t adup_len, const uint32_t adup_offset)
{
//
// CALCULATE
//
                register uint32_t t;
                register uint32_t dup_len = adup_len;
                register uint32_t dup_offset = adup_offset;
                t = aplain_len;
                register uint32_t price =t;
                while (t > PLAIN_LEN_MAX) {
                                price+= plain_price(PLAIN_LEN_MAX);
                                t -= PLAIN_LEN_MAX;
                }
                if (t)
                                price+= plain_price(t);
//--------------------
                price+= dup_price(dup_len,dup_offset);
//--------------------
                t = aplain_len + dup_len;
                register uint32_t repl = t;
                while (t > PLAIN_LEN_MAX) {
                                repl+= plain_price(PLAIN_LEN_MAX);
                                t -= PLAIN_LEN_MAX;
                }
                if (t)
                                repl+= plain_price(t);
//--------------------
return repl - price;
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::dup_encode(void *a_code_ptr, const uint32_t axdata_uncoded_len, const uint32_t axdata_uncoded_offset)
{
// L - LENGTH
// 0000LLLL
// <<2
// 00LLLL00
// 000000XX
// =
// FFLLLLXX
// OUT 1 BYTE LENGTH + 2 BITS OF OFFSET SELECTOR
//
// F - OFFSET
// FFFFFFFFFFLLLLXX
// OUT 1 BYTE HIGH PART OF OFFSET

                register uint32_t e;
                register uint32_t o = axdata_uncoded_offset;
                register uint32_t l = axdata_uncoded_len;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint32_t t;
                         
                if (l<= DUP_LEN_N) {

                        if (o <= DUP_OFFSET_1) e = N_DUP_OFFSET_0;
                        else 
                        if (o <= DUP_OFFSET_2) e = N_DUP_OFFSET_1;
                        else 
                                                                   e = N_DUP_OFFSET_2;

                                t = l;
                                t = t << (N_BITS + N_DUP_OFFSET_BITS);
                                t = t | e;
                                t = t | N_DUP_CODE;
                                ((uint8_t*)code)[0] = t;
                                
                                if (e==N_DUP_OFFSET_0) {
                                        ((uint8_t*)code)[1] = o;
                                        return 2;               
                                }
                                else if (e==N_DUP_OFFSET_1) {
                                        ((uint8_t*)code)[1] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[2] = o;
                                        return 3;               
                                }
                                else if (e==N_DUP_OFFSET_2) {
                                        ((uint8_t*)code)[1] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[3] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[2] = o;
                                        return 4;               
                                }
                } 
                else {

                        if (o <= DUP_OFFSET_1) e = E_DUP_OFFSET_0;
                        else 
                        if (o <= DUP_OFFSET_2) e = E_DUP_OFFSET_1;
                        else 
                                                                   e = E_DUP_OFFSET_2;

                                t = l;
                                t = t << (E_BITS + E_DUP_OFFSET_BITS);
                                t = t | e;
                                t = t | E_DUP_CODE;
                                ((uint8_t*)code)[0] = t;
                                t = t >>8;
                                ((uint8_t*)code)[1] = t;

                                if (e==E_DUP_OFFSET_0) {
                                        o = o;
                                        ((uint8_t*)code)[2] = o;
                                        return 2;               
                                }
                                else if (e==E_DUP_OFFSET_1) {
                                        ((uint8_t*)code)[2] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[3] = o;
                                        return 3;               
                                }
                                else if (e==E_DUP_OFFSET_2) {
                                        ((uint8_t*)code)[2] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[3] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[4] = o;
                                        return 4;               
                                }
                }
return 0;
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::file_header::__lzstv4_header_coder::dup_decode(uint32_t *a_data_uncoded_len, uint32_t *a_data_uncoded_offset, const void *a_code_ptr)
{
                register uint32_t l, o;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint32_t e;
                register uint8_t  c0, c1;
                
                                   c0 = ((uint8_t*)code)[0];
                int8_t h = c0 & N_CODE_MASK;
                
                if (h==N_DUP_CODE) {
                                e  = c0  & N_DUP_OFFSET_MASK;
                                o  =  0;
                                c0 = c0 >> (N_BITS + N_DUP_OFFSET_BITS);
                                l  = c0;
                                a_data_uncoded_len[0] = l;
                                
                                if (e==N_DUP_OFFSET_2) {
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[1];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 3;
                                }
                                if (e==N_DUP_OFFSET_1) {
                                                o = o | ((uint8_t*)code)[2];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[1];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 2;
                                }
                                if (e==N_DUP_OFFSET_0) {
                                                o = o | ((uint8_t*)code)[1];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 1;
                                }
                } 
                else {
                                e  = c0 & E_DUP_OFFSET_MASK;
                                o  = 0;
                                c0 = c0 >> (E_BITS + E_DUP_OFFSET_BITS);
                                l  = c0;
                                c1 = ((uint8_t*)code)[1];
                                c1 = c1 << E_DUP_LEN_BITS;
                                l  = l | c1;
                                l  = l;
                                a_data_uncoded_len[0] = l;

                                if (e==N_DUP_OFFSET_2) {
                                                o = o | ((uint8_t*)code)[4];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 3;
                                }
                                if (e==N_DUP_OFFSET_1) {
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 2;
                                }
                                if (e==N_DUP_OFFSET_0) {
                                                o = o | ((uint8_t*)code)[2];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 1;
                                }
                }
return 0;
}
#endif




