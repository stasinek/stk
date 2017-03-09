//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_compression_bwt_matrix2.h"
#include "./../mem/tsoft_mem.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

ts::compression::__bwt_compressor::__bwt_compressor(const uint32_t ablock)
{ 
#ifdef __DEBUG_BWT_COMPRESSOR__
__DEBUG_FUNC_CALLED("")
#endif

		matrix_dim = ablock;
        matrix_idx_ptr = (uint32_t*)ts::mem::alloc(matrix_dim*(sizeof(uint32_t)));
		matrix_ptr	   =		(char*)ts::mem::alloc(matrix_dim*2);
        groups_bgn[0]  = (uint32_t*)ts::mem::alloc(matrix_dim*(sizeof(uint32_t)/2));
        groups_bgn[1]  = (uint32_t*)ts::mem::alloc(matrix_dim*(sizeof(uint32_t)/2));
        groups_end[0]  = (uint32_t*)ts::mem::alloc(matrix_dim*(sizeof(uint32_t)/2));
        groups_end[1]  = (uint32_t*)ts::mem::alloc(matrix_dim*(sizeof(uint32_t)/2));
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::compression::__bwt_compressor::generate(const char *a_src_ptr, const uint32_t a_rowsize)
{ 
#ifdef __DEBUG_BWT_COMPRESSOR__
__DEBUG_FUNC_CALLED("")
#endif

		matrix_dim = a_rowsize;
        uint32_t  row, row_max = matrix_dim;
        uint8_t *idx;
        uint8_t *idx_end;
		// reverse copying BARBAKAN->>NAKABRAB for int32_t suffix sorting
		ts::mem::rev(matrix_ptr,a_src_ptr,row_max);
		// NAKABRAB->NAKABRABNAKABRAB
		ts::mem::mov(matrix_ptr+row_max,matrix_ptr,row_max);
		// matrix_row_ptr addresing
//------------------------------------------
        idx = (uint8_t*)matrix_idx_ptr;
		idx_end = idx + row_max*4 - 4;
		row = row_max;
		while (idx <=idx_end) {
                ((uint32_t*)idx)[0] = row--;
				idx+=4;
		}
//------------------------------------------
		return matrix_dim;
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::compression::__bwt_compressor::save(char *a_dst_ptr)
{ 
#ifdef __DEBUG_BWT_COMPRESSOR__
__DEBUG_FUNC_CALLED("")
#endif

		char *ptr = matrix_ptr;
        uint32_t row_max = matrix_dim;
        uint8_t *idx;
        uint8_t *idx_end;
// decode and move to dst
//------------------------------------------
        idx = (uint8_t*)matrix_idx_ptr;
		idx_end = idx + row_max*4 - 4;
		while (idx <= idx_end) {
				((char*)a_dst_ptr)[0] = ptr[((int32_t*)idx)[0]];
				a_dst_ptr+=1;
				idx+=4;
		}
//------------------------------------------
		return matrix_dim;
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::compression::__bwt_compressor::sort(void)
{ 
#ifdef __DEBUG_BWT_COMPRESSOR__
__DEBUG_FUNC_CALLED("")
#endif

        register uint32_t *gl_end_cur = groups_end[0], *gl_end_new = groups_end[1];
		gl_end_cur[0] = matrix_dim-1;
        register uint32_t *gl_bgn_cur = groups_bgn[0], *gl_bgn_new = groups_bgn[1];
		gl_bgn_cur[0] = 0;
        register uint32_t  row, col;
//------------------------------------------
		for (col = matrix_dim/4 - 1;;) {
//------------------------------------------
BWT_MATRIX_SORT_GROUPS:
//------------------------------------------
				for (row = 0; gl_end_cur[row]!=0; row++) {
						sort_groups(col,gl_bgn_cur[row],gl_end_cur[row]);
				}
				if (--col==0) break;
//------------------------------------------
BWT_MATRIX_FIND_GROUPS:
//------------------------------------------
				for (row = 0; gl_end_cur[row]!=0; row++) {
						find_groups(col,gl_bgn_cur[row],gl_end_cur[row],gl_bgn_new,gl_end_new);
				}
				if (gl_end_new[0]==0) break;
//------------------------------------------
BWT_MATRIX_FLIP_GROUPS:
//------------------------------------------
                register uint32_t*row_ptr;

				row_ptr = gl_bgn_cur;
				gl_bgn_cur = gl_bgn_new;
				gl_bgn_new = row_ptr;
				row_ptr = gl_end_cur;
				gl_end_cur = gl_end_new;
				gl_end_new = row_ptr;
//------------------------------------------
		}
//------------------------------------------
BWT_MATRIX_FIND_FIRST_ROW:
//------------------------------------------
        uint32_t *idx_ptr = matrix_idx_ptr, idx_bgn = matrix_dim;
//------------------------------------------
		for (row = 0; idx_ptr[row]!=idx_bgn;) {
				 row++;
		}
//------------------------------------------
		return row;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__bwt_compressor::sort_groups(const uint32_t acolumn,const uint32_t arow_bgn,const uint32_t arow_end)
{ 
#ifdef __DEBUG_BWT_COMPRESSOR__
__DEBUG_FUNC_CALLED("")
#endif

        uint32_t  row, row_cmp, row_fnd, row_bgn = arow_bgn, row_end = arow_end;
        char	 *ptr = matrix_ptr + acolumn;
        uint32_t *idx_ptr = matrix_idx_ptr;
        uint32_t  cmp;
//------------------------------------------
		for (row = row_bgn; row <= row_end; row++) {
//------------------------------------------
                for (row_cmp = row, cmp =*((uint32_t*)(ptr+idx_ptr[row])), row_fnd = row; ++row_fnd <= row_end;) // find first lower
                        if (cmp >*((uint32_t*)(ptr+idx_ptr[row_fnd]))) {
                                cmp =*((uint32_t*)(ptr+idx_ptr[row_fnd]));
								row_cmp =row_fnd;
						}
				if (row_cmp!=row) {
						cmp = idx_ptr[row];
						idx_ptr[row] = idx_ptr[row_cmp];
						idx_ptr[row_cmp] = cmp;
				}
//------------------------------------------
		}
//------------------------------------------
}
//---------------------------------------------------------------------------
void __stdcall ts::compression::__bwt_compressor::find_groups(const uint32_t acolumn,const uint32_t arow_bgn,const uint32_t arow_end, uint32_t *alist_bgn, uint32_t *alist_end)
{ 
#ifdef __DEBUG_BWT_COMPRESSOR__
__DEBUG_FUNC_CALLED("")
#endif

        uint32_t  list_count = 0;
        uint32_t  row, row_cmp, row_fnd, row_bgn = arow_bgn, row_end = arow_end;
		char	 *ptr = matrix_ptr + acolumn;
        uint32_t *idx_ptr = matrix_idx_ptr;
        uint32_t  cmp;
//------------------------------------------
		for (row = row_bgn; row <= row_end;) {
//------------------------------------------
                for (row_cmp = row, cmp =*((uint32_t*)(ptr+idx_ptr[row])); ++row <= row_end;)
                        if (cmp!=*((uint32_t*)(ptr+idx_ptr[row]))) {
								break;
						}
				if (row-1 > row_cmp) {
						alist_bgn[list_count] = row_cmp;
						alist_end[list_count] = row-1;
						list_count++;
				}
//------------------------------------------
		}
//------------------------------------------
		alist_end[list_count] = 0;
}
//---------------------------------------------------------------------------

ts::compression::__bwt_compressor::~__bwt_compressor(void)
{ 
#ifdef __DEBUG_BWT_COMPRESSOR__
__DEBUG_FUNC_CALLED("")
#endif

		ts::mem::free(groups_bgn[0]);
		ts::mem::free(groups_bgn[1]);
		ts::mem::free(groups_end[0]);
		ts::mem::free(groups_end[1]);
		ts::mem::free(matrix_ptr);
		ts::mem::free(matrix_idx_ptr);
}
//-------------------------------THE END-------------------------------------

