//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_lzssv4.h"
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
//---------------------------------------------------------------------------
// tym wiï¿½cej bitï¿½w im wiï¿½ksze slide window, 12 dla 4096   wyniki dla AMD Athlon X2 3800 Dual Core 939 2.2GHz 512kB cache LZS CalgaryCorpus
// 64kB (cache ~L2)
//#define HASH_SIZE (__int32)(256<<8)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<3)^(((__int16)ptr[2])<<5)^(((__int16)ptr[3])<<8)) //4.20MB
// 32kB (cache ~L1-L2)
//#define HASH_SIZE (__int32)(256<<7)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<3)^(((__int16)ptr[2])<<5)^(((__int16)ptr[3])<<7)) //5.1MB
// 16kB (for sure cached in ~L1)
//#define HASH_SIZE (__int32)(256<<6)
//#define HASH(ptr) (__int32)(__int32((__int16)ptr[0])^(__int32((__int16)ptr[1])<<2)^(__int32((__int16)ptr[2])<<4)^(__int32((__int16)ptr[3])<<6)) //5.1MB
#define HASH_SIZE (__int32)(256<<6)
#define HASH(ptr) (__int32)(__int32((__int16)ptr[0])^(__int32((__int16)ptr[1])<<2)^(__int32((__int16)ptr[2])<<4)^(__int32((__int16)ptr[3])<<6)) //5.1MB
//#define HASH_SIZE (__int32)(256<<6)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<2)^(((__int16)ptr[2])<<4)^(((__int16)ptr[3])<<6)) //4.9MB
//#define HASH_SIZE (__int32)(256<<5)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<2)^(((__int16)ptr[2])<<3)^(((__int16)ptr[3])<<5)) //4.40MB
//#define HASH_SIZE (__int32)(256<<4)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<2)^(((__int16)ptr[2])<<3)^(((__int16)ptr[3])<<4)) //4.20MB
//#define HASH_SIZE (__int32)(256<<3)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<1)^(((__int16)ptr[2])<<2)^(((__int16)ptr[3])<<3)) //3.40MB
//#define HASH_SIZE (__int32)(256<<2)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<1)^(((__int16)ptr[2])<<2)) //2.20MB
//#define HASH_SIZE (__int32)(256<<1)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<1)) //0.95MB
//#define HASH_SIZE (__int32)256
//#define HASH(ptr) (__int32)(((__int16)ptr[0])) // 1__int8 SLOW 0.29MB

// proste i 100% trafiania, ale powolne
//#define HASH_SIZE (__int32)(256<<8)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])|(((__int16)ptr[1])<<8)) //1.40MB
//wersje ksiaï¿½kowe powolne
//#define HASH_SIZE (__int32)(256<<8)
//#define HASH(ptr) (__int32)(((((ptr[0]<<5)+ptr[1])<<5)+ptr[2])) //2.95MB
//#define HASH_SIZE (__int32)(256<<4)
//#define HASH(ptr) (__int32)((40543*((((ptr[0]<<4)^ptr[1])<<4)^ptr[2])>>4) & 0xFFFL) //4.20MB
//---------------------------------------------------------------------------

// This structure contains binary tree constructed around ring_ptr witch is pointer to
// memory array, text buffer like fifo/hash chain with dinamicaly updated begin
// newest charters are allways at begining of hash chain and old characters unregistered
// dad, son are array of indexes, nodes those makes tree.
// son[TREE]+"character treated as number" points to the index of this character in ring_ptr
// son[previous index] contains index of next (same) character. When last char is found son[]=DUP_NULL
// dad[current index] = index of previous index that is "owner" of it, that points to it
//
ts::compression::__lzss_compressor::__lzss_compressor(const uint32_t adict, const uint32_t asize)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------------------------------
		if (asize > DUP_LEN_MAX) backward_max_len = DUP_LEN_MAX;
		else if (asize < DUP_LEN_MIN) backward_max_len = DUP_LEN_MIN; else backward_max_len = asize;
                
		if (adict > DUP_OFFSET_MAX) backward_max_offset = DUP_OFFSET_MAX;
		else if (adict < DUP_OFFSET_MIN) backward_max_offset = DUP_OFFSET_MIN; else backward_max_offset = adict;
//if (backward_max_len>8) backward_max_len=8;
		if (backward_max_offset < backward_max_len * 2) backward_max_len = (backward_max_offset >> 1) - 1;
// rozmiar sï¿½ownika(okna wstecz) musi byï¿½ nie mniejszy niï¿½ dwukrotnoï¿½ï¿½ aktualnego okna wzprzedzenia danych
//------------------------------------------
		/*
		son_hash  								   HHHHHHHHH -> POINTS to SSSSSSS, double level hash, could be faster for pararell search?
		dad		  DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD|		  __int32 x offset
		son		  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS|SSSSSSSSS __int32 x offset + HASH_SIZE
		ring_ptr  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|XXXXXXXXXXXXXXX|X char x offset + char x max_len + sizeof(int64) for QWORD cmp pruposses - access violation of full __int32 comparision)
		*/
		dad = (__int32*)ts::mem32::alloc(sizeof(__int32)*(backward_max_offset));
		son = (__int32*)ts::mem32::alloc(sizeof(__int32)*(backward_max_offset + HASH_SIZE));
//------------------------------------------
		ring_ptr =	(char*)ts::mem32::alloc(backward_max_offset + backward_max_len + 2*sizeof(__int32)); // search_forward minimum match 4 bytes -> __int32 mode(8 bytes ahead)
//------------------------------------------
		small_offset = 0;
}
//---------------------------------------------------------------------------

ts::compression::__lzss_compressor::~__lzss_compressor(void)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		ts::mem32::free(dad);
		ts::mem32::free(son);
		ts::mem32::free(ring_ptr);
//ts::con::prints"%d\n",pmmcmax);
//cos nadpisuje na pozycji dalej i przy usuwaniu access voliation!  rozszerzam ring_ptr+1
}
//---------------------------------------------------------------------------
// dad=son[TREE+for 0 to 256]=DUP_NULL
//

void __stdcall ts::compression::__lzss_compressor::initialize(const char *aptr)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------------------------------
		backward_len = 0;
		backward_offset = 0;
		forward_len = 0;
		forward_elcount = 0;
		forward_elsize = 1;
//------------------------------------------
		ring_insert = backward_max_offset - backward_max_len;
		ring_delete = 0;
		ts::mem32::mov((char*)&ring_ptr[ring_insert],aptr,backward_max_len);
//------------------------------------------
		uint32_t  i;
		for (i=0; i <= backward_max_offset + HASH_SIZE;) {
				son[i++]=DUP_NULL;
		}
		for (i=0; i <= backward_max_offset;) {
				dad[i++]=DUP_NULL;
		}
//------------------------------------------
}
//---------------------------------------------------------------------------
// if current 'x' characters of string is "abcdef" and asize=3 so adict=6 and ring buffer probably will be "aaabcdaaa"
// son[TREE+'a']=0 -> son[0]=1 -> son[1]=2 -> son[2]=DUP_NULL ...son[TREE+'d']=5
// when next character would been inserted ring_ptr="gaabcdgaa"
// after this operation son[TREE+'g']=0 and son[TREE+'a']=1 and dad[1] will change form 0 to TREE+'a'
// of course 'a' must be deleted first (ts::compression::__lzss_compressor::delete) becouse it is no longer exists in buffer history
//


void __stdcall ts::compression::__lzss_compressor::insert(void)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//insert from RIGHT to LEFT on RING BUFFER! (reverse order in dictionary vs buffer ocurances reality)
		register uint32_t  ins = ring_insert;
		register char *ins_ptr =((char*)ring_ptr + ins);
		register uint32_t  hsh_ins = HASH(ins_ptr);
		register uint32_t  stn = backward_max_offset + hsh_ins;
		register uint32_t  cpx = son[stn];
		son[stn]=ins;
		dad[ins]=stn;
		if (cpx==DUP_NULL) {
				return;
		}
		dad[cpx]=ins;
		son[ins]=cpx;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__lzss_compressor::skip(void)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register uint32_t  skp = ring_insert;
// function dosnt check whatever skp was inserted or not so does nothing
// son[skp]=DUP_NULL; dad[skp]=DUP_NULL;
}

//---------------------------------------------------------------------------

void __stdcall ts::compression::__lzss_compressor::cut(const uint32_t choosen_ring_delete)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register uint32_t del;
		if (choosen_ring_delete!=DUP_NULL) del = choosen_ring_delete;
		else del = ring_delete;
		register uint32_t dad_del = dad[del];
		if (dad_del==DUP_NULL) {
				return;					// element nie zarejestrowany
		}
		dad[del]=DUP_NULL;
		register uint32_t son_del = son[del];
		son[dad_del] = son_del;						 // MADE connection the 'del' DAD is parrent of 'del' SON (even if it's DUP NULL)
		if (son_del==DUP_NULL) {					 // DUP_NULL can't have SON
				return;
		}
		son[del]=DUP_NULL;
		dad[son_del] = dad_del;						 // MADE connection the 'del' SON is parrent of 'del' DAD
}
//---------------------------------------------------------------------------
// updates tree by deleteing old and inserting new characters in ring buffer, also prepares buffer(last characters) for matches
//

void __stdcall ts::compression::__lzss_compressor::update(const char *aadd_ptr, const uint32_t aupdate_count, const bool a_insert)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//------------------------------------------
		register uint32_t maxl = backward_max_len;
		register uint32_t maxo = backward_max_offset;
//------------------------------------------
		register uint32_t ucnt = aupdate_count;
		register char *uptr = &((char*)aadd_ptr)[maxl];
		register char *rptr;
//------------------------------------------
		while  (ucnt!=0) {
				ucnt--;
//------------------------------------------
// UNREGISTER OLD CHARTER FROM DUPIONARY (DUP NULL MEANS current ring pos not CHOOSEN)
				cut(DUP_NULL);
//-------------------
// COPY NEW CHARTER FROM INPUT INTO RING BUFFER,
				rptr	= &ring_ptr[ring_delete];
				rptr[0] = uptr[0];
//-------------------
//IF DELETE<LEN THEN COPY OUTSIDE MAIN RING FOR INSERT+LEN CHARTERS TO BE(comparision of len charters prupose)
				if (ring_delete < maxl)   rptr[maxo] = uptr[0];
//------------------------------------------
// INCRESE THE INPUT POINTER
				uptr++;
//-------------------
				if (++ring_delete >=maxo) ring_delete =0;
//------------------------------------------
// REGISTER CHARTER INTO DUPIONARY
				if (a_insert==true) insert();
				else skip();
//-------------------
				if (++ring_insert >=maxo) ring_insert =0;
//-------------------
		}
//------------------------------------------
}
//---------------------------------------------------------------------------
// will recrusevly search for longest match of string at ref_ptr[ring_insert]...backward_max_len with ref_ptr[...]
//
uint32_t __stdcall ts::compression::__lzss_compressor::search_backward(void)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

//----------------------
		register uint32_t bst_len = 0, bst_ofs = 0;
		register uint32_t  ref = ring_insert;
		register char *ref_ptr = &((char*)ring_ptr)[ref];
		uint32_t hsh_ref = HASH(ref_ptr) & (HASH_SIZE-1);
		register uint32_t  cur_len, cur_ofs;
		register uint32_t  cur = backward_max_offset + hsh_ref;
		register char *cur_ptr;
		uint32_t  cur_tail_minmach = cur + 0; //+len
//----------------------
// FINDER FIRST LOOP, PREPARE THE POTENTIAL MATCHES
//
//------------------------------------------
		while (1) {
// GET NEXT ELEMENT IN CURRENT HASH CHAIN, CHECK AGAINST EXISTING IN CHAIN
ENTRY:
 if (son[cur] == DUP_NULL) break;
else cur = son[cur];
//------------------------------------------
 if (bst_len<=4) goto COMPARE;
// CHECK WHATEVER PLAUSIBLE & SENSE TO CHECK AGAINST TAIL HASH
 if (son[cur_tail_minmach] == DUP_NULL) break;
else		 cur_tail_minmach = son[cur_tail_minmach];
// SKIP MAIN CHAIN UNTIL FIT THE ACTUAL FOUND TAIL
for (; son[cur]==DUP_NULL; cur = son[cur]) {
		  if ((cur + bst_len - 4) < cur_tail_minmach) continue;
		  else if ((cur + bst_len - 4) < cur_tail_minmach) goto COMPARE;
}
goto ENTRY;
//----------------------
COMPARE:
// INITIALIZE CURRENT MATCH & CURRENT INPUT REFERENCED POITERS
				cur_ptr = &ring_ptr[cur];
				ref_ptr = &ring_ptr[ref];
//----------------------
// CHECK MINIMUM LEN MATCH 4 - MISMATCH OF HASH CHECK
				if (((__int32*)cur_ptr)[0]!=((__int32*)ref_ptr)[0])
				continue;
//----------------------
// START COMPARING FROM 4 BYTES - ALREADY FILTERED IN FIRST LOOP FROM HASH CHAIN
				cur_len =4;
				cur_ptr+=4;
				ref_ptr+=4;
//----------------------
// COMPARING LOOP DWORD
				while (1) {
						if (((char*)cur_ptr)[0]!=((char*)ref_ptr)[0])
							break;
						else {
						cur_len+=1;
						}
						if (cur_len >= backward_max_len)
							break;
						else {
						cur_ptr+=1;
						ref_ptr+=1;
						continue;
						}
				}
				/*
				//----------------------
				// COMPARING LOOP QWORD
				while (1) {
				  if (((__int64*)cur_ptr)[0]!=((__int64*)ref_ptr)[0])
				  break;

				  cur_len+=8;
				  if (cur_len >= backward_max_len) {goto CALCULATE_OFFSET;}
				  else {
				  cur_ptr+=8;
				  ref_ptr+=8;
				  continue;
				  }
				}
				//----------------------
				// COMPARING LOOP BYTES
				while (1) {
				  if (((__int8*)cur_ptr)[0]!=((__int8*)ref_ptr)[0])
				  break;

				  cur_len+=1;
				  if (cur_len >= backward_max_len) {goto CALCULATE_OFFSET;}
				  else {
				  cur_ptr+=1;
				  ref_ptr+=1;
				  continue;
				  }
				}
				*/
				if (cur_len<=bst_len)
				continue;
//----------------------
CALCULATE_OFFSET:
// TREE_SEARCH_CALC_OFFSET_AND_STORE
				if (ref <= cur) cur_ofs  = backward_max_offset + ref - cur;
		   else cur_ofs  = ref - cur;
// CHECK CURRENT OFFSET IS VALIDITY(MATCH DATA OVERLAPS OR NOT)
				if (cur_ofs <= cur_len) {
// CHECK IS CURRENT LENGTH(NOW LIMITED BY OFFSET) IS BETTER THAN PREVIOUS?
				if (cur_ofs <= bst_len) continue;
				else
					cur_len  = cur_ofs;
				}
				bst_ofs  = cur_ofs;
				bst_len  = cur_len;
				cur_tail_minmach = cur + cur_len - 4;
//----------------------
// TREE_EXIT_IF_MAX
				if (bst_len>=backward_max_len) {
					cut(cur);
					bst_len =backward_max_len;
					break;
				}
				// ^^ skip or delete cur charter at found offset from dictionary! because current charter@hash will be soon fresh in dictionary with maximum length
				// so OLD would only slooow down searching process and soon or later would be outside the find window so..its useless
//----------------------
		}
//------------------------------------------
// RETURN FOUND ELEMENT LEN AND SET LEN & OFS PAIRS
EXIT:
		backward_len = bst_len;
		backward_offset = bst_ofs;
		return bst_len;
}
//---------------------------------------------------------------------------

void __stdcall  ts::compression::__lzss_compressor::clear_backward_result(void)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		backward_len = 0;
		backward_offset = 0;
}
//---------------------------------------------------------------------------
// will search for characters(groups 1,2,3,4) repetitions, faster than dictionary matches more efectively for compression
//
uint32_t __stdcall ts::compression::__lzss_compressor::search_forward(void)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		register char  *cur_ref = &((char*)ring_ptr)[ring_insert];
		register char  *cur_ptr = NULL;
		register __int8 cur_els = 0;
		register __int8 cur_els_max = 0;
//------------------------------------------
// calculate optimal (biggest) RLE element size
		if (*((__int32*)cur_ref)==*((__int32*)(cur_ref+4))) {
				if (cur_els_max==0)
					{
					cur_els_max =4;
					cur_ptr=cur_ref+2*4;
					}
				cur_els =4;
		}
		if (*((__int16*)cur_ref)==*((__int16*)(cur_ref+3)) ? *((__int8*)(cur_ref+2))==*((__int8*)(cur_ref+5)) : false) {
				if (cur_els_max==0)
					{
					cur_els_max =3;
					cur_ptr=cur_ref+2*3;
					}
				cur_els =3;
		}
		if (*((__int16*)cur_ref)==*((__int16*)(cur_ref+2))) {
				if (cur_els_max==0)
					{
					cur_els_max =2;
					cur_ptr=cur_ref+2*2;
					}
				cur_els =2;
		}
		if (cur_ref[0]==cur_ref[1]) {
				if (cur_els_max==0)
					{
					cur_els_max =1;
					cur_ptr=cur_ref+2*1;
					}
				cur_els =1;
		}
//--------------------
		if (cur_els==0) { // NOTHING FOUND
//--------------------
				forward_len =0;
				forward_elcount =0;
				forward_elsize =1;
//--------------------
				return forward_len;
//--------------------
		}
//--------------------
//
// SEARCH OPTIMAL PATTERNS
		register char  *cur_ptr_end;
		if (backward_max_len < PATTERN_LEN_MAX) cur_ptr_end = cur_ref + backward_max_len;
		else cur_ptr_end = cur_ref + PATTERN_LEN_MAX;
		if (cur_els_max>=4 ? cur_els<=4 : false)
				while (cur_ptr <= cur_ptr_end -4) {
						if (((__int32*)cur_ref)[0]!=((__int32*)cur_ptr)[0])
								break;
						cur_ptr+=4;
				}
		if (cur_els_max==3 ? cur_els==3 : false)
				while (cur_ptr <= cur_ptr_end -3) {
						if (((__int16*)cur_ref)[0]!=((__int16*)cur_ptr)[0] || ((__int8*)(cur_ref+2))[0]!=((__int8*)(cur_ptr+2))[0])
								break;
						cur_ptr+=3;
				}
		if (cur_els_max>=2 ? cur_els<=2 : false)
				while (cur_ptr <= cur_ptr_end -2) {
						if (((__int16*)cur_ref)[0]!=((__int16*)cur_ptr)[0])
								break;
						cur_ptr+=2;
				}
		//rest of comparisions <2,3,4
		if (cur_els_max>=1 ? cur_els<=1 : false)
				while (cur_ptr <= cur_ptr_end -1) {
						if (cur_ref[0]!=cur_ptr[0])
								break;
						cur_ptr+=1;
				}
//--------------------
// CALCULATE LENGTH, COUNT & ELEMENT SIZE (TODO: SOME "CHOICE" CODE! IN FUTURE)
//--------------------
		forward_len =(size_t)(cur_ptr - cur_ref);
		forward_elsize =cur_els;
		forward_elcount =forward_len / forward_elsize;
		return forward_len;
//--------------------
}
//---------------------------------------------------------------------------

void __stdcall  ts::compression::__lzss_compressor::clear_forward_result(void)
{
#ifdef __DEBUG_LZSS_COMPRESSOR__
__DEBUG_FUNC_CALLED__
#endif

		forward_len =0;
		forward_elcount =0;
		forward_elsize =1;
}
//-------------------------------THE END-------------------------------------

