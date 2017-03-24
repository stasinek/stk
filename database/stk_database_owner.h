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
												   __stdcall __database_owner(const __database *a_owner);
												   __stdcall __database_owner(void);
				void						   __stdcall operator= (const __database *i);
				void						   __stdcall set(const __database *i);
												   __stdcall operator __database* ();
												   __database *__stdcall get(void);
												   __stdcall ~__database_owner(void);
//------------------------------------
				friend __database;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

