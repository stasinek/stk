//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef stk_bin_tree_h
#define stk_bin_tree_h
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#include "./../file/eno/stk_file_lzst_header.h"
//---------------------------------------------------------------------------
#define DUP_NULL			 (uint32_t)0x0F000000L
//---------------------------------------------------------------------------
namespace stk { namespace compression {
//---------------------------------------------------------------------------
class  __lzss_compressor {
private:
//---------------------------------------------------------------------------
		uint32_t  *son,*dad;
//---------------------------------------------------------------------------
public:
		uint32_t ring_delete, ring_insert;
		char  *ring_ptr;
		uint32_t backward_len, backward_max_len, backward_offset, backward_max_offset;
		char  *find_ptr;
//---------------------------------------------------------------------------
		uint32_t forward_len, forward_max_len, forward_elcount, forward_max_elcount, forward_elsize, forward_max_elsize;
//---------------------------------------------------------------------------
		 __lzss_compressor(const uint32_t a_dict,const uint32_t a_dup_size);
		~__lzss_compressor();
//---------------------------------------------------------------------------
		void __stdcall  initialize(const char *a_base_ptr);
//---------------------------------------------------------------------------
		void __stdcall  update(const char *a_add_ptr, const uint32_t a_update_count, const bool a_insert);
		void __stdcall  insert(void);
		void __stdcall  skip(void);
		void __stdcall  cut(const uint32_t a_choosen_ring_delete);
//---------------------------------------------------------------------------
		uint32_t __stdcall  search_forward(void);
		void __stdcall  clear_forward_result(void);
		uint32_t __stdcall  search_backward(void);
		void __stdcall  clear_backward_result(void);
//---------------------------------------------------------------------------
		uint32_t small_offset;
//---------------------------------------------------------------------------
#ifdef LZSSv4_HEAD
		file_header::__lzstv4_header_coder header_coder;
#endif
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------

/* cpx1_bgn =&ring_ptr[p]; cpx2_ptr =find_ptr;
 if (((uint32_t*)cpx1_bgn)[0]!=((uint32_t*)cpx2_ptr)[0]) // warunek konieczny
 continue;
				cpx1_ptr =cpx1_bgn+sizeof(uint32_t);
				cpx2_ptr+=+sizeof(uint32_t);
		  cpx1_ptr_end = cpx1_bgn + find_max_len-1;
 while (cpx1_ptr <= cpx1_ptr_end) {
		 if (cpx1_ptr[0]!=cpx2_ptr[0])
				break;
				cpx1_ptr+=1;
				cpx2_ptr+=1;
		}
 cpx_len = cpx1_ptr-cpx1_bgn;
*/


