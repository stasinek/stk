//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
    #pragma hdrstop
#endif
#include "./../text/stk_cstr_utils.h"
#include "./../mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_hash_password.h"
//---------------------------------------------------------------------------

__stdcall stk::__password::__password() : text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
}
//---------------------------------------------------------------------------

__stdcall stk::__password::~__password()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
}
//---------------------------------------------------------------------------

__stdcall  stk::__password_text::__password_text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        f_lp_hash_str = stk::cstr::alloc(256);
        stk::mem::set((void*)f_lp_hash_str,'\0',256);
        f_lp_plain_str = stk::cstr::alloc(256);
        stk::mem::set((void*)f_lp_plain_str,'\0',256);
        f_size = 0;
}
//---------------------------------------------------------------------------
__stdcall stk::__password_text::~__password_text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        stk::cstr::free(f_lp_hash_str); stk::cstr::free(f_lp_plain_str);
        f_size = 0;
}
//---------------------------------------------------------------------------

int8_t __stdcall stk::__password_text::size()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        return f_size;
}
//---------------------------------------------------------------------------

const char *__stdcall stk::__password_text::get_hash(void)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        return (const char*)&f_lp_hash_str;
}
//---------------------------------------------------------------------------

const char *__stdcall stk::__password_text::get(void)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        return (const char*)&f_lp_plain_str;
}
//---------------------------------------------------------------------------

void __stdcall stk::__password_text::set(const char *a_user_password)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        f_size = stk::cstr::len(a_user_password) + 1;
        stk::mem::mov(f_lp_plain_str, a_user_password, f_size);
        register int64_t kod = 0;
        register int32_t i;
        if (size() > 0) {
                for (i = size()-1;; i--) {
                        kod +=f_lp_plain_str[i];
                        if (i==0) break;
                }
        }
        if (size() > 0) {
                for (i = size()-1;; i--) {
                        f_lp_hash_str[i] = f_lp_plain_str[i] ^ (kod % (i+1)) ^ i;
                        if (i==0) break;
                }
        }
}
//---------------------------------------------------------------------------

void  __stdcall stk::__password_text::operator= (const char *a_user_password)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        set(a_user_password);
}
//---------------------------------------------------------------------------

__stdcall stk::__password_text::operator const char* ()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_CALLED("")
#endif
        return (const char*)&f_lp_hash_str;
}
//---------------------------------------------------------------------------

