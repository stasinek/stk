//---------------------------------------------------------------------------
#ifndef __tsoft_md5_H__
#define __tsoft_md5_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace hash { namespace md5 {
//---------------------------------------------------------------------------
extern void __stdcall reset_MD5(void);
extern const uint32_t *__stdcall calc_MD5(const char *initial_msg, const __int32 initial_len);
//---------------------------------------------------------------------------
}}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
