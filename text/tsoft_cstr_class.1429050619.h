//---------------------------------------------------------------------------
#ifndef __tsoft_text_c_H__
#define __tsoft_text_c_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "./../text/tsoft_text_manipulation.h"
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
namespace ts { namespace text {
//---------------------------------------------------------------------------
class __cstr_class {
//---------------------------------------------------------------------------
	protected:
//-------------------------------
		char *f_ptr; __int32 f_ptr_size;
//-------------------------------
	public:
//-------------------------------
				  __stdcall __cstr_class(void);
				  __stdcall __cstr_class(const char* __restrict__ a_c_to_clone);
				  __stdcall __cstr_class(__int32 a_initial_size);
		void  __stdcall set(__cstr_class* __restrict__ a_text_c_to_clone);
		void  __stdcall set(const char* __restrict__ a_c_to_clone);
		void  __stdcall set(__int32 a_int);
		char *__stdcall add(const char* __restrict__ a_c_to_add);
		__int32  __stdcall c_size(void);
		__int32  __stdcall len(void);
		void  __stdcall resize(__int32 a_new_size);
		char *__stdcall c_str(void);
		__int32 __stdcall i(void);
				  __stdcall operator char* ();
				  __stdcall operator __int32 ();
		void  __stdcall operator= (const char* __restrict__ a_c_to_clone);
		void  __stdcall operator= (__int32 a_i_to_clone);
				  __stdcall ~__cstr_class();
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif

