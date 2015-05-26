//---------------------------------------------------------------------------
#include "tsoft_compression_bwt_matrix2.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------

ts::compression::__bwt_compressor::__bwt_compressor(const __int32 ablock)
{
	matrix_dim = ablock;
		matrix_idx_ptr = (__int32*)ts::mem32::alloc(matrix_dim*(sizeof(__int32)));
		matrix_ptr	   =		(char*)ts::mem32::alloc(matrix_dim*2);
		groups_bgn[0]  = (__int32*)ts::mem32::alloc(matrix_dim*(sizeof(__int32)/2));
		groups_bgn[1]  = (__int32*)ts::mem32::alloc(matrix_dim*(sizeof(__int32)/2));
		groups_end[0]  = (__int32*)ts::mem32::alloc(matrix_dim*(sizeof(__int32)/2));
		groups_end[1]  = (__int32*)ts::mem32::alloc(matrix_dim*(sizeof(__int32)/2));
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::__bwt_compressor::generate(const char *a_src_ptr, const __int32 a_rowsize)
{
	matrix_dim = a_rowsize;
		__int32  row, row_max = matrix_dim;
		__int32  idx;
		__int32  idx_end;
		// reverse copying BARBAKAN->>NAKABRAB for __int32 suffix sorting
	ts::mem32::rev(matrix_ptr,a_src_ptr,row_max);
	// NAKABRAB->NAKABRABNAKABRAB
	ts::mem32::mov(matrix_ptr+row_max,matrix_ptr,row_max);
	// matrix_row_ptr addresing
//------------------------------------------
		idx = (__int32)matrix_idx_ptr;
	idx_end = idx + row_max*4 - 4;
	row = row_max;
	while (idx <=idx_end) {
				((__int32*)idx)[0]=row--;
		idx+=4;
	}
//------------------------------------------
	return matrix_dim;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::__bwt_compressor::save(char *a_dst_ptr)
{
		char *ptr = matrix_ptr;
		__int32  row_max = matrix_dim;
		__int32  idx;
		__int32  idx_end;
// decode and move to dst
//------------------------------------------
		idx = (__int32)matrix_idx_ptr;
	idx_end = idx + row_max*4 - 4;
	while (idx <= idx_end) {
				((char*)a_dst_ptr++)[0] = ptr[((__int32*)idx)[0]];
		idx+=4;
	}
//------------------------------------------
	return matrix_dim;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::compression::__bwt_compressor::sort(void)
{
		__int32 *gl_end_cur = groups_end[0], *gl_end_new = groups_end[1];
	gl_end_cur[0] = matrix_dim-1;
		__int32 *gl_bgn_cur = groups_bgn[0], *gl_bgn_new = groups_bgn[1];
	gl_bgn_cur[0] = 0;
		__int32  col, row;
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
				row = (__int32)gl_bgn_cur;
		gl_bgn_cur = gl_bgn_new;
				gl_bgn_new =(__int32*)row;
				row = (__int32)gl_end_cur;
		gl_end_cur = gl_end_new;
				gl_end_new =(__int32*)row;
//------------------------------------------
	}
//------------------------------------------
BWT_MATRIX_FIND_FIRST_ROW:
//------------------------------------------
		__int32 *idx_ptr = matrix_idx_ptr, idx_bgn = matrix_dim;
//------------------------------------------
	for (row=0; idx_ptr[row]!=idx_bgn;) {
		row++;
	}
//------------------------------------------
	return row;
}
//---------------------------------------------------------------------------

void __stdcall ts::compression::__bwt_compressor::sort_groups(const __int32 acolumn,const __int32 arow_bgn,const __int32 arow_end)
{
		__int32  row, row_cmp, row_fnd, row_bgn = arow_bgn, row_end = arow_end;
		char	 *ptr = matrix_ptr + acolumn;
		__int32 *idx_ptr = matrix_idx_ptr;
		__int32  cmp;
//------------------------------------------
	for (row = row_bgn; row <= row_end; row++) {
//------------------------------------------
		for (row_cmp = row, cmp =*((__int32*)(ptr+idx_ptr[row])), row_fnd = row; ++row_fnd <= row_end;) // find first lower
						if (cmp >*((__int32*)(ptr+idx_ptr[row_fnd]))) {
								cmp =*((__int32*)(ptr+idx_ptr[row_fnd]));
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
void __stdcall ts::compression::__bwt_compressor::find_groups(const __int32 acolumn,const __int32 arow_bgn,const __int32 arow_end,__int32 *alist_bgn,__int32 *alist_end)
{
		__int32  list_count = 0;
		__int32  row, row_cmp, row_fnd, row_bgn = arow_bgn, row_end = arow_end;
		char	 *ptr = matrix_ptr + acolumn;
		__int32 *idx_ptr = matrix_idx_ptr;
		__int32  cmp;
//------------------------------------------
	for (row = row_bgn; row <= row_end;) {
//------------------------------------------
				for (row_cmp = row, cmp =*((__int32*)(ptr+idx_ptr[row])); ++row <= row_end;)
						if (cmp!=*((__int32*)(ptr+idx_ptr[row]))) {
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
	ts::mem32::free(groups_bgn[0]);
	ts::mem32::free(groups_bgn[1]);
	ts::mem32::free(groups_end[0]);
	ts::mem32::free(groups_end[1]);
	ts::mem32::free(matrix_ptr);
	ts::mem32::free(matrix_idx_ptr);
}
//-------------------------------THE END-------------------------------------

