//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_text_stack_H__
#define __tsoft_text_stack_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "tsoft_text_class.h"
//---------------------------------------------------------------------------
namespace ts { namespace text {
//---------------------------------------------------------------------------
#define STACKCNT	(int32_t)512
#define STACKSTR	(int32_t)512  // 64*1024=64kB ONE MEMORY SEGMENT
class  __cstr_stack {
private:
		int32_t  f_initial_count;
		int32_t  f_count;
		int32_t  f_initial_text_class_size;
		__cstr_class **f_text_c;
public:
						  __stdcall  __cstr_stack   ();
						  __stdcall  __cstr_stack   (int32_t a_initial_count, int32_t a_initial_ptr_size);
		int32_t   __stdcall set_count		   (int32_t a_initial_count, int32_t a_initial_ptr_size);
		int32_t   __stdcall get_count				(void);
		__cstr_class *__stdcall push						(int32_t a_text_class_size);
		__cstr_class *__stdcall push						(int32_t a_text_class_size, char *a_text_to_clone);
		__cstr_class *__stdcall push						(char *a_text_to_clone);
		__cstr_class *__stdcall push						(void);
		__cstr_class *__stdcall push						(__cstr_class *a_text_c);
		void		  __stdcall pop						 (void);
		void		  __stdcall pop						 (int32_t a_cnt);
		void		  __stdcall pop_all				 ();
		void		  __stdcall swap						(int32_t i1,int32_t i2);
						  __stdcall ~__cstr_stack   ();
};
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
