//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_huff.h"
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
//---------------------------------------------------------------------------
#define BIT_COMBINATIONS_PER_BYTE	(__int32)(256) 								   /* kinds of characters (character code = 0..BIT_COMBINATIONS_PER_BYTE-1) */
#define TREE_SIZE 					(__int32)((BIT_COMBINATIONS_PER_BYTE*2) - 1)	  /* size of table */


// if BIT COMBINATION EQUALS 8
// TREE WOULD BE LIKE THAT
//
//			  d
//		c		   c
//  b   b   b   b
// a a a a a a a a

// aaaaaaaabbbbccd -> SUM OF 8 + 4 + 2 + 1 EQUALS (8 x 2) - 1
// ROOT POS of d ^ is 8+4+2(because first is 0)

#define MAXIMUM_FREQENCY		(__int32)(0x08000000L)  /* 8*chars encoded so max size 2^28=250MB updates TREE_SIZE when the ROOT_POS frequency comes to this value. */
#define ROOT_NODE				   (__int32)(TREE_SIZE-1)	  /* position of ROOT_POS */
#define TOPMOST_NODE				(__int32)(0x1FFFFFFFL)
//---------------------------------------------------------------------------

__stdcall ts::compression::__huff_compressor::__huff_compressor(void)
{
#ifdef __DEBUG_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		son = (__int32*)::ts::mem32::alloc(sizeof(__int32)*(TREE_SIZE));
		freq_values = (__int32*)::ts::mem32::alloc(sizeof(__int32)*(TREE_SIZE + 1));
		dad = (__int32*)::ts::mem32::alloc(sizeof(__int32)*(TREE_SIZE + BIT_COMBINATIONS_PER_BYTE));
		this->initialize();
}
//---------------------------------------------------------------------------

__stdcall ts::compression::__huff_compressor::~__huff_compressor(void)
{
#ifdef __DEBUG_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		ts::mem32::free(dad);
		ts::mem32::free(son);
		ts::mem32::free(freq_values);
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__huff_compressor::initialize(void)
{
#ifdef __DEBUG_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32  i, e;
//----------------------
		for (i = 0; i < BIT_COMBINATIONS_PER_BYTE; i++) {
//----------------------
				son[i] = TREE_SIZE + i;
				dad[TREE_SIZE + i] = i;
				freq_values[i] = 1;
		}
//----------------------
		for (i = 0, e = BIT_COMBINATIONS_PER_BYTE; e <= ROOT_NODE; i+=2, e++) {
//----------------------
				if (e==ROOT_NODE)
						e=e;
				son[e]   = i;
				dad[i+0] = e;
				dad[i+1] = e;
				freq_values[e]   = freq_values[i] + freq_values[i+1];
		}
		dad[ROOT_NODE] = TOPMOST_NODE;
//----------------------
		freq_values[TREE_SIZE] = MAXIMUM_FREQENCY; // this frequency would be compared on each root node in update function so MUST BE MAXIMUM FREQUENCY!
// SO ALGORITM WOULD MUST NOT EXCHANGE ROOT NODE WITH ANYTHING, it's LOGICAL ;)
// IF ROOT FREQUENCY WOULD BE MAXUMUM RECONSTRUCT TREE, CUT FREQUENCES TO HALF OF FREQUENCES VALUES
//----------------------
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__huff_compressor::update(const char axdata_uncoded)
{
#ifdef __DEBUG_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------------------
//
// 2^28=250MB OF INPUT DATA so in real, never overflows but if did then must call reconstruct()
//
		if (freq_values[ROOT_NODE]>=MAXIMUM_FREQENCY) reconstruct();
//------------------------------
		register __int32 son_exg, frq_exg, exg;
		register __int32 son_cur, frq_cur, cur = TREE_SIZE + (__int32)axdata_uncoded;
//------------------------------
		for (;;) {
//------------------------------
				if (cur>=TREE_SIZE + BIT_COMBINATIONS_PER_BYTE)
						cur=cur;
				cur =dad[cur];
				/* in first step go from leaf list(at end of tree) to main tree */
				if (cur==TOPMOST_NODE)				/* if current node is ROOT_NODE then return */
						return;
				if (cur>=TREE_SIZE)
						cur=cur;
				freq_values[cur]++;					/* increment freq count */
//----------------------
//GOTO_HUFF_CHECK_ORDER:
//----------------------					/* if the order is disturbed, exchange nodes */
				frq_cur = freq_values[cur];
				for (exg =cur; frq_cur > freq_values[exg+1];) {		 /* search frequences of 256 chars, if not found - contunue */
						exg+=1;
				}
				if (exg+1>TREE_SIZE)
						cur=cur;
				if (exg==cur) continue;
//----------------------					/* exchange nodes at same level /\ */
//WIN32_FIND_DATAAGOTO_HUFF_EXCHANGE_NODES:
//----------------------
// new >>> old
//----------------------
				if (cur>=TREE_SIZE)
						cur=cur;
				if (exg>=TREE_SIZE)
						exg=cur;
				son_cur  = son[cur];
				frq_cur  = freq_values[cur];
				frq_exg  = freq_values[exg];
				son_exg  = son[exg];
				if (son_cur>=TREE_SIZE + BIT_COMBINATIONS_PER_BYTE)
						son_cur=son_cur;
				dad[son_cur] = exg;
				if (son_cur < ROOT_NODE) dad[son_cur+1] = exg;
				son[cur] = son_exg;
				freq_values[cur] = frq_exg;
				if (son_exg>=TREE_SIZE + BIT_COMBINATIONS_PER_BYTE)
						son_exg=son_exg;
				dad[son_exg] = cur;
				if (son_exg < ROOT_NODE) dad[son_exg+1] = cur;
				son[exg] = son_cur;
				freq_values[exg] = frq_cur;
//----------------------
				cur = exg;
//------------------------------------------
		}
//------------------------------------------
}
//---------------------------------------------------------------------------

__int8 __stdcall ts::compression::__huff_compressor::encode(char *a_code_ptr, const __int8 a_code_ptr_bit, const char axdata_uncoded)
{
#ifdef __DEBUG_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32 current_node = dad[TREE_SIZE + (__int32)axdata_uncoded];
		register __int32 code = 0;
		register __int8 code_bits = 0;
//----------------------												/* travel from leaf to ROOT_NODE */
		do {
//----------------------												/*  determine position in tree bit by bit */
				code = (code<<1) | (current_node & 0x00000001L);
				code_bits++;
				if (current_node>=TREE_SIZE + BIT_COMBINATIONS_PER_BYTE) current_node = 0;
				current_node = dad[current_node];
//----------------------
		} while (current_node!=ROOT_NODE);
//----------------------												/* send bits to output and update model */
		update(axdata_uncoded);
		__int32 result = code; // duplicated so "code" variable could be stored in ALU register, and just once passed there as RAM address
		ts::mem32::bit_mov(a_code_ptr,a_code_ptr_bit,&result,0,code_bits);
		return code_bits;
}
//---------------------------------------------------------------------------

char __stdcall ts::compression::__huff_compressor::decode(char *alpdata_uncoded, const char *a_code_ptr, const __int8 a_code_ptr_bit)
{
#ifdef __DEBUG_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32 current_node = son[ROOT_NODE];				// begin on top of the huffman tree
		register __int32 code;										 // input bit code to decode
		register __int32 code_bits = 0;								   // number of bits readed from input stream
//------------------------------------------
		__int32 input_data;
		ts::mem32::bit_mov(&input_data,0,a_code_ptr,a_code_ptr_bit,24);
		code =  input_data;
//----------------------												/* travel from ROOT_NODE to leaf */
		do {
//----------------------												/* select node depend on next bit */
				current_node |= (code & 0x00000001L);
				code>>= 1;
				code_bits++;
				if (current_node>=TREE_SIZE)
						current_node=0;
				current_node =son[current_node];
//----------------------
		} while (current_node <TREE_SIZE);
//----------------------												/* send bits to output and update model */
		current_node -=TREE_SIZE;
		alpdata_uncoded[0] = (char)current_node;
		update((char)current_node);
		return code_bits;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__huff_compressor::reconstruct(void)
{
#ifdef __DEBUG_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32 i, e, k, f, l;
//----------------------
		for (i = 0, e = 0; i < TREE_SIZE; i++) {								/* collect leaf nodes in the first half of the table and replace the freq_values by (freq_values + 1) / 2 */
//----------------------
				if (son[i]>= TREE_SIZE) {
						son[e] = son[i];
						freq_values[e] =(freq_values[i]+1)>>1;
						e++;
				}
		}
//----------------------											   /* begin constructing TREE_SIZE by connecting sons */
		for (i = 0, e = BIT_COMBINATIONS_PER_BYTE; e < TREE_SIZE; i+=2, e++) {
//----------------------
				f = freq_values[i] + freq_values[i+1];
				freq_values[e] = f;
				for (k = e; f < freq_values[k-1];) {
						k-= 1;
				}
				l=(e-k)<<1;
				if (l==0)
						continue;
				ts::mem32::mov(&freq_values[k + 1],&freq_values[k],l);
				freq_values[k] = f;
				ts::mem32::mov(&son[k + 1],&son[k],l);
				son[k] = i;
		}
//----------------------												/* conect leaf sons /\ to upper */
		for (i = 0; i < TREE_SIZE; i++) {
//----------------------
				k  = son[i];
				dad[k] = i;
				if (k < TREE_SIZE)
						dad[k+1] = i;
		}
//----------------------
}
//-------------------------------THE END-------------------------------------
