//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
    #pragma hdrstop
#endif
//---------------------------------------------------------------------------
#include "stk_file_lzss_header.h"
//---------------------------------------------------------------------------
#if LZSS_HEAD == 4
// Little Endian 0x03020100L -> [0]:0x00L, [1]:0x01L, [2]:0x02L, [3]:0x03L
//---------------------------------------------------------------------------

typedef void(*__code_handler)();
void f00() { /* ... */ }
void f01() { /* ... */ }
void fFF() { /* ... */ }
void f_default() { /* ... */ }

__code_handler jump_table[256] = {
    /* 0x00 */ f00,
    /* 0x01 */ f01,
    /* 0x02 */ f_default,
    /* ...  */
    /* 0xFF */ fFF
};
void jump_table_init() { 
     
     for (int i = 0; i <= 0xFF; i++)
     {
         jump_table[i] = f_default;
     }
     jump_table[0x00] = f00;
     jump_table[0x01] = f01;
     jump_table[0xFF] = fFF;

}


__stdcall  stk::file_header::__lzss_header_coder::__lzss_header_coder()
{
}
//---------------------------------------------------------------------------

__stdcall  stk::file_header::__lzss_header_coder::~__lzss_header_coder()
{
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::lit_price(const uint32_t axdata_uncoded_len)
{
//minimum code size for uncoded data header, just pass throught
                register uint32_t len = axdata_uncoded_len;
                if (len<=L1_LIT_LENGHT_0_MAX) return L1_LIT_CODE_PRICE;
				if (len<=L2_LIT_LENGHT_1_MAX) return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_1_PRICE;
                if (len<=L2_LIT_LENGHT_2_MAX) return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_2_PRICE;
                if (len<=L2_LIT_LENGHT_3_MAX) return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_3_PRICE;
                if (len<=L2_LIT_LENGHT_4_MAX) return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_4_PRICE;
return 0;
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::file_header::__lzss_header_coder::lit_total_price(const uint32_t axdata_uncoded_len)
{
    return lit_price(axdata_uncoded_len) + axdata_uncoded_len;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::lit_encode(void *a_code_ptr, const uint32_t axdata_uncoded_len)
{
// LEN = LEN - 1
// LEN = 0000LLLL
// <<2
// -----------
//    LLLL0000
// OR 0000XXXX
// -----------
// =
// CODE = LLLLXXXX = 1BYTE
// or in extended version LLLLLLLL + LLXXXXXX = 2B, 1024

                register uint32_t len = axdata_uncoded_len;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                if (len<=L1_LIT_LENGHT_0_MAX) {
                                len = len - L1_LIT_LENGHT_0_MIN;
                                len = len << (L1_LIT_CODE_BITS + L1_LIT_MODE_BITS);
                                len = len  | (L1_LIT_CODE & L1_LIT_MODE_1);
                                ((uint8_t*)code)[0] = len;
                                return L1_LIT_CODE_PRICE;
				}
				if (len<=L2_LIT_LENGHT_1_MAX) {
                                len = len - L2_LIT_LENGHT_1_MIN;
                                ((uint8_t*)code)[0] = len;
                                return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_1_PRICE;
				}
				if (len<=L2_LIT_LENGHT_2_MAX) {
                                len = len - L2_LIT_LENGHT_2_MIN;
                                ((uint8_t*)code)[0] = len;
                                len = len >>8;
                                ((uint8_t*)code)[1] = len;
                                len = len >>8;
                                return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_2_PRICE;
				}
				if (len<=L2_LIT_LENGHT_3_MAX) {
                                len = len - L2_LIT_LENGHT_3_MIN;
                                ((uint8_t*)code)[0] = len;
                                len = len >>8;
                                ((uint8_t*)code)[1] = len;
                                len = len >>8;
                                ((uint8_t*)code)[2] = len;
                                len = len >>8;
                                return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_3_PRICE;
				}
				if (len<=L2_LIT_LENGHT_4_MAX) {
                                len = len - L2_LIT_LENGHT_4_MIN;
                                ((uint8_t*)code)[0] = len;
                                len = len >>8;
                                ((uint8_t*)code)[1] = len;
                                len = len >>8;
                                ((uint8_t*)code)[2] = len;
                                len = len >>8;
                                ((uint8_t*)code)[3] = len;
                                len = len >>8;
                                return L2_LIT_CODE_PRICE + L2_LIT_LENGHT_4_PRICE;
				}
return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::lit_decode(uint32_t *a_data_uncoded_len, const void *a_code_ptr)
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
                register uint8_t h = c0 & L1_CODE_MASK;
                if (h==L1_LIT_CODE) {
                                c0 = c0 >> L1_CODE_BITS;
                                l  = c0;
                                l  = l  >> L1_CODE_BITS;
                                a_data_uncoded_len[0] = l;
                                return 1;
                }
                else {
                                c1 = ((uint8_t*)code)[1];
                                l  = c1;
                                l  = l  << (8 - L2_CODE_BITS);
                                c0 = c0 >> L2_CODE_BITS;
                                l = l | c0;
                                a_data_uncoded_len[0] = l;
                                return 2;
                }
return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::rle_price(const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsize)
{
//minimum code size for data header, one byte for lenght and code second byte for RLE-byte
                register uint32_t len = axdata_uncoded_counte;
                register uint32_t ele = axdata_uncoded_elsize;
				if (len<=L1_RLE_LENGHT_0_MAX) return L1_RLE_CODE_PRICE + ele; 
				if (len<=L2_RLE_LENGHT_1_MAX) return L2_RLE_CODE_PRICE + L2_RLE_LENGHT_1_PRICE + ele;
                if (len<=L2_RLE_LENGHT_2_MAX) return L2_RLE_CODE_PRICE + L2_RLE_LENGHT_2_PRICE + ele;
                if (len<=L2_RLE_LENGHT_3_MAX) return L2_RLE_CODE_PRICE + L2_RLE_LENGHT_3_PRICE + ele;
                if (len<=L2_RLE_LENGHT_4_MAX) return L2_RLE_CODE_PRICE + L2_RLE_LENGHT_4_PRICE + ele;
return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::rle_total_price(const uint32_t alen, const uint32_t arle_counte, const uint32_t arle_elsize)
{
                register uint32_t t;
                register uint32_t rle_elsize = arle_elsize;
                register uint32_t rle_counte = arle_counte;
                register uint32_t rle_len = rle_elsize * rle_counte;
                t = alen;
                register uint32_t price =t;
                while (t > L1_LIT_LENGHT_0_MAX) {
                                price+= lit_price(L1_LIT_LENGHT_0_MAX);
                                t -= L1_LIT_LENGHT_0_MAX;
                }
                if (t)
                                price+= lit_price(t);
//--------------------
                price+= rle_price(rle_counte,rle_elsize);
                price+= rle_elsize;
//--------------------
                t = alen + rle_len;
                register uint32_t  repl = t;
                while (t > L1_LIT_LENGHT_0_MAX) {
                                repl+= lit_price(L1_LIT_LENGHT_0_MAX);
                                t -= L1_LIT_LENGHT_0_MAX;
                }
                if (t)
                                repl+= lit_price(t);
//--------------------
return repl-price;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::rle_encode(void *a_code_ptr, const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsize)
{
// L - LENGTH
// 0000LLLL
// <<4
// LLLL0000
// 0000XXXX
// =
// LLLLXXXX
// OUT 1 BYTE LENGTH RLE 1 OF BYTES
                register uint32_t l = axdata_uncoded_counte;
                register uint32_t e = axdata_uncoded_elsize;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint32_t t;
                if (l<= L1_RLE_LENGHT_0_MAX) {
                                t = l;
                                e = e - 1;
                                t = t <<2;
                                t = t | e;
                                t = t <<2;
                                t = t | L1_RLE_CODE;
                                ((uint8_t*)code)[0] = t;
                                return 1;
                } else {
                                t = l;
                                e = e - 1;
                                t = t <<2;
                                t = t | e;
                                t = t <<4;
                                t = t | L2_RLE_CODE;
                                ((uint8_t*)code)[0] = t;
                                t = t >>8;
                                ((uint8_t*)code)[1] = t;
                                return 2;
                }
//return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::rle_decode(uint32_t *a_data_uncoded_counte, uint32_t *a_data_uncoded_elsize, const void *a_code_ptr)
{
                register uint32_t l, e;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint8_t  c0, c1;
                c0 = ((uint8_t*)code)[0];
                uint8_t h = c0 & L1_CODE_MASK;
                if (h==L1_RLE_CODE) {
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

int32_t __stdcall stk::file_header::__lzss_header_coder::dup_price(const  uint32_t axdata_uncoded_len, const uint32_t axdata_uncoded_offset)
{
                register uint32_t l = axdata_uncoded_len;
                register uint32_t o = axdata_uncoded_offset;
                if (l<=L1_DUP_LENGHT_0_MAX) {
                                if (o<=L1_DUP_OFFSET_1_MAX) return 1+0+1;
                                else if (o<=L1_DUP_OFFSET_2_MAX) return 1+0+2;
                                    else if (o<=L1_DUP_OFFSET_3_MAX) return 1+0+3;
                                        else return 1+0+4;
                }
                else if (l<=L2_DUP_LENGHT_1_MAX) {
                                if (o<=L2_DUP_OFFSET_1_MAX) return 1+1+1;
                                else if (o<=L2_DUP_OFFSET_2_MAX) return 1+1+2;
                                    else if (o<=L2_DUP_OFFSET_3_MAX) return 1+1+3;
                                        else return 1+1+4;
                }
                else if (l<=L2_DUP_LENGHT_2_MAX) {
                                if (o<=L2_DUP_OFFSET_1_MAX) return 1+2+1;
                                else if (o<=L2_DUP_OFFSET_2_MAX) return 1+2+2;
                                    else if (o<=L2_DUP_OFFSET_3_MAX) return 1+2+3;
                                        else return 1+2+4;
                }
                else if (l<=L2_DUP_LENGHT_3_MAX) {
                                if (o<=L2_DUP_OFFSET_1_MAX) return 1+3+1;
                                else if (o<=L2_DUP_OFFSET_2_MAX) return 1+3+2;
                                    else if (o<=L2_DUP_OFFSET_3_MAX) return 1+3+3;
                                        else return 1+3+4;
                }
                else if (l<=L2_DUP_LENGHT_4_MAX) {
                                if (o<=L2_DUP_OFFSET_1_MAX) return 1+4+1;
                                else if (o<=L2_DUP_OFFSET_2_MAX) return 1+4+2;
                                    else if (o<=L2_DUP_OFFSET_3_MAX) return 1+4+3;
                                        else return 1+4+4;
                }
return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::dup_total_price(const uint32_t alit_len, const uint32_t adup_len, const uint32_t adup_offset)
{
//
// CALCULATE
//
                register uint32_t t;
                register uint32_t dup_len = adup_len;
                register uint32_t dup_offset = adup_offset;
                t = alit_len;
                register uint32_t price =t;
                while (t > L1_LIT_LENGHT_0_MAX) {
                                price+= lit_price(L1_LIT_LENGHT_0_MAX);
                                t -= L1_LIT_LENGHT_0_MAX;
                }
                if (t)
                                price+= lit_price(t);
//--------------------
                price+= dup_price(dup_len,dup_offset);
//--------------------
                t = alit_len + dup_len;
                register uint32_t repl = t;
                while (t > L1_LIT_LENGHT_0_MAX) {
                                repl+= lit_price(L1_LIT_LENGHT_0_MAX);
                                t -= L1_LIT_LENGHT_0_MAX;
                }
                if (t)
                                repl+= lit_price(t);
//--------------------
return repl - price;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::dup_encode(void *a_code_ptr, const uint32_t axdata_uncoded_len, const uint32_t axdata_uncoded_offset)
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

                register uint32_t o = axdata_uncoded_offset;
                register uint8_t os;
                register uint32_t l = axdata_uncoded_len;
                register uint8_t ls;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint32_t t = 0, re = 0;

                if (l<= L1_DUP_LENGHT_0_MAX) {

                        if (o <= L1_DUP_OFFSET_1_MAX) os = L1_DUP_OFFSET_1_CODE;
                        else
                        if (o <= L1_DUP_OFFSET_2_MAX) os = L1_DUP_OFFSET_2_CODE;
                        else
                        if (o <= L1_DUP_OFFSET_3_MAX) os = L1_DUP_OFFSET_3_CODE;
                        else
                                                      os = L1_DUP_OFFSET_4_CODE;

                                t = l;
                                t = t << (L1_CODE_BITS + L1_DUP_OFFSET_CODE_BITS);
                                t = t | L1_DUP_CODE;
                                t = t | os;
                                ((uint8_t*)code)[0] = t;
                                re = 1;

                                     if (os==L1_DUP_OFFSET_1_CODE) {
                                     	o = o - L1_DUP_OFFSET_1_MIN;
                                        ((uint8_t*)code)[1] = o;
                                        re = re + 1;
                                }
                                else if (os==L1_DUP_OFFSET_2_CODE) {
                                		o = o - L1_DUP_OFFSET_2_MIN;
                                        ((uint8_t*)code)[1] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[2] = o;
                                        re = re + 2;
                                }
                                else if (os==L1_DUP_OFFSET_3_CODE) {
                                		o = o - L1_DUP_OFFSET_3_MIN;
                                        ((uint8_t*)code)[1] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[2] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[3] = o;
                                        re = re + 3;
                                }
                                else if (os==L1_DUP_OFFSET_4_CODE) {
                                		o = o - L1_DUP_OFFSET_4_MIN;
                                        ((uint8_t*)code)[1] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[2] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[3] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[4] = o;
                                        re = re + 4;
                                }
                    return re;
                }
                else {

                        if (o <= L2_DUP_OFFSET_1_MAX) os = L2_DUP_OFFSET_1_CODE;
                        else
                        if (o <= L2_DUP_OFFSET_2_MAX) os = L2_DUP_OFFSET_2_CODE;
                        else
                        if (o <= L2_DUP_OFFSET_3_MAX) os = L2_DUP_OFFSET_3_CODE;
                        else
                                                      os = L2_DUP_OFFSET_4_CODE;

                        if (l <= L2_DUP_LENGHT_1_MAX) ls = L2_DUP_LENGHT_1_CODE;
                        else
                        if (l <= L2_DUP_LENGHT_2_MAX) ls = L2_DUP_LENGHT_2_CODE;
                        else
                        if (l <= L2_DUP_LENGHT_3_MAX) ls = L2_DUP_LENGHT_3_CODE;
                        else
                                                      ls = L2_DUP_LENGHT_4_CODE;
                                t = o;
                                t = t << (L2_CODE_BITS + L2_DUP_OFFSET_CODE_BITS + L2_DUP_LENGHT_CODE_BITS);
                                t = t | L2_DUP_CODE;
                                t = t | os;
                                t = t | ls;
                                ((uint8_t*)code)[0] = t;
								re = 1;

                                if (os==L2_DUP_OFFSET_1_CODE) {
                                		o = o - L1_DUP_OFFSET_1_MIN;
                                        ((uint8_t*)code)[re + 0] = o;
                                        re = re + 1;
                                }
                                else if (os==L2_DUP_OFFSET_2_CODE) {
                                		o = o - L1_DUP_OFFSET_2_MIN;
                                        ((uint8_t*)code)[re + 0] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[re + 1] = o;
                                        re = re + 2;
                                }
                                else if (os==L2_DUP_OFFSET_3_CODE) {
                                		o = o - L1_DUP_OFFSET_3_MIN;
                                        ((uint8_t*)code)[re + 0] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[re + 1] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[re + 2] = o;
                                        re = re + 3;
                                }
                                else if (os==L2_DUP_OFFSET_4_CODE) {
                                		o = o - L1_DUP_OFFSET_4_MIN;
                                        ((uint8_t*)code)[re + 0] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[re + 1] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[re + 2] = o;
                                        o = o >> 8;
                                        ((uint8_t*)code)[re + 3] = o;
                                        re = re + 4;
                                }
                                if (ls==L2_DUP_LENGHT_1_CODE) {
                                		l = l - L2_DUP_LENGHT_1_MIN;
                                        ((uint8_t*)code)[re + 0] = o;
                                        re = re + 1;
                                }
                                else if (ls==L2_DUP_LENGHT_2_CODE) {
                                		l = l - L2_DUP_LENGHT_2_MIN;
                                        ((uint8_t*)code)[re + 0] = o;
                                        l = l >> 8;
                                        ((uint8_t*)code)[re + 1] = o;
                                        re = re + 2;
                                }
                                else if (ls==L2_DUP_LENGHT_3_CODE) {
                                		l = l - L2_DUP_LENGHT_3_MIN;
                                        ((uint8_t*)code)[re + 0] = o;
                                        l = l >> 8;
                                        ((uint8_t*)code)[re + 1] = o;
                                        l = l >> 8;
                                        ((uint8_t*)code)[re + 2] = o;
                                        re = re + 3;
                                }
                                else if (ls==L2_DUP_LENGHT_4_CODE) {
                                		l = l - L2_DUP_LENGHT_4_MIN;
                                        ((uint8_t*)code)[re + 0] = l;
                                        l = l >> 8;
                                        ((uint8_t*)code)[re + 1] = l;
                                        l = l >> 8;
                                        ((uint8_t*)code)[re + 2] = l;
                                        l = l >> 8;
                                        ((uint8_t*)code)[re + 3] = l;
                                        re = re + 4;
                                }
                                return re;
                }
return re;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::file_header::__lzss_header_coder::dup_decode(uint32_t *a_data_uncoded_len, uint32_t *a_data_uncoded_offset, const void *a_code_ptr)
{
                register uint32_t l, o;
                register uint8_t *code = (uint8_t*)a_code_ptr;
                register uint32_t os;
                register uint8_t  c0, c1;

                                   c0 = ((uint8_t*)code)[0];
                int8_t h = c0 & L1_CODE_MASK;

                if (h==L1_DUP_CODE) {
                                os  = c0  & L1_DUP_OFFSET_MASK;
                                o  =  0;
                                c0 = c0 >> (L1_CODE_BITS + L1_DUP_OFFSET_CODE_BITS);
                                l  = c0;
                                a_data_uncoded_len[0] = l;

                                if (os==L1_DUP_OFFSET_4_CODE) {
                                                o = o | ((uint8_t*)code)[4];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[1];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 4;
                                }
                                if (os==L1_DUP_OFFSET_3_CODE) {
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[1];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 3;
                                }
                                if (os==L1_DUP_OFFSET_2_CODE) {
                                                o = o | ((uint8_t*)code)[2];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[1];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 2;
                                }
                                if (os==L1_DUP_OFFSET_1_CODE) {
                                                o = o | ((uint8_t*)code)[1];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 1;
                                }
                }
                else {
                                os  = c0 & L2_DUP_OFFSET_MASK;
                                o  = 0;
                                c0 = c0 >> (L2_CODE_BITS + L2_DUP_OFFSET_CODE_BITS);
                                l  = c0;
                                c1 = ((uint8_t*)code)[1];
                                c1 = c1 << L2_DUP_LENGHT_CODE_BITS;
                                l  = l | c1;
                                l  = l;
                                a_data_uncoded_len[0] = l;

                                if (os==L1_DUP_OFFSET_4_CODE) {
                                                o = o | ((uint8_t*)code)[5];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[4];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 4;
                                }
                                if (os==L1_DUP_OFFSET_3_CODE) {
                                                o = o | ((uint8_t*)code)[4];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 3;
                                }
                                if (os==L1_DUP_OFFSET_2_CODE) {
                                                o = o | ((uint8_t*)code)[3];
                                                o = o <<8;
                                                o = o | ((uint8_t*)code)[2];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 2;
                                }
                                if (os==L1_DUP_OFFSET_1_CODE) {
                                                o = o | ((uint8_t*)code)[2];
                                                o = o;
                                                a_data_uncoded_offset[0] = o;
                                                return 1 + 1;
                                }
                }
return 0;
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
