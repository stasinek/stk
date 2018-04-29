//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_cipher_pair.h"
//---------------------------------------------------------------------------
#include "./../mem/stk_mem.h"
#include "./../text/stk_cstr_utils.h"
//---------------------------------------------------------------------------

stk::cipher::__pair_cipher::__pair_cipher(void)
{
#ifdef __DEBUG_pair_CIPHER__
__DEBUG_FUNC_CALLED("")
#endif
	order = (uint8_t*)stk::mem::alloc(256*sizeof(uint8_t));
	this->initialize();
}
//---------------------------------------------------------------------------

stk::cipher::__pair_cipher::~__pair_cipher(void)
{
#ifdef __DEBUG_pair_CIPHER__
__DEBUG_FUNC_CALLED("")
#endif
	stk::mem::free(order);
}
//---------------------------------------------------------------------------

void __stdcall stk::cipher::__pair_cipher::initialize(void)
{
#ifdef __DEBUG_pair_CIPHER__
__DEBUG_FUNC_CALLED("")
#endif
	for (uint8_t i = 0;; i++) {
		order[i]=i;
		if (i==255) break;
	}
//------------------------------------------
}
//---------------------------------------------------------------------------

char __stdcall stk::cipher::__pair_cipher::encode(const char a_ch)
{
#ifdef __DEBUG_pair_CIPHER__
__DEBUG_FUNC_CALLED("")
#endif
	register uint8_t l_ch = (uint8_t)a_ch, r = stk::mem::chr(order,l_ch,256);
	stk::mem::ror(order,r);
	return r;
//------------------------------------------
}
//---------------------------------------------------------------------------

char __stdcall stk::cipher::__pair_cipher::decode(const char a_ch)
{
#ifdef __DEBUG_pair_CIPHER__
__DEBUG_FUNC_CALLED("")
#endif
	register uint8_t r = order[(uint8_t)a_ch];
	stk::mem::ror(order,r);
	return r;
//------------------------------------------
}
//-------------------------------THE END-------------------------------------
