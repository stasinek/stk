//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_file_eno_header.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
#ifdef  LZSSv4_HDR

// Little Endian 0x03020100 -> [0]:0x00, [1]:0x01, [2]:0x02, [3]:0x03

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::pass_Price(__int32 axdata_uncoded_len)
{
//minimum code size for uncoded data header, just pass throught
		register __int32 l = axdata_uncoded_len;
	if (l<=PASS_LEN_1) {
		return 1;
	} 
	else {
		return 2;
	}
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::pass_encode(void *a_code_ptr,__int32 axdata_uncoded_len)
{
// 00LLLLLL
// <<2
// LLLLLL00
// 000000XX
// =
// LLLLLLXX
		register __int32 l = axdata_uncoded_len;
	register unsigned __int8 *code = (unsigned __int8*)a_code_ptr;
	if (l<=PASS_LEN_1) {
				l = l <<4;
		l = l | X_PASS_CODE;
		((unsigned __int8*)code)[0] = l;
		return 1;
	} else {
		l = l <<4;
		l = l | E_PASS_CODE;
		((unsigned __int8*)code)[0] = l;
		l = l >>8;
		((unsigned __int8*)code)[1] = l;
		return 2;
	}
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::pass_decode(__int32 *a_data_uncoded_len,void *a_code_ptr)
{
// LLLLLLXX 
// >>2
// ??LLLLLL & 00111111
// =
// 00LLLLLL
		register __int32 l;
	register unsigned __int8 *code = (unsigned __int8*)a_code_ptr;
	register unsigned __int8  c0, c1;
	c0 = ((unsigned __int8*)code)[0];
	register unsigned __int8 h = c0 & X_CODE_MASK;
	if (h==X_PASS_CODE) {
		c0 = c0 >> 2;
		l  = c0;
		l  = l  >> 2;
		a_data_uncoded_len[0] = l;
		return 1;
	} 
	else {
		c1 = ((unsigned __int8*)code)[1];
		l  = c1;
		l  = l  << 4;
		c0 = c0 >> 4;
		l = l | c0;
		a_data_uncoded_len[0] = l;
		return 2;
	}
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::brun_Price(__int32 axdata_uncoded_counte,__int32 axdata_uncoded_elsize)
{
//minimum code size for data header, one byte for lenght and code second byte for RLE-byte
		register __int32 l = axdata_uncoded_counte;
		register __int32 e = axdata_uncoded_elsize;
	if (l<=BRUN_LEN_1) {
		return 1;
	} 
	else {
		return 2;
	}
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::file_header::__lzssv4_header_coder::check_brun_Match_Cost(__int32 alen,__int32 abrun_counte,__int32 abrun_elsize)
{
	register __int32 t;
	register __int32 brun_elsize = abrun_elsize;
	register __int32 brun_counte = abrun_counte;
	register __int32 brun_len = brun_elsize * brun_counte;
	t = alen;
	register __int32 price =t;
	while (t > PASS_LEN_MAX) {
		price+= pass_Price(PASS_LEN_MAX);
		t -= PASS_LEN_MAX;
	}
	if (t)
		price+= pass_Price(t);
//--------------------
	price+= brun_Price(brun_counte,brun_elsize);
	price+= brun_elsize;
//--------------------
	t = alen + brun_len;
	register __int32  repl = t;
	while (t > PASS_LEN_MAX) {
		repl+= pass_Price(PASS_LEN_MAX);
		t -= PASS_LEN_MAX;
	}
	if (t)
		repl+= pass_Price(t);
//--------------------
	return repl-price;
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::brun_encode(void *a_code_ptr, __int32 axdata_uncoded_counte,__int32 axdata_uncoded_elsize)
{
// L - LENGTH
// 00LLLLLL
// <<2
// LLLLLL00
// 000000XX
// =
// LLLLLLXX
// OUT 1 BYTE LENGTH RLE 1 OF BYTES
		register __int32 l = axdata_uncoded_counte;
		register __int32 e = axdata_uncoded_elsize;
	register unsigned __int8 *code = (unsigned __int8*)a_code_ptr;
		register __int32 t;
	if (l<= BRUN_LEN_1) {
		t = l;
		e = e - 1;
		t = t <<2;
		t = t | e;
		t = t <<2;
		t = t | X_BRUN_CODE;
		((unsigned __int8*)code)[0] = t;
		return 1;
	} else {
		t = l;
		e = e - 1;
		t = t <<2;
		t = t | e;
		t = t <<4;
		t = t | E_BRUN_CODE;
		((unsigned __int8*)code)[0] = t;
		t = t >>8;
		((unsigned __int8*)code)[1] = t;
		return 2;
	}
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::brun_decode(__int32 *a_data_uncoded_counte,__int32 *a_data_uncoded_elsize,void *a_code_ptr)
{
		register __int32 l, e;
	register unsigned __int8 *code = (unsigned __int8*)a_code_ptr;
	register unsigned __int8  c0, c1;
	c0 = ((unsigned __int8*)code)[0];
	unsigned __int8 h = c0 & X_CODE_MASK;
	if (h==X_BRUN_CODE) {
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
		c1 = ((unsigned __int8*)code)[1];
		c1 = c1 <<2;
		l  = l | c1;
		l  = l;
		a_data_uncoded_counte[0] = l;
		return 2;
	}
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::dict_Price(__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset)
{
		register __int32 l = axdata_uncoded_len;
		register __int32 o = axdata_uncoded_offset;
	if (l<=DICT_LEN_1) {
		if (o<=DICT_OFFSET_1) return 2;
		else if (o<=DICT_OFFSET_2) return 3;
		else return 4;
	} 
	else {
		if (o<=DICT_OFFSET_1) return 3;
		else if (o<=DICT_OFFSET_2) return 4;
		else return 5;
	}
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::file_header::__lzssv4_header_coder::check_dict_Match_Cost(__int32 apass_len,__int32 adict_len,__int32 adict_offset)
{
//
// CALCULATE
//
	register __int32 t;
		register __int32 dict_len = adict_len;
		register __int32 dict_offset = adict_offset;
	t = apass_len;
	register __int32 price =t;
	while (t > PASS_LEN_MAX) {
		price+= pass_Price(PASS_LEN_MAX);
		t -= PASS_LEN_MAX;
	}
	if (t)
		price+= pass_Price(t);
//--------------------
	price+= dict_Price(dict_len,dict_offset);
//--------------------
	t = apass_len + dict_len;
	register __int32 repl = t;
	while (t > PASS_LEN_MAX) {
		repl+= pass_Price(PASS_LEN_MAX);
		t -= PASS_LEN_MAX;
	}
	if (t)
		repl+= pass_Price(t);
//--------------------
	return repl-price;
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::dict_encode(void *a_code_ptr,__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset)
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
		register __int32 e;
		register __int32 o = axdata_uncoded_offset;
		register __int32 l = axdata_uncoded_len;
	register unsigned __int8 *code = (unsigned __int8*)a_code_ptr;
		register __int32 t;
	if (o <= DICT_OFFSET_1)
		e = 0x00;
	else if (o <= DICT_OFFSET_2)
		e = 0x01;
	else
		e = 0x02;
	if (l<= DICT_LEN_1) {
		t = l;
		t = t <<2;
		t = t | e;
		t = t <<2;
		t = t | X_DICT_CODE;
		((unsigned __int8*)code)[0] = t;
		o = o;
		((unsigned __int8*)code)[1] = o;
		if (e<=1-1)
			return 2;
		else {
			o = o >> 8;
			((unsigned __int8*)code)[2] = o;
		}
		if (e<=2-1)
			return 3;
		else {
			o = o >> 8;
			((unsigned __int8*)code)[3] = o;
		}
		return 4;
	} else {
		t = l;
		t = t <<2;
		t = t | e;
		t = t <<4;
		t = t | E_DICT_CODE;
		((unsigned __int8*)code)[0] = t;
		t = t >>8;
		((unsigned __int8*)code)[1] = t;
		o = o;
		((unsigned __int8*)code)[2] = o;
		if (e<=1-1)
			return 3;
		else {
			o = o >> 8;
			((unsigned __int8*)code)[3] = o;
		}
		if (e<=2-1)
			return 4;
		else {
			o = o >> 8;
			((unsigned __int8*)code)[4] = o;
		}
		return 5;
	}
}
//---------------------------------------------------------------------------

unsigned __int8 __stdcall ts::file_header::__lzssv4_header_coder::dict_decode(__int32 *a_data_uncoded_len,__int32 *a_data_uncoded_offset,void *a_code_ptr)
{
		register __int32 l, o;
	register unsigned __int8 *code = (unsigned __int8*)a_code_ptr;
		register __int32 e;
	register unsigned __int8  c0, c1;
	c0 = ((unsigned __int8*)code)[0];
	__int8 h = c0 & X_CODE_MASK;
	if (h==X_DICT_CODE) {
		c0 = c0 >>2;
		e  = c0 & 0x03L;
		e  = e + 1;
		c0 = c0 >>2;
		l  = c0;
		a_data_uncoded_len[0] = l;
		o = 0;
		if (e>=3) {
			o = o | ((unsigned __int8*)code)[3];
			o = o <<8;
		}
		if (e>=2) {
			o = o | ((unsigned __int8*)code)[2];
			o = o <<8;
		}
		o  = o | ((unsigned __int8*)code)[1];
		o  = o;
		a_data_uncoded_offset[0] = o;
		return 1+e;
	} else {
		c0 = c0 >>4;
		e  = c0 & 0x03L;
		e  = e + 1;
		c0 = c0 >>2;
		l  = c0;
		c1 = ((unsigned __int8*)code)[1];
		c1 = c1 <<4;
		l  = l | c1;
		l  = l;
		a_data_uncoded_len[0] = l;
		o  = 0;
		if (e>=3) {
			o = o | ((unsigned __int8*)code)[4];
			o = o <<8;
		}
		if (e>=2) {
			o = o | ((unsigned __int8*)code)[3];
			o = o <<8;
		}
		o  = o | ((unsigned __int8*)code)[2];
		o  = o;
		a_data_uncoded_offset[0] = o;
		return 2+e;
	}
}
#endif

