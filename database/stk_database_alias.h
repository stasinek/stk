//---------------------------------------------------------------------------
#ifndef __stk_database_alias_h
#define __stk_database_alias_h
#pragma once
//---------------------------------------------------------------------------
#include "./../text/stk_cstr_class.h"
//---------------------------------------------------------------------------
// alias = database file name, override __cstr_class change text to save to file in future ;)
//
namespace stk {
//---------------------------------------------------------------------------
class __database;
class __database_alias : public stk::__cstr_class {
//-------------------------------
	public:
//-------------------------------
	STK_IMPEXP  __stdcall  __database_alias(void)
	: stk::__cstr_class()
	{}
	STK_IMPEXP  __stdcall  __database_alias(const char *atext)
	: stk::__cstr_class(atext)
	{ }
		STK_IMPEXP  __stdcall ~__database_alias()
	{}
//-------------------------------
	friend class __database;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

