//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#ifdef __MSVC__
#include <MEMORY.h>
#endif
#include <malloc.h>
#pragma hdrstop
#include "./../cpu/stk_cpu.h"
#include "./../threads/stk_threads.h"
#include "./../io/stk_console.h"
#include "./../stk_vector.h"
//---------------------------------------------------------------------------
#include "stk_mem.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace mem {
#endif
//---------------------------------------------------------------------------
static int64_t g_mem_allocated = 0;
static int64_t g_mem_max = 1<<30;
static int32_t g_mem_size_align = 16;
static int32_t g_mem_pointer_align = 16;
//---------------------------------------------------------------------------
#define MAGIC_TAIL ((uint32_t)(0xCCCCCCCCL))
#pragma pack(push, 1)
struct __mem_chunk {
uint64_t ptr_reserved_header[1];
uint64_t ptr_size; // size of user data
uint64_t ptr; // points to head of user data
uint64_t chunk_reserved_header[1];
uint64_t chunk_ptr_size;
uint64_t chunk_ptr;  //points to head of this structure, pointer should be pass to stk::mem::alloc, ::realloc, ::free()
} __attribute__((packed,aligned (8)));

struct __mem_tail {
    uint32_t f_magic_tail[1];
    uint32_t f_null[1];

    inline void __stdcall add()
    { 	 f_magic_tail[0] = MAGIC_TAIL;
         f_null[0] = 0;
    }
    inline bool __stdcall check()
    {    return (f_magic_tail[0]==MAGIC_TAIL);
    }
} __attribute__((packed,aligned (8)));
#pragma pack(pop)

//---------------------------------------------------------------------------
intmax_t __stdcall allocated(void)
{
return g_mem_allocated;
}
//---------------------------------------------------------------------------
size_t __stdcall size(const void *a_ptr)
{
    return ::_msize((void*)a_ptr);
}
//---------------------------------------------------------------------------

void *__stdcall calloc(char a_size, const size_t a_count)
{
register size_t cnt = a_size * a_count;
register void *ptr = alloc(cnt);
return  set(ptr,0,cnt);
}
//---------------------------------------------------------------------------

void *__stdcall alloc(const size_t a_count)
{
    register size_t l_n_tailed_count;
    register __mem_tail *n_t;
    register void *r;
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("stk::mem::alloc(size_t)")
#endif
    l_n_tailed_count  = a_count;
    l_n_tailed_count += sizeof(__mem_tail);
    l_n_tailed_count += l_n_tailed_count % g_mem_size_align;
#if defined(__DEBUG_MEM32__) | defined(__DEBUG_MEM32_ALLOC__)
    printf("stk::mem::alloc(%u+%d(ALIGNED_TO %d)+%u(MAGIC_TAIL))\n", a_count, (int32_t)sizeof(__mem_tail),(int32_t)(l_n_tailed_count - a_count - sizeof(__mem_tail)),(int32_t)g_mem_size_align);
#endif
        r = ::malloc(l_n_tailed_count);
    if (r==NULL)
        throw "stk::mem::alloc::ERROR! OUT OF MEMORY?";
    n_t = (__mem_tail*)((size_t)r + (size_t)l_n_tailed_count - sizeof(__mem_tail)) ;
    n_t->add();
ATOMIC(1)
ATOMIC_LOCK(1)
    g_mem_allocated += l_n_tailed_count;
ATOMIC_UNLOCK(1)
#if defined(__DEBUG_MEM32__) | defined(__DEBUG_MEM32_ALLOC__)
    printf("stk::mem::alloc::return address=0x%08hu, allocated=%lldB\n",(size_t)r,(int64_t)g_mem_allocated);
#endif
    __builtin_prefetch(r,1,3);
    return r;
}
//---------------------------------------------------------------------------
/*
STK_IMPEXP void *__stdcall crealloc(char a_znak, void *a_dst_ptr, const size_t a_count)
{
size_t s = size(a_dst_ptr);
void  *ptr = realloc(a_dst_ptr,a_count);
if (s < a_count) return set(ptr,a_znak,a_count-s);
else return ptr;
}
*/
//---------------------------------------------------------------------------

void *__stdcall realloc(void *a_dst_ptr,const size_t a_count)
{
    register size_t l_p_tailed_count;
    register size_t l_n_tailed_count;
    register void *r;
#ifdef __DEBUG_MEM32__
    register __mem_tail *o_t;
    register __mem_tail *n_t;
 __DEBUG_CALLED("realloc(void*,const size_t)")
#endif
ATOMIC(1)
    l_p_tailed_count  = stk::mem::size(a_dst_ptr);
    l_n_tailed_count  = a_count;
    l_n_tailed_count += sizeof(__mem_tail);
    l_n_tailed_count += l_n_tailed_count % g_mem_size_align;
#if defined(__DEBUG_MEM32__) | defined(__DEBUG_MEM32_ALLOC__)
    o_t = (__mem_tail*)(((size_t)a_dst_ptr + (size_t)l_p_tailed_count) - (size_t)sizeof(__mem_tail)) ;
    printf("mem::realloc(adress=0x%08hu,%u+%d(ALIGNED_TO %d)+%u(MAGIC_TAIL))\n",(size_t)a_dst_ptr, a_count,(size_t)sizeof(__mem_tail),l_n_tailed_count - a_count - sizeof(__mem_tail),g_mem_size_align);
    if (l_p_tailed_count > sizeof(__mem_tail))
    if (!o_t->check()) {
    printf("WARNING! detected out of bound access 0x%08hu(@MAGIC_TAIL)\n",(size_t)a_dst_ptr);
    }
#endif
ATOMIC_LOCK(1)
    g_mem_allocated -= l_p_tailed_count;
ATOMIC_UNLOCK(1)
        r = (void*)::realloc(a_dst_ptr,l_n_tailed_count);
    if (r==NULL)
    throw "mem::realloc FAIL! OUT OF MEMORY";
#if defined(__DEBUG_MEM32__) | defined(__DEBUG_MEM32_ALLOC__)
    n_t = (__mem_tail*)(((size_t)r + (size_t)l_n_tailed_count) - (size_t)sizeof(__mem_tail)) ;
    n_t->add();
#endif
ATOMIC_LOCK(1)
    g_mem_allocated += l_n_tailed_count;
ATOMIC_UNLOCK(1)
#if defined(__DEBUG_MEM32__) | defined(__DEBUG_MEM32_ALLOC__)
    printf("returned, address=0x%08hu, now allocated sum is=%lldB\n",(size_t)r,(int64_t)g_mem_allocated);
#endif
    __builtin_prefetch(r, 1, 3);
    return r;
}
//---------------------------------------------------------------------------

void __stdcall free(void *a_dst_ptr)
{
    register size_t l_p_tailed_count;
    register __mem_tail *o_t;
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
ATOMIC(1)
    l_p_tailed_count = stk::mem::size(a_dst_ptr);
    o_t = (__mem_tail*)(((size_t)a_dst_ptr + (size_t)l_p_tailed_count) - (size_t)sizeof(__mem_tail)) ;
#if defined(__DEBUG_MEM32__) | defined(__DEBUG_MEM32_ALLOC__)
    printf("mem::free(address=0x%08hu)\n",(size_t)a_dst_ptr);
#endif
    if (l_p_tailed_count > sizeof(__mem_tail))
    if (!o_t->check())
    printf("WARNING! detected out of bound access(@MAGIC_TAIL)!\n");
ATOMIC_LOCK(1)
    g_mem_allocated -= l_p_tailed_count;
ATOMIC_UNLOCK(1)

    ::free(a_dst_ptr);
    __builtin___clear_cache(a_dst_ptr,(uint8_t*)a_dst_ptr+l_p_tailed_count);

#if defined(__DEBUG_MEM32__) | defined(__DEBUG_MEM32_ALLOC__)
    printf("returned, now allocated sum is=%lldB\n",(int64_t)g_mem_allocated);
    if (g_mem_allocated<0)
    printf("WARNING! allocated sum is below 0, You should check for double: free(ptr)\n");
#endif
}
//---------------------------------------------------------------------------

void *__stdcall set(void *a_dst_ptr, const unsigned char a_znak_B, const size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
return stk::mem::setex(a_dst_ptr,&a_znak_B,1,a_count);
#else
::memset(a_dst_ptr,a_znak_B,a_count);
return a_dst_ptr;
#endif
}
//---------------------------------------------------------------------------

void *__stdcall setex(void *a_dst_ptr, const void *a_src_ptr, const int8_t a_element_size, const size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
if (a_element_size <= 1) {
    __asm {
        push EDI;
        push EDX;
        push ECX;
        push EBX;
set_SET_DST:
        mov EDI,a_dst_ptr;
set_COUNT:
        mov EBX,a_count;
       test EBX,EBX;
         jz set_EXIT0;

set_BYTES_PREPARE:
        mov ESI,a_src_ptr;
        mov  AL,[ESI];
        cmp EBX,4;
         jb set_BYTES;
set_DWORD_PREPARE:
       imul EAX,0x01010101L;
set_BIG_OR_NOT_TO_BIG:
        cmp EBX,64;
         jb set_DWORD;
set_ALIGN_PREPARE: //ALIGN EDI to 64-bytes cache line, EBX must be >= 64
        mov ECX,0xFFFFFFFFL
        sub ECX,EDI;
        inc ECX;
        and ECX,0x0000003FL;
        mov EDX,ECX;
        and ECX,0x00000003L;
        cld;
        rep stosb;
        mov ECX,EDX;
        shr ECX,2;
        rep stosd;
        cld;
        sub EBX,EDX;
set_ALIGN_PREPARE_EXIT:
set_SSE:
           //place to decide use SSE1 vs jump to MMX?
        cmp EBX,64;
         jb set_DWORD;
set_SSE_PREPARE:
       movd xmm0,EAX;
       movd xmm1,EAX;
    pshufw mm0, mm0, 0x00
   UNPCKLPS xmm0,xmm1;
     movupd xmm1,xmm0;
   UNPCKLPS xmm0,xmm1;
set_SSE_LOOP:
        sub EBX,64;
      movntps [EDI+0x00],xmm0;
      movntps [EDI+0x10],xmm0;
      movntps [EDI+0x20],xmm0;
      movntps [EDI+0x30],xmm0;
        add EDI,64;

        cmp EBX,64;
        jnb set_SSE_LOOP;
        jmp set_SSE_EXIT;
set_MMX:
           //unreachable unless jumped here  before SSE
        cmp EBX,64;
         jb set_DWORD;
set_MMX_PREPARE:
       movd mm0,EAX;
       movd mm1,EAX;
  PUNPCKLBW mm0,mm1;
set_MMX_LOOP:
        sub EBX,64;
      movntq [EDI+0x00],mm0;
      movntq [EDI+0x08],mm0;
      movntq [EDI+0x10],mm0;
      movntq [EDI+0x18],mm0;
        add EDI,32;
      movntq [EDI+0x00],mm0;
      movntq [EDI+0x08],mm0;
      movntq [EDI+0x10],mm0;
      movntq [EDI+0x18],mm0;
        add EDI,32;

        cmp EBX,64;
        jnb set_MMX_LOOP;
set_MMX_EXIT:
emms;
set_SSE_EXIT:
sfence;
set_DWORD:
        mov ECX,EBX;
        shr ECX,2;
        cld;
        rep STOSD;
set_BYTES:
        mov ECX,EBX;
        and ECX,0x00000003L;
        cld;
        rep STOSB;
set_EXIT0:
        pop EBX;
        pop ECX;
        pop EDX;
        pop EDI;
    }
return a_dst_ptr;
}
else
#endif
if (a_element_size >= 1 ? a_element_size <= 8 : false) {

    register char 	*d_ptr = (char*)a_dst_ptr;
    register char 	*s_ptr = (char*)a_src_ptr;
    for (register size_t c = a_count, e_size = a_element_size; c != 0; c--) {
         for (register uint32_t e = 0; e < e_size; e++) ((char*)d_ptr++)[0] = ((char*)s_ptr)[e];
         }
return a_dst_ptr;
}
else if (a_element_size > 8) {
    for (register size_t c = a_count, e_size = a_element_size; c != 0; c--) {
         a_dst_ptr = (char*)stk::mem::mov(a_dst_ptr,a_src_ptr,e_size) + e_size;
        }
return a_dst_ptr;
}
return NULL;
}
//---------------------------------------------------------------------------

void *__stdcall mov(void *a_dst_ptr,const void *a_src_ptr, const size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
    __asm {
        push EDI;
        push ESI;
        push EDX;
        push ECX;
        push EBX;
mov_SET_SRC_DST:
        mov ESI,a_src_ptr;
        mov EDI,a_dst_ptr;
        cmp ESI,EDI;
         je mov_EXIT0;
mov_SET_COUNT:
        mov EBX,a_count;
       test EBX,EBX;
         jz mov_EXIT0;
mov_SET_DIRECTION:
        cmp EDI,ESI;
        jbe mov_DIRECTION_INC;
        LEA EAX,[ESI+EBX];
        cmp EAX,EDI;
        jbe mov_DIRECTION_INC;
mov_DIRECTION_DEC:
        mov EDX,1;
        cmp EBX,64;
         jb mov_DWORD;
mov_ALIGN64_DEC: //ALIGN ESI to 64-bytes, EBX must be >= 64
        mov ECX,0xFFFFFFFFL
        sub ECX,ESI;
        inc ECX;
        and ECX,0x0000003FL;
        mov EAX,ECX;
        and ECX,0x00000003L;
        lea ESI,[ESI+EBX-1];
        lea EDI,[EDI+EBX-1];
        std;
        rep movsb;
        mov ECX,EAX;
        shr ECX,2;
        rep movsd;
        cld;
        sub EBX,EAX;
        jmp mov_ALIGN64_EXIT;
mov_DIRECTION_INC: //ALIGN ESI to 64-bytes, EBX must be >= 64
        mov EDX,0;
        cmp EBX,64;
         jb mov_DWORD;
mov_ALIGN64_INC:
        mov ECX,0xFFFFFFFFL
        sub ECX,ESI;
        inc ECX;
        and ECX,0x0000003FL;
        mov EAX,ECX;
        and ECX,0x00000003L;
        cld;
        rep movsb;
        mov ECX,EAX;
        shr ECX,2;
        rep movsd;
        cld;
        sub EBX,EAX;
mov_ALIGN64_EXIT:
mov_SSE:
       test EDI,0x0000000F; // if dst is not aligned 16 use MMX version
        jnz mov_MMX;
        cmp EBX,64;
         jb mov_DWORD;
       test EDX,EDX;
        jnz mov_SSE_DEC;
mov_SSE_INC:
mov_SSE_LOOP_INC:
        sub EBX,64;
      movapd xmm0,[ESI+0x00];
      movapd xmm1,[ESI+0x10];
      movapd xmm2,[ESI+0x20];
      movapd xmm3,[ESI+0x30];
        add ESI,64;
      movntps [EDI+0x00],xmm0;
      movntps [EDI+0x10],xmm1;
      movntps [EDI+0x20],xmm2;
      movntps [EDI+0x30],xmm3;
        add EDI,64;

        cmp EBX,64;
        jnb mov_SSE_LOOP_INC;
        jmp mov_SSE_EXIT;
mov_SSE_DEC:
        lea ESI,[ESI+EBX-16];
        lea EDI,[EDI+EBX-16];
mov_SSE_LOOP_DEC:
        sub EBX,64;
      movdqa xmm0,[ESI-0x00];
      movdqa xmm1,[ESI-0x10];
      movdqa xmm2,[ESI-0x20];
      movdqa xmm3,[ESI-0x30];
        sub ESI,64;
      movntps [EDI-0x00],xmm0;
      movntps [EDI-0x10],xmm1;
      movntps [EDI-0x20],xmm2;
      movntps [EDI-0x30],xmm3;
        sub EDI,64;

        cmp EBX,64;
        jnb mov_SSE_LOOP_DEC;
        jmp mov_SSE_EXIT;
mov_MMX:
        cmp EBX,64;
         jb mov_DWORD;
       test EDX,EDX;
        jnz mov_MMX_DEC;
mov_MMX_INC:
mov_MMX_LOOP_INC:
        sub EBX,64;

      movq mm0,[ESI + 0x00L];
      movq mm1,[ESI + 0x08L];
      movq mm2,[ESI + 0x10L];
      movq mm3,[ESI + 0x18L];
        add ESI,32;
      movntq   [EDI + 0x00L],mm0;
      movntq   [EDI + 0x08L],mm1;
      movntq   [EDI + 0x10L],mm2;
      movntq   [EDI + 0x18L],mm3;
        add EDI,32;
      movq mm4,[ESI + 0x00L];
      movq mm5,[ESI + 0x08L];
      movq mm6,[ESI + 0x10L];
      movq mm7,[ESI + 0x18L];
        add ESI,32;
      movntq   [EDI + 0x00L],mm4;
      movntq   [EDI + 0x08L],mm5;
      movntq   [EDI + 0x10L],mm6;
      movntq   [EDI + 0x18L],mm7;
        add EDI,32;

        cmp EBX,64;
        jnb mov_MMX_LOOP_INC;
        jmp mov_MMX_EXIT;

mov_MMX_DEC:
        lea ESI,[ESI+EBX-8];
        lea EDI,[EDI+EBX-8];
mov_MMX_LOOP_DEC:
        sub EBX,64;

      movq mm0,[ESI - 0x00L];
      movq mm1,[ESI - 0x08L];
      movq mm2,[ESI - 0x10L];
      movq mm3,[ESI - 0x18L];
        sub ESI,32;
      movntq     [EDI - 0x00L],mm0;
      movntq     [EDI - 0x08L],mm1;
      movntq     [EDI - 0x10L],mm2;
      movntq     [EDI - 0x18L],mm3;
        sub EDI,32;
      movq mm4,[ESI - 0x00L];
      movq mm5,[ESI - 0x08L];
      movq mm6,[ESI - 0x10L];
      movq mm7,[ESI - 0x18L];
        sub ESI,32;
      movntq     [EDI - 0x00L],mm4;
      movntq     [EDI - 0x08L],mm5;
      movntq     [EDI - 0x10L],mm6;
      movntq     [EDI - 0x18L],mm7;
        sub EDI,32;

        cmp EBX,64;
        jnb mov_MMX_LOOP_DEC;
mov_MMX_EXIT:
       emms;
mov_SSE_EXIT:
       sfence;
mov_DWORD:
       test EBX,EBX;
         jz mov_EXIT0;
       test EDX,EDX;
        jnz mov_DWORD_DEC;
mov_DWORD_INC:
        mov ECX,EBX;
        shr ECX,2;
        cld;
        rep MOVSD;
        mov ECX,EBX;
        and ECX,0x03L;
        rep MOVSB;
        jmp mov_EXIT0;
mov_DWORD_DEC:
        lea ESI,[ESI+EBX-1];
        lea EDI,[EDI+EBX-1];
        mov ECX,EBX;
        and ECX,3;
        std;
        rep MOVSB;
        mov ECX,EBX;
        shr ECX,2;
        sub ESI,3;
        sub EDI,3;
        rep MOVSD;
        cld;
mov_EXIT0:
        pop EBX;
        pop ECX;
        pop EDX;
        pop ESI;
        pop EDI;
    }
return a_dst_ptr;
#else
::memmove(a_dst_ptr,a_src_ptr,a_count);
return a_dst_ptr;
#endif
}
//---------------------------------------------------------------------------

void *__stdcall shl(void *a_dst_ptr, size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
    register size_t r_cmo = a_count-1;
    stk::mem::mov(a_dst_ptr,(void*)((int8_t*)a_dst_ptr+1),r_cmo);
           ((int8_t*)a_dst_ptr)[r_cmo] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

void *__stdcall shr(void *a_dst_ptr, size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
    register size_t r_cmo = a_count-1;
    stk::mem::mov((void*)((int8_t*)a_dst_ptr+1),a_dst_ptr,r_cmo);
           ((int8_t*)a_dst_ptr)[0] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

void *__stdcall ror(void *a_dst_ptr, size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
    register char dE = ((char*)a_dst_ptr)[a_count-1];
    stk::mem::shr(a_dst_ptr,a_count);
           ((char*)a_dst_ptr)[0] = dE;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

void *__stdcall rol(void *a_dst_ptr, size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
    register char d0 = ((char*)a_dst_ptr)[0];
    stk::mem::shl(a_dst_ptr,a_count);
           ((char*)a_dst_ptr)[a_count-1] = d0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

void *__stdcall rev(void  *a_dst_ptr, const void *a_src_ptr, const size_t a_count)
{
      register char *r_src_start = (char*)a_src_ptr;
      register char *r_src_end = r_src_start + a_count - 1;
      register char *r_dst_start = (char*)a_dst_ptr;
      register char *r_dst_end = r_dst_start + a_count - 1;
      register char  a;

      for (; r_src_start < r_src_end; r_src_start++, r_src_end--, r_dst_start++, r_dst_end--) {
            a = *r_src_start;
            *r_dst_start = *r_src_end;
            *r_dst_end = a;
      }
return a_dst_ptr;
}
//---------------------------------------------------------------------------

/*  Public domain demo by Ray Gardner, 7 dec 88
 *
 *     |...... head .......|.................. tail .................|
 *
 *  You reverse the head, reverse the tail, then reverse the entire buffer.
 *  That's all there is to it.  It will leave you with:
 *
 *     |.................. tail .................|...... head .......|
 */

void *__stdcall swap(void *a_ptr, const size_t a_head_count, const size_t a_tail_count)
{
      stk::mem::rev(a_ptr,a_ptr, a_head_count);
      stk::mem::rev((char*)a_ptr+a_head_count,(char*)a_ptr+a_head_count, a_tail_count);
      stk::mem::rev(a_ptr,a_ptr, a_head_count + a_tail_count);
return a_ptr;
}
//---------------------------------------------------------------------------

intmax_t __stdcall cmp(const void *a_ptr1, const void *a_ptr2, const size_t a_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
    __asm {
        push EDI;
        push ESI;
        push EDX;
        push ECX;
        push EBX;
        mov ESI,a_ptr1;
        mov EDI,a_ptr2;
        mov ECX,a_count;
        mov EAX,ECX;
        cmp ECX,4;
        jl ptrcmp_BYTES;
        shr ECX,2;
        cld;
        repe cmpsd;
        jl ptrcmp_L;
        jg ptrcmp_G;
        inc ECX;
        shl ECX,2;
        sub EAX,ECX;
        mov ECX,EAX;
        and ECX,3;
        ptrcmp_BYTES:
        repe cmpsb;
        jl ptrcmp_L;
        jg ptrcmp_G;
        xor EAX,EAX;
        jmp ptrcmp_E;
        ptrcmp_L:
        mov EAX,-1;
        jmp ptrcmp_E;
        ptrcmp_G:
        mov EAX,+1;
        jmp ptrcmp_E;
        ptrcmp_E:
        pop EBX;
        pop ECX;
        pop EDX;
        pop ESI;
        pop EDI;
    }
#else
    register char *lp1 = (char*)a_ptr1, *lp2 = (char*)a_ptr2;
    return ::memcmp(lp1,lp2,a_count);
#endif
}
//---------------------------------------------------------------------------

/*MMX
 * Funkcja oblicza dlugo¶æ lancucha znakow zakonczonego zerem, z powodzeniem moze byæ wykorzystana jako strchr, wystarczy wypelniæ mm1 szukanym znakiem.

; edi - pierwszy znak
; ecx - wynik: dlugo¶æ lancucha

mmx_strlen:

    pxor mm1, mm1 ; packed_byte(0x00)
    xor  ecx, ecx

.count:                     ; np.
    movq     mm0, [edi] ; mm0 = | 0 |'e'| 0 |'b'|'m'|'e'|'s'|'a'|
    pcmpeqb  mm0, mm1   ; mm0 = | ff| 0 | ff| 0 | 0 | 0 | 0 | 0 |

    pmovmskb eax, mm0   ; eax = 10100000b (0xa0)
    test      al, al
    jnz      .founded   ; w wyniku s± ustawione bity, znaleziono koncz±ce zero
                        ; w przeciwny przypadku...

    add      edi, 8     ; nastepne 8 bajtow
    add      ecx, 8     ; zwieksz o 8 dlugo¶æ

    jmp .count

.founded:

bsf eax, eax    ; znajd¼ pierwszy ustawiony bit
add ecx, eax
ret*/

//---------------------------------------------------------------------------

intmax_t __stdcall chr(const void *a_dst_ptr, const char a_znak_B, const size_t a_max_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)  && (1==0)
    __asm {
        push EDI;
        push EDX;
        push ECX;
        push EBX;
        mov EDI,a_dst_ptr;
        mov EDX,a_max_count;
        xor ecx,ecx;
        mov EBX,EDX;
        mov  AL,a_znak_B;

        cmp EDX,64;
         jl ptrchr_BELOW_CHUNK;
ptrchr_MMX_PREPARE:
       imul EAX,0x01010101;
       movd mm7,EAX;
       movd mm0,EAX;
  PUNPCKLBW mm7,mm0;

ptrchr_CHUNK_START:
ptrchr_CHUNK_CMP_LOOP:
        sub EBX, 32

        movq MM0,[EDI+0x00L];
        movq MM1,[EDI+0x08L];
        movq MM2,[EDI+0x10L];
        movq MM3,[EDI+0x18L];

        pcmpeqb  mm0, mm7
        pcmpeqb  mm1, mm7
        pcmpeqb  mm2, mm7
        pcmpeqb  mm3, mm7

        pmovmskb eax, mm0
        test al, al
        jnz ptrchr_COMPUTE_FOUND;
        pmovmskb eax, mm1
        test al, al
        jnz ptrchr_COMPUTE_FOUND;
        pmovmskb eax, mm2
        test al, al
        jnz ptrchr_COMPUTE_FOUND;
        pmovmskb eax, mm3
        test al, al
        jnz ptrchr_COMPUTE_FOUND;

        add EDI, 32
        cmp EBX, 32
        jnl ptrchr_CHUNK_CMP_LOOP;
ptrchr_BELOW_CHUNK:
        mov ECX,EBX
        cld;
        repne SCASB;
         je ptrchr_COMPUTE_FOUND;
        mov EAX,0xFFFFFFFFL;
        jmp ptrchr_RETURN;
ptrchr_COMPUTE_FOUND:
        mov EAX,EDX;
        sub EAX,EBX;
        sub EAX,ECX;
        dec EAX;
ptrchr_RETURN:
        pop EBX;
        pop ECX;
        pop EDX;
        pop EDI;
        emms;
    }
#else
    register const char  b = a_znak_B;
    register const char *p_start = static_cast<char*> (const_cast<void*> (a_dst_ptr));
    register const char *p_end = p_start + a_max_count;
    register char *p = (char*)p_start;
    for (;p < p_end;) {
         if (*p==b) return size_t(p - p_start);
        else p++;
    }
    return -1;
#endif
}
//---------------------------------------------------------------------------

intmax_t __stdcall chrr(const void *a_dst_ptr, const char a_znak_B, const size_t a_max_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#define CHR_R_CHUNK (2 * 64)
    register const char  b = a_znak_B;
    register const char *p_start = static_cast<char*> (const_cast<void*> (a_dst_ptr));
    register const char *p_end = p_start + a_max_count;
    register size_t chunk_count = a_max_count % CHR_R_CHUNK;
    register char *p = (char*)p_end - chunk_count;
    register  int32_t rt;
    if (chunk_count > 0) {
            rt = chr(p,b,chunk_count);
        if (rt >=0)
        return size_t(p - p_start) + rt;
    }
    for (; p >= p_start;) {
        p -= CHR_R_CHUNK;
        rt = chr(p,b,CHR_R_CHUNK);
        if (rt>=0)
        return size_t(p - p_start) + rt;
        else continue;
    }
    return -1;
}
//---------------------------------------------------------------------------

intmax_t __stdcall pos(const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_search_ptr, const size_t a_search_size)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
size_t src_size = a_src_size, fnd_size = a_search_size;
size_t r;
    __asm {
//------------------------------------------
        push EDI;
        push ESI;
        push EDX;
        push ECX;
        push EBX;
        mov EDX,fnd_size;
        cmp EDX,0;
        jle strpos_ERROR;
//-----------------
        mov ECX,src_size;
        cmp ECX,0;
        jle strpos_ERROR;
//-----------------
        mov EBX,a_start;
        mov EAX,EBX;
        add EAX,EDX;
        cmp ECX,EAX;
        jl strpos_ERROR;
//-----------------
        dec EDX;
//------------------------------------------
        strpos_DO:
//------------------------------------------
        mov ESI,a_search_ptr;
        mov EDI,a_src_ptr;
        mov AL,[ESI];
        cmp AL,[EDI+EBX];
        jne strpos_NEXT;
        add EDI,EBX;
        mov ECX,fnd_size;
        cld;
        repe CMPSB;
        je  strpos_FOUND;
//-----------------
        strpos_NEXT:
//-----------------
        inc EBX;
        mov EAX,EBX;
        add EAX,EDX;
        cmp EAX,src_size;
        jl strpos_DO;
        jmp strpos_ERROR;
//------------------------------------------
        strpos_FOUND:
        mov EAX,EBX;
        jmp strpos_BREAK;
        strpos_ERROR:
        mov EAX,-1;
        jmp strpos_BREAK;
        strpos_BREAK:
        mov r, EAX;
        pop EBX;
        pop ECX;
        pop EDX;
        pop ESI;
        pop EDI;
//------------------------------------------
    }
            return r;
        // metoda Boyera-Moroe
            if (a_search_size > a_src_size || a_search_size<=0 || a_src_size<=0)
                return -1;
            static size_t ret_i,*lpret_i=&ret_i;
            static uint8_t  shift[0x0100L],*lpshift=&shift[0];
            if (a_search_size>0xFFL) {
                stk::mem::set(&shift,0x0100L,0xFFL);
                for (size_t i=a_search_size-0x0100L,ic=0x0100L; i < a_search_size; i++,ic--) {
                    shift[ ((char*)a_search_ptr)[i] ]=(uint8_t)(ic-1);
                }
            } else {
                stk::mem::set(&shift,0x0100L,a_search_size);
                for (size_t i=0,ic=a_search_size; i < a_search_size; i++,ic--) {
                    shift[ ((char*)a_search_ptr)[i] ]=(uint8_t)(ic-1);
                }
            }
            __asm {
                push EDI;
                push ESI;
                push EDX;
                push ECX;
                push EBX;
                mov EDX,a_search_size;
                dec EDX;
                mov EAX,0;
                add EAX,EDX;
                cmp EAX,a_src_size;
                jnl find_X;
                find_FIRST:
                xor EBX,EBX;
                xor ECX,ECX;
                mov ESI,a_src_ptr;
                mov EDI,a_search_ptr;
                find_DO:
                mov BL,[ESI+EAX];
                cmp BL,[EDI+EDX];
                je  find_CMP;
                mov ECX,lpshift;
                mov CL,[ECX+EBX];
                and ECX,0xFFL;
                add EAX,ECX;
                cmp EAX,a_src_size;
                jl find_FIRST;
                jmp find_X;
                find_CMP:
                add ESI,EAX;
                mov ECX,a_search_size;
                sub ESI,ECX;
                dec ESI;
                repe CMPSB;
                jne find_NEXT;
                sub EAX,EDX;
                mov EDI,lpret_i;
                mov [EDI],EAX;
                jmp find_EQL;
                find_NEXT:
                inc EAX;
                cmp EAX,a_src_size;
                jl  find_FIRST;
                jmp find_X;
            }
            find_EQL:
            asm {
                pop EBX;
                pop ECX;
                pop EDX;
                pop ESI;
                pop EDI;
            }
            return ret_i;
            find_X:
            asm {
                pop EBX;
                pop ECX;
                pop EDX;
                pop ESI;
                pop EDI;
            }
            return -1;
// return EAX
#else
    if (a_start > a_src_size)
        return -1;
    register size_t isrc_size  = a_src_size - a_start;
    register size_t isrc = 0;
    register size_t ifnd_size  = a_search_size;
    register size_t ifnd = 0;
    if (ifnd_size > isrc_size)
        return -1;
    register size_t imax_start = isrc_size - ifnd_size;
    register char *src = &((char*)a_src_ptr)[a_start];
    register char *fnd = &((char*)a_search_ptr)[0];
    for ( ; isrc <= imax_start; isrc++, src = &src[1]) {
        for (;;) {
            if (src[ifnd]!=fnd[ifnd])
                break;
            if (++ifnd >= ifnd_size)  return a_start + isrc;
        }
    }
    return -1;
#endif
}
//---------------------------------------------------------------------------

intmax_t __stdcall posr(const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_search_ptr, const size_t a_search_size)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
    register int32_t x = a_start, r = -1;
    do {
    x = stk::mem::pos(a_src_ptr, a_src_size, x, a_search_ptr, a_search_size);
    if (x!=-1) r = x;
    else break;
    x += a_search_size;
    } while (x < (int32_t)a_src_size);
    return r;
}
//---------------------------------------------------------------------------

intmax_t __stdcall pos_kmp(const void *a_src_ptr, const size_t a_src_size, const size_t a_start, const void *a_pattern_ptr, const size_t a_pattern_size)
{
    // Allocate variables
    size_t *T, i;
    int64_t d, r_result = 0;
    register const char *r_pattern = (const char*)a_pattern_ptr;
    register const char *r_text = (const char*)a_src_ptr;
    // Check empty pattern
    if (r_pattern[0] == (char)'\0')
        return -1;

    // Lookup table
    T = (size_t*)stk::mem::alloc((strlen(r_pattern)+1) * sizeof(int64_t));
    T[0] = -1;
    for (i=0; (char)r_pattern[i] != (char)'\0'; i++) {
        T[i+1] = T[i] + 1;
        while ((char)T[i+1] > 0 && (char)r_pattern[i] != (char)r_pattern[T[i+1]-1])
            T[i+1] = T[T[i+1]-1] + 1;
    }

    // Search
    for (i=0, d=0; (char)r_text[i] != (char)'\0'; ) {
        if (d < 0 ? true : r_text[i] == r_pattern[d]) {
            ++i, ++d;
            if (r_pattern[d] == (char)'\0') {
                r_result = i-d;
                break;
            }
        }
        else d = (char)T[d];
    }
    // Cleanup & Result
    stk::mem::free(T);
    return r_result;
}

void __stdcall bit_mov(void *a_dst_ptr, const uint8_t adst_bit, const void *a_src_ptr, const uint8_t asrc_bit, const size_t a_bits_num)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
    __asm {
//------------------------------------------
        push EDI;
        push ESI;
        push EDX;
        push ECX;
        push EBX;
        mov  BL,asrc_bit;
        mov ESI,a_src_ptr;
        mov  BH,adst_bit;
        mov EDI,a_dst_ptr;
        mov EDX,a_bits_num;
//------------------------------------------<< can just move?
        cmp  BX,0;
        jnz BIT_REP_BREAK;
        cmp EDX,8;
        jb BIT_REP_01;
        BIT_REP_32:
        mov ECX,EDX;
        shr ECX,5;
        cld;
        rep MOVSD;
        mov ECX,EDX;
        shr ECX,3;
        and ECX,3;
        rep MOVSB;
        BIT_REP_01:
        and  DL,8-1;
        jz BIT_XX_BREAK;
        mov  CL,DL;
        mov  AX,0xFF00L;
        rol  AX,CL;
        mov  BL,[ESI];
        and  AL,BL;
        mov  [EDI],AL;
        jmp BIT_XX_BREAK;
//-------------------
        BIT_REP_BREAK:
//------------------------------------------<< make dst existing bits mask
        mov  CL,BH;
        mov  CH,0x01L;
        shl  CH,CL;
        dec  CH;
//------------------------------------------<< move 24BIT by 24BIT
        cmp EDX,24;
        jbe BIT_24_BREAK;
        BIT_24_LOOP:
        sub EDX,24;

        mov EAX,[ESI+0];
        mov  CL,BL;
        shr EAX,CL;
        and EAX,0x00FFFFFF;
        mov  CL,BH;
        shl EAX,CL;
        mov  CL,[EDI+0];
        and  CL,CH;
        xor  AL,CL;
        mov [EDI+0],EAX;

        add ESI, 3;
        add EDI, 3;
        cmp EDX,24;
        ja BIT_24_LOOP;
//-------------------
        BIT_24_BREAK:
//------------------------------------------<< move 8BIT by 8BIT
        cmp EDX,8;
        jbe BIT_08_BREAK;
        BIT_08_LOOP:
        sub EDX,8;

        mov  AX,[ESI+0];
        mov  CL,BL;
        shr  AX,CL;
        and  AX,0x00FF;
        mov  CL,BH;
        shl  AX,CL;
        mov  CL,[EDI+0];
        and  CL,CH;
        xor  AL,CL;
        mov  [EDI+0],AX;

        add ESI, 1;
        add EDI, 1;
        cmp EDX, 8;
        ja BIT_08_LOOP;
//-------------------
        BIT_08_BREAK:
//------------------------------------------<< move remained BITS
        cmp EDX,0;
        jna BIT_XX_BREAK;
        BIT_XX:
        mov  CH,0x08L;
        sub  CH,DL;
        ESI_00:
        mov  AL,[ESI+0];
        cmp  BL,CH;
        jna ESI_XX;
        ESI_01:
        mov  AH,[ESI+1];
        ESI_XX:
        mov  CL,CH;
        mov EDX,0x000000FFL;
        shr  DX,CL;
        mov  CL,BL;
        shr  AX,CL;
        and EAX,EDX;
        mov  CL,BH;
        shl  AX,CL;
        mov EDX,0x0000FF00L;
        rol  DX,CL;
        mov  CL,[EDI];
        and  CL,DL;
        xor  AL,CL;
        EDI_00:
        mov [EDI+0],AL;
        cmp  BH,CH;
        jna EDI_XX;
        EDI_01:
        mov [EDI+1],AH;
        EDI_XX:
//------------------------------------------<< EXITING POINTS
        BIT_XX_BREAK:
        pop EBX;
        pop ECX;
        pop EDX;
        pop ESI;
        pop EDI;
    }
#else
    register size_t bits = a_bits_num;
    register char *src = (char*)a_src_ptr;
    register uint8_t src_bit = asrc_bit;
    register char *dst = (char*)a_dst_ptr;
    register uint8_t dst_bit = adst_bit;
    while (bits>=32) {

        ((int32_t*)dst)[0] = (((int32_t*)dst)[0] && (0xFFFFFFFFL>>(32-dst_bit))) | ((((int32_t*)src)[0]>>src_bit)<<dst_bit) && (0xFFFFFFFFL<<dst_bit);
        dst = &dst[3];
        src = &src[3];
        bits-=24;
    }
    while (bits> 0) {
        dst[0] = (dst[0] && (0xFFL>>dst_bit)) | (((src[0]>>src_bit)<<dst_bit) && (0xFFL<<dst_bit));
        dst = &dst[1];
        src = &dst[1];
        bits-=8;
    }
#endif
}
//---------------------------------------------------------------------------

void __stdcall bit_setex(void *a_dst_ptr, const uint8_t adst_bit, const void *a_src_ptr, const uint8_t asrc_bit, const uint8_t a_src_elsize, const size_t a_dst_count)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
    __asm {
//------------------------------------------
        push EDI;
        push ESI;
        push EDX;
        push ECX;
        push EBX;
        mov ESI,a_src_ptr;
        mov  BH,asrc_bit;
        mov  BL,a_src_elsize;
        xor EAX,EAX;
        xor EDX,EDX;
//-------------------
        MCODE_SS:
        mov  CH,BL;
        shl  CH,3;
        add  CH,BH;
        MCODE_00:
        mov  DL,[ESI+0];
        cmp  CH, 8;
        jbe MSHRD_32;
        MCODE_01:
        mov  DH,[ESI+1];
        cmp  CH,16;
        jbe MSHRD_32;
//-------------------
        shrd EAX,EDX,16;
        xor EDX,EDX;
        MCODE_02:
        mov  DL,[ESI+2];
        cmp  CH,24;
        jbe MSHRD_16;
        MCODE_03:
        mov  DH,[ESI+3];
        cmp  CH,32;
        jbe MSHRD_16;
//-------------------
        shrd EAX,EDX,16;
        xor EDX,EDX;
        MCODE_04:
        mov  DL,[ESI+4];
        jmp MSHRD_00;
        MCODE_XX:
//-------------------
        MSHRD_32:
        shrd EAX,EDX,16;
        xor EDX,EDX;
        MSHRD_16:
        shrd EAX,EDX,16;
        xor EDX,EDX;
        MSHRD_00:
//-------------------
        MPREP:
        mov  CL,BH;
        shrd EAX,EDX,CL;
        mov EDI,a_dst_ptr;
        mov ECX,a_dst_count;
        xor  BH,BH;
//------------------------------------------<< move 8BIT by 8BIT
        cmp EBX,1;
        jne BIT_08_BREAK;
        BIT_08:
        cld;
        rep stosb;
        jmp BIT_XX_BREAK;
//-------------------
        BIT_08_BREAK:
//------------------------------------------<< move 16BIT by 16BIT
        cmp EBX,2;
        jne BIT_16_BREAK;
        BIT_16:
        cld;
        rep stosw;
        jmp BIT_XX_BREAK;
//-------------------
        BIT_16_BREAK:
//------------------------------------------<< move 24BIT by 24BIT
        cmp EBX,3;
        jne BIT_24_BREAK;
        test ECX,ECX;
        jz BIT_XX_BREAK;
        BIT_24:
        stosb;
        ror EAX,8;
        stosw;
        rol EAX,8;
        dec ECX;
        test ECX,ECX;
        jnz BIT_24;
        jmp BIT_XX_BREAK;
//-------------------
        BIT_24_BREAK:
//------------------------------------------<< move 32BIT by 32BIT
        cmp EBX,4;
        jne BIT_32_BREAK;
        BIT_32:
        cld;
        rep stosd;
        jmp BIT_XX_BREAK;
//-------------------
        BIT_32_BREAK:
//------------------------------------------<< return number of bits
        BIT_XX_BREAK:
        pop EBX;
        pop ECX;
        pop EDX;
        pop ESI;
        pop EDI;
    }
#else
assert(0); return;
#endif
}
//---------------------------------------------------------------------------

size_t __stdcall len(char *lpString) {

#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)

asm{

        mov eax,lpString
        pxor mm0,mm0
        pxor mm1,mm1
@@:
        pcmpeqb mm0,[eax+0]
        pcmpeqb mm1,[eax+8]
        packsswb mm0,mm1
        add eax,16
        packsswb mm0,mm0
        movd ecx,mm0
        test ecx,ecx
        je @@
        sub eax,16+1
@@@:
        inc eax
        cmp byte ptr [eax],0
        jne @@@
        sub eax,lpString
        emms

}
#else
return strlen(lpString);
#endif
return 0;
}


size_t __stdcall kmp2(char *StringSource, size_t SourceLength, char* StringPattern, size_t PatternLength, char *ShiftTable)
{
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
asm {

    mov     eax, PatternLength
    push    eax
    mov     eax, SourceLength
    push    eax
    mov     eax, 0FFFFFFFFh
    mov     ebx, ShiftTable
    xor     ecx, ecx
    mov     [ebx+ecx*04h], eax
    mov     esi, StringSource
    mov     edi, StringPattern

    GENERATE_TABLE:

        cmp     ecx, DWORD PTR [esp+04h]
        je      TABLE_FINISHED

    INNER_TABLE_LOOP:

        test    eax, eax
        js      CONTINUE_TABLE
        mov     dl, BYTE PTR [edi+ecx]
        cmp     dl, BYTE PTR [edi+eax]
        je      CONTINUE_TABLE
        mov     eax, [ebx+eax*04h]
        jmp     INNER_TABLE_LOOP

    CONTINUE_TABLE:

        inc     ecx
        inc     eax
        mov     dl, BYTE PTR [edi+ecx]
        cmp     dl, BYTE PTR [edi+eax]
        jne     SHIFTTABLE_VALUE_IS_EAX
        mov     edx, [ebx+eax*04h]
        mov     [ebx+ecx*04h], edx
        jmp     GENERATE_TABLE

    SHIFTTABLE_VALUE_IS_EAX:

        mov     [ebx+ecx*04h], eax
        jmp     GENERATE_TABLE

    TABLE_FINISHED:

    xor     eax, eax
    xor     ecx, ecx

    KMP_SEARCH:

        cmp     eax, DWORD PTR [esp]
        je      KMP_END
        cmp     ecx, DWORD PTR [esp+04h]
        je      KMP_END

    INNER_KMP:

        test    ecx, ecx
        js      KMP_CONTINUE
        mov     dl, BYTE PTR [esi+eax]
        cmp     dl, BYTE PTR [edi+ecx]
        je      KMP_CONTINUE
        mov     ecx, [ebx][ecx*04h]
        jmp     INNER_KMP

    KMP_CONTINUE:

        inc     eax
        inc     ecx
        jmp     KMP_SEARCH

    KMP_END:

        pop     edx
        pop     edx

        cmp     ecx, edx
        jne     STRING_NOT_FOUND

        sub     eax, edx
        ret

    STRING_NOT_FOUND:

        mov     eax, 0FFFFFFFFh
        ret
}
#endif
return 0;
}

size_t __stdcall asciitdec (char *String)
 {
#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
asm {
    mov edx, [esp+4]
    xor eax, eax
    cmp BYTE PTR [edx], 2Eh
    sbb [esp+4], edx
    adc edx, eax
    jmp @F
again:
    lea eax, [eax+4*eax]
    inc edx
    lea eax, [ecx+2*eax-30h]
@F: movzx ecx, BYTE PTR [edx]
    cmp BYTE PTR [edx], 30h
    jns again
    add eax, [esp+4]
    xor eax, [esp+4]
}

#endif
    return 0;
}


size_t __stdcall StrHex2bin(char *lpString) {

#if (__BORLANDC__ > 0x551) & defined (__ASM_OPT__)
asm {
    movq mm0,QWORD PTR [lpString]

    //psubusb  mm0,0x30303030 ; //"0" = 0
    movq mm1,mm0

   // pcmpgtb  mm1,0x09090909 ; //letter?
 //   pand mm1,0x07070707

    psubusb mm0,mm1 ; //fix letters

    movq mm1,mm0         ; //0F0E0D0C0B0A0908
   // pand mm0,0x000F000F ; //0E000C000A000800
   // pand mm1,0x000F000F ; //000F000D000B0009
    psrlq mm0,8          ; //000E000C000A0008

    packuswb mm1,mm1     ; //0F0D0B09
    packuswb mm0,mm0     ; //0E0C0A08
    psllq mm1,4          ; //F0D0B090
    por mm0,mm1          ; //FEDCBA98
    movd eax,mm0         ; //FEDCBA98

    bswap eax            ; //89ABCDEF
    ret
}
#endif
    return 0;
}
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace tsoft,mem
#endif
//---------------------------------------------------------------------------


/*BIT SET MMX
 * //------------------------------------------<< if, there MMX copy Q-7__int8S by Q-7__int8S
  cmp EDX,168		   // 40_INSTR/168b
  jna BIT_MMX_NOT_NEADED
 push EAX
 push EDX
  mov EAX,1
cpuid
 test EDX,0x00800000L   // IS, THERE MMX?
  pop EDX
  pop EAX
    jz BIT_MMX_ABSENT
  xor EAX,EAX
  mov  AL,BL
 movd MM0,EAX
  mov  AL,BH
 movd MM1,EAX
  mov  AL,CH
 movd MM2,EAX
 pxor MM3,MM3
  pcmpeqd MM3,MM3
psrlq MM3,8
//-------------------
  cmp EDX,168
  jmp BIT_MMX_BREAK
BIT_MMX:
  sub EDX,168

 movq MM5,[ESI+0x00L-0]
 movq MM6,[ESI+0x08L-1]
 movq MM7,[ESI+0x10L-2]

psrlq MM5,MM0
 pand MM5,MM3
psllq MM5,MM1
psrlq MM6,MM0
 pand MM6,MM3
psllq MM6,MM1
psrlq MM7,MM0
 pand MM7,MM3
psllq MM7,MM1

 movq MM4,[EDI]
 pand MM4,MM2
  por MM5,MM4
 movq [EDI+0x00L-0],MM5
psrlq MM5,64-8
 pand MM5,MM2
  por MM6,MM5
 movq [EDI+0x80L-1],MM6
psrlq MM6,64-8
 pand MM6,MM2
  por MM7,MM6
 movq [EDI+0x10L-2],MM7

  add ESI,21
  add EDI,21
  cmp EDX,168
    ja BIT_MMX
//-------------------
BIT_MMX_BREAK:
 emms
BIT_MMX_NOT_NEADED:
BIT_MMX_ABSENT:
*/




