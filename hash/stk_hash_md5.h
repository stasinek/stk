//---------------------------------------------------------------------------
#ifndef __stk_md5_H
#define __stk_md5_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace hash { namespace md5 {
//---------------------------------------------------------------------------
extern STK_IMPEXP void              __stdcall reset_MD5(void);
extern STK_IMPEXP const uint32_t   *__stdcall calc_MD5(const char *initial_msg, const uint32_t initial_len);
//---------------------------------------------------------------------------
}}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
