//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_ari.h"
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
//---------------------------------------------------------------------------

/*  If you are not familiar with arithmetic compression, you should read
I. E. Witten, R. M. Neal, and J. G. Cleary,
Communications of the ACM, Vol. 30, pp. 520-540 (1987),
from which much have been borrowed.  */

#define M   (__int32)15

/*	Q1 (= 2 to the M) must be sufficiently large, but not so
		large as the __int32 4 * Q1 * (Q1 - 1) overflows.  */

#define Q1  	 (__int32)(1UL << M)
#define Q2  	 (__int32)(2 * Q1)
#define Q3  	 (__int32)(3 * Q1)
#define Q4  	 (__int32)(4 * Q1)
#define MAX_CUMF (__int32)(Q1 - 1)

#define CNUM (__int32)256

#define OUT_BIT_0(code,u,bits)		\
		{code=((__int32)code>>(u+1)) | ((0x10000000L-((0x10000000L>>u)-1))<<1); \
		 bits+=u+1;						\
		 u=0;								\
		}

#define OUT_BIT_1(code,u,bits) \
		{code=((__int32)code>>(u+1)) | ((0x10000000L>>u));   \
		 bits+=1+u;						\
		 u=0;								\
		}

ts::compression::__ari_compressor::__ari_compressor(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		char_to_symb = (__int32*)::ts::mem32::alloc(sizeof(__int32)*(CNUM));
		symb_to_char = (__int32*)::ts::mem32::alloc(sizeof(__int32)*(CNUM+1));
		symb_cumf	 = (__int32*)::ts::mem32::alloc(sizeof(__int32)*(CNUM+1));  /* cumulative freq for symbols */
		symb_freq	 = (__int32*)::ts::mem32::alloc(sizeof(__int32)*(CNUM+1));  /* frequency for symbols */
}
//---------------------------------------------------------------------------

ts::compression::__ari_compressor::~__ari_compressor(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		::ts::mem32::free(char_to_symb);
		::ts::mem32::free(symb_freq);
		::ts::mem32::free(symb_to_char);
		::ts::mem32::free(symb_cumf);
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__ari_compressor::initialize()
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------
		low = 0, high = Q4, value = 0, underflow_bits = 0;
//------------------
		register __int32 c, i;
//------------------
		symb_freq[CNUM] = 0;
		for (i = CNUM; i!=0; i--) {
				c = i - 1;
				char_to_symb[c] = i;
				symb_to_char[i] = c;
				symb_freq[i] = 1;
				symb_cumf[i-1] = symb_cumf[i] + symb_freq[i];
		}
		symb_freq[0] = 0;
//------------------
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__ari_compressor::update(const __int32 axdata_uncoded)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------
		register __int32 symb = axdata_uncoded;
//------------------
		register __int32 i, f;
//------------------
		if (symb_cumf[0] >= MAX_CUMF) {
//------------------
				f = 0;
				for (i = CNUM; i!=0; i--) {
						symb_cumf[i] = f;
						symb_freq[i] = (symb_freq[i]+1)>>1;
						f += symb_freq[i];
				}
				symb_cumf[0] = f;
//------------------
		}
//------------------
		register __int32 char_i, char_symb;
		for (i = symb; symb_freq[i]==symb_freq[i-1]; i--);
		if (i < symb) {
				char_i = symb_to_char[i];
				char_symb = symb_to_char[symb];
				symb_to_char[i]	= char_symb;
				symb_to_char[symb] = char_i;
				char_to_symb[char_i]	= symb;
				char_to_symb[char_symb] = i;
		}
//------------------
		symb_freq[i]++;
		for (; i!=0; i--) symb_cumf[i-1]++;
//------------------
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::__ari_compressor::Search(const __int32 x)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32 l, h, c;
		for (l = 1, h = CNUM; l < h; ) {
				c = (l + h) >> 1;
				if (symb_cumf[c] > x) l = c + 1;
				else h = c;
		}
		return l - 1;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__ari_compressor::initialize_encoder(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		initialize();
}
//---------------------------------------------------------------------------

char __stdcall ts::compression::__ari_compressor::encode(__int32 *a_code_ptr, const __int8 a_code_ptr_bit, const char axdata_uncoded)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------
		register __int32 l = low, h = high;
		__int32 r = h - l;
		__int32 symb = char_to_symb[(__int32)axdata_uncoded];
//------------------
		h = l + ((r * symb_cumf[symb-1]) / symb_cumf[0]);
		l = l + ((r * symb_cumf[symb-0]) / symb_cumf[0]);
//------------------
		register __int32 code = 0;
		register __int32 u = underflow_bits;
		register __int32 bits = 0;
//------------------
		for (;;) {
//------------------
				if (h <= Q2) {
						OUT_BIT_0(code,u,bits)
				} else if (l >= Q2) {
						OUT_BIT_1(code,u,bits)
						l -= Q2;
						h -= Q2;
				} else if (l >= Q1 && h <= Q3) {
						l -= Q1;
						h -= Q1;
						u++;
				} else break;
//------------------
				l += l;
				h += h;
//------------------
		}
//------------------
		low = l;
		high = h;
		underflow_bits = u;
		update(symb);
		__int32 result = code;
		ts::mem32::bit_mov(a_code_ptr,a_code_ptr_bit,&result,0,bits);
		return bits;
}
//---------------------------------------------------------------------------

char __stdcall ts::compression::__ari_compressor::flush_encoder(__int32 *a_code_ptr, const char a_code_ptr_bit)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------
		register __int32 bits = 0;
		register __int32 code = 0;
		register char code_bit = a_code_ptr_bit;
//------------------
		register __int32 u = ++underflow_bits;
		if (low < Q1) {
				OUT_BIT_0(code,u,bits)
		} else {
				OUT_BIT_1(code,u,bits)
		}
		__int32 result = code;
		ts::mem32::bit_mov(a_code_ptr,a_code_ptr_bit,&result,0,bits);
		code_bit += bits;
		a_code_ptr += (code_bit>>3);
		code_bit &= 0x07L;
		a_code_ptr[0]  &=(0xFFFFFFFFL>>(32-code_bit));
		return (char)((__int32)32+(__int32)bits-(__int32)code_bit);
}
//---------------------------------------------------------------------------

char __stdcall ts::compression::__ari_compressor::initialize_decoder(const __int32 *a_code_ptr, const __int8 a_code_ptr_bit)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		initialize();
//------------------
		register __int32 bits = 0;
		register __int32 code;
//------------------
		register __int32 v = value;
//------------------
		__int32 indata;
		ts::mem32::bit_mov(&indata,0,a_code_ptr,a_code_ptr_bit,32);
		code =  indata;
//------------------
		register __int8 i;
//------------------
		for (i = 0; i < M + 2; i++) {
				v = (v<<1) + (code&1);
				code=code>>1;
				bits++;
		}
		value = v;
		return bits;
}
//---------------------------------------------------------------------------

char __stdcall ts::compression::__ari_compressor::decode(char *alpdata_uncoded, const __int32 *a_code_ptr, const __int8 a_code_ptr_bit)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------
		register __int32 bits = 0;
		register __int32 code;
		register __int32 v = value;
		register __int32 l = low, h = high, r = h - l;
		register __int32 symb = Search((__int32)(((v - l + 1) * symb_cumf[0] - 1) / r));
//------------------
		h = l + (r * symb_cumf[symb - 1]) / symb_cumf[0];
		l = l + (r * symb_cumf[symb - 0]) / symb_cumf[0];
//------------------
		__int32 indata;
		ts::mem32::bit_mov(&indata,0,a_code_ptr,a_code_ptr_bit,32);
		code =  indata;
//------------------
		for (;;) {
//------------------
				if (l >= Q2) {
						l -= Q2;
						h -= Q2;
						v -= Q2;
				} else if (l >= Q1 && h <= Q3) {
						l -= Q1;
						h -= Q1;
						v -= Q1;
				} else if (h > Q2) break;
//------------------
				l += l;
				h += h;
				v = (v<<1) + (code & 0x01L);
				code = code>>1;
				bits++;
//------------------
		}
//------------------
		alpdata_uncoded[0] = (char)symb_to_char[symb];
//------------------
		low = l;
		high = h;
		value = v;
		update(symb);
		return bits;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__ari_compressor::flush_decoder(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

}
//-------------------------------THE END-------------------------------------

