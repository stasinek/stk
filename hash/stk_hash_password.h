//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_password_H__
#define __stk_password_H__
//---------------------------------------------------------------------------
#include <stk_main.h>
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
class STK_IMPEXP __password_text {
//---------------------------------------------------------------------------
        private:
        uint32_t f_size;
        char *f_lp_hash_str, *f_lp_plain_str;
        public:
                     __stdcall  __password_text();
                     __stdcall ~__password_text();
                     __stdcall operator const char* ();
        void     __stdcall operator= (const char *a_user_password);
        int8_t   __stdcall size();
        const char    *__stdcall get_hash(void);
        const char    *__stdcall get(void);
        void     __stdcall set(const char *a_user_password);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
class __password {
//---------------------------------------------------------------------------
        public:
      __stdcall  __password();
      __stdcall ~__password();
//---------------------------------------------------------------------------
        __password_text text;
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif

