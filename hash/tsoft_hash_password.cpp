//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
#include "tsoft_hash_password.h"
//---------------------------------------------------------------------------

__stdcall ts::__password::__password() : text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
}
//---------------------------------------------------------------------------

__stdcall ts::__password::~__password()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
}
//---------------------------------------------------------------------------

__stdcall  ts::__password_text::__password_text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        f_lp_hash_str = ts::cstr::alloc(256);
        ts::mem32::set((void*)f_lp_hash_str,'\0',256);
        f_lp_plain_str = ts::cstr::alloc(256);
        ts::mem32::set((void*)f_lp_plain_str,'\0',256);
        f_size = 0;
}
//---------------------------------------------------------------------------
__stdcall ts::__password_text::~__password_text()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        ts::cstr::free(f_lp_hash_str); ts::cstr::free(f_lp_plain_str);
        f_size = 0;
}
//---------------------------------------------------------------------------

__int8 __stdcall ts::__password_text::size()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        return f_size;
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__password_text::get_hash(void)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        return (const char*)&f_lp_hash_str;
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__password_text::get(void)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        return (const char*)&f_lp_plain_str;
}
//---------------------------------------------------------------------------

void __stdcall ts::__password_text::set(const char *a_user_password)
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        f_size = ts::cstr::len(a_user_password) + 1;
        ts::mem32::mov(f_lp_plain_str, a_user_password, f_size);
        register __int64 kod = 0;
        register __int32 i;
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
__DEBUG_FUNC_CALLED__
#endif
        set(a_user_password);
}
//---------------------------------------------------------------------------

__stdcall ts::__password_text::operator const char* ()
{
#ifdef __DEBUG_PASSWORD_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        return (const char*)&f_lp_hash_str;
}
//---------------------------------------------------------------------------

