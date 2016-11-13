//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_file_eno_header.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#ifdef  LZSSv4_HEAD

// Little Endian 0x03020100L -> [0]:0x00L, [1]:0x01L, [2]:0x02L, [3]:0x03L

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::pass_Price(int32_t axdata_uncoded_len)
{
//minimum code size for uncoded data header, just pass throught
		register int32_t l = axdata_uncoded_len;
		if (l<=PLAIN_LEN_1) {
				return 1;
		}
		else {
				return 2;
		}
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::pass_encode(void *a_code_ptr,int32_t axdata_uncoded_len)
{
// 00LLLLLL
// <<2
// LLLLLL00
// 000000XX
// =
// LLLLLLXX
		register int32_t l = axdata_uncoded_len;
		register uint8_t *code = (uint8_t*)a_code_ptr;
		if (l<=PLAIN_LEN_1) {
				l = l <<4;
				l = l | X_PLAIN_CODE;
				((uint8_t*)code)[0] = l;
				return 1;
		} else {
				l = l <<4;
				l = l | E_PLAIN_CODE;
				((uint8_t*)code)[0] = l;
				l = l >>8;
				((uint8_t*)code)[1] = l;
				return 2;
		}
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::pass_decode(int32_t *a_data_uncoded_len,void *a_code_ptr)
{
// LLLLLLXX
// >>2
// ??LLLLLL & 00111111
// =
// 00LLLLLL
		register int32_t l;
		register uint8_t *code = (uint8_t*)a_code_ptr;
		register uint8_t  c0, c1;
		c0 = ((uint8_t*)code)[0];
		register uint8_t h = c0 & X_CODE_MASK;
		if (h==X_PLAIN_CODE) {
				c0 = c0 >> 2;
				l  = c0;
				l  = l  >> 2;
				a_data_uncoded_len[0] = l;
				return 1;
		}
		else {
				c1 = ((uint8_t*)code)[1];
				l  = c1;
				l  = l  << 4;
				c0 = c0 >> 4;
				l = l | c0;
				a_data_uncoded_len[0] = l;
				return 2;
		}
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::brun_Price(int32_t axdata_uncoded_counte,int32_t axdata_uncoded_elsize)
{
//minimum code size for data header, one byte for lenght and code second byte for RLE-byte
		register int32_t l = axdata_uncoded_counte;
		register int32_t e = axdata_uncoded_elsize;
		if (l<=PATTERN_LEN_1) {
				return 1;
		}
		else {
				return 2;
		}
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::file_header::__lzssv4_header_coder::check_brun_Match_Cost(int32_t alen,int32_t abrun_counte,int32_t abrun_elsize)
{
		register int32_t t;
		register int32_t brun_elsize = abrun_elsize;
		register int32_t brun_counte = abrun_counte;
		register int32_t brun_len = brun_elsize * brun_counte;
		t = alen;
		register int32_t price =t;
		while (t > PLAIN_LEN_MAX) {
				price+= pass_Price(PLAIN_LEN_MAX);
				t -= PLAIN_LEN_MAX;
		}
		if (t)
				price+= pass_Price(t);
//--------------------
		price+= brun_Price(brun_counte,brun_elsize);
		price+= brun_elsize;
//--------------------
		t = alen + brun_len;
		register int32_t  repl = t;
		while (t > PLAIN_LEN_MAX) {
				repl+= pass_Price(PLAIN_LEN_MAX);
				t -= PLAIN_LEN_MAX;
		}
		if (t)
				repl+= pass_Price(t);
//--------------------
		return repl-price;
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::brun_encode(void *a_code_ptr, int32_t axdata_uncoded_counte,int32_t axdata_uncoded_elsize)
{
// L - LENGTH
// 00LLLLLL
// <<2
// LLLLLL00
// 000000XX
// =
// LLLLLLXX
// OUT 1 BYTE LENGTH RLE 1 OF BYTES
		register int32_t l = axdata_uncoded_counte;
		register int32_t e = axdata_uncoded_elsize;
		register uint8_t *code = (uint8_t*)a_code_ptr;
		register int32_t t;
		if (l<= PATTERN_LEN_1) {
				t = l;
				e = e - 1;
				t = t <<2;
				t = t | e;
				t = t <<2;
				t = t | X_PATTERN_CODE;
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
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::brun_decode(int32_t *a_data_uncoded_counte,int32_t *a_data_uncoded_elsize,void *a_code_ptr)
{
		register int32_t l, e;
		register uint8_t *code = (uint8_t*)a_code_ptr;
		register uint8_t  c0, c1;
		c0 = ((uint8_t*)code)[0];
		uint8_t h = c0 & X_CODE_MASK;
		if (h==X_PATTERN_CODE) {
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
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::dict_Price(int32_t axdata_uncoded_len,int32_t axdata_uncoded_offset)
{
		register int32_t l = axdata_uncoded_len;
		register int32_t o = axdata_uncoded_offset;
		if (l<=DUP_LEN_1) {
				if (o<=DUP_OFFSET_1) return 2;
				else if (o<=DUP_OFFSET_2) return 3;
				else return 4;
		}
		else {
				if (o<=DUP_OFFSET_1) return 3;
				else if (o<=DUP_OFFSET_2) return 4;
				else return 5;
		}
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::file_header::__lzssv4_header_coder::check_dict_Match_Cost(int32_t apass_len,int32_t adict_len,int32_t adict_offset)
{
//
// CALCULATE
//
		register int32_t t;
		register int32_t dict_len = adict_len;
		register int32_t dict_offset = adict_offset;
		t = apass_len;
		register int32_t price =t;
		while (t > PLAIN_LEN_MAX) {
				price+= pass_Price(PLAIN_LEN_MAX);
				t -= PLAIN_LEN_MAX;
		}
		if (t)
				price+= pass_Price(t);
//--------------------
		price+= dict_Price(dict_len,dict_offset);
//--------------------
		t = apass_len + dict_len;
		register int32_t repl = t;
		while (t > PLAIN_LEN_MAX) {
				repl+= pass_Price(PLAIN_LEN_MAX);
				t -= PLAIN_LEN_MAX;
		}
		if (t)
				repl+= pass_Price(t);
//--------------------
		return repl-price;
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::dict_encode(void *a_code_ptr,int32_t axdata_uncoded_len,int32_t axdata_uncoded_offset)
{
// L - LENGTH
// 0000LLLL
// <<2
// 00LLLL00
// 000000XX
// =
// FFLLLLXX
// OUT 1 BYTE LENGTH + 2 BITS OF OFFSET
//
// F - OFFSET
// FFFFFFFFFFLLLLXX
// OUT 1 BYTE HIGH PART OF OFFSET
		register int32_t e;
		register int32_t o = axdata_uncoded_offset;
		register int32_t l = axdata_uncoded_len;
		register uint8_t *code = (uint8_t*)a_code_ptr;
		register int32_t t;
		if (o <= DUP_OFFSET_1)
				e = 0x00L;
		else if (o <= DUP_OFFSET_2)
				e = 0x01L;
		else
				e = 0x02L;
		if (l<= DUP_LEN_1) {
				t = l;
				t = t <<2;
				t = t | e;
				t = t <<2;
				t = t | X_DUP_CODE;
				((uint8_t*)code)[0] = t;
				o = o;
				((uint8_t*)code)[1] = o;
				if (e<=1-1)
						return 2;
				else {
						o = o >> 8;
						((uint8_t*)code)[2] = o;
				}
				if (e<=2-1)
						return 3;
				else {
						o = o >> 8;
						((uint8_t*)code)[3] = o;
				}
				return 4;
		} else {
				t = l;
				t = t <<2;
				t = t | e;
				t = t <<4;
				t = t | E_DUP_CODE;
				((uint8_t*)code)[0] = t;
				t = t >>8;
				((uint8_t*)code)[1] = t;
				o = o;
				((uint8_t*)code)[2] = o;
				if (e<=1-1)
						return 3;
				else {
						o = o >> 8;
						((uint8_t*)code)[3] = o;
				}
				if (e<=2-1)
						return 4;
				else {
						o = o >> 8;
						((uint8_t*)code)[4] = o;
				}
				return 5;
		}
}
//---------------------------------------------------------------------------

uint8_t __stdcall ts::file_header::__lzssv4_header_coder::dict_decode(int32_t *a_data_uncoded_len,int32_t *a_data_uncoded_offset,void *a_code_ptr)
{
		register int32_t l, o;
		register uint8_t *code = (uint8_t*)a_code_ptr;
		register int32_t e;
		register uint8_t  c0, c1;
		c0 = ((uint8_t*)code)[0];
		int8_t h = c0 & X_CODE_MASK;
		if (h==X_DUP_CODE) {
				c0 = c0 >>2;
				e  = c0 & 0x03L;
				e  = e + 1;
				c0 = c0 >>2;
				l  = c0;
				a_data_uncoded_len[0] = l;
				o = 0;
				if (e>=3) {
						o = o | ((uint8_t*)code)[3];
						o = o <<8;
				}
				if (e>=2) {
						o = o | ((uint8_t*)code)[2];
						o = o <<8;
				}
				o  = o | ((uint8_t*)code)[1];
				o  = o;
				a_data_uncoded_offset[0] = o;
				return 1+e;
		} else {
				c0 = c0 >>4;
				e  = c0 & 0x03L;
				e  = e + 1;
				c0 = c0 >>2;
				l  = c0;
				c1 = ((uint8_t*)code)[1];
				c1 = c1 <<4;
				l  = l | c1;
				l  = l;
				a_data_uncoded_len[0] = l;
				o  = 0;
				if (e>=3) {
						o = o | ((uint8_t*)code)[4];
						o = o <<8;
				}
				if (e>=2) {
						o = o | ((uint8_t*)code)[3];
						o = o <<8;
				}
				o  = o | ((uint8_t*)code)[2];
				o  = o;
				a_data_uncoded_offset[0] = o;
				return 2+e;
		}
}
#endif




