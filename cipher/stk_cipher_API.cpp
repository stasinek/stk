//---------------------------------------------------------------------------
// ------ StanisĹaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_cipher_API.h"
#include "stk_cipher_mtf.h"
//---------------------------------------------------------------------------
#include "./../text/stk_cstr_utils.h"
#include "./../io/stk_console.h"
//---------------------------------------------------------------------------

void __stdcall stk::cipher::cript_MTF(void *a_dst_ptr, const uint32_t a_count)
{
#ifdef __DEBUG_CIPHER_API__
__DEBUG_FUNC_CALLED("")
#endif
		__mtf_cipher *mtf = new __mtf_cipher();
		register int8_t *ptrd	  = static_cast<int8_t*> (a_dst_ptr);
		register int8_t *ptrd_end = static_cast<int8_t*> (a_dst_ptr) + size_t(a_count);
//------------------------------------------
		for ( ; ptrd < ptrd_end; ptrd++) {
//------------------------------------------
			ptrd[0] = mtf->encode(ptrd[0]);
//------------------------------------------
		}
//------------------------------------------
		delete mtf;
}
//---------------------------------------------------------------------------

void __stdcall stk::cipher::uncript_MTF(void *a_dst_ptr, const uint32_t a_count)
{
#ifdef __DEBUG_CIPHER_API__
__DEBUG_FUNC_CALLED("")
#endif
		__mtf_cipher *mtf = new __mtf_cipher();
		register int8_t *ptrd	  = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
		register int8_t *ptrd_end = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + size_t(a_count);
//------------------------------------------
		for (; ptrd < ptrd_end; ptrd++) {
//------------------------------------------
			ptrd[0] = mtf->decode(ptrd[0]);
//------------------------------------------
		}
//------------------------------------------
		delete mtf;
}
//---------------------------------------------------------------------------

void __stdcall stk::cipher::cript_XOR(void *a_dst_ptr, const uint32_t a_count, const char *alpHaslo, const uint32_t a_haslo_count)
{
#ifdef __DEBUG_CIPHER_API__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __BORLANDC__
		__asm {
				mov EDI,a_dst_ptr
				mov EDX,EDI
				add EDX,a_count
				cmp EDI,EDX
				jnl cript_XOR_EXIT
				mov ESI,alpHaslo
				mov ECX,a_haslo_count
				add ECX,ESI
				cmp ESI,ECX
				jnl cript_XOR_EXIT
				mov EBX,ESI
				cript_XOR_LOOP:
				mov AL,[ESI]
				xor [EDI],AL
				inc ESI
				cmp ESI,ECX
				jl cript_XOR_PLAIN
				mov ESI,EBX
				cript_XOR_PLAIN:
				inc EDI
				cmp EDI,EDX
				jl cript_XOR_LOOP
				mov ESI,EBX
				cript_XOR_EXIT:
		}
#else
#endif
}
//---------------------------------------------------------------------------

void __stdcall stk::cipher::uncript_XOR(void *a_dst_ptr, const uint32_t a_count, const char *alpHaslo, const uint32_t a_haslo_count)
{
#ifdef __DEBUG_CIPHER_API__
__DEBUG_FUNC_CALLED("")
#endif
		cript_XOR(a_dst_ptr,a_count,alpHaslo,a_haslo_count);
}
//---------------------------------------------------------------------------

void __stdcall stk::cipher::cript_ROT(void *a_dst_ptr,const uint32_t a_count, const uint32_t a_haslo_count)
{
#ifdef __DEBUG_CIPHER_API__
__DEBUG_FUNC_CALLED("")
#endif
		if (a_haslo_count<=1) {
				return;
		}
		short buff_count = a_haslo_count;
		short buff_sq = buff_count * buff_count;
		char *buff_ptr = stk::cstr::alloc(buff_count+1);
		int8_t *ptrd 	  = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr));
		int8_t *ptrd_end  = static_cast<int8_t*> (const_cast<void*>(a_dst_ptr)) + size_t(a_count) - size_t(buff_count);
#ifdef __BORLANDC__
		__asm {
				movzx EAX,buff_count
				movzx EBX,buff_sq
				mov EDI,ptrd
				mov EDX,ptrd_end
				cmp EDI,EDX
				ja cript_ROT_BREAK
				nop
				cript_ROT_main_LOOP:
				xor ECX,ECX
				mov ESI,buff_ptr
				push EDX
				xor EDX,EDX
				cript_ROT_buff_count:
				cript_ROT_sq:
				push EAX
				mov  AL,[EDI+ECX]
				mov [ESI],AL
				pop EAX
				inc ESI
				add  CX,AX
				cmp  CX,BX
				jl cript_ROT_sq
				sub  CX,BX
				inc  DX
				inc  CX
				cmp  DX,AX
				jnae cript_ROT_buff_count
				pop EDX
				mov ESI,buff_ptr
				cld
				movzx ECX,BX
				shr ECX,2
				rep MOVSD
				movzx ECX,BX
				and ECX,3
				rep MOVSB
				cmp EDI,EDX
				jna cript_ROT_main_LOOP
				nop
				cript_ROT_BREAK:
		}
#else
#endif
		stk::cstr::free(buff_ptr);
}
//---------------------------------------------------------------------------

void __stdcall stk::cipher::uncript_ROT(void *a_dst_ptr, const uint32_t a_count, const uint32_t a_haslo_count)
{
#ifdef __DEBUG_CIPHER_API__
__DEBUG_FUNC_CALLED("")
#endif
		cript_ROT(a_dst_ptr,a_count,a_haslo_count);
}
//---------------------------------------------------------------------------
