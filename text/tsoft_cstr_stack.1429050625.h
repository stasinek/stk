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
#define STACKCNT	(__int32)512
#define STACKSTR	(__int32)512  // 64*1024=64kB ONE MEMORY SEGMENT
class  __cstr_stack {
private:
		__int32  f_initial_count;
		__int32  f_count;
		__int32  f_initial_text_class_size;
		__cstr_class **f_text_c;
public:
						  __stdcall  __cstr_stack   ();
						  __stdcall  __cstr_stack   (__int32 a_initial_count, __int32 a_initial_ptr_size);
		__int32   __stdcall set_count		   (__int32 a_initial_count, __int32 a_initial_ptr_size);
		__int32   __stdcall get_count				(void);
		__cstr_class *__stdcall push						(__int32 a_text_class_size);
		__cstr_class *__stdcall push						(__int32 a_text_class_size, char *a_text_to_clone);
		__cstr_class *__stdcall push						(char *a_text_to_clone);
		__cstr_class *__stdcall push						(void);
		__cstr_class *__stdcall push						(__cstr_class *a_text_c);
		void		  __stdcall pop						 (void);
		void		  __stdcall pop						 (__int32 a_cnt);
		void		  __stdcall pop_all				 ();
		void		  __stdcall swap						(__int32 i1,__int32 i2);
						  __stdcall ~__cstr_stack   ();
};
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
