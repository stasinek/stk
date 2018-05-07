//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_password_H
#define __stk_password_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
class __password_text {
//---------------------------------------------------------------------------
		private:
		uint32_t f_size;
		char *f_lp_hash_str, *f_lp_plain_str;
		public:
				   STK_IMPEXP  __stdcall  __password_text();
				   STK_IMPEXP  __stdcall ~__password_text();
				   STK_IMPEXP  __stdcall operator const char* ();
		void   STK_IMPEXP  __stdcall operator= (const char *a_user_password);
		int8_t STK_IMPEXP  __stdcall size();
		const char   STK_IMPEXP *__stdcall get_hash(void);
		const char   STK_IMPEXP *__stdcall get(void);
		void   STK_IMPEXP  __stdcall set(const char *a_user_password);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
class __password {
//---------------------------------------------------------------------------
		public:
	STK_IMPEXP  __stdcall  __password();
	STK_IMPEXP  __stdcall ~__password();
//---------------------------------------------------------------------------
		__password_text text;
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif

