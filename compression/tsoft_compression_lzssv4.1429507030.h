//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_bin_tree_H__
#define __tsoft_bin_tree_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "./../io/tsoft_file_eno_header.h"
//---------------------------------------------------------------------------
#define DICT_NULL			 (__int32)0x0F000000
//---------------------------------------------------------------------------
namespace ts { namespace compression {
//---------------------------------------------------------------------------
class  __lzss_compressor {
private:
//---------------------------------------------------------------------------
		__int32  *son,*dad;
//---------------------------------------------------------------------------
public:
		__int32   ring_delete, ring_insert;
		char  *ring_ptr;
		__int32   find_len, max_find_len, find_offset, max_find_offset;
		char  *find_ptr;
//---------------------------------------------------------------------------
		__int32   forward_len, forward_counte, forward_elsize;
//---------------------------------------------------------------------------
		 __lzss_compressor(const __int32 adict,const __int32 asize);
	~__lzss_compressor();
//---------------------------------------------------------------------------
		void __stdcall  initialize(const char *abase_ptr);
//---------------------------------------------------------------------------
		void __stdcall  update(const char *aadd_ptr, const __int32 aupdate_count, const bool ainsert);
	void __stdcall  insert(void);
	void __stdcall  skip(void);
		void __stdcall  cut(const __int32 zchoosen_ring_delete);
//---------------------------------------------------------------------------
		__int32 __stdcall  search_forward(void);
	void __stdcall  clear_forward_result(void);
		__int32 __stdcall  search_backward(void);
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
 if (((__int32*)cpx1_bgn)[0]!=((__int32*)cpx2_ptr)[0]) // warunek konieczny
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


