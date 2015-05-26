//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_koder_H__
#define __tsoft_koder_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../io/tsoft_file_eno_header.h"
/*
//FOR DEBUGING, STATISTICS OF USE LENGHT CODES
extern __int32 *hist_l_dict;
extern __int32 hist_l_dict_max;
extern __int32 *hist_o_dict;
extern __int32 hist_o_dict_max;
extern __int32 *hist_l_brun;
extern __int32 hist_l_brun_max;
extern __int32 *hist_e_brun;
extern __int32 hist_e_brun_max;
extern __int32 *hist_l_pass;
extern __int32 hist_l_pass_max;
*/
//---------------------------------------------------------------------------
namespace ts { namespace compression {
void __stdcall test(void);
//---------------------------------------------------------------------------
#ifdef LZSSv4_HDR
#define LZS_TRASH_BPB(bufsize,block) (__int32)(bufsize/1)
#endif
__int32 __stdcall   compress_LZS(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 adict);
void __stdcall uncompress_LZS(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
#ifdef LZSSv4_HDR
#define HUF_TRASH_BPB(bufsize) (__int32)(bufsize/1)
#endif
__int32 __stdcall   compress_HUF(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 ablock);
void __stdcall uncompress_HUF(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
#ifdef LZSSv4_HDR
#define ARI_TRASH_BPB(bufsize) (__int32)(bufsize/1)
#endif
__int32 __stdcall   compress_ARI(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 ablock);
void __stdcall uncompress_ARI(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
#ifdef LZSSv4_HDR
#define BWT_TRASH_BPB(bufsize,block) (__int32)(2+2+(2*bufsize)/block)
#endif
__int32 __stdcall   compress_BWT(void *a_dst_ptr, const void *a_src_ptr, const uint32_t a_count, const __int32 ablock);
void __stdcall uncompress_BWT(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
/*#define XBRUN_RLE_BIT  0x01L
#define MAX08_RLE_SIZE 0x3FL
#define TAG08_RLE_SIZE 2
#define MAX16_RLE_SIZE 0x1FFFL
#define TAG16_RLE_BIT  0x02L
#define TAG16_RLE_SIZE 3
#define MAX32_RLE_SIZE 0x1FFFFFFFL
#define TAG32_RLE_BIT  0x04L
#define TAG32_RLE_SIZE 3
#define RLE_TRASH_BPB(bufsize) (__int32)(8)
__int32 __stdcall compress_RLE(void *a_dst_ptr, void *a_src_ptr, uint32_t a_count);
void __stdcall uncompress_RLE(void *a_dst_ptr, uint32_t a_count, void *a_src_ptr);
//---------------------------------------------------------------------------
*/
//---------------------------------------------------------------------------
/*
typedef __int8 __intRLE;
//---------------------------------------------------------------------------

__int32 __stdcall compress_RLE(void *a_dst_ptr,void *a_src_ptr,uint32_t a_count)
{
__int32	 ptrs = (__int32)a_src_ptr;
__int32 ptrs_end = (__int32)a_src_ptr + size_t(a_count);
__int32	 ptrd = (__int32)a_dst_ptr;

__int32 iP,iL; bool exit = false;
register __intRLE *acc;
//
for (;exit==false;)
	{
	iL=0,iP=0;

	for (;;iL++)
	 if (ptrs + (iL+8)*sizeof(__intRLE) <= ptrs_end)
		{
			acc = &((__intRLE*)ptrs)[iL];
		if (acc[0]==acc[1])
		if (acc[0]==acc[2])
		if (acc[0]==acc[3])
		if (iL <=MAX08_RLE_SIZE)
		   {iP=3; break;}
		else
		if (acc[0]==acc[4])
		if (iL <=MAX16_RLE_SIZE)
		   {iP=4; break;}
		else
		if (acc[0]==acc[5])
		if (acc[0]==acc[6])
			  {iP=6; break;}
		continue;
	   }
	else
	   {  iL = (ptrs_end-ptrs) / sizeof(__intRLE);
		exit = true;
		break;
	   }
#define SAVE_DIFRENT()\
		if (iL <=MAX08_RLE_SIZE)\
		   {*((__intTAG08*)ptrd) = (iL<<TAG08_RLE_SIZE);\
			ptrd+=sizeof(__intTAG08);\
		   }\
		else\
		if (iL <=MAX16_RLE_SIZE)\
		   {*((__intTAG16*)ptrd) = (iL<<TAG16_RLE_SIZE) | TAG16_RLE_BIT;\
			ptrd+=sizeof(__intTAG16);\
		   }\
		else\
		   {*((__intTAG32*)ptrd) = (iL<<TAG32_RLE_SIZE) | TAG16_RLE_BIT | TAG32_RLE_BIT;\
			ptrd+=sizeof(__intTAG32);\
			}\
		ts::mem32::cpy((char*)ptrd,(char*)ptrs,iL*sizeof(__intRLE));\
		ptrd+=sizeof(__intRLE)*iL;\
		ptrs+=sizeof(__intRLE)*iL;
	if (iL!=0)
	   {SAVE_DIFRENT();
	   }
   for (;;iP++)
	if (ptrs + (iP+2)*sizeof(__intRLE) <= ptrs_end)
	   {
			acc = &((__intRLE*)ptrs)[iP];
		if (acc[0]!=acc[1])
		   {iP++; break;}
		continue;
	   }
	else
	   {  iP+= 1;
		exit = true;
		break;
	   }
#define SAVE_SAME()\
		if (iP <=MAX08_RLE_SIZE)\
		   {((__intTAG08*)ptrd)[0] = (iP<<TAG08_RLE_SIZE) | XBRUN_RLE_BIT;\
			ptrd+=sizeof(__intTAG08);}\
		else\
		if (iP <=MAX16_RLE_SIZE)\
		   {((__intTAG16*)ptrd)[0] = (iP<<TAG16_RLE_SIZE) | XBRUN_RLE_BIT | TAG16_RLE_BIT;\
			ptrd+=sizeof(__intTAG16);\
			}\
		else\
		   {((__intTAG32*)ptrd)[0] = (iP<<TAG32_RLE_SIZE) | XBRUN_RLE_BIT | TAG16_RLE_BIT | TAG32_RLE_BIT;\
			ptrd+=sizeof(__intTAG32);\
		   }\
		((__intRLE*)ptrd)[0]=((__intRLE*)ptrs)[0];\
		ptrd+=sizeof(__intRLE);\
		ptrs+=sizeof(__intRLE)*iP;
	if (iP >1)
	   {SAVE_SAME();
	   }
	}
for (;ptrs < ptrs_end;)
	{
	 *((__int8*)ptrd++) = *((__int8*)ptrs++);
	}
return (__int32)ptrd - (__int32)a_dst_ptr;
}
//---------------------------------------------------------------------------

void __stdcall uncompress_RLE(void *a_dst_ptr,uint32_t a_count, void *a_src_ptr)
{
__int32	 ptrs = (__int32)a_src_ptr;
__int32	 ptrd = (__int32)a_dst_ptr;
__int32 ptrd_end = (__int32)a_dst_ptr + size_t(a_count);
//
register __int32 iX;

for (;ptrd <= ptrd_end - sizeof(__intRLE);)
	{
	if ((((__intTAG08*)ptrs)[0] & XBRUN_RLE_BIT)==0x00L)
	   {goto RLE_LOADDIFFRENT;
	   }
RLE_LOADSAME:
	if ((((__intTAG08*)ptrs)[0] & TAG16_RLE_BIT)==0x00L)
	   {iX =*((__intTAG08*)ptrs)>>TAG08_RLE_SIZE;
		ptrs+=sizeof(__intTAG08);
	   }
	else
	if ((((__intTAG08*)ptrs)[0] & TAG32_RLE_BIT)==0x00L)
	   {iX =*((__intTAG16*)ptrs)>>TAG16_RLE_SIZE;
		ptrs+=sizeof(__intTAG16);
	   }
	else
	   {iX =*((__intTAG32*)ptrs)>>TAG32_RLE_SIZE;
		ptrs+=sizeof(__intTAG32);
		}
	ts::mem32::set((char*)ptrd,iX,((__intRLE*)ptrs)[0],sizeof(__intRLE));
	ptrd+=sizeof(__intRLE)*iX;
	ptrs+=sizeof(__intRLE);
	continue;

RLE_LOADDIFFRENT:
	if ((((__intTAG08*)ptrs)[0] & TAG16_RLE_BIT)==0x00L)
	   {iX =*((__intTAG08*)ptrs)>>TAG08_RLE_SIZE;
		ptrs+=sizeof(__intTAG08);
		}
	else
	if ((((__intTAG08*)ptrs)[0] & TAG32_RLE_BIT)==0x00L)
	   {iX =*((__intTAG16*)ptrs)>>TAG16_RLE_SIZE;
		ptrs+=sizeof(__intTAG16);
	   }
	else
	   {iX =*((__intTAG32*)ptrs)>>TAG32_RLE_SIZE;
		ptrs+=sizeof(__intTAG32);
	   }

	ts::mem32::cpy((char*)ptrd,(char*)ptrs,iX*sizeof(__intRLE));
	ptrd+=sizeof(__intRLE)*iX;
	ptrs+=sizeof(__intRLE)*iX;
	continue;
	}
for (;ptrd < ptrd_end;)
	{
	*((__int8*)ptrd++) = *((__int8*)ptrs++);
	}
}*/
#endif

