//---------------------------------------------------------------------------
#ifndef __bitset_h
#define __bitset_h
//---------------------------------------------------------------------------
#include "stk_MAIN.h"
//---------------------------------------------------------------------------
namespace stk { class __bitset {

int32_t *f_bits, f_bits_size;

public:

__stdcall  __bitset(void) {
f_bits_size = 64;
f_bits = new int32_t[f_bits_size];
}
__stdcall ~__bitset(void) {
f_bits_size = 0;
delete f_bits; f_bits = ((void*)0);
}

const bool __stdcall test(int a_bitnum) {
register int32_t r_intnum = a_bitnum>>(3+2), r_relative_bitnum = a_bitnum & 0x0000001FL;
register int32_t r_get_bits = f_bits[r_intnum] >> r_relative_bitnum;
return r_get_bits;
}

const bool __stdcall set(int a_bitnum, bool a_bit) {
register int32_t r_intnum = a_bitnum>>(3+2), r_relative_bitnum = a_bitnum & 0x0000001FL;
register int32_t r_old_bits = f_bits[r_intnum];
register int32_t r_set_bits = 0x00000001L << r_relative_bitnum;
return f_bits[r_intnum] = r_old_bits | r_set_bits;
}

const bool __stdcall clear(int a_bitnum, bool a_bit) {
register int32_t r_intnum = a_bitnum>>(3+2), r_relative_bitnum = a_bitnum & 0x0000001FL;
register int32_t r_old_bits = f_bits[r_intnum];
register int32_t r_clr_bits = 0xFFFFFFFFL ^ (0x00000001L << r_relative_bitnum);
return f_bits[r_intnum] = r_old_bits & r_clr_bits;
}

inline bool __stdcall operator [](int a_bitnum) const {
return __bitset::test(a_bitnum);
}


};
}
//---------------------------------------------------------------------------
#endif
