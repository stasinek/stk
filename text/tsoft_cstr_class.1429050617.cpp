//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_text_class.h"
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::__cstr_class(const char* __restrict__ a_text_to_clone)
{
		if (a_text_to_clone==NULL) {
				f_ptr_size = 1;
				f_ptr = ts::cstr::allocex(f_ptr_size + 32,"");
				return;
		}
		else
		{
				f_ptr_size = ts::cstr::len(a_text_to_clone) + 1;
				f_ptr = ts::cstr::allocex(f_ptr_size + 32,a_text_to_clone);
				return;
		}
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::__cstr_class(__int32 a_initial_size)
{
		f_ptr_size = a_initial_size;
		f_ptr = ts::cstr::alloc(f_ptr_size + 32);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::__cstr_class(void)
{
		__cstr_class("");
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::operator= (const char* __restrict__ a_text_to_clone)
{
		set(a_text_to_clone);
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::set(const char* __restrict__ a_text_to_clone)
{
		if (a_text_to_clone==NULL) {
				f_ptr[0] = '\0';
				return;
		}
		else
		{
				register __int32 container_len = ts::cstr::len(a_text_to_clone);
				if (f_ptr_size < container_len + 1) {
						f_ptr = ts::cstr::realloc(f_ptr,container_len + 1);
				}
				ts::cstr::mov(f_ptr, a_text_to_clone);
				return;
		}
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::set(__cstr_class* __restrict__ a_text_c)
{
		set(a_text_c->c_str());
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::set(__int32 a_i_to_clone)
{
		set(ts::cstr::itoa(a_i_to_clone));
}
//---------------------------------------------------------------------------

char *__stdcall ts::__cstr_class::add(const char* __restrict__ a_text_to_clone)
{
		register __int32 add_size = ts::cstr::len(a_text_to_clone) + 1, new_size = ts::cstr::len(f_ptr) + add_size;
		if (new_size > f_ptr_size) resize(new_size);
		return ts::cstr::add(f_ptr,a_text_to_clone);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_class::len(void)
{
		return ts::cstr::len(f_ptr);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_class::c_size(void)
{
		return f_ptr_size;
}

//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::resize(__int32 a_new_size)
{
		f_ptr_size = a_new_size + 1;
		f_ptr = ts::cstr::realloc(f_ptr,f_ptr_size);
}
//---------------------------------------------------------------------------

char *__stdcall ts::__cstr_class::c_str(void)
{
		return f_ptr;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_class::i(void)
{
		return ts::cstr::atoi(f_ptr);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::operator char* () 
{
		return c_str();
}
//---------------------------------------------------------------------------
__stdcall ts::__cstr_class::operator __int32 ()
{
		return i();
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::~__cstr_class() 
{
		if (f_ptr!=NULL) ts::cstr::free(f_ptr);
		f_ptr_size = 0;
}
//---------------------------------------------------------------------------
