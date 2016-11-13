//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_bin_tree_H__
#define __tsoft_bin_tree_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include <inttypes.h>
#include <cstddef>
//---------------------------------------------------------------------------
#include "./../io/tsoft_file_eno_header.h"
//---------------------------------------------------------------------------
#define DICT_NULL			 (int32_t)0x0F000000
//---------------------------------------------------------------------------
namespace ts { namespace compression {
//---------------------------------------------------------------------------
class  __lzss_compressor {
private:
//---------------------------------------------------------------------------
		int32_t  *son,*dad;
//---------------------------------------------------------------------------
public:
		int32_t   ring_delete, ring_insert;
		char  *ring_ptr;
		int32_t   find_len, max_find_len, find_offset, max_find_offset;
		char  *find_ptr;
//---------------------------------------------------------------------------
		int32_t   forward_len, forward_counte, forward_elsize;
//---------------------------------------------------------------------------
		 __lzss_compressor(const int32_t adict,const int32_t asize);
	~__lzss_compressor();
//---------------------------------------------------------------------------
		void __stdcall  initialize(const char *abase_ptr);
//---------------------------------------------------------------------------
		void __stdcall  update(const char *aadd_ptr, const int32_t aupdate_count, const bool ainsert);
	void __stdcall  insert(void);
	void __stdcall  skip(void);
		void __stdcall  cut(const int32_t zchoosen_ring_delete);
//---------------------------------------------------------------------------
		int32_t __stdcall  search_forward(void);
	void __stdcall  clear_forward_result(void);
		int32_t __stdcall  search_backward(void);
	void __stdcall  clear_backward_result(void);
//---------------------------------------------------------------------------
	int small_offset;
//---------------------------------------------------------------------------
#ifdef LZSSv4_HDR
	file_header::__lzssv4_header_coder header_coder;
#endif
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

/* cpx1_bgn =&ring_ptr[p]; cpx2_ptr =find_ptr;
 if (((int32_t*)cpx1_bgn)[0]!=((int32_t*)cpx2_ptr)[0]) // warunek konieczny
 continue;
		cpx1_ptr =cpx1_bgn+4;
		cpx2_ptr+=4;
	  cpx1_ptr_end = cpx1_bgn + find_max_len-1;
 while (cpx1_ptr <= cpx1_ptr_end) {
	 if (cpx1_ptr[0]!=cpx2_ptr[0])
		break;
		cpx1_ptr+=1;
		cpx2_ptr+=1;
	}
 cpx_len = cpx1_ptr-cpx1_bgn;
*/


