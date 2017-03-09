//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../text/tsoft_cstr_utils.h"
#include "./../mem/tsoft_mem.h"
//---------------------------------------------------------------------------
#include "tsoft_hash_password.h"
//---------------------------------------------------------------------------

__stdcall ts::__password::__password() : text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
}
//---------------------------------------------------------------------------

__stdcall ts::__password::~__password()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
}
//---------------------------------------------------------------------------

__stdcall  ts::__password_text::__password_text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        f_lp_hash_str = ts::cstr::alloc(256);
        ts::mem::set((void*)f_lp_hash_str,'\0',256);
        f_lp_plain_str = ts::cstr::alloc(256);
        ts::mem::set((void*)f_lp_plain_str,'\0',256);
        f_size = 0;
}
//---------------------------------------------------------------------------
__stdcall ts::__password_text::~__password_text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        ts::cstr::free(f_lp_hash_str); ts::cstr::free(f_lp_plain_str);
        f_size = 0;
}
//---------------------------------------------------------------------------

int8_t __stdcall ts::__password_text::size()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        return f_size;
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__password_text::get_hash(void)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        return (const char*)&f_lp_hash_str;
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__password_text::get(void)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        return (const char*)&f_lp_plain_str;
}
//---------------------------------------------------------------------------

void __stdcall ts::__password_text::set(const char *a_user_password)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        f_size = ts::cstr::len(a_user_password) + 1;
        ts::mem::mov(f_lp_plain_str, a_user_password, f_size);
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

void  __stdcall ts::__password_text::operator= (const char *a_user_password)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        set(a_user_password);
}
//---------------------------------------------------------------------------

__stdcall ts::__password_text::operator const char* ()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED("")
#endif
        return (const char*)&f_lp_hash_str;
}
//---------------------------------------------------------------------------

