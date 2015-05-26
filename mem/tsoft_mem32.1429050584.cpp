//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_mem32.h"
//---------------------------------------------------------------------------
#include <string.h>
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::alloc(uint32_t a_count)
{
		return (void*)::malloc(a_count);
}
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::realloc(void *alpdst,uint32_t a_count)
{
		return (void*)::realloc(alpdst,a_count);
}
//---------------------------------------------------------------------------

void __stdcall ts::mem32::free(void *alpdst)
{
		::free(alpdst);
}
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::rev(void *alpdst,const void *a_src_ptr,uint32_t a_count)
{
#ifdef BCC
	__asm {
		mov ESI,a_src_ptr
		mov EDI,alpdst
		mov ECX,EDI
		add EDI,a_count
		dec EDI
		cmp EDI,ECX
		jle ptrrev_EXIT
		ptrrev_LOOP:
		mov  AL,[ESI]
		inc ESI
		mov [EDI],AL
		dec EDI
		cmp EDI,ECX
		jnl ptrrev_LOOP
		ptrrev_EXIT:
	}
	return alpdst;
#else
	register char ti, tj;
		register __int32 i,j;
	for ( i = (a_count>>1), j = 0; i > 0; i--, j++) {
		ti = ((char*)a_src_ptr)[i];
		tj = ((char*)a_src_ptr)[j];
		((char*)alpdst)[j] = ti;
		((char*)alpdst)[i] = tj;
	}
	return alpdst;
#endif
}
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::mov(void *alpdst,const void *a_src_ptr,uint32_t a_count)
{
#ifdef BCC
	__asm {
		mov ESI,a_src_ptr
		mov EDI,alpdst
		mov ECX,a_count
		mov EAX,ECX
		cmp EDI,ESI
		jb  ptrmovINC
		jz  ptrmovX
		ptrmovDEC:
		lea ESI,[ESI+ECX-1]
		lea EDI,[EDI+ECX-1]
		and ECX,3
		std
		rep MOVSB
		mov ECX,EAX
		shr ECX,2
		sub ESI,3
		sub EDI,3
		rep MOVSD
		cld
		jmp ptrmovX
		ptrmovINC:
		shr ECX,2
		cld
		rep MOVSD
		mov ECX,EAX
		and ECX,3
		rep MOVSB
		ptrmovX:
	}
	return alpdst;
#else
	memmove(alpdst,a_src_ptr,a_count);
	return alpdst;
#endif
}
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::set(void *alpdst, char aznakb,uint32_t a_count)
{
#ifdef BCC
	__asm {
		mov EDI,alpdst
		mov ECX,a_count
		mov  AL,aznakb
		cld
		rep STOSB
	}
	return alpdst;
#else
	memset(alpdst,aznakb,a_count);
	return alpdst;
#endif
}
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::setex(void *alpdst, const void *a_src_ptr, uint32_t a_count, __int8 aesize)
{
#ifdef BCC
	__asm {
		xor EAX,EAX
		xor EBX,EBX
		xor EDX,EDX
		mov ESI,a_src_ptr
		mov  BL,aesize
//-------------------
		MCODE_00:
//-------------------
		mov  AL,[ESI+0]
		cmp  BL, 1
		jbe MCODE_XX
//-------------------
		MCODE_01:
//-------------------
		mov  AH,[ESI+1]
		cmp  BL, 2
		jbe MCODE_XX
//-------------------
		MCODE_02:
//-------------------
		bswap EAX
		mov  AH,[ESI+2]
		bswap EAX
		cmp  BL, 3
		jbe MCODE_XX
//-------------------
		MCODE_03:
//-------------------
		bswap EAX
		mov  AL,[ESI+3]
		bswap EAX
//-------------------
		MCODE_XX:
//------------------------------------------<< prepare
		MPREP:
		mov EDI,alpdst
		mov ECX,a_count
//------------------------------------------<< move  8BIT
		cmp  BL,1
		jne BIT_08_BREAK
		BIT_08:
		cld
		rep stosb
		jmp BIT_XX_BREAK
//-------------------
		BIT_08_BREAK:
//------------------------------------------<< move 16BIT
		cmp  BL,2
		jne BIT_16_BREAK
		BIT_16:
		cld
		rep stosw
		jmp BIT_XX_BREAK
//-------------------
		BIT_16_BREAK:
//------------------------------------------<< move 24BIT
		cmp  BL,3
		jne BIT_24_BREAK
		test ECX,ECX
		jz BIT_XX_BREAK
		BIT_24:
		stosb
		ror EAX,8
		stosw
		rol EAX,8
		dec ECX
		test ECX,ECX
		jnz BIT_24
		jmp BIT_XX_BREAK
//-------------------
		BIT_24_BREAK:
//------------------------------------------<< move 32BIT
		cmp  BL,4
		jne BIT_32_BREAK
		BIT_32:
		cld
		rep stosd
		jmp BIT_XX_BREAK
//-------------------
		BIT_32_BREAK:
//------------------------------------------<< move FINISH
		BIT_XX_BREAK:
	}
	return alpdst;
#else
		for (register __int32 i = a_count, j = 0; i > 0; i--, j++) {
				for (register __int32  e = aesize, f = 0; e > 0; e--, f++) ((char*)alpdst)[j+f] = ((char*)a_src_ptr)[f];
	}
	return alpdst;
#endif
}
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::shl(void *alpdst,uint32_t a_count)
{
#ifdef BCC
	__asm {
		mov ECX,a_count
		mov EAX,ECX
		mov ESI,alpdst
		inc ESI
		mov EDI,alpdst
		shr ECX,2
		cld
		rep MOVSD
		mov ECX,EAX
		and ECX,3
		rep MOVSB
	}
	return alpdst;
#else
	register __int32 i = a_count, *j = (__int32*)alpdst;
	for (; i >= 5; i-=4) {
				j[0] = ((__int32*)((__int32)j+1))[0];
				j = ((__int32*)((__int32)j+sizeof(__int32*)));
	}
	register __int8 *k = (__int8*)j;
	for (; i >= 2; i-=1) {
				k[0] = ((__int8*)((__int32)k+1))[0];
				k = ((__int8*)((__int32)k+sizeof(__int8*)));
	}
	return alpdst;
#endif
}
//---------------------------------------------------------------------------

void *__stdcall ts::mem32::shr(void *alpdst,uint32_t a_count)
{
#ifdef BCC
	__asm {
		mov ESI,alpdst
		mov EDI,alpdst
		mov ECX,a_count
		mov EAX,ECX
		inc EDI
		lea ESI,[ESI+ECX-1]
		lea EDI,[EDI+ECX-1]
		and ECX,3
		std
		rep MOVSB
		mov ECX,EAX
		shr ECX,2
		sub ESI,3
		sub EDI,3
		rep MOVSD
		cld
	}
	return alpdst;
#else
		memmove(alpdst,(void*)((__int32)alpdst+1),a_count);
	return alpdst;
#endif
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::mem32::cmp(const void *alp1, const void *alp2, const uint32_t a_count)
{
#ifdef BCC
	__asm {
				mov ESI,alp1
				mov EDI,alp2
		mov ECX,a_count
		mov EAX,ECX
		shr ECX,2
		cld
		repe cmpsd
		je ptrcmp_D
		shl ECX,2
		add ECX,4
		sub ESI,4
		sub EDI,4
		sub EAX,ECX
		ptrcmp_D:
		mov ECX,EAX
		and ECX,3
		repe cmpsb
		je ptrcmp_B
		inc ECX
		sub EAX,ECX
		ptrcmp_B:
	}
#else
		return memcmp(alp1,alp2,a_count);
#endif
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::mem32::sca(const void *alpdst, const char aznakb, const uint32_t a_count)
{
#ifdef BCC
	__asm {
		mov  AL,aznakb
		mov ECX,a_count
		mov EDX,ECX
		mov EDI,alpdst
		cld
		repe SCASB
		jnz ptrsca_DIF
		mov EAX,EDX
		jmp ptrsca_BREAK
		ptrsca_DIF:
		inc ECX
		mov EAX,EDX
		sub EAX,ECX
		ptrsca_BREAK:
	}
#else
	register __int32 i = a_count;
	register __int8 *k = (__int8*)alpdst + i - 1;
	for (; i >= 1; i-=1) {
		if (k[i - 1]==aznakb) break;
				k = ((__int8*)((__int32)k-sizeof(__int8*)));
	}
	if (i==0) return a_count;
	else return i - 1;
#endif
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::mem32::chr(const void *alpdst,char aznakb,uint32_t a_count)
{
#ifdef BCC
	__asm {
		mov  AL,aznakb
		mov ECX,a_count
		mov EDX,ECX
		mov EDI,alpdst
		cld
		repne SCASB
		je ptrchrDIF
		mov EAX,0xFFFFFFFFL
		jmp ptrchrBREAK
		ptrchrDIF:
		inc ECX
		mov EAX,EDX
		sub EAX,ECX
		ptrchrBREAK:
	}
#else
	register __int32  i = (__int32)memchr(alpdst,aznakb,a_count);
	if (i==0) return -1;
	else return (__int32)alpdst - (__int32)i;
#endif
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::mem32::pos(const char *a_src_ptr, const __int32 asrc_size, const __int32 abegin, const char *alpfnd, const __int32 afnd_size)
{
#ifdef BCC
	__int32 src_size = asrc_size, fnd_size = afnd_size;
	__asm {
//------------------------------------------
		mov EDX,fnd_size
		cmp EDX,0
		jle strPosERROR
//-----------------
		mov ECX,src_size
		cmp ECX,0
		jle strPosERROR
//-----------------
		mov EBX,abegin
		mov EAX,EBX
		add EAX,EDX
		cmp ECX,EAX
		jl strPosERROR
//-----------------
		dec EDX
//------------------------------------------
		strPosDO:
//------------------------------------------
		mov ESI,alpfnd
		mov EDI,a_src_ptr
		mov AL,[ESI]
		cmp AL,[EDI+EBX]
		jne strPosNEXT
		add EDI,EBX
		mov ECX,fnd_size
		cld
		repe CMPSB
		je  strPosFOUND
//-----------------
		strPosNEXT:
//-----------------
		inc EBX
		mov EAX,EBX
		add EAX,EDX
		cmp EAX,src_size
		jl strPosDO
		jmp strPosERROR
//------------------------------------------
		strPosFOUND:
		mov EAX,EBX
		jmp strPosBREAK
		strPosERROR:
		mov EAX,-1
		jmp strPosBREAK
		strPosBREAK:
//------------------------------------------
	}
// return EAX
#else
	if (abegin > asrc_size)
		return -1;
	register __int32 isrc_size  = asrc_size - abegin;
	register __int32 isrc = 0;
	register __int32 ifnd_size  = afnd_size;
	register __int32 ifnd = 0;
	if (ifnd_size > isrc_size)
		return -1;
	register __int32 imax_start = isrc_size - ifnd_size;
		register char *src = &((char*)a_src_ptr)[abegin];
		register char *fnd = &((char*)alpfnd)[0];
	for ( ; isrc <= imax_start; isrc++, src = &src[1]) {
		for (;;) {
			if (src[ifnd]!=fnd[ifnd])
				break;
			if (++ifnd >= ifnd_size)  return abegin + isrc;
		}
	}
	return -1;
#endif
}
//---------------------------------------------------------------------------

#ifdef BCC32
__int32 __stdcall ts::mem32::findlast(const char *a_src_ptr, const __int32 asrc_min, const __int32 asrc_size, const char *alpfnd,const  __int32 aco_size)
{
// metoda Boyera-Moroe
	if (asrc_min+aco_size > asrc_size || aco_size<=0 || asrc_size<=0)
		return -1;
	static __int32 ret_i,*lpret_i=&ret_i;
		static __int8 shift[0x0100L],*lpshift=&shift[0];
	if (aco_size>0xFFL) {
				ts::mem32::set(&shift,0x0100L,0xFFL);
		for (__int32 i=0xFFL-1; i >= 0; i--) {
						shift[ alpfnd[i] ]=(__int8)i;
		}
	} else {
				ts::mem32::set(&shift,0x0100L,aco_size);
		for (__int32 i=aco_size-1; i >= 0; i--) {
						shift[ alpfnd[i] ]=(__int8)i;
		}
	}
#ifdef BCC
	__asm {
		mov EDX,lpshift
		mov EAX,asrc_size
		sub EAX,aco_size
		cmp EAX,asrc_min
		jl  ptrfindlastX
		ptrfindlastFIRST:
		xor EBX,EBX
		xor ECX,ECX
		mov ESI,a_src_ptr
		mov EDI,alpfnd
		ptrfindlastDO:
		mov BL,[ESI+EAX]
		cmp BL,[EDI+0]
		je  ptrfindlastCHECK
		mov CL,[EDX+EBX]
		sub EAX,ECX
		cmp EAX,asrc_min
		jnl ptrfindlastDO

		jmp ptrfindlastX
		ptrfindlastCHECK:
		add ESI,EAX
		mov ECX,aco_size
		cld
		repe CMPSB
		jne ptrfindlastNEXT
		mov  EDI ,lpret_i
		mov [EDI],EAX
		jmp ptrfindlastEQL
		ptrfindlastNEXT:
		dec EAX
		cmp EAX,asrc_min
		jnl ptrfindlastFIRST

		jmp ptrfindlastX
	}
	ptrfindlastEQL:
	return ret_i;
	ptrfindlastX:
	return -1;
#else
	return -1;
#endif
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::mem32::find(const char *a_src_ptr, const __int32 asrc_min, __int32 asrc_size, const char *alpfnd, const __int32 aco_size)
{
// metoda Boyera-Moroe
	if (asrc_min+aco_size > asrc_size || aco_size<=0 || asrc_size<=0)
		return -1;
	static __int32 ret_i,*lpret_i=&ret_i;
		static __int8 shift[0x0100L],*lpshift=&shift[0];
	if (aco_size>0xFFL) {
				ts::mem32::set(&shift,0x0100L,0xFFL);
		for (__int32 i=aco_size-0x0100L,ic=0x0100L; i < aco_size; i++,ic--) {
						shift[ alpfnd[i] ]=(__int8)(ic-1);
		}
	} else {
		ptrset(&shift,0x0100L,aco_size);
		for (__int32 i=0,ic=aco_size; i < aco_size; i++,ic--) {
						shift[ alpfnd[i] ]=(__int8)(ic-1);
		}
	}
#ifdef BCC
	__asm {
		mov EDX,aco_size
		dec EDX
		mov EAX,asrc_min
		add EAX,EDX
		cmp EAX,asrc_size
		jnl ptrfndX
		ptrfndFIRST:
		xor EBX,EBX
		xor ECX,ECX
		mov ESI,a_src_ptr
		mov EDI,alpfnd
		ptrfndDO:
		mov BL,[ESI+EAX]
		cmp BL,[EDI+EDX]
		je  ptrfndCMP
		mov ECX,lpshift
		mov CL,[ECX+EBX]
		and ECX,0xFFL
		add EAX,ECX
		cmp EAX,asrc_size
		jl ptrfndFIRST
		jmp ptrfndX
		ptrfndCMP:
		add ESI,EAX
		mov ECX,aco_size
		sub ESI,ECX
		dec ESI
		repe CMPSB
		jne ptrfndNEXT
		sub EAX,EDX
		mov EDI,lpret_i
		mov [EDI],EAX
		jmp ptrfndEQL
		ptrfndNEXT:
		inc EAX
		cmp EAX,asrc_size
		jl  ptrfndFIRST
		jmp ptrfndX
	}
	ptrfndEQL:
	return ret_i;
	ptrfndX:
	return -1;
#else
	return -1;
#endif
}
#else
#endif
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

void __stdcall ts::mem32::bit_mov(void *alpdst, const char adst_bit, const void *a_src_ptr, const char asrc_bit, const __int32 abits_num)
{
#ifdef BCC32
	__asm {
//------------------------------------------
		mov  BL,asrc_bit
		mov ESI,a_src_ptr
		mov  BH,adst_bit
		mov EDI,alpdst
		mov EDX,abit_num
//------------------------------------------<< can just move?
		cmp  BX,0
		jnz BIT_REP_BREAK
		cmp EDX,8
		jb BIT_REP_01
		BIT_REP_32:
		mov ECX,EDX
		shr ECX,5
		cld
		rep MOVSD
		mov ECX,EDX
		shr ECX,3
		and ECX,3
		rep MOVSB
		BIT_REP_01:
		and  DL,8-1
		jz BIT_XX_BREAK
		mov  CL,DL
		mov  AX,0xFF00
		rol  AX,CL
		mov  BL,[ESI]
		and  AL,BL
		mov  [EDI],AL
		jmp BIT_XX_BREAK
//-------------------
		BIT_REP_BREAK:
//------------------------------------------<< make dst existing bits mask
		mov  CL,BH
		mov  CH,0x01
		shl  CH,CL
		dec  CH
//------------------------------------------<< move 24BIT by 24BIT
		cmp EDX,24
		jbe BIT_24_BREAK
		BIT_24_LOOP:
		sub EDX,24

		mov EAX,[ESI+0]
		mov  CL,BL
		shr EAX,CL
		and EAX,0x00FFFFFF
		mov  CL,BH
		shl EAX,CL
		mov  CL,[EDI+0]
		and  CL,CH
		xor  AL,CL
		mov [EDI+0],EAX

		add ESI, 3
		add EDI, 3
		cmp EDX,24
		ja BIT_24_LOOP
//-------------------
		BIT_24_BREAK:
//------------------------------------------<< move 8BIT by 8BIT
		cmp EDX,8
		jbe BIT_08_BREAK
		BIT_08_LOOP:
		sub EDX,8

		mov  AX,[ESI+0]
		mov  CL,BL
		shr  AX,CL
		and  AX,0x00FF
		mov  CL,BH
		shl  AX,CL
		mov  CL,[EDI+0]
		and  CL,CH
		xor  AL,CL
		mov  [EDI+0],AX

		add ESI, 1
		add EDI, 1
		cmp EDX, 8
		ja BIT_08_LOOP
//-------------------
		BIT_08_BREAK:
//------------------------------------------<< move remained BITS
		cmp EDX,0
		jna BIT_XX_BREAK
		BIT_XX:
		mov  CH,0x08
		sub  CH,DL
		ESI_00:
		mov  AL,[ESI+0]
		cmp  BL,CH
		jna ESI_XX
		ESI_01:
		mov  AH,[ESI+1]
		ESI_XX:
		mov  CL,CH
		mov EDX,0x000000FF
		shr  DX,CL
		mov  CL,BL
		shr  AX,CL
		and EAX,EDX
		mov  CL,BH
		shl  AX,CL
		mov EDX,0x0000FF00
		rol  DX,CL
		mov  CL,[EDI]
		and  CL,DL
		xor  AL,CL
		EDI_00:
		mov [EDI+0],AL
		cmp  BH,CH
		jna EDI_XX
		EDI_01:
		mov [EDI+1],AH
		EDI_XX:
//------------------------------------------<< EXITING POINTS
		BIT_XX_BREAK:
	}
#else
	register __int32 bits = abits_num;
	register __int8 *src = (char*)a_src_ptr;
	register __int8 src_bit = asrc_bit;
	register __int8 *dst = (char*)alpdst;
	register __int8 dst_bit = adst_bit;
	while (bits>=32) {
		((__int32*)dst)[0] = (((__int32*)dst)[0] && (0xFFFFFFFF>>(32-dst_bit))) | ((((__int32*)src)[0]>>src_bit)<<dst_bit) && (0xFFFFFFFF<<dst_bit);
		dst = &dst[3];
		src = &src[3];
		bits-=24;
	}
	while (bits> 0) {
		dst[0] = (dst[0] && (0xFF>>dst_bit)) | (((src[0]>>src_bit)<<dst_bit) && (0xFF<<dst_bit));
		dst = &dst[1];
		src = &dst[1];
		bits-=8;
	}
#endif
}
//---------------------------------------------------------------------------

void __stdcall ts::mem32::bit_set(void *alpdst,const void *a_src_ptr,const char asrc_bit,const char asrc_elsize,const __int32 adst_count)
{
#ifdef BCC
	__asm {
//------------------------------------------
		mov ESI,a_src_ptr
		mov  BH,asrc_bit
		mov  BL,asrc_elsize
		xor EAX,EAX
		xor EDX,EDX
//-------------------
		MCODE_SS:
		mov  CH,BL
		shl  CH,3
		add  CH,BH
		MCODE_00:
		mov  DL,[ESI+0]
		cmp  CH, 8
		jbe MSHRD_32
		MCODE_01:
		mov  DH,[ESI+1]
		cmp  CH,16
		jbe MSHRD_32
//-------------------
		shrd EAX,EDX,16
		xor EDX,EDX
		MCODE_02:
		mov  DL,[ESI+2]
		cmp  CH,24
		jbe MSHRD_16
		MCODE_03:
		mov  DH,[ESI+3]
		cmp  CH,32
		jbe MSHRD_16
//-------------------
		shrd EAX,EDX,16
		xor EDX,EDX
		MCODE_04:
		mov  DL,[ESI+4]
		jmp MSHRD_00
		MCODE_XX:
//-------------------
		MSHRD_32:
		shrd EAX,EDX,16
		xor EDX,EDX
		MSHRD_16:
		shrd EAX,EDX,16
		xor EDX,EDX
		MSHRD_00:
//-------------------
		MPREP:
		mov  CL,BH
		shrd EAX,EDX,CL
		mov EDI,alpdst
		mov ECX,adst_count
		xor  BH,BH
//------------------------------------------<< move 8BIT by 8BIT
		cmp EBX,1
		jne BIT_08_BREAK
		BIT_08:
		cld
		rep stosb
		jmp BIT_XX_BREAK
//-------------------
		BIT_08_BREAK:
//------------------------------------------<< move 16BIT by 16BIT
		cmp EBX,2
		jne BIT_16_BREAK
		BIT_16:
		cld
		rep stosw
		jmp BIT_XX_BREAK
//-------------------
		BIT_16_BREAK:
//------------------------------------------<< move 24BIT by 24BIT
		cmp EBX,3
		jne BIT_24_BREAK
		test ECX,ECX
		jz BIT_XX_BREAK
		BIT_24:
		stosb
		ror EAX,8
		stosw
		rol EAX,8
		dec ECX
		test ECX,ECX
		jnz BIT_24
		jmp BIT_XX_BREAK
//-------------------
		BIT_24_BREAK:
//------------------------------------------<< move 32BIT by 32BIT
		cmp EBX,4
		jne BIT_32_BREAK
		BIT_32:
		cld
		rep stosd
		jmp BIT_XX_BREAK
//-------------------
		BIT_32_BREAK:
//------------------------------------------<< return number of bits
		BIT_XX_BREAK:
	}
#else
#endif
}



/*
ts::mem32::c_MMX:
 cmp EAX,32
 jle ts::mem32::c_MMX_BREAK
 sub EAX,32
movq mm0,[ESI]
movq mm1,[ESI+8]
movq mm2,[ESI+8+8]
movq mm3,[ESI+8+8+8]
 add ESI,32
movq [EDI],mm0
movq [EDI+8],mm1
movq [EDI+8+8],mm2
movq [EDI+8+8+8],mm3
 add EDI,32
 jmp ts::mem32::c_MMX
ts::mem32::c_MMX_BREAK:
emms
*/
/*//------------------------------------------<< if, there MMX copy Q-7__int8S by Q-7__int8S
  cmp EDX,168		   // 40_INSTR/168b
  jna BIT_MMX_NOT_NEADED
 push EAX
 push EDX
  mov EAX,1
cpuid
 test EDX,0x00800000   // IS, THERE MMX?
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

 movq MM5,[ESI+0x00-0]
 movq MM6,[ESI+0x08-1]
 movq MM7,[ESI+0x10-2]

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
 movq [EDI+0x00-0],MM5
psrlq MM5,64-8
 pand MM5,MM2
  por MM6,MM5
 movq [EDI+0x80-1],MM6
psrlq MM6,64-8
 pand MM6,MM2
  por MM7,MM6
 movq [EDI+0x10-2],MM7

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


