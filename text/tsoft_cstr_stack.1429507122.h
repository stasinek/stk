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
#define STACKCNT	(__int32)1024
#define STACKSTR	(__int32)1024 // 64*1024=64kB ONE MEMORY SEGMENT
class  __cstr_stack {
private:
		__int32  f_initial_count;
		__int32  f_count;
		__int32  f_initial_text_class_size;
		__cstr_class **f_text_c;
public:
										__stdcall	__cstr_stack		();
										__stdcall	__cstr_stack		(const __int32 a_initial_count);
										__stdcall	__cstr_stack		(const __int32 a_initial_count, const __int32 a_initial_text_class_size);
		__cstr_class   *__stdcall	at				(const __int32 a_at_index);
		__cstr_class   *__stdcall	top				(void);
		__cstr_class   *__stdcall	bottom			(void);
		__int32			__stdcall	set_count			(const __int32 a_initial_count, const __int32 a_initial_text_class_size);
		__int32			__stdcall	count				(void);
		__int32			__stdcall	size				(void);
		__int32			__stdcall	max_size			(void);
		bool   			__stdcall	empty				(void);
		__cstr_class   *__stdcall	push				(const __int32 a_text_class_size);
		__cstr_class   *__stdcall	push				(const __int32 a_text_class_size, const char *a_text_to_clone);
		__cstr_class   *__stdcall	push				(const char *a_text_to_clone);
		__cstr_class   *__stdcall	push				(void);
		__cstr_class   *__stdcall	push				(const __cstr_class *a_text_c);
		void			__stdcall	pop				(void);
		void			__stdcall	pop				(const __int32 a_cnt);
		void			__stdcall	pop_all			();
		__cstr_class   *__stdcall	operator[]		(const __int32 a_at_index);
		void			__stdcall	swap				(const __int32 i1, const __int32 i2);
										__stdcall ~__cstr_stack		();
};
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
