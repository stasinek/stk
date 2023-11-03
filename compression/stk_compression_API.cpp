//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
    #pragma hdrstop
#endif
#include "stk_compression_lzss.h"
#include "stk_compression_bwt_matrix2.h"
#include "stk_compression_huff.h"
#include "stk_compression_ari.h"
#include "./../cipher/stk_cipher_mtf.h"
#include "./../io/stk_console.h"
#include "./../text/stk_cstr_utils.h"
#include "./../mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_compression_API.h"
//---------------------------------------------------------------------------

void __stdcall stk::compression::test(void)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif
	register int32_t o, i = 0;
	char *src = stk::cstr::alloc((const size_t)4096);
	char *dst = stk::cstr::alloc((const size_t)4096);
if (src==NULL || dst==NULL)
return;
	stk::con::prints("Adres src: %d\n",(int8_t*)src);
	stk::cstr::mov(src,(char*)"Here the defined words consist of two disjoint classes, sequences of alphanumeric characters and sequences of nonalphanumeric characters.\0");
	i = stk::cstr::len(src);
	stk::con::prints("do kompresji %d bajtow\n",i);
	stk::con::prints("%s\n",src);
	stk::con::prints("Compress\n",i);
	o = stk::compression::compress_LZS(dst,src,1024,4096);
	stk::con::prints("Zmniejszono do %d bajtow\n",o);
    for (int x = 0; x < o; x++) {
		if (dst[x]>=' ' && dst[x]<='~') stk::con::prints(" \'%c\' ",dst[x]); //ASCII numbers,letters, special !~# etc.
	   else stk::con::prints(" \'%#02x\' ",dst[x]);
	   //unprintable compressor codes 0xXXL
	}
	stk::con::prints("\n");
	stk::con::prints("Decompress\n");
//	stk::compression::uncompress_LZS(dst,o,src);
	stk::con::prints("End\n");
	stk::cstr::free(src);
	stk::cstr::free(dst);
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::compression::compress_LZS(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_src_count, const uint32_t a_block)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif
	register int8_t* ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register const int8_t* ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + a_src_count;
	register int8_t* ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const int8_t* ptrd_start = ptrd;
//------------------------------------------
	register uint32_t  lit_text_len = 0;
	register char *lit_text_ptr = (char*)ptrs;
	register uint32_t  next_skip_len = 0, next_insert_to_dup_len = 0;
//------------------------------------------
//stk_huff_compressor huff;
//		  huff.initialize();
	stk::compression::__lzss_compressor *chain = new stk::compression::__lzss_compressor(a_block,a_src_count);
	chain->initialize((char*)ptrs);
//------------------------------------------
	while (1) {
//------------------------------------------
// sprawdz koniec
		if (ptrs + next_insert_to_dup_len + next_skip_len + chain->backward_max_len >= ptrs_end) {
			if (ptrs + next_insert_to_dup_len + next_skip_len + 8 >= ptrs_end) {
				ptrs +=next_insert_to_dup_len;
				ptrs +=next_skip_len;
				lit_text_len += ptrs_end - ptrs;
				break;
			}
			chain->backward_max_len = ptrs_end - ptrs - next_insert_to_dup_len - next_skip_len;
		}
//------------------------------------------
// update chain, copy data to ringbuffer
                LZS_UPDATE_DUP:
// delete old, copy data to ring, skip some nodes (mostly found by brun or by greedy dictionary search)
		if (next_skip_len) {
			chain->update((char*)ptrs,next_skip_len, 0);
			ptrs += next_skip_len;
			next_skip_len = 0;
		}
// delete old, copy data to ring, insert new nodes to chain
		if (next_insert_to_dup_len) {
			chain->update((char*)ptrs,next_insert_to_dup_len, 1);
			ptrs += next_insert_to_dup_len;
			next_insert_to_dup_len = 0;
		}
//------------------------------------------
// search for fixed rles ahead 1,2,3,4 byte rles
		LZS_RLE:
//------------------------------------------
		if (chain->search_forward()>=RLE_LENGHT_MIN) {
			if (chain->header_coder.check_rle_match_cost(lit_text_len,chain->forward_elcount,chain->forward_elsize) > 0)
				goto LZS_SAVE_LIT;
			else chain->clear_forward_result();
		}
//------------------------------------------
// search for variable rles in the past, but only for those that had been registered in chain
		LZS_DUP:
//------------------------------------------
		if (chain->search_backward()>=DUP_LENGHT_MIN) {
			if (chain->header_coder.check_dup_match_cost(lit_text_len,chain->backward_len,chain->backward_offset) > 0)
				goto LZS_SAVE_LIT;
			else chain->clear_backward_result();
		}
//------------------------------------------
		LZS_NOTHING:
// nothing found, increment passed text length, prepare for next charter or save passed if reach limit
//------------------------------------------
		if (lit_text_len  >=LIT_LENGHT_MAX) {
			goto LZS_SAVE_LIT;
		}
		else lit_text_len += 1;
		next_skip_len = 0;
		next_insert_to_dup_len = 1;
		continue;
//------------------------------------------
// if limit is not reached save passed text
                LZS_SAVE_LIT:
//------------------------------------------
		if (lit_text_len==0) goto LZS_SAVE_RLE;
#define SAVE_LIT(d,s,l)								\
	for (;l> LIT_LENGHT_MAX; l-=LIT_LENGHT_MAX) {					\
		 d+=chain->header_coder.lit_encode((void*)d,LIT_LENGHT_MAX);		\
		 stk::mem::mov((char*)d,(char*)s,LIT_LENGHT_MAX);			\
		 d+=LIT_LENGHT_MAX;							\
		 s+=LIT_LENGHT_MAX; 							\
		}									\
	if  (l> 0) {									\
		 d+=chain->header_coder.lit_encode((void*)d,l);			\
		 stk::mem::mov((char*)d,(char*)s,l);					\
		 d+=l;									\
		 s+=l;									\
		}
		SAVE_LIT(ptrd,lit_text_ptr,lit_text_len);
// hist_l_pass[lit_text_len]++;
//	if (hist_l_pass[lit_text_len]>hist_l_lit_max) hist_l_lit_max=hist_l_pass[lit_text_len];
		lit_text_ptr =(char*)ptrs;
		lit_text_len = 0;
//------------------------------------------
		LZS_SAVE_RLE:
//------------------------------------------
		if (chain->forward_len< RLE_LENGHT_MIN)
			goto LZS_SAVE_DUP;
#define SAVE_RLE(d,s,c,e)												\
	d+=chain->header_coder.rle_encode((void*)d,c,e);						\
	 stk::mem::mov((char*)d,(char*)s,e);		\
	d+=e;
		SAVE_RLE(ptrd,ptrs,chain->forward_elcount,chain->forward_elsize);
//	hist_l_brun[chain->rle_counte]++;
//	if (hist_l_brun[chain->rle_counte]>hist_l_rle_max) hist_l_rle_max=hist_l_brun[chain->rle_counte];
//	hist_e_brun[chain->rle_elsize]++;
//	if (hist_e_brun[chain->rle_elsize]>hist_e_rle_max) hist_e_rle_max=hist_e_brun[chain->rle_elsize];
		lit_text_ptr = (char*)(ptrs+chain->forward_len);
		next_insert_to_dup_len = chain->forward_elsize;

		while (next_insert_to_dup_len < chain->forward_len && next_insert_to_dup_len < 4) {
			next_insert_to_dup_len+=1;
		}
		next_skip_len = chain->forward_len - next_insert_to_dup_len;
		chain->clear_forward_result();
		continue;
		/*for (ptmp = (int32_t)ptrs, ptmp_end = ptmp+chain->rle_elsize; ptmp < ptmp_end; ptmp++) {	\
		ptrd_bit+= huff.encode((char*)ptrd,ptrd_bit,((char*)ptmp)[0]);								\
			 ptrd+= ptrd_bit>>3;																	\
		ptrd_bit = ptrd_bit & (8-1);																\
		} */
//------------------------------------------
		LZS_SAVE_DUP:
//------------------------------------------
		if (chain->backward_len< DUP_LENGHT_MIN)
			continue;
#define SAVE_DUP(d,l,o)												\
		d+=chain->header_coder.dup_encode((void*)d,l,o);
		SAVE_DUP(ptrd,chain->backward_len,chain->backward_offset);
//	hist_l_dict[chain->backward_len]++;
//	if (hist_l_dict[chain->backward_len]>hist_l_dup_max) hist_l_dup_max=hist_l_dict[chain->backward_len];
//	hist_o_dict[chain->backward_offset>>8]++;
//	if (hist_o_dict[chain->backward_offset>>8]>hist_o_dup_max) hist_o_dup_max=hist_o_dict[chain->backward_offset>>8];
		lit_text_ptr =(char*)(ptrs + chain->backward_len);
		next_skip_len = 0;
		next_insert_to_dup_len = chain->backward_len;
		chain->clear_backward_result();
		continue;
	}
//------------------------------------------
	LZS_SAVE_REST:
	if (lit_text_len!=0) {
		SAVE_LIT(ptrd,lit_text_ptr,lit_text_len);
	}
	delete chain;
//------------------------------------------
	return (int8_t*)ptrd - (int8_t*)ptrd_start;
}
//---------------------------------------------------------------------------

void __stdcall stk::compression::uncompress_LZS(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const  int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
    uint32_t siz, cnt, len, ofs;
	register char hdr;
//------------------------------------------
//stk_huff_compressor huff;
//		 huff.initialize();
#ifdef LZSS_HEAD
	const file_header::__lzss_header_coder header_coder;
#endif
//------------------------------------------
	for (; ptrd < ptrd_end;) {
//------------------------------------------
		// Normal code hdr is 4 bit + LENGTHS are coded in 4 bits(15)
		// OFFSET in 8 or 16 or 24 or 32 bit
			hdr = ((char*)ptrs)[0] & L1_CODE_MASK;
		if (hdr==L1_RLE_CODE)
			goto GOTO_LZS_LOAD_RLE;
		if (hdr==L1_LIT_CODE)
			goto GOTO_LZS_LOAD_LIT;
		if (hdr==L1_DUP_CODE)
			goto GOTO_LZS_LOAD_DUP;

		// Extended codes, hdr is 4 bit + LENGTHS are coded 4bits+8bits(4096) rather than just 4 bits(15) like in normal one.
		// OFFSET are still the same 8 or 16 or 24 or 32 bit
			hdr = ((char*)ptrs)[0] & L2_CODE_MASK;
		if (hdr==L2_RLE_CODE)
			goto GOTO_LZS_LOAD_RLE_EX;
		if (hdr==L2_LIT_CODE)
			goto GOTO_LZS_LOAD_LIT_EX;
		if (hdr==L2_DUP_CODE)
			goto GOTO_LZS_LOAD_DUP_EX;

		// RESERVED 0-2 CODE POSIBBLE HERE (CRC32, RECOVERY DATA ETC.), reserved, if detected in current version the file must be treated as corrupted or EOF
			hdr = ((char*)ptrs)[0] & L3_CODE_MASK;
		if (hdr==L3_CODE_0) goto GOTO_L3_0;
		if (hdr==L3_CODE_1) goto GOTO_L3_1;
		if (hdr==L3_CODE_2) goto GOTO_L3_2;
		//last 7-8bit = last code that fits in one byte
		if (hdr==L3_EXT_CODE) goto GOTO_RESERVED;
		break;
//------------------------------------------
		GOTO_LZS_LOAD_LIT:
		GOTO_LZS_LOAD_LIT_EX:
//------------------------------------------
		ptrs+= header_coder.lit_decode(&len,(void*)ptrs);
		stk::mem::mov((char*)ptrd, (char*)ptrs, len);
		ptrs+= len;
		ptrd+= len;
		/*for (; len!=0; len--) {
		ptrs_bit+= huff.decode((char*)ptrd++,(char*)ptrs,ptrs_bit);
		  ptrs+= ptrs_bit>>3;
		ptrs_bit = ptrs_bit & 0x07L;
		}*/
		continue;
//------------------------------------------
		GOTO_LZS_LOAD_RLE:
		GOTO_LZS_LOAD_RLE_EX:
//------------------------------------------
		ptrs+= header_coder.rle_decode(&cnt,&siz,(void*)ptrs);
		stk::mem::setex((char*)ptrd, (char*)ptrs, siz, cnt);
		ptrs+= siz;
		ptrd+= siz * cnt;
		continue;
		/*for (ptmp = ptrd, ptmp_end = ptmp+siz; ptmp < ptmp_end; ptmp++) {
		 ptrs_bit+= huff.decode((char*)ptmp,(char*)ptrs,ptrs_bit);
			  ptrs+= ptrs_bit>>3;
		 ptrs_bit = ptrs_bit & 0x07L;
		 }
		 stk::mem::bitset((char*)ptmp_end,(char*)ptmp,0,siz,cnt-1);
			  ptrd+= siz*cnt;  */
//------------------------------------------
		GOTO_LZS_LOAD_DUP:
		GOTO_LZS_LOAD_DUP_EX:
//------------------------------------------
		ptrs+= header_coder.dup_decode(&len,&ofs,(void*)ptrs);
		stk::mem::mov((char*)ptrd, (char*)(ptrd-ofs), len);
		ptrd+= len;
		continue;
//------------------------------------------
		GOTO_L3_0:
		GOTO_L3_1:
		GOTO_L3_2:
		GOTO_RESERVED: //it's reserved opcode & must not! be used
		return;
//------------------------------------------
	}
//------------------------------------------
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::compression::compress_HUF(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const uint32_t ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t *ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + a_count;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register int8_t ptrd_bit = 0;
	stk::compression::__huff_compressor* huff = new stk::compression::__huff_compressor();
	huff->initialize();
//------------------------------------------
	for ( ; ptrs < ptrs_end; ptrs++) {
//------------------------------------------
		ptrd_bit += huff->encode((int8_t*)ptrd,ptrd_bit,((int8_t*)ptrs)[0]);
		ptrd += ptrd_bit>>3; // wykorzystano tyle pelnych bajtow wyjscia
		ptrd_bit = ptrd_bit & 0x07L; // numer bitu w ostatnim bajcie ptrd ktory wykorzystano od ktorej to zacznie zapisywac kolejne
//------------------------------------------
	}
//------------------------------------------
	stk::mem::bit_mov((char*)ptrd,ptrd_bit,(void*)"\0\0\0\0",0,32-ptrd_bit);  // resztka bitow na wyjscie, wyrownana do maximum 32 bitow naddatku
	ptrd+=4;
	delete huff;
	return ptrd - static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall stk::compression::uncompress_HUF(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t ptrs_bit = 0;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
	stk::compression::__huff_compressor* huff = new stk::compression::__huff_compressor();
	huff->initialize();
//------------------------------------------
	for ( ; ptrd < ptrd_end; ptrd++) {
//------------------------------------------
        ptrs_bit += huff->decode((int8_t*)ptrd,(int8_t*)ptrs,ptrs_bit);
		ptrs += ptrs_bit>>3;
		ptrs_bit = ptrs_bit & 0x07L;
//------------------------------------------
	}
//------------------------------------------
	delete huff;
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::compression::compress_ARI(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const uint32_t ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register const int8_t *ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + a_count;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register int8_t ptrd_bit = 0;
	stk::compression::__ari_compressor *ari = new stk::compression::__ari_compressor();
	ari->initialize_encoder();
//------------------------------------------
	for ( ; ptrs < ptrs_end; ptrs++)	{
//------------------------------------------
        ptrd_bit += ari->encode((uint32_t*)ptrd,ptrd_bit,((uint8_t*)ptrs)[0]);
		ptrd += ptrd_bit>>3;
		ptrd_bit = ptrd_bit & 0x07L;
//------------------------------------------
	}
//------------------------------------------
    ptrd_bit += ari->flush_encoder((uint32_t*)ptrd,ptrd_bit);
	ptrd += ptrd_bit>>3;
	ptrd_bit = ptrd_bit & 0x07L;
	stk::mem::bit_mov((char*)ptrd,ptrd_bit,(void*)"\0\0\0\0",0,32-ptrd_bit);  // resztka bitow na wyjscie, wyrownana do maximum 32 bitow naddatku
	ptrd+=4;
	delete ari;
//------------------------------------------
	return ptrd - static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall stk::compression::uncompress_ARI(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t ptrs_bit = 0;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
	stk::compression::__ari_compressor *ari = new stk::compression::__ari_compressor();
    ptrs_bit += ari->initialize_decoder((uint32_t*)ptrs,ptrs_bit);
	ptrs += ptrs_bit>>3;
	ptrs_bit = ptrs_bit & 0x07L;
//------------------------------------------
	for ( ; ptrd < ptrd_end; ptrd++) {
//------------------------------------------
        ptrs_bit += ari->decode((char*)ptrd,(uint32_t*)ptrs,ptrs_bit);
		ptrs += ptrs_bit>>3;
		ptrs_bit = ptrs_bit & 0x07L;
//------------------------------------------
	}
	delete ari;
//------------------------------------------
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::compression::compress_BWT(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const uint32_t ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif

	register int8_t*  ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register const int8_t* ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + size_t(a_count);
	register int8_t*  ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
//------------------------------------------
	stk::compression::__bwt_compressor *bwt = new stk::compression::__bwt_compressor(ablock);
//------------------------------------------
	((int16_t*)ptrd)[0] = (int16_t)bwt->matrix_dim;
	ptrd+=2;
//------------------------------------------
	while (ptrs < ptrs_end) {
//------------------------------------------
		ptrs+=(int32_t)bwt->generate((char*)ptrs,(ptrs_end-ptrs));
		((int16_t*)ptrd)[0] = (int16_t)bwt->sort();
		ptrd+=2;
		ptrd+=bwt->save((char*)ptrd);
//------------------------------------------
	}
//------------------------------------------
	delete bwt;
	return (int8_t*)ptrd - static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall stk::compression::uncompress_BWT(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_CALLED("")
#endif
	register int8_t *ptrs	  = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t *ptrd	  = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
	stk::mem::mov(a_dst_ptr,a_src_ptr,a_count - ((2*a_count)/(1024)) - 2);
//bwt_decode((char*)a_src_ptr+4,(char*)a_dst_ptr,a_count-4,((int32_t*)a_src_ptr)[0]);
}
//-------------------------------THE END-------------------------------------


