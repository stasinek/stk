//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_API.h"
//---------------------------------------------------------------------------
#include "tsoft_compression_lzssv4.h"
#include "tsoft_compression_bwt_matrix2.h"
#include "tsoft_compression_huff.h"
#include "tsoft_compression_ari.h"
//---------------------------------------------------------------------------
#include "./../cipher/tsoft_cipher_mtf.h"
//---------------------------------------------------------------------------
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../mem/tsoft_mem32.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

void __stdcall ts::compression::test(void)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register __int32 o, r = 0;
	char *src = ts::cstr::alloc(4096);
	char *dst = ts::cstr::alloc(4096);
if (src==NULL || dst==NULL)
return;
	ts::console::print_formated("%d\n",(__int8*)src);
	ts::cstr::mov(src,(char*)"Here the defined words consist of two disjoint classes, sequences of alphanumeric characters and sequences of nonalphanumeric characters.\0");
	o = ts::cstr::len(src);
	ts::console::print_formated("do kompresji %d bajtow\n",o);
	ts::console::print_formated("%s\n",src);
	ts::console::print_formated("Compress\n",r);
	r = ts::compression::compress_LZS(dst,src,1024,4096);
	ts::console::print_formated("Zmniejszono do %d bajtow\n",r);
	for (int i = 0,k=0;i< r;i++) {
		if (dst[i]>=' ' && dst[i]<='~') ts::console::print_formated("%c",dst[i]); //ASCII numbers,letters, special !~# etc.
	   else ts::console::print_formated("\'%#02x\'",dst[i]);
	   //unprintable compressor codes 0xXXL
	}
	ts::console::print_formated("\n");
	ts::console::print_formated("Uncompress\n");
//	ts::compression::uncompress_LZS(dst,o,src);
	ts::console::print_formated("End\n");
	ts::cstr::free(src);
	ts::cstr::free(dst);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::compress_LZS(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 adict)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register 	   __int8* ptrs		= static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register const __int8* ptrs_end	= static_cast<__int8*> (const_cast<void*>(a_src_ptr)) + a_count;
	register	   __int8* ptrd = static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
	register const __int8* ptrd_start = ptrd;
//------------------------------------------
	register uint32_t  pass_text_len = 0;
	register char *pass_text_ptr = (char*)ptrs;
	register uint32_t  next_skip_len = 0, next_insert_to_dict_len = 0;
//------------------------------------------
//__huff_compressor huff;
//		  huff.initialize();
	__lzss_compressor *tree = new ts::compression::__lzss_compressor(adict,a_count);
	tree->initialize((char*)ptrs);
//------------------------------------------
	while (1) {
//------------------------------------------
// sprawdz koniec
		if (ptrs + next_insert_to_dict_len + next_skip_len + tree->max_find_len >= ptrs_end) {
			if (ptrs + next_insert_to_dict_len + next_skip_len + 8 >= ptrs_end) {
				ptrs +=next_insert_to_dict_len;
				ptrs +=next_skip_len;
				pass_text_len += ptrs_end - ptrs;
				break;
			}
			tree->max_find_len = ptrs_end - ptrs - next_insert_to_dict_len - next_skip_len;
		}
//------------------------------------------
		LZS_UPDATE_DICT:
// delete old, copy data to ring, skip inserting few of new nodes
		if (next_skip_len) {
			tree->update((char*)ptrs,next_skip_len, false);
			ptrs+=next_skip_len;
			next_skip_len =0;
		}
// delete old, copy data to ring, insert new nodes
		if (next_insert_to_dict_len) {
			tree->update((char*)ptrs,next_insert_to_dict_len, true);
			ptrs+=next_insert_to_dict_len;
			next_insert_to_dict_len = 0;
		}
//------------------------------------------
		LZS_BRUN:
//------------------------------------------
		if (tree->search_forward()>=BRUN_LEN_MIN) {
			if (tree->header_coder.check_brun_Match_Cost(pass_text_len,tree->forward_counte,tree->forward_elsize) > 0)
				goto LZS_SAVE_PASS;
			else tree->clear_forward_result();
		}
//------------------------------------------
		LZS_DICT:
//------------------------------------------
		if (tree->search_backward()>=DICT_LEN_MIN) {
			if (tree->header_coder.check_dict_Match_Cost(pass_text_len,tree->find_len,tree->find_offset) > 0)
				goto LZS_SAVE_PASS;
			else tree->clear_backward_result();
		}
//------------------------------------------
		LZS_NOTHING:
//------------------------------------------
		if (pass_text_len  >=PASS_LEN_MAX) {
			goto LZS_SAVE_PASS;
		} else pass_text_len+=1;
		next_skip_len =0;
		next_insert_to_dict_len =1;
		continue;
//------------------------------------------
		LZS_SAVE_PASS:
//------------------------------------------
		if (pass_text_len==0)
			goto LZS_SAVE_BRUN;
#define SAVE_PASS(d,s,l)												\
	for (;l> PASS_LEN_MAX; l-=PASS_LEN_MAX) {							\
		 d+=tree->header_coder.pass_encode((void*)d,PASS_LEN_MAX);		\
		 ts::mem32::mov((char*)d,(char*)s,PASS_LEN_MAX);				\
		 d+=PASS_LEN_MAX;												\
		 s+=PASS_LEN_MAX; 												\
		}																\
	if  (l> 0) {														\
		 d+=tree->header_coder.pass_encode((void*)d,l);					\
		 ts::mem32::mov((char*)d,(char*)s,l);							\
		 d+=l;															\
		 s+=l;															\
		}
		SAVE_PASS(ptrd,pass_text_ptr,pass_text_len);
// hist_l_pass[pass_text_len]++;
//	if (hist_l_pass[pass_text_len]>hist_l_pass_max) hist_l_pass_max=hist_l_pass[pass_text_len];
		pass_text_ptr =(char*)ptrs;
		pass_text_len = 0;
//------------------------------------------
		LZS_SAVE_BRUN:
//------------------------------------------
		if (tree->forward_len< BRUN_LEN_MIN)
			goto LZS_SAVE_DICT;
#define SAVE_BRUN(d,s,c,e)												\
	d+=tree->header_coder.brun_encode((void*)d,c,e);						\
	 ts::mem32::mov((char*)d,(char*)s,e);		\
	d+=e;
		SAVE_BRUN(ptrd,ptrs,tree->forward_counte,tree->forward_elsize);
//	hist_l_brun[tree->brun_counte]++;
//	if (hist_l_brun[tree->brun_counte]>hist_l_brun_max) hist_l_brun_max=hist_l_brun[tree->brun_counte];
//	hist_e_brun[tree->brun_elsize]++;
//	if (hist_e_brun[tree->brun_elsize]>hist_e_brun_max) hist_e_brun_max=hist_e_brun[tree->brun_elsize];
		pass_text_ptr = (char*)(ptrs+tree->forward_len);
		next_insert_to_dict_len = tree->forward_elsize;

		while (next_insert_to_dict_len < tree->forward_len && next_insert_to_dict_len < 4) {
			next_insert_to_dict_len+=1;
		}
		next_skip_len = tree->forward_len - next_insert_to_dict_len;
		tree->clear_forward_result();
		continue;
		/*for (ptmp = (__int32)ptrs, ptmp_end = ptmp+tree->brun_elsize; ptmp < ptmp_end; ptmp++) {	\
		ptrd_bit+= huff.encode((char*)ptrd,ptrd_bit,((char*)ptmp)[0]);								\
			 ptrd+= ptrd_bit>>3;																	\
		ptrd_bit = ptrd_bit & (8-1);																\
		} */
//------------------------------------------
		LZS_SAVE_DICT:
//------------------------------------------
		if (tree->find_len< DICT_LEN_MIN)
			continue;
#define SAVE_DICT(d,l,o)												\
		d+=tree->header_coder.dict_encode((void*)d,l,o);
		SAVE_DICT(ptrd,tree->find_len,tree->find_offset);
//	hist_l_dict[tree->find_len]++;
//	if (hist_l_dict[tree->find_len]>hist_l_dict_max) hist_l_dict_max=hist_l_dict[tree->find_len];
//	hist_o_dict[tree->find_offset>>8]++;
//	if (hist_o_dict[tree->find_offset>>8]>hist_o_dict_max) hist_o_dict_max=hist_o_dict[tree->find_offset>>8];
		pass_text_ptr =(char*)(ptrs + tree->find_len);
		next_skip_len = 0;
		next_insert_to_dict_len = tree->find_len;
		tree->clear_backward_result();
		continue;
	}
//------------------------------------------
	LZS_SAVE_REST:
	if (pass_text_len!=0) {
		SAVE_PASS(ptrd,pass_text_ptr,pass_text_len);
	}
	delete tree;
//------------------------------------------
	return (__int8*)ptrd - (__int8*)ptrd_start;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::uncompress_LZS(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register		__int8 *ptrs		= static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register 		__int8 *ptrd		= static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
	register const  __int8 *ptrd_end	= static_cast<__int8*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
	__int32 cnt, ofs, siz;
	register char hdr;
//------------------------------------------
//__huff_compressor huff;
//		 huff.initialize();
#ifdef LZSSv4_HDR
	const file_header::__lzssv4_header_coder header_coder;
#endif
//------------------------------------------
	for (; ptrd < ptrd_end;) {
//------------------------------------------
		// Normal code LENGTHS are coded 4 bits(15)
		// OFFSET 8,16,24,32bits
			hdr = ((char*)ptrs)[0] & X_CODE_MASK;
		if (hdr==X_PASS_CODE)
			goto GOTO_LZS_LOAD_PASS;
		if (hdr==X_BRUN_CODE)
			goto GOTO_LZS_LOAD_BRUN;
		if (hdr==X_DICT_CODE)
			goto GOTO_LZS_LOAD_DICT;

		// Ex codes, LENGTHS are coded 4bits+8bits(4096) rather than just 4 bits(15)
		// OFFSET 8,16,24,32bits
			hdr = ((char*)ptrs)[0] & E_CODE_MASK;
		if (hdr==E_PASS_CODE)
			goto GOTO_LZS_LOAD_PASS_Ex;
		if (hdr==E_BRUN_CODE)
			goto GOTO_LZS_LOAD_BRUN_Ex;
		if (hdr==E_DICT_CODE)
			goto GOTO_LZS_LOAD_DICT_Ex;

		// RESERVED 0-2 CODE POSIBBLE HERE (CRC32, RECOVERY DATA ETC.), reserved so in current version, file must be treated as corrupted
			hdr = ((char*)ptrs)[0] & R_CODE_MASK;
		if (hdr==R_0_CODE)
			goto GOTO_R0;
		if (hdr==R_1_CODE)
			goto GOTO_R1;
		if (hdr==R_2_CODE)
			goto GOTO_R2;
		if (hdr==R_MOST_RESERVED_CODE) //last 8bit = byte codes plausability
			goto GOTO_MOST_RESERVED;
		break;
//------------------------------------------
		GOTO_LZS_LOAD_PASS:
		GOTO_LZS_LOAD_PASS_Ex:
//------------------------------------------
		ptrs+= header_coder.pass_decode(&cnt,(void*)ptrs);
		ts::mem32::mov((char*)ptrd, (char*)ptrs, cnt);
		ptrs+= cnt;
		ptrd+= cnt;
		/*for (; cnt!=0; cnt--) {
		ptrs_bit+= huff.decode((char*)ptrd++,(char*)ptrs,ptrs_bit);
		  ptrs+= ptrs_bit>>3;
		ptrs_bit = ptrs_bit & 0x07L;
		}*/
		continue;
//------------------------------------------
		GOTO_LZS_LOAD_BRUN:
		GOTO_LZS_LOAD_BRUN_Ex:
//------------------------------------------
		ptrs+= header_coder.brun_decode(&cnt,&siz,(void*)ptrs);
		ts::mem32::setex((char*)ptrd, (char*)ptrs, siz, cnt);
		ptrs+= siz;
		ptrd+= siz*cnt;
		continue;
		/*for (ptmp = ptrd, ptmp_end = ptmp+siz; ptmp < ptmp_end; ptmp++) {
		 ptrs_bit+= huff.decode((char*)ptmp,(char*)ptrs,ptrs_bit);
			  ptrs+= ptrs_bit>>3;
		 ptrs_bit = ptrs_bit & 0x07L;
		 }
		 ts::mem32::bitset((char*)ptmp_end,(char*)ptmp,0,siz,cnt-1);
			  ptrd+= siz*cnt;  */
//------------------------------------------
		GOTO_LZS_LOAD_DICT:
		GOTO_LZS_LOAD_DICT_Ex:
//------------------------------------------
		ptrs+= header_coder.dict_decode(&cnt,&ofs,(void*)ptrs);
		ts::mem32::mov((char*)ptrd, (char*)(ptrd-ofs), cnt);
		ptrd+= cnt;
		continue;
//------------------------------------------
		GOTO_R0:
		GOTO_R1:
		GOTO_R2:
		GOTO_MOST_RESERVED: //it's reserved opcode & must not! be used
		return;
//------------------------------------------
	}
//------------------------------------------
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::compress_HUF(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register 	   __int8 *ptrs	  	= static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register const __int8 *ptrs_end = static_cast<__int8*> (const_cast<void*>(a_src_ptr)) + a_count;
	register 	   __int8 *ptrd	  	= static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
	register char ptrd_bit = 0;
	__huff_compressor* huff = new __huff_compressor();
	huff->initialize();
//------------------------------------------
	for ( ; ptrs < ptrs_end; ptrs++) {
//------------------------------------------
		ptrd_bit += huff->encode((char*)ptrd,ptrd_bit,((char*)ptrs)[0]);
		ptrd += ptrd_bit>>3; // zapisano bajt wejscia przy pomocy bajtow w takiej ilosci
		ptrd_bit = ptrd_bit & 0x07L; // oraz tyle reszty bitï¿½w od ktorych zacznie zapisywac dalej
//------------------------------------------
	}
//------------------------------------------
	ts::mem32::bit_mov((char*)ptrd,ptrd_bit,(void*)"\0\0\0\0",0,32-ptrd_bit);  // resztka bitow na wyjscie wyrownana do 32 bitow naddatku
	ptrd+=4;
	delete huff;
	return ptrd - static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::uncompress_HUF(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register __int8 *ptrs	  		= static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register unsigned char ptrs_bit = 0;
	register __int8 *ptrd	  		= static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
	register const __int8 *ptrd_end = static_cast<__int8*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
	__huff_compressor* huff = new __huff_compressor();
	huff->initialize();
//------------------------------------------
	for ( ; ptrd < ptrd_end; ptrd++) {
//------------------------------------------
		ptrs_bit += huff->decode((char*)ptrd,(char*)ptrs,ptrs_bit);
		ptrs += ptrs_bit>>3;
		ptrs_bit = ptrs_bit & 0x07L;
//------------------------------------------
	}
//------------------------------------------
	delete huff;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::compress_ARI(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register 	   __int8 *ptrs	  	= static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register const __int8 *ptrs_end = static_cast<__int8*> (const_cast<void*>(a_src_ptr)) + a_count;
	register 	   __int8 *ptrd	  	= static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
	register char ptrd_bit = 0;
	ts::compression::__ari_compressor *ari = new ts::compression::__ari_compressor();
	ari->initialize_encoder();
//------------------------------------------
	for ( ; ptrs < ptrs_end; ptrs++)	{
//------------------------------------------
		ptrd_bit += ari->encode((__int32*)ptrd,ptrd_bit,((char*)ptrs)[0]);
		ptrd += ptrd_bit>>3;
		ptrd_bit = ptrd_bit & 0x07L;
//------------------------------------------
	}
//------------------------------------------
	ptrd_bit += ari->flush_encoder((__int32*)ptrd,ptrd_bit);
	ptrd += ptrd_bit>>3;
	delete ari;
//------------------------------------------
	return ptrd - static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::uncompress_ARI(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register __int8 *ptrs  	  		= static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register char ptrs_bit = 0;
	register __int8 *ptrd	  		= static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
	register const __int8 *ptrd_end = static_cast<__int8*> (const_cast<void*>(a_dst_ptr)) + a_count;
//------------------------------------------
	ts::compression::__ari_compressor *ari = new ts::compression::__ari_compressor();
	ptrs_bit += ari->initialize_decoder((__int32*)ptrs,ptrs_bit);
	ptrs += ptrs_bit>>3;
	ptrs_bit = ptrs_bit & 0x07L;
//------------------------------------------
	for ( ; ptrd < ptrd_end; ptrd++) {
//------------------------------------------
		ptrs_bit += ari->decode((char*)ptrd,(__int32*)ptrs,ptrs_bit);
		ptrs += ptrs_bit>>3;
		ptrs_bit = ptrs_bit & 0x07L;
//------------------------------------------
	}
	delete ari;
//------------------------------------------
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::compress_BWT(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 ablock)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register __int8*  ptrs	   		= static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register const __int8* ptrs_end = static_cast<__int8*> (const_cast<void*>(a_src_ptr)) + size_t(a_count);
	register __int8*  ptrd	   		= static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
//------------------------------------------
	ts::compression::__bwt_compressor *bwt = new ts::compression::__bwt_compressor(ablock);
//------------------------------------------
	((__int16*)ptrd)[0] = (__int16)bwt->matrix_dim;
	ptrd+=2;
//------------------------------------------
	while (ptrs < ptrs_end) {
//------------------------------------------
		ptrs+=(__int32)bwt->generate((char*)ptrs,(ptrs_end-ptrs));
		((__int16*)ptrd)[0] = (__int16)bwt->sort();
		ptrd+=2;
		ptrd+=bwt->save((char*)ptrd);
//------------------------------------------
	}
//------------------------------------------
	delete bwt;
	return (__int8*)ptrd - static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::uncompress_BWT(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr)
{ 
#ifdef __DEBUG_COMPRESSION_API__
__DEBUG_FUNC_CALLED__
#endif

	register __int8 *ptrs	  = static_cast<__int8*> (const_cast<void*>(a_src_ptr));
	register __int8 *ptrd	  = static_cast<__int8*> (const_cast<void*>(a_dst_ptr));
	register __int8 *ptrd_end = static_cast<__int8*> (const_cast<void*>(a_dst_ptr)) + a_count;
	ts::mem32::mov(a_dst_ptr,a_src_ptr,a_count - ((2*a_count)/(1024)) - 2);
//bwt_decode((char*)a_src_ptr+4,(char*)a_dst_ptr,a_count-4,((__int32*)a_src_ptr)[0]);
}
//-------------------------------THE END-------------------------------------


