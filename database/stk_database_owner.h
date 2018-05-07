//---------------------------------------------------------------------------
#ifndef __stk_database_owner_h
#define __stk_database_owner_h
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_MAIN.h"
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
class __database;
class __database_owner {
//---------------------------------------------------------------------------
		protected:
//------------------------------------
				__database *f_owner;
//------------------------------------
		public:
//------------------------------------
												   STK_IMPEXP  __stdcall __database_owner(const __database *a_owner);
												   STK_IMPEXP  __stdcall __database_owner(void);
				void						   STK_IMPEXP  __stdcall operator= (const __database *i);
				void						   STK_IMPEXP  __stdcall set(const __database *i);
												   STK_IMPEXP  __stdcall operator __database* ();
												   __database  STK_IMPEXP *__stdcall get(void);
												   STK_IMPEXP  __stdcall ~__database_owner(void);
//------------------------------------
				friend __database;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

