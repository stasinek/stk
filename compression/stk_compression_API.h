//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_compression_API_h__
#define __stk_compression_API_h__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
#include "./../file/eno/stk_file_lzss_header.h"
/*
//FOR DEBUGING, STATISTICS OF USE LENGHT CODES
extern uint32_t *hist_l_dict;
extern uint32_t hist_l_dup_max;
extern uint32_t *hist_o_dict;
extern uint32_t hist_o_dup_max;
extern uint32_t *hist_l_brun;
extern uint32_t hist_l_pattern_max;
extern uint32_t *hist_e_brun;
extern uint32_t hist_e_pattern_max;
extern uint32_t *hist_l_pass;
extern uint32_t hist_l_plain_max;
*/
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace compression {
#endif
//---------------------------------------------------------------------------
extern STK_IMPEXP void   __stdcall test(void);
//---------------------------------------------------------------------------
#if LZSS_HEAD==4
#define LZS_WASTE_BPB(buffsize,dictsize) (uint32_t)(buffsize/1)
#endif
uint32_t   __stdcall compress_LZS(void *a_dst_ptr, const void *a_src_ptr,  const uint32_t a_src_count, const uint32_t ablock);
void   __stdcall  uncompress_LZS(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
#if LZSS_HEAD==4
#define HUF_WASTE_BPB(buffsize) (uint32_t)(buffsize/1)
#endif
extern STK_IMPEXP uint32_t  __stdcall   compress_HUF(void *a_dst_ptr, const void *a_src_ptr,  const uint32_t a_src_count, const uint32_t ablock);
extern STK_IMPEXP void      __stdcall uncompress_HUF(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
#if LZSS_HEAD==4
#define ARI_WASTE_BPB(buffsize) (uint32_t)(buffsize/1)
#endif
extern STK_IMPEXP uint32_t  __stdcall   compress_ARI(void *a_dst_ptr, const void *a_src_ptr,  const uint32_t a_src_count, const uint32_t ablock);
extern STK_IMPEXP void      __stdcall uncompress_ARI(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
#if LZSS_HEAD==4
#define BWT_WASTE_BPB(buffsize,bwt_block) (uint32_t)(2 + 2 + ((buffsize/bwt_block)+1))
#endif
extern STK_IMPEXP uint32_t  __stdcall   compress_BWT(void *a_dst_ptr, const void *a_src_ptr,  const uint32_t a_src_count, const uint32_t ablock);
extern STK_IMPEXP void      __stdcall uncompress_BWT(void *a_dst_ptr, const uint32_t a_count, const void *a_src_ptr);
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}
#endif
//-------------------------------THE END-------------------------------------



/*#define XPATTERN_RLE_BIT  0x01L
#define MAX08_RLE_SIZE 0x3FL
#define TAG08_RLE_SIZE 2
#define MAX16_RLE_SIZE 0x1FFFL
#define TAG16_RLE_BIT  0x02L
#define TAG16_RLE_SIZE 3
#define MAX32_RLE_SIZE 0x1FFFFFFFL
#define TAG32_RLE_BIT  0x04L
#define TAG32_RLE_SIZE 3
#define RLE_WASTE_BPB(bufsize) (uint32_t)(8)
uint32_t   __stdcall compress_RLE(void *a_dst_ptr, void *a_src_ptr, uint32_t a_count);
void   __stdcall uncompress_RLE(void *a_dst_ptr, uint32_t a_count, void *a_src_ptr);
//---------------------------------------------------------------------------
*/
//---------------------------------------------------------------------------
/*
typedef int8_t intRLE;
//---------------------------------------------------------------------------

uint32_t   __stdcall compress_RLE(void *a_dst_ptr,void *a_src_ptr,uint32_t a_count)
{
uint32_t	 ptrs = (uint32_t)a_src_ptr;
uint32_t ptrs_end = (uint32_t)a_src_ptr + size_t(a_count);
uint32_t	 ptrd = (uint32_t)a_dst_ptr;

uint32_t iP,iL; bool exit = false;
register intRLE *acc;
//
for (;exit==false;)
    {
    iL=0,iP=0;

    for (;;iL++)
     if (ptrs + (iL+8)*sizeof(intRLE) <= ptrs_end)
        {
            acc = &((intRLE*)ptrs)[iL];
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
       {  iL = (ptrs_end-ptrs) / sizeof(intRLE);
        exit = true;
        break;
       }
#define SAVE_DIFRENT()\
        if (iL <=MAX08_RLE_SIZE)\
           {*((intTAG08*)ptrd) = (iL<<TAG08_RLE_SIZE);\
            ptrd+=sizeof(intTAG08);\
           }\
        else\
        if (iL <=MAX16_RLE_SIZE)\
           {*((intTAG16*)ptrd) = (iL<<TAG16_RLE_SIZE) | TAG16_RLE_BIT;\
            ptrd+=sizeof(intTAG16);\
           }\
        else\
           {*((intTAG32*)ptrd) = (iL<<TAG32_RLE_SIZE) | TAG16_RLE_BIT | TAG32_RLE_BIT;\
            ptrd+=sizeof(intTAG32);\
            }\
        stk::mem::cpy((char*)ptrd,(char*)ptrs,iL*sizeof(intRLE));\
        ptrd+=sizeof(intRLE)*iL;\
        ptrs+=sizeof(intRLE)*iL;
    if (iL!=0)
       {SAVE_DIFRENT();
       }
   for (;;iP++)
    if (ptrs + (iP+2)*sizeof(intRLE) <= ptrs_end)
       {
            acc = &((intRLE*)ptrs)[iP];
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
           {((intTAG08*)ptrd)[0] = (iP<<TAG08_RLE_SIZE) | XPATTERN_RLE_BIT;\
            ptrd+=sizeof(intTAG08);}\
        else\
        if (iP <=MAX16_RLE_SIZE)\
           {((intTAG16*)ptrd)[0] = (iP<<TAG16_RLE_SIZE) | XPATTERN_RLE_BIT | TAG16_RLE_BIT;\
            ptrd+=sizeof(intTAG16);\
            }\
        else\
           {((intTAG32*)ptrd)[0] = (iP<<TAG32_RLE_SIZE) | XPATTERN_RLE_BIT | TAG16_RLE_BIT | TAG32_RLE_BIT;\
            ptrd+=sizeof(intTAG32);\
           }\
        ((intRLE*)ptrd)[0]=((intRLE*)ptrs)[0];\
        ptrd+=sizeof(intRLE);\
        ptrs+=sizeof(intRLE)*iP;
    if (iP >1)
       {SAVE_SAME();
       }
    }
for (;ptrs < ptrs_end;)
    {
     *((int8_t*)ptrd++) = *((int8_t*)ptrs++);
    }
return (uint32_t)ptrd - (uint32_t)a_dst_ptr;
}
//---------------------------------------------------------------------------

void   __stdcall uncompress_RLE(void *a_dst_ptr,uint32_t a_count, void *a_src_ptr)
{
uint32_t	 ptrs = (uint32_t)a_src_ptr;
uint32_t	 ptrd = (uint32_t)a_dst_ptr;
uint32_t ptrd_end = (uint32_t)a_dst_ptr + size_t(a_count);
//
register uint32_t iX;

for (;ptrd <= ptrd_end - sizeof(intRLE);)
    {
    if ((((intTAG08*)ptrs)[0] & XPATTERN_RLE_BIT)==0x00L)
       {goto RLE_LOADDIFFRENT;
       }
RLE_LOADSAME:
    if ((((intTAG08*)ptrs)[0] & TAG16_RLE_BIT)==0x00L)
       {iX =*((intTAG08*)ptrs)>>TAG08_RLE_SIZE;
        ptrs+=sizeof(intTAG08);
       }
    else
    if ((((intTAG08*)ptrs)[0] & TAG32_RLE_BIT)==0x00L)
       {iX =*((intTAG16*)ptrs)>>TAG16_RLE_SIZE;
        ptrs+=sizeof(intTAG16);
       }
    else
       {iX =*((intTAG32*)ptrs)>>TAG32_RLE_SIZE;
        ptrs+=sizeof(intTAG32);
        }
    stk::mem::set((char*)ptrd,iX,((intRLE*)ptrs)[0],sizeof(intRLE));
    ptrd+=sizeof(intRLE)*iX;
    ptrs+=sizeof(intRLE);
    continue;

RLE_LOADDIFFRENT:
    if ((((intTAG08*)ptrs)[0] & TAG16_RLE_BIT)==0x00L)
       {iX =*((intTAG08*)ptrs)>>TAG08_RLE_SIZE;
        ptrs+=sizeof(intTAG08);
        }
    else
    if ((((intTAG08*)ptrs)[0] & TAG32_RLE_BIT)==0x00L)
       {iX =*((intTAG16*)ptrs)>>TAG16_RLE_SIZE;
        ptrs+=sizeof(intTAG16);
       }
    else
       {iX =*((intTAG32*)ptrs)>>TAG32_RLE_SIZE;
        ptrs+=sizeof(intTAG32);
       }

    stk::mem::cpy((char*)ptrd,(char*)ptrs,iX*sizeof(intRLE));
    ptrd+=sizeof(intRLE)*iX;
    ptrs+=sizeof(intRLE)*iX;
    continue;
    }
for (;ptrd < ptrd_end;)
    {
    *((int8_t*)ptrd++) = *((int8_t*)ptrs++);
    }
}*/
#endif

