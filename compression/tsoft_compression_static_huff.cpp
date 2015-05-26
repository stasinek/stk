//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_static_huff.h"
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
//---------------------------------------------------------------------------
#define BIT_COMBINATIONS_PER_BYTE	 (256) 		   /* kinds of characters (character code = 0..BIT_COMBINATIONS_PER_BYTE-1) */
#define TREE_SIZE ((BIT_COMBINATIONS_PER_BYTE*2)-1)	/* size of table */

// if BIT COMBINATION EQUALS 8
// TREE WOULD BE LIKE THAT
//		d
//	c	   c
//  b   b   b   b
// a a a a a a a a

// aaaaaaaabbbbccd -> SUM OF 8 + 4 + 2 + 1 EQUALS (8 x 2) - 1
// ROOT POS of d ^ is 8+4+2(because first is 0)


#define TOPMOST_NODE		(0x3FFFFFFFL)
#define ROOT_NODE 			(TREE_SIZE-1)	  /* position of ROOT_POS */
#define MAXIMUM_FREQENCY 	(0x10000000L)  /* 8*chars encoded so max size 2^28=250MB updates TREE_SIZE when the ROOT_POS frequency comes to this value. */
//---------------------------------------------------------------------------

ts::compression::__static_huff_compressor::__static_huff_compressor(void)
{
#ifdef __DEBUG_STATIC_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		son = (__int32*)ts::mem32::alloc(sizeof(__int32)*(TREE_SIZE));
		dad = (__int32*)ts::mem32::alloc(sizeof(__int32)*(TREE_SIZE + BIT_COMBINATIONS_PER_BYTE));
		frq = (__int32*)ts::mem32::alloc(sizeof(__int32)*(TREE_SIZE + 1));
}
//---------------------------------------------------------------------------

ts::compression::__static_huff_compressor::~__static_huff_compressor(void)
{
#ifdef __DEBUG_STATIC_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		ts::mem32::free(frq);
		ts::mem32::free(dad);
		ts::mem32::free(son);
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__static_huff_compressor::initialize(void)
{
#ifdef __DEBUG_STATIC_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32  i, e;
//----------------------
		for (i = 0; i < BIT_COMBINATIONS_PER_BYTE; i++) {
//----------------------
				son[i] = TREE_SIZE + i;
				dad[TREE_SIZE + i] = i;
				frq[i] = 1;
		}
//----------------------
		for (i = 0, e = BIT_COMBINATIONS_PER_BYTE; e <= ROOT_NODE; i+=2, e++) {
//----------------------
				son[e]   = i;
				dad[i+0] = e;
				dad[i+1] = e;
				frq[e]   = frq[i] + frq[i+1];
		}
		dad[ROOT_NODE] = TOPMOST_NODE;
//----------------------
		frq[TREE_SIZE] = MAXIMUM_FREQENCY; // this frequency would be compared on each root node in update function so MUST BE MAXIMUM FREQUENCY!
// SO ALGORITM WOULD MUST NOT EXCHANGE ROOT NODE WITH ANYTHING, it's LOGICAL ;)
// IF ROOT FREQUENCY WOULD BE MAXUMUM RECONSTRUCT TREE, CUT FREQUENCES TO HALF OF FREQUENCES VALUES
//----------------------
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__static_huff_compressor::update(const char axdata_uncoded)
{
#ifdef __DEBUG_STATIC_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------------------
//
// 2^28=250MB OF INPUT DATA so in real, never overflows but if did then must call reconstruct()
//
		if (frq[ROOT_NODE]>=MAXIMUM_FREQENCY) reconstruct();
//------------------------------
		register __int32 son_exg, frq_exg, dad_exg, exg;
		register __int32 son_cur, frq_cur, dad_cur, cur = TREE_SIZE + axdata_uncoded;
//------------------------------
		for (;;) {
//------------------------------
				cur =dad[cur];
				if (cur==TOPMOST_NODE)				/* if current node is ROOT_NODE then return */
						return;
				frq[cur]++;					/* increment freq count */
//----------------------
HUFF_CHECK_ORDER:
//----------------------					/* if the order is disturbed, exchange nodes */
				frq_cur = frq[cur];
				for (exg = cur; frq_cur > frq[exg+1]; exg++) {		 /* search frequences of 256 chars, if not found - contunue */
				}
				if (exg==cur) continue;
//----------------------					/* exchange nodes at same level /\ */
HUFF_EXCHANGE_NODES:
//----------------------
// new >>> old
//----------------------
				son_cur  = son[cur];
				frq_cur  = frq[cur];
				frq_exg  = frq[exg];
				son_exg  = son[exg];
				dad[son_cur] = exg;
				if (son_cur < ROOT_NODE) dad[son_cur+1] = exg;
				son[cur] = son_exg;
				frq[cur] = frq_exg;
				dad[son_exg] = cur;
				if (son_exg < ROOT_NODE) dad[son_exg+1] = cur;
				son[exg] = son_cur;
				frq[exg] = frq_cur;
//----------------------
				cur = exg;
//------------------------------------------
		}
//------------------------------------------
}
//---------------------------------------------------------------------------

char __stdcall ts::compression::__static_huff_compressor::encode(char *a_code_ptr, const char a_code_ptr_bit, const char axdata_uncoded)
{
#ifdef __DEBUG_STATIC_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32 current_node = dad[TREE_SIZE + axdata_uncoded];
		register __int32 code = 0;
		register __int8  code_bits = 0;
//----------------------												/* travel from leaf to ROOT_NODE */
		do {
//----------------------												/*  determine position in tree bit by bit */
				code = (code<<1) | (current_node & 0x00000001L);
				code_bits++;
				current_node = dad[current_node];
//----------------------
		} while (current_node!=ROOT_NODE);
//----------------------												/* send bits to output and update model */
		update(axdata_uncoded);
		__int32 result = code; // so code could be stored in ALU register, result shared as RAM address
		ts::mem32::bit_mov(a_code_ptr,a_code_ptr_bit,&result,0,code_bits);
		return code_bits;
}
//---------------------------------------------------------------------------

char __stdcall ts::compression::__static_huff_compressor::decode(char *alpdata_uncoded, const char *a_code_ptr, const char a_code_ptr_bit)
{
#ifdef __DEBUG_STATIC_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32 current_node = son[ROOT_NODE];				// begin on top of the huffman tree
		register __int32 code;										 // input bit code to decode
		register __int8  code_bits = 0;								   // number of bits readed from input stream
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

void __stdcall ts::compression::__static_huff_compressor::reconstruct(void)
{
#ifdef __DEBUG_STATIC_HUFF_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register __int32 i, e, k, f, l;
//----------------------
		for (i = 0, e = 0; i < TREE_SIZE; i++) {								/* collect leaf nodes in the first half of the table and replace the frq by (frq + 1) / 2 */
//----------------------
				if (son[i]>= TREE_SIZE) {
						son[e] = son[i];
						frq[e] =(frq[i]+1)>>1;
						e++;
				}
		}
//----------------------											   /* begin constructing TREE_SIZE by connecting sons */
		for (i = 0, e = BIT_COMBINATIONS_PER_BYTE; e < TREE_SIZE; i+=2, e++) {
//----------------------
				f = frq[i] + frq[i+1];
				frq[e] = f;
				for (k = e; f < frq[k-1];) {
						k-= 1;
				}
				l=(e-k)<<1;
				if (l==0)
						continue;
				ts::mem32::mov(&frq[k + 1],&frq[k],l);
				frq[k] = f;
				ts::mem32::mov(&son[k + 1],&son[k],l);
				son[k] = i;
		}
//----------------------												/* conect leaf sons /\ to upper */
		for (i = 0; i < TREE_SIZE; i++) {
//----------------------
				k = son[i];
				if (k>= TREE_SIZE) dad[k] = i;
				else
						dad[k] = i;
				dad[k+1] = i;
		}
//----------------------
}
//-------------------------------THE END-------------------------------------
