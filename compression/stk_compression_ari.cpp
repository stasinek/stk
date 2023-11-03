//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
    #pragma hdrstop
#endif
#include "./../mem/stk_mem.h"
#include "./../text/stk_cstr_utils.h"
#include "./../io/stk_console.h"
//---------------------------------------------------------------------------
#include "stk_compression_ari.h"
//---------------------------------------------------------------------------

/*  If you are not familiar with arithmetic compression, you should read
I. E. Witten, R. M. Neal, and J. G. Cleary,
Communications of the ACM, Vol. 30, pp. 520-540 (1987),
from which much have been borrowed.  */

#define M   (int32_t)15

/*	Q1 (= 2 to the M) must be sufficiently large, but not so
		large as the int32_t 4 * Q1 * (Q1 - 1) overflows.  */

#define Q1  	 (uint32_t)(1UL << M)
#define Q2  	 (uint32_t)(2 * Q1)
#define Q3  	 (uint32_t)(3 * Q1)
#define Q4  	 (uint32_t)(4 * Q1)
#define MAX_CUMF (uint32_t)(Q1 - 1)

#define CNUM (uint32_t)256

#define OUT_BIT_0(code,u,bits)		\
		{code=((int32_t)code>>(u+1)) | ((0x10000000L-((0x10000000L>>u)-1))<<1); \
		 bits+=u+1;						\
		 u=0;								\
		}

#define OUT_BIT_1(code,u,bits) \
		{code=((int32_t)code>>(u+1)) | ((0x10000000L>>u));   \
		 bits+=1+u;						\
		 u=0;								\
		}

stk::compression::__ari_compressor::__ari_compressor(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

        char_to_symb = (uint32_t*)stk::mem::alloc(sizeof(uint32_t)*(CNUM));
        symb_to_char = (uint32_t*)stk::mem::alloc(sizeof(uint32_t)*(CNUM+1));
        symb_cumf	 = (uint32_t*)stk::mem::alloc(sizeof(uint32_t)*(CNUM+1));  /* cumulative freq for symbols */
        symb_freq	 = (uint32_t*)stk::mem::alloc(sizeof(uint32_t)*(CNUM+1));  /* frequency for symbols */
}
//---------------------------------------------------------------------------

stk::compression::__ari_compressor::~__ari_compressor(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

		stk::mem::free(char_to_symb);
		stk::mem::free(symb_freq);
		stk::mem::free(symb_to_char);
		stk::mem::free(symb_cumf);
}
//---------------------------------------------------------------------------

void __stdcall stk::compression::__ari_compressor::initialize()
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

//------------------
		low = 0, high = Q4, value = 0, underflow_bits = 0;
//------------------
        register uint32_t c, i;
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

void __stdcall stk::compression::__ari_compressor::update(const uint32_t axdata_uncoded)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

//------------------
        register uint32_t symb = axdata_uncoded;
//------------------
        register uint32_t i, f;
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
        register uint32_t char_i, char_symb;
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

uint32_t __stdcall stk::compression::__ari_compressor::search(const uint32_t x)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

        register uint32_t l, h, c;
		for (l = 1, h = CNUM; l < h; ) {
				c = (l + h) >> 1;
				if (symb_cumf[c] > x) l = c + 1;
				else h = c;
		}
		return l - 1;
}
//---------------------------------------------------------------------------

void __stdcall stk::compression::__ari_compressor::initialize_encoder(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

		initialize();
}
//---------------------------------------------------------------------------

uint8_t __stdcall stk::compression::__ari_compressor::encode(uint32_t *a_code_ptr, const uint8_t a_code_ptr_bit, const uint8_t axdata_uncoded)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

//------------------
        register uint32_t l = low, h = high;
        uint32_t r = h - l;
        uint32_t symb = char_to_symb[(uint32_t)axdata_uncoded];
//------------------
		h = l + ((r * symb_cumf[symb-1]) / symb_cumf[0]);
		l = l + ((r * symb_cumf[symb-0]) / symb_cumf[0]);
//------------------
        register uint32_t code = 0;
        register uint32_t u = underflow_bits;
        register uint32_t bits = 0;
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
        uint32_t result = code;
		stk::mem::bit_mov(a_code_ptr,a_code_ptr_bit,&result,0,bits);
		return bits;
}
//---------------------------------------------------------------------------

uint8_t __stdcall stk::compression::__ari_compressor::flush_encoder(uint32_t *a_code_ptr, const uint8_t a_code_ptr_bit)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

//------------------
        register uint32_t bits = 0;
        register uint32_t code = 0;
		register char code_bit = a_code_ptr_bit;
//------------------
        register uint32_t u = ++underflow_bits;
		if (low < Q1) {
				OUT_BIT_0(code,u,bits)
		} else {
				OUT_BIT_1(code,u,bits)
		}
        uint32_t result = code;
		stk::mem::bit_mov(a_code_ptr,a_code_ptr_bit,&result,0,bits);
		code_bit += bits;
		a_code_ptr += (code_bit>>3);
		code_bit &= 0x07L;
		a_code_ptr[0]  &=(0xFFFFFFFFL>>(32-code_bit));
        return (char)((uint32_t)32+(uint32_t)bits-(uint32_t)code_bit);
}
//---------------------------------------------------------------------------

uint8_t __stdcall stk::compression::__ari_compressor::initialize_decoder(const uint32_t *a_code_ptr, const uint8_t  a_code_ptr_bit)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

		initialize();
//------------------
        register uint32_t bits = 0;
        register uint32_t code;
//------------------
        register uint32_t v = value;
//------------------
        uint32_t indata;
		stk::mem::bit_mov(&indata,0,a_code_ptr,a_code_ptr_bit,32);
		code =  indata;
//------------------
		register int8_t i;
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

uint8_t __stdcall stk::compression::__ari_compressor::decode(char *alpdata_uncoded, const uint32_t *a_code_ptr, const uint8_t a_code_ptr_bit)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

//------------------
        register uint32_t bits = 0;
        register uint32_t code;
        register uint32_t v = value;
        register uint32_t l = low, h = high, r = h - l;
        register uint32_t symb = this->search((uint32_t)(((v - l + 1) * symb_cumf[0] - 1) / r));
//------------------
		h = l + (r * symb_cumf[symb - 1]) / symb_cumf[0];
		l = l + (r * symb_cumf[symb - 0]) / symb_cumf[0];
//------------------
        uint32_t indata;
		stk::mem::bit_mov(&indata,0,a_code_ptr,a_code_ptr_bit,32);
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

void __stdcall stk::compression::__ari_compressor::flush_decoder(void)
{
#ifdef __DEBUG_ARI_COMPRESSOR__
__DEBUG_CALLED("")
#endif

}
//-------------------------------THE END-------------------------------------

