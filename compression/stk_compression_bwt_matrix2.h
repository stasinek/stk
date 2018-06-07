//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017---------------
//---------------------------------------------------------------------------
#ifndef __stk_bwt_matrix_H__
#define __stk_bwt_matrix_H__
//---------------------------------------------------------------------------
#include <stk_main.h>
//---------------------------------------------------------------------------
#define MAX_GRAD	0x1000L
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace compression {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __bwt_compressor {
private:
//---------------------------------------------------------------------------
public:
//---------------------------------------------------------------------------
        __bwt_compressor(const uint32_t ablock);
    ~__bwt_compressor();
//---------------------------------------------------------------------------
        uint32_t   __stdcall generate(const char *a_src_ptr, const uint32_t a_rowsize);
        uint32_t   __stdcall sort(void);
        uint32_t   __stdcall save(char *a_dst_ptr);
        char  *matrix_ptr;
        uint32_t  *matrix_idx_ptr;
        uint32_t   matrix_dim;
#define BGN 0
#define END 1
        void   __stdcall find_groups(const uint32_t acolumn,const uint32_t arow_bgn,const uint32_t arow_end, uint32_t *alist_bgn, uint32_t *alist_end);
        uint32_t *groups_bgn[2], *groups_end[2];
        void   __stdcall sort_groups(const uint32_t acolumn,const uint32_t arow_bgn,const uint32_t arow_end);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace stk,compression
#endif
//-------------------------------THE END-------------------------------------
/*
typedef char byte;

byte *rotlexcmp_buf = NULL;
int rottexcmp_bufsize = 0;

int rotlexcmp(const void *l, const void *r)
{
     int li = *(const int*)l, ri = *(const int*)r, ac=rottexcmp_bufsize;
     while (rotlexcmp_buf[li] == rotlexcmp_buf[ri])
     {
          if (++li == rottexcmp_bufsize)
                li = 0;
          if (++ri == rottexcmp_bufsize)
                ri = 0;
          if (!--ac)
                return 0;
     }
     if (rotlexcmp_buf[li] > rotlexcmp_buf[ri])
          return 1;
     else
          return -1;
}

void bwt_encode(byte *buf_in, byte *buf_out, int size, int *primary_index)
{
     int *indices = new int[size];
     int i;

     for(i=0; i<size; i++)
          indices[i] = i;
     rotlexcmp_buf = buf_in;
     rottexcmp_bufsize = size;
     qsort (indices, size, sizeof(int), rotlexcmp);

     for (i=0; i<size; i++)
          buf_out[i] = buf_in[(indices[i]+size-1)%size];
     for (i=0; i<size; i++)
     {
          if (indices[i] == 1) {
                *primary_index = i;
                delete indices;
                return;
          }
     }
//	 assert (0);

delete indices;
}

void bwt_decode(byte *buf_in, byte *buf_out, int size, int primary_index)
{
     byte *F = new byte[size];
     int buckets[256];
     int i,j,k;
     int *indices = new int[size];

     for (i=0; i<256; i++)
          buckets[i] = 0;
     for (i=0; i<size; i++)
          buckets[buf_in[i]] ++;
     for (i=0,k=0; i<256; i++)
          for (j=0; j<buckets[i]; j++)
                F[k++] = i;
//	 assert (k==size);
     for (i=0,j=0; i<256; i++)
     {
          while (i>F[j] && j<size)
                j++;
          buckets[i] = j; // it will get fake values if there is no i in F, but
                                // that won't bring us any problems
     }
     for(i=0; i<size; i++)
          indices[buckets[buf_in[i]]++] = i;
     for(i=0,j=primary_index; i<size; i++)
     {
          buf_out[i] = buf_in[j];
          j=indices[j];
     }

delete indices,F;
}
*/
#endif
//---------------------------------------------------------------------------
/*
void   __stdcall bit_mov_08(void *a_dst_ptr,char adst_bit,void *a_src_ptr,char asrc_bit)
{
__asm {

  mov  DL,asrc_bit
  mov ESI,a_src_ptr
  mov  DH,adst_bit
  mov EDI,a_dst_ptr

bit_mov08_BIT_XXX:
  mov  AL,[ESI+0] 		// dana src
  cmp  DL,0
    jz bit_mov08_ESI_01 	// jeden bajt SRC?
  mov  AH,[ESI+1]
bit_mov08_ESI_01:
  mov  CL,DL
  shr  AX,CL
  and  AX,0x00FFL 		// and maska
  mov  CL,DH
  shl  AX,CL
  cmp  DH,0
  jnz bit_mov08_EDI_CL
  mov [EDI+0],AL
  jmp bit_mov08_BIT_XXX_BREAK
bit_mov08_EDI_CL:
    or [EDI+0],AL 			// xor dana dst
  mov [EDI+1],AH
bit_mov08_BIT_XXX_BREAK:
bit_mov08_BIT_OK:
    }
}
//---------------------------------------------------------------------------

void   __stdcall bit_mov_16(void *a_dst_ptr,char adst_bit,void *a_src_ptr,char asrc_bit)
{
__asm {

  mov  DL,asrc_bit
  mov ESI,a_src_ptr
  mov  DH,adst_bit
  mov EDI,a_dst_ptr

bit_mov16_BIT_XXX:
  xor EAX,EAX
  mov  AX,[ESI+0] 		// dana src
  cmp  DL,0
    jz bit_mov16_ESI_01 	// jeden bajt SRC?
  shl EAX,8
  mov  AL,[ESI+1]
bit_mov16_ESI_01:
  mov  CL,DL
  shr EAX,CL
  and EAX,0x0000FFFFL 		// and maska
  mov  CL,DH
  shl EAX,CL
  cmp  DH,0
  jnz bit_mov16_EDI_CL
  mov [EDI+0],AX
  jmp bit_mov16_BIT_XXX_BREAK
bit_mov16_EDI_CL:
    or [EDI+0],AL		// xor dana dst
  shr EAX,8
  mov [EDI+1],AX
bit_mov16_BIT_XXX_BREAK:
bit_mov16_BIT_OK:
    }
}
//---------------------------------------------------------------------------

void   __stdcall bit_mov_24(void *a_dst_ptr,char adst_bit,void *a_src_ptr,char asrc_bit)
{
__asm {

  mov  DL,asrc_bit
  mov ESI,a_src_ptr
  mov  DH,adst_bit
  mov EDI,a_dst_ptr

bit_mov24_BIT_XXX:
  xor EAX,EAX
  mov  AX,[ESI+0] 		// dana src
  shl EAX,8
  mov  AL,[ESI+2] 		// dana src
  cmp  DL,0
    jz bit_mov24_ESI_01 	// jeden bajt SRC?
  shl EAX,8
  mov  AL,[ESI+3]
bit_mov24_ESI_01:
  mov  CL,DL
  shr EAX,CL
  and EAX,0x00FFFFFFL 		// and maska
  mov  CL,DH
  shl EAX,CL
  cmp  DH,0
  jnz bit_mov24_EDI_CL
  mov [EDI+0],AL
  shr EAX,8
  mov [EDI+1],AX
  jmp bit_mov24_BIT_XXX_BREAK
bit_mov24_EDI_CL:
    or [EDI+0],AL		// xor dana dst
  shr EAX,8
  mov [EDI+1],AL
  shr EAX,8
  mov [EDI+2],AX
bit_mov24_BIT_XXX_BREAK:
bit_mov24_BIT_OK:
    }
}
//---------------------------------------------------------------------------

void   __stdcall bit_mov_32(void *a_dst_ptr, char adst_bit,void *a_src_ptr, char asrc_bit)
{
__asm {

  mov  DL,asrc_bit
  mov ESI,a_src_ptr
  mov  DH,adst_bit
  mov EDI,a_dst_ptr

bit_mov32_BIT_XXX:
  mov EAX,[ESI+0] 		// dana src
  xor EBX,EBX
  cmp  DL,0
    jz bit_mov32_ESI_01 	// jeden bajt SRC?
  mov  BL,[ESI+4]
bit_mov32_ESI_01:
  mov  CL,DL
 shrd EAX,EBX,CL
  shr EBX,CL
  mov  CL,DH
 shld EBX,EAX,CL
  shl EAX,CL
  cmp  DH,0
  jnz bit_mov32_EDI_CL
  mov [EDI+0],EAX
  jmp bit_mov32_BIT_XXX_BREAK
bit_mov32_EDI_CL:
    or [EDI+0],AL		// xor dana dst
 shrd EAX,EBX,8
  mov [EDI+1],EAX
bit_mov32_BIT_XXX_BREAK:
bit_mov32_BIT_OK:
    }
}


  */
