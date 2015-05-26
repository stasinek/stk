//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_lzssv4.h"
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// tym wi�cej bit�w im wi�ksze slide window, 12 dla 4096   wyniki dla AMD Athlon X2 3800 Dual Core 939 2.2GHz 512kB cache LZS CalgaryCorpus
//#define HASH_SIZE (__int32)(256<<8)
//#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<3)^(((__int16)ptr[2])<<5)^(((__int16)ptr[3])<<8)) //4.20MB
#define HASH_SIZE (__int32)(256<<7)
#define HASH(ptr) (__int32)(((__int16)ptr[0])^(((__int16)ptr[1])<<3)^(((__int16)ptr[2])<<5)^(((__int16)ptr[3])<<7)) //5.1MB
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
//wersje ksia�kowe powolne
//#define HASH_SIZE (__int32)(256<<8)
//#define HASH(ptr) (__int32)(((((ptr[0]<<5)+ptr[1])<<5)+ptr[2])) //2.95MB
//#define HASH_SIZE (__int32)(256<<4)
//#define HASH(ptr) (__int32)((40543*((((ptr[0]<<4)^ptr[1])<<4)^ptr[2])>>4) & 0xFFF) //4.20MB
//---------------------------------------------------------------------------

// This structure contains binary tree constructed around ring_ptr witch is pointer to
// memory array, text buffer like fifo/hash chain with dinamicaly updated begin
// newest charters are allways at begining of hash chain and old characters unregistered
// dad, son are array of indexes, nodes those makes tree.
// son[TREE]+"character treated as number" points to the index of this character in ring_ptr
// son[previous index] contains index of next (same) character. When last char is found son[]=DICT_NULL
// dad[current index] = index of previous index that is "owner" of it, that points to it
//
ts::compression::__lzss_compressor::__lzss_compressor(const __int32 adict, const __int32 asize)
{
//------------------------------------------
	if (asize > DICT_LEN_MAX)
		max_find_len = DICT_LEN_MAX;
	else if (asize < DICT_LEN_MIN)
		max_find_len = DICT_LEN_MIN;
	else
		max_find_len = asize;
	if (adict > DICT_OFFSET_MAX)
		max_find_offset = DICT_OFFSET_MAX;
	else if (adict < DICT_OFFSET_MIN)
		max_find_offset = DICT_OFFSET_MIN;
	else
		max_find_offset = adict;
//if (max_find_len>8) max_find_len=8;
	if (max_find_offset < max_find_len * 2) max_find_len = (max_find_offset >> 1) - 1;
// rozmiar s�ownika(okna wstecz) musi by� nie mniejszy ni� dwukrotno�� aktualnego okna wzprzedzenia danych
//------------------------------------------
	/*
	dad	  DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD|		  __int32 x offset
	son	  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS|SSSSSSSSS __int32 x offset + HASH_SIZE
	ring_ptr XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|XXXXXXXXXXXXXXX|X char x offset + char x max_len + sizeof(int32) for safety pruposses - access violation of full __int32 comparision)

	*/
		dad = (__int32*)ts::mem32::alloc(sizeof(__int32)*(max_find_offset));
		son = (__int32*)ts::mem32::alloc(sizeof(__int32)*(max_find_offset + HASH_SIZE));
//------------------------------------------
		ring_ptr =	(char*)ts::mem32::alloc(max_find_offset + max_find_len + sizeof(__int32));
//------------------------------------------
	small_offset = 0;
}
//---------------------------------------------------------------------------

ts::compression::__lzss_compressor::~__lzss_compressor(void)
{
	ts::mem32::free(dad);
	ts::mem32::free(son);
	ts::mem32::free(ring_ptr);
//ts::console::print_formated"%d\n",pmmcmax);
// cos nadpisuje na pozycji dalej i przy usuwaniu access voliation!  rozszerzam ring_ptr+1
}
//---------------------------------------------------------------------------
// dad=son[TREE+for 0 to 256]=DICT_NULL
//

void __stdcall ts::compression::__lzss_compressor::initialize(const char *aptr)
{
//------------------------------------------
	find_len = 0;
	find_offset = 0;
	forward_len = 0;
	forward_counte = 0;
	forward_elsize = 1;
//------------------------------------------
	ring_insert = max_find_offset - max_find_len;
	ring_delete = 0;
		ts::mem32::mov((char*)&ring_ptr[ring_insert],aptr,max_find_len);
//------------------------------------------
		__int32  i;
	for (i = max_find_offset + HASH_SIZE;;) {
		son[--i]=DICT_NULL;
		if (i==0)
			break;
	}
	for (i = max_find_offset;;) {
		dad[--i]=DICT_NULL;
		if (i==0)
			break;
	}
//------------------------------------------
}
//---------------------------------------------------------------------------
// if current 'x' characters of string is "abcdef" and asize=3 so adict=6 and ring buffer probably will be "aaabcdaaa"
// son[TREE+'a']=0 -> son[0]=1 -> son[1]=2 -> son[2]=DICT_NULL ...son[TREE+'d']=5
// when next character would been inserted ring_ptr="gaabcdgaa"
// after this operation son[TREE+'g']=0 and son[TREE+'a']=1 and dad[1] will change form 0 to TREE+'a'
// of course 'a' must be deleted first (ts::compression::__lzss_compressor::delete) becouse it is no longer exists in buffer history
//


void __stdcall ts::compression::__lzss_compressor::insert(void)
{
//insert from RIGHT to LEFT on RING BUFFER! (reverse order in dictionary vs buffer ocurances reality)
		register __int32  ins = ring_insert;
		register char *ins_ptr =((char*)ring_ptr + ins);
		register __int32  hsh_ins = HASH(ins_ptr);
		register __int32  stn = max_find_offset + hsh_ins;
		register __int32  cpx = son[stn];
	son[stn]=ins;
	dad[ins]=stn;
	if (cpx==DICT_NULL) {
		return;
	}
	dad[cpx]=ins;
	son[ins]=cpx;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__lzss_compressor::skip(void)
{
		register __int32  skp = ring_insert;
// function dosnt check whatever skp was inserted or not so does nothing
// son[skp]=DICT_NULL; dad[skp]=DICT_NULL;
}

//---------------------------------------------------------------------------

void __stdcall ts::compression::__lzss_compressor::cut(const __int32 choosen_ring_delete)
{
		register __int32 del;
	if (choosen_ring_delete!=DICT_NULL) del = choosen_ring_delete;
	else del = ring_delete;
		register __int32 dad_del = dad[del];
	if (dad_del==DICT_NULL) {
		return;					// element nie zarejestrowany
	}
	dad[del]=DICT_NULL;
		register __int32 son_del = son[del];
	son[dad_del] = son_del;						 // MADE connection the 'del' DAD is parrent of 'del' SON (even if it's DICT NULL)
	if (son_del==DICT_NULL) {					 // DICT_NULL can't have SON
		return;
	}
	son[del]=DICT_NULL;
	dad[son_del] = dad_del;						 // MADE connection the 'del' SON is parrent of 'del' DAD
}
//---------------------------------------------------------------------------
// updates tree by deleteing old and inserting new characters in ring buffer, also prepares buffer(last characters) for matches
//

void __stdcall ts::compression::__lzss_compressor::update(const char *aadd_ptr, const __int32 aupdate_count, const bool ainsert)
{
//------------------------------------------
		register __int32 maxl = max_find_len;
		register __int32 maxo = max_find_offset;
//------------------------------------------
		register char *uptr = &((char*)aadd_ptr)[maxl];
		register __int32 ucnt = aupdate_count;
		register char *rptr;
//------------------------------------------
	while (ucnt!=0) {
		ucnt--;
//------------------------------------------
// UNREGISTER OLD CHARTER FROM DICTIONARY (DICT NULL MEANS current ring pos not CHOOSEN)
				cut(DICT_NULL);
//-------------------
// COPY NEW CHARTER FROM INPUT INTO RING BUFFER,
		rptr	= &ring_ptr[ring_delete];
		rptr[0] = uptr[0];
//-------------------
//IF DELETE<LEN THEN COPY OUTSIDE MAIN RING FOR INSERT+LEN CHARTERS TO BE(comparision of len charters prupose)
		if (ring_delete < maxl) rptr[maxo] = uptr[0];
//-------------------
// INCRESE THE INPUT POINTER
		uptr++;
//-------------------
		if (++ring_delete >=maxo) ring_delete =0;
//------------------------------------------
// REGISTER CHARTER INTO DICTIONARY
				if (ainsert==true) insert();
		else skip();
//-------------------
		if (++ring_insert >=maxo) ring_insert =0;
//------------------------------------------
	}
//------------------------------------------
}
//---------------------------------------------------------------------------
// will recrusevly search for longest match of string at ref_ptr[ring_insert]...max_find_len with ref_ptr[...]
//
__int32 __stdcall ts::compression::__lzss_compressor::search_backward(void)
{
//----------------------
		__int32  bst_len = 0, bst_ofs = 0;
		register __int32   ref = ring_insert;
		register char *ref_ptr = &((char*)ring_ptr)[ref];
		__int32  hsh_ref = HASH(ref_ptr);
		register __int32   cur = max_find_offset + hsh_ref;
		__int32   cur_len, cur_ofs;
		register __int32   cur_tail_minmach = cur + 0; //+len
		register char *cur_ptr;
//----------------------
// FINDER FIRST LOOP, PREPARE THE POTENTIAL MATCHES
//
//------------------------------------------
	while (1) {
// GET NEXT ELEMENT IN CURRENT HASH CHAIN, CHECK AGAINST EXISTING IN CHAIN
ENTRY:
 if (son[cur] == DICT_NULL) break; 
else cur = son[cur];
//------------------------------------------
 if (bst_len<=4) goto COMPARE; 
// CHECK WHATEVER PLAUSIBLE & SENSE TO CHECK AGAINST TAIL HASH
 if (son[cur_tail_minmach] == DICT_NULL) break;
else		 cur_tail_minmach = son[cur_tail_minmach];
// SKIP MAIN CHAIN UNTIL FIT THE ACTUAL FOUND TAIL
for (; son[cur]==DICT_NULL; cur = son[cur]) {
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
				if (((__int32*)cur_ptr)[0]!=((__int32*)ref_ptr)[0]) continue;
//----------------------
// START COMPARING FROM 4 BYTES - ALREADY FILTERED IN FIRST LOOP FROM HASH CHAIN
		cur_ptr+=4;
		ref_ptr+=4;
		cur_len =4;
//----------------------
// COMPARING LOOP DWORD
		while (1) {
			if (((char*)cur_ptr)[0]!=((char*)ref_ptr)[0])
				break;
			cur_len+=1;
			if (cur_len >= max_find_len)
				break;
			cur_ptr+=1;
			ref_ptr+=1;
		}
		if (cur_len<=bst_len)
			continue;
		/*cur_len = 0;
		//----------------------
		// COMPARING LOOP DWORD
		while (1) {
				  if (((__int32*)cur_ptr)[0]!=((__int32*)ref_ptr)[0])
		  break;
		  cur_len+=4;
		  if (cur_len >= max_find_len) {cur_len = max_find_len; goto CALCULATE_OFFSET;}
		  else {cur_ptr+=4;ref_ptr+=4;}
		   }
		if (cur_len==0)
		continue;
		//----------------------
		// COMPARING LOOP BYTES
		while (1) {
		  if (((char*)cur_ptr)[0]!=((char*)ref_ptr)[0])
		  break;
		  cur_len+=1;
		  if (cur_len >= max_find_len) {cur_len = max_find_len; goto CALCULATE_OFFSET;}
		  else {cur_ptr+=1;ref_ptr+=1;}
		   }
		if (cur_len<=bst_len)
		continue;*/
//----------------------
CALCULATE_OFFSET:
// TREE_SEARCH_CALC_OFFSET_AND_STORE
		if (ref <= cur) cur_ofs  = max_find_offset + ref - cur;
	   else cur_ofs  = ref - cur;
// CHECK CURRENT OFFSET IS VALIDITY(MATCH DATA OVERLAPS OR NOT)
		if (cur_ofs <= cur_len) cur_len = cur_ofs;
// CHECK IS CURRENT LENGTH IS BETTER THAN PREVIOUS?
		if (cur_len <= bst_len) continue;
	   else {
			bst_ofs  = cur_ofs;
			bst_len  = cur_len;
			cur_tail_minmach = cur + cur_len - 4;
		}
//----------------------
// TREE_EXIT_IF_MAX
		if (bst_len>=max_find_len) {
						cut(cur);
			bst_len =max_find_len;
			break;
		}
		// ^^ skip or delete cur charter at found offset from dictionary! because current charter@hash will be soon fresh in dictionary with maximum length
		// so OLD would only slooow down searching process and soon or later would be outside the find window so..its useless
//----------------------
	}
//------------------------------------------
// RETURN FOUND ELEMENT LEN AND SET LEN & OFS PAIRS
EXIT:
	find_len = bst_len;
	find_offset = bst_ofs;
	return bst_len;
}
//---------------------------------------------------------------------------

void __stdcall  ts::compression::__lzss_compressor::clear_backward_result(void)
{
	find_len = 0;
	find_offset = 0;
}
//---------------------------------------------------------------------------
// will search for characters(groups 1,2,3,4) repetitions, faster than dictionary matches more efectively for compression
//
__int32 __stdcall ts::compression::__lzss_compressor::search_forward(void)
{
		register char  *cur_ref = &((char*)ring_ptr)[ring_insert];
		register char  *cur_ptr = NULL;
		register __int8 cur_els = 0;
		register __int8 cur_els_max = 0;
//------------------------------------------
		if (*((__int32*)cur_ref)==*((__int32*)(cur_ref+4))) {
		if (cur_ptr==NULL)
			cur_ptr=cur_ref+2*4;
		if (cur_els_max==0)
			cur_els_max =4;
		cur_els =4;
	}
		if (*((__int16*)cur_ref)==*((__int16*)(cur_ref+3)) && *((__int8*)(cur_ref+2))==*((__int8*)(cur_ref+5))) {
		if (cur_ptr==NULL)
			cur_ptr=cur_ref+2*3;
		if (cur_els_max==0)
			cur_els_max =3;
		cur_els =3;
	}
		if (*((__int16*)cur_ref)==*((__int16*)(cur_ref+2))) {
		if (cur_ptr==NULL)
			cur_ptr=cur_ref+2*2;
		if (cur_els_max==0)
			cur_els_max =2;
		cur_els =2;
	}
	if (cur_ref[0]==cur_ref[1]) {
		if (cur_ptr==NULL)
			cur_ptr=cur_ref+2*1;
		if (cur_els_max==0)
			cur_els_max =1;
		cur_els =1;
	}
//--------------------
	if (cur_els==0) { // NOTHING FOUND
//--------------------
		forward_len =0;
		forward_counte =0;
		forward_elsize =1;
//--------------------
		return forward_len;
//--------------------
	}
//--------------------
//
// SEARCH ANOTHER BRUNS
//
		register char  *cur_ptr_end;
	if (max_find_len < BRUN_LEN_MAX) cur_ptr_end = cur_ref + max_find_len;
	else cur_ptr_end = cur_ref + BRUN_LEN_MAX;
	if (cur_els<=4 && cur_els_max>=4)
		while (cur_ptr <= cur_ptr_end -4) {
						if (((__int32*)cur_ref)[0]!=((__int32*)cur_ptr)[0])
				break;
			cur_ptr+=4;
		}
	if (cur_els==3 && cur_els_max==3)
		while (cur_ptr <= cur_ptr_end -3) {
						if (((__int16*)cur_ref)[0]!=((__int16*)cur_ptr)[0] || ((__int8*)(cur_ref+2))[0]!=((__int8*)(cur_ptr+2))[0])
				break;
			cur_ptr+=3;
		}
	if (cur_els<=2 && cur_els_max>=2)
		while (cur_ptr <= cur_ptr_end -2) {
						if (((__int16*)cur_ref)[0]!=((__int16*)cur_ptr)[0])
				break;
			cur_ptr+=2;
		}
	if (cur_els<=1 && cur_els_max>=1)
		while (cur_ptr <= cur_ptr_end -1) {
			if (cur_ref[0]!=cur_ptr[0])
				break;
			cur_ptr+=1;
		}
//--------------------
// CALCULATE LENGTH, COUNT & ELEMENT SIZE (TODO: SOME "CHOICE" CODE! IN FUTURE)
//--------------------
		forward_len =(__int32)cur_ptr - (__int32)cur_ref;
	forward_elsize =cur_els;
	forward_counte =forward_len / forward_elsize;
	return forward_len;
//--------------------
}
//---------------------------------------------------------------------------

void __stdcall  ts::compression::__lzss_compressor::clear_forward_result(void)
{
	forward_len =0;
	forward_counte =0;
	forward_elsize =1;
}
//-------------------------------THE END-------------------------------------

