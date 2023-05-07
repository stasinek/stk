//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_cipher_pair_h__
#define __stk_cipher_pair_h__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace cipher {
//---------------------------------------------------------------------------
class  STK_IMPEXP __pair_cipher {
private:
//---------------------------------------------------------------------------
        uint8_t  *order;
//---------------------------------------------------------------------------
public:
//---------------------------------------------------------------------------
        __pair_cipher(void);
       ~__pair_cipher(void);
//---------------------------------------------------------------------------
        void   __stdcall  initialize(void);
//---------------------------------------------------------------------------
        char   __stdcall  encode(const char a_ch);
        char   __stdcall  decode(const char a_ch);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------
