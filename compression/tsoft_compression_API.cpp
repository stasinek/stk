//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_API.h"
//---------------------------------------------------------------------------
#include "tsoft_compression_lzstv4.h"
#include "tsoft_compression_bwt_matrix2.h"
#include "tsoft_compression_huff.h"
#include "tsoft_compression_ari.h"
//---------------------------------------------------------------------------
#include "./../cipher/tsoft_cipher_mtf.h"
#include "./../io/tsoft_console.h"
#include "./../text/tsoft_cstr_utils.h"
#include "./../mem/tsoft_mem.h"
//---------------------------------------------------------------------------

void __stdcall ts::compression::test(void)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif
	register int32_t o, i = 0;
	char *src = ts::cstr::alloc(4096);
	char *dst = ts::cstr::alloc(4096);
if (src==NULL || dst==NULL)
return;
	ts::con::prints("Adres src: %d\n",(int8_t*)src);
	ts::cstr::mov(src,(char*)"Here the defined words consist of two disjoint classes, sequences of alphanumeric characters and sequences of nonalphanumeric characters.\0");
	i = ts::cstr::len(src);
	ts::con::prints("do kompresji %d bajtow\n",i);
	ts::con::prints("%s\n",src);
	ts::con::prints("Compress\n",i);
	o = ts::compression::compress_LZS(dst,src,1024,4096);
	ts::con::prints("Zmniejszono do %d bajtow\n",o);
	for (int x = 0,k = 0;x < o;x++) {
		if (dst[x]>=' ' && dst[x]<='~') ts::con::prints(" \'%c\' ",dst[x]); //ASCII numbers,letters, special !~# etc.
	   else ts::con::prints(" \'%#02x\' ",dst[x]);
	   //unprintable compressor codes 0xXXL
	}
	ts::con::prints("\n");
	ts::con::prints("Decompress\n");
//	ts::compression::uncompress_LZS(dst,o,src);
	ts::con::prints("End\n");
	ts::cstr::free(src);
	ts::cstr::free(dst);
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::compression::compress_LZS(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_src_count, const uint32_t a_block)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif
	register int8_t* ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register const int8_t* ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + a_src_count;
	register int8_t* ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const int8_t* ptrd_start = ptrd;
//------------------------------------------
	register uint32_t  plain_text_len = 0;
	register char *plain_text_ptr = (char*)ptrs;
	register uint32_t  next_skip_len = 0, next_insert_to_dup_len = 0;
//------------------------------------------
//__huff_compressor huff;
//		  huff.initialize();
	ts::compression::__lzss_compressor *chain = new ts::compression::__lzss_compressor(a_block,a_src_count);
	chain->initialize((char*)ptrs);
//------------------------------------------
	while (1) {
//------------------------------------------
// sprawdz koniec
		if (ptrs + next_insert_to_dup_len + next_skip_len + chain->backward_max_len >= ptrs_end) {
			if (ptrs + next_insert_to_dup_len + next_skip_len + 8 >= ptrs_end) {
				ptrs +=next_insert_to_dup_len;
				ptrs +=next_skip_len;
				plain_text_len += ptrs_end - ptrs;
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
// search for fixed patterns ahead 1,2,3,4 byte patterns
		LZS_PATTERN:
//------------------------------------------
		if (chain->search_forward()>=PATTERN_LEN_MIN) {
			if (chain->header_coder.check_pattern_match_cost(plain_text_len,chain->forward_elcount,chain->forward_elsize) > 0)
				goto LZS_SAVE_PLAIN;
			else chain->clear_forward_result();
		}
//------------------------------------------
// search for variable patterns in the past, but only for those that had been registered in chain
		LZS_DUP:
//------------------------------------------
		if (chain->search_backward()>=DUP_LEN_MIN) {
			if (chain->header_coder.check_dup_match_cost(plain_text_len,chain->backward_len,chain->backward_offset) > 0)
				goto LZS_SAVE_PLAIN;
			else chain->clear_backward_result();
		}
//------------------------------------------
		LZS_NOTHING:
// nothing found, increment passed text length, prepare for next charter or save passed if reach limit
//------------------------------------------
		if (plain_text_len  >=PLAIN_LEN_MAX) {
			goto LZS_SAVE_PLAIN;
		}
		else plain_text_len += 1;
		next_skip_len = 0;
		next_insert_to_dup_len = 1;
		continue;
//------------------------------------------
// if limit is not reached save passed text
                LZS_SAVE_PLAIN:
//------------------------------------------
		if (plain_text_len==0) goto LZS_SAVE_PATTERN;
#define SAVE_PLAIN(d,s,l)								\
	for (;l> PLAIN_LEN_MAX; l-=PLAIN_LEN_MAX) {					\
		 d+=chain->header_coder.plain_encode((void*)d,PLAIN_LEN_MAX);		\
		 ts::mem::mov((char*)d,(char*)s,PLAIN_LEN_MAX);			\
		 d+=PLAIN_LEN_MAX;							\
		 s+=PLAIN_LEN_MAX; 							\
		}									\
	if  (l> 0) {									\
		 d+=chain->header_coder.plain_encode((void*)d,l);			\
		 ts::mem::mov((char*)d,(char*)s,l);					\
		 d+=l;									\
		 s+=l;									\
		}
		SAVE_PLAIN(ptrd,plain_text_ptr,plain_text_len);
// hist_l_pass[plain_text_len]++;
//	if (hist_l_pass[plain_text_len]>hist_l_plain_max) hist_l_plain_max=hist_l_pass[plain_text_len];
		plain_text_ptr =(char*)ptrs;
		plain_text_len = 0;
//------------------------------------------
		LZS_SAVE_PATTERN:
//------------------------------------------
		if (chain->forward_len< PATTERN_LEN_MIN)
			goto LZS_SAVE_DUP;
#define SAVE_PATTERN(d,s,c,e)												\
	d+=chain->header_coder.pattern_encode((void*)d,c,e);						\
	 ts::mem::mov((char*)d,(char*)s,e);		\
	d+=e;
		SAVE_PATTERN(ptrd,ptrs,chain->forward_elcount,chain->forward_elsize);
//	hist_l_brun[chain->pattern_counte]++;
//	if (hist_l_brun[chain->pattern_counte]>hist_l_pattern_max) hist_l_pattern_max=hist_l_brun[chain->pattern_counte];
//	hist_e_brun[chain->pattern_elsize]++;
//	if (hist_e_brun[chain->pattern_elsize]>hist_e_pattern_max) hist_e_pattern_max=hist_e_brun[chain->pattern_elsize];
		plain_text_ptr = (char*)(ptrs+chain->forward_len);
		next_insert_to_dup_len = chain->forward_elsize;

		while (next_insert_to_dup_len < chain->forward_len && next_insert_to_dup_len < 4) {
			next_insert_to_dup_len+=1;
		}
		next_skip_len = chain->forward_len - next_insert_to_dup_len;
		chain->clear_forward_result();
		continue;
		/*for (ptmp = (int32_t)ptrs, ptmp_end = ptmp+chain->pattern_elsize; ptmp < ptmp_end; ptmp++) {	\
		ptrd_bit+= huff.encode((char*)ptrd,ptrd_bit,((char*)ptmp)[0]);								\
			 ptrd+= ptrd_bit>>3;																	\
		ptrd_bit = ptrd_bit & (8-1);																\
		} */
//------------------------------------------
		LZS_SAVE_DUP:
//------------------------------------------
		if (chain->backward_len< DUP_LEN_MIN)
			continue;
#define SAVE_DUP(d,l,o)												\
		d+=chain->header_coder.dup_encode((void*)d,l,o);
		SAVE_DUP(ptrd,chain->backward_len,chain->backward_offset);
//	hist_l_dict[chain->backward_len]++;
//	if (hist_l_dict[chain->backward_len]>hist_l_dup_max) hist_l_dup_max=hist_l_dict[chain->backward_len];
//	hist_o_dict[chain->backward_offset>>8]++;
//	if (hist_o_dict[chain->backward_offset>>8]>hist_o_dup_max) hist_o_dup_max=hist_o_dict[chain->backward_offset>>8];
		plain_text_ptr =(char*)(ptrs + chain->backward_len);
		next_skip_len = 0;
		next_insert_to_dup_len = chain->backward_len;
		chain->clear_backward_result();
		continue;
	}
//------------------------------------------
	LZS_SAVE_REST:
	if (plain_text_len!=0) {
		SAVE_PLAIN(ptrd,plain_text_ptr,plain_text_len);
	}
	delete chain;
//------------------------------------------
	return (int8_t*)ptrd - (int8_t*)ptrd_start;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::uncompress_LZS(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const  int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
    uint32_t siz, cnt, len, ofs;
	register char hdr;
//------------------------------------------
//__huff_compressor huff;
//		 huff.initialize();
#ifdef LZSSv4_HEAD
	const file_header::__lzstv4_header_coder header_coder;
#endif
//------------------------------------------
	for (; ptrd < ptrd_end;) {
//------------------------------------------
		// Normal code hdr is 4 bit + LENGTHS are coded in 4 bits(15)
		// OFFSET in 8 or 16 or 24 or 32 bit
			hdr = ((char*)ptrs)[0] & N_CODE_MASK;
		if (hdr==N_PATTERN_CODE)
			goto GOTO_LZS_LOAD_PATTERN;
		if (hdr==N_PLAIN_CODE)
			goto GOTO_LZS_LOAD_PLAIN;
		if (hdr==N_DUP_CODE)
			goto GOTO_LZS_LOAD_DUP;

		// Extended codes, hdr is 4 bit + LENGTHS are coded 4bits+8bits(4096) rather than just 4 bits(15) like in normal one.
		// OFFSET are still the same 8 or 16 or 24 or 32 bit
			hdr = ((char*)ptrs)[0] & E_CODE_MASK;
		if (hdr==E_PATTERN_CODE)
			goto GOTO_LZS_LOAD_PATTERN_EX;
		if (hdr==E_PLAIN_CODE)
			goto GOTO_LZS_LOAD_PLAIN_EX;
		if (hdr==E_DUP_CODE) 
			goto GOTO_LZS_LOAD_DUP_EX;

		// RESERVED 0-2 CODE POSIBBLE HERE (CRC32, RECOVERY DATA ETC.), reserved, if detected in current version the file must be treated as corrupted or EOF
			hdr = ((char*)ptrs)[0] & R_CODE_MASK;
		if (hdr==R_0_CODE) goto GOTO_R0;
		if (hdr==R_1_CODE) goto GOTO_R1;
		if (hdr==R_2_CODE) goto GOTO_R2;
		//last 7-8bit = last code that fits in one byte
		if (hdr==R_CODE) goto GOTO_RESERVED;
		break;
//------------------------------------------
		GOTO_LZS_LOAD_PLAIN:
		GOTO_LZS_LOAD_PLAIN_EX:
//------------------------------------------
		ptrs+= header_coder.plain_decode(&len,(void*)ptrs);
		ts::mem::mov((char*)ptrd, (char*)ptrs, len);
		ptrs+= len;
		ptrd+= len;
		/*for (; len!=0; len--) {
		ptrs_bit+= huff.decode((char*)ptrd++,(char*)ptrs,ptrs_bit);
		  ptrs+= ptrs_bit>>3;
		ptrs_bit = ptrs_bit & 0x07L;
		}*/
		continue;
//------------------------------------------
		GOTO_LZS_LOAD_PATTERN:
		GOTO_LZS_LOAD_PATTERN_EX:
//------------------------------------------
		ptrs+= header_coder.pattern_decode(&cnt,&siz,(void*)ptrs);
		ts::mem::setex((char*)ptrd, (char*)ptrs, siz, cnt);
		ptrs+= siz;
		ptrd+= siz * cnt;
		continue;
		/*for (ptmp = ptrd, ptmp_end = ptmp+siz; ptmp < ptmp_end; ptmp++) {
		 ptrs_bit+= huff.decode((char*)ptmp,(char*)ptrs,ptrs_bit);
			  ptrs+= ptrs_bit>>3;
		 ptrs_bit = ptrs_bit & 0x07L;
		 }
		 ts::mem::bitset((char*)ptmp_end,(char*)ptmp,0,siz,cnt-1);
			  ptrd+= siz*cnt;  */
//------------------------------------------
		GOTO_LZS_LOAD_DUP:
		GOTO_LZS_LOAD_DUP_EX:
//------------------------------------------
		ptrs+= header_coder.dup_decode(&len,&ofs,(void*)ptrs);
		ts::mem::mov((char*)ptrd, (char*)(ptrd-ofs), len);
		ptrd+= len;
		continue;
//------------------------------------------
		GOTO_R0:
		GOTO_R1:
		GOTO_R2:
		GOTO_RESERVED: //it's reserved opcode & must not! be used
		return;
//------------------------------------------
	}
//------------------------------------------
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::compression::compress_HUF(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const uint32_t ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t *ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + a_count;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register int8_t ptrd_bit = 0;
	ts::compression::__huff_compressor* huff = new ts::compression::__huff_compressor();
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
	ts::mem::bit_mov((char*)ptrd,ptrd_bit,(void*)"\0\0\0\0",0,32-ptrd_bit);  // resztka bitow na wyjscie, wyrownana do maximum 32 bitow naddatku
	ptrd+=4;
	delete huff;
	return ptrd - static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::uncompress_HUF(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t ptrs_bit = 0;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
	ts::compression::__huff_compressor* huff = new ts::compression::__huff_compressor();
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

uint32_t __stdcall ts::compression::compress_ARI(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const uint32_t ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register const int8_t *ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + a_count;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register int8_t ptrd_bit = 0;
	ts::compression::__ari_compressor *ari = new ts::compression::__ari_compressor();
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
	ts::mem::bit_mov((char*)ptrd,ptrd_bit,(void*)"\0\0\0\0",0,32-ptrd_bit);  // resztka bitow na wyjscie, wyrownana do maximum 32 bitow naddatku
	ptrd+=4;
	delete ari;
//------------------------------------------
	return ptrd - static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::uncompress_ARI(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif

	register int8_t *ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t ptrs_bit = 0;
	register int8_t *ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register const int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
	ts::compression::__ari_compressor *ari = new ts::compression::__ari_compressor();
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

uint32_t __stdcall ts::compression::compress_BWT(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const uint32_t ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif

	register int8_t*  ptrs = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register const int8_t* ptrs_end = static_cast<int8_t*> (const_cast<void*>(a_src_ptr)) + size_t(a_count);
	register int8_t*  ptrd = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
//------------------------------------------
	ts::compression::__bwt_compressor *bwt = new ts::compression::__bwt_compressor(ablock);
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

void __stdcall ts::compression::uncompress_BWT(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED("")
#endif
	register int8_t *ptrs	  = static_cast<int8_t*> (const_cast<void*>(a_src_ptr));
	register int8_t *ptrd	  = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
	register int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + a_count;
	ts::mem::mov(a_dst_ptr,a_src_ptr,a_count - ((2*a_count)/(1024)) - 2);
//bwt_decode((char*)a_src_ptr+4,(char*)a_dst_ptr,a_count-4,((int32_t*)a_src_ptr)[0]);
}
//-------------------------------THE END-------------------------------------


