//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_base64.h"
//---------------------------------------------------------------------------
#include "./../mem/stk_mem.h"
#include "./../text/stk_cstr_utils.h"
//---------------------------------------------------------------------------

size_t __stdcall stk::cipher::char2base64(char *Z, int s, char *out)
    {
        int L = s;
        char *oo;
        __base64_encoder<char*,char*>e;
        oo = e.Filter(out, Z, Z + L);
        oo = e.Finish(oo);
        *oo = 0;                     // Put a zero to the end
        return strlen(out);
    }

int __stdcall stk::cipher::base642char(char *Z, int s, char *out)
    {
        if (s == -1)
        s = (int)strlen(Z);
        int L = s;
        char *oo;
        __base64_decoder<char*,char*>e;
        oo = e.Filter(out, Z, Z + L);
        oo = e.Finish(oo);
        *oo = 0;                     // Put a zero to the end
        return (oo - out);
    }


stk::cipher::__base64::__base64(void)
{
#ifdef __DEBUG_BASE64__
__DEBUG_CALLED("")
#endif
        order = (uint8_t*)stk::mem::alloc(256*sizeof(uint8_t));
        this->initialize();
}
//---------------------------------------------------------------------------

stk::cipher::__base64::~__base64(void)
{
#ifdef __DEBUG_BASE64__
__DEBUG_CALLED("")
#endif
        stk::mem::free(order);
}
//---------------------------------------------------------------------------

void __stdcall stk::cipher::__base64::initialize(void)
{
#ifdef __DEBUG_BASE64__
__DEBUG_CALLED("")
#endif
        for (uint8_t i = 0;; i++) {
                order[i]=i;
                if (i==255) break;
        }
//------------------------------------------
}
//---------------------------------------------------------------------------

char __stdcall stk::cipher::__base64::encode(const char a_ch)
{
#ifdef __DEBUG_BASE64__
__DEBUG_CALLED("")
#endif
        register uint8_t l_ch = (uint8_t)a_ch, r = stk::mem::chr(order,l_ch,256);
        stk::mem::ror(order,r);
        return r;
//------------------------------------------
}
//---------------------------------------------------------------------------

char __stdcall stk::cipher::__base64::decode(const char a_ch)
{
#ifdef __DEBUG_BASE64__
__DEBUG_CALLED("")
#endif
        register uint8_t r = order[(uint8_t)a_ch];
        stk::mem::ror(order,r);
        return r;
//------------------------------------------
}
//-------------------------------THE END-------------------------------------
