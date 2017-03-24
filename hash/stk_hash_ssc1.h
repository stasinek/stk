//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_ssc1_H
#define __stk_ssc1_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace hash { namespace ssc1 {
//---------------------------------------------------------------------------
extern void __stdcall reset_SSC1(void);
const uint32_t*  __stdcall calc_SSC1(const void *a_data, const uint32_t a_len, const uint32_t a_bits);
extern void __stdcall print_SSC1(void);
//---------------------------------------------------------------------------
}}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------


