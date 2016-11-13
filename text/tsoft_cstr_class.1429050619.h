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
		char *f_ptr; int32_t f_ptr_size;
//-------------------------------
	public:
//-------------------------------
				  __stdcall __cstr_class(void);
				  __stdcall __cstr_class(const char* __restrict__ a_c_to_clone);
				  __stdcall __cstr_class(int32_t a_initial_size);
		void  __stdcall set(__cstr_class* __restrict__ a_text_c_to_clone);
		void  __stdcall set(const char* __restrict__ a_c_to_clone);
		void  __stdcall set(int32_t a_int);
		char *__stdcall add(const char* __restrict__ a_c_to_add);
		int32_t  __stdcall c_size(void);
		int32_t  __stdcall len(void);
		void  __stdcall resize(int32_t a_new_size);
		char *__stdcall c_str(void);
		int32_t __stdcall i(void);
				  __stdcall operator char* ();
				  __stdcall operator int32_t ();
		void  __stdcall operator= (const char* __restrict__ a_c_to_clone);
		void  __stdcall operator= (int32_t a_i_to_clone);
				  __stdcall ~__cstr_class();
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif

