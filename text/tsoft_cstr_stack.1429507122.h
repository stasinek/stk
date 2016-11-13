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
#define STACKCNT	(int32_t)1024
#define STACKSTR	(int32_t)1024 // 64*1024=64kB ONE MEMORY SEGMENT
class  __cstr_stack {
private:
		int32_t  f_initial_count;
		int32_t  f_count;
		int32_t  f_initial_text_class_size;
		__cstr_class **f_text_c;
public:
										__stdcall	__cstr_stack		();
										__stdcall	__cstr_stack		(const int32_t a_initial_count);
										__stdcall	__cstr_stack		(const int32_t a_initial_count, const int32_t a_initial_text_class_size);
		__cstr_class   *__stdcall	at				(const int32_t a_at_index);
		__cstr_class   *__stdcall	top				(void);
		__cstr_class   *__stdcall	bottom			(void);
		int32_t			__stdcall	set_count			(const int32_t a_initial_count, const int32_t a_initial_text_class_size);
		int32_t			__stdcall	count				(void);
		int32_t			__stdcall	size				(void);
		int32_t			__stdcall	max_size			(void);
		bool   			__stdcall	empty				(void);
		__cstr_class   *__stdcall	push				(const int32_t a_text_class_size);
		__cstr_class   *__stdcall	push				(const int32_t a_text_class_size, const char *a_text_to_clone);
		__cstr_class   *__stdcall	push				(const char *a_text_to_clone);
		__cstr_class   *__stdcall	push				(void);
		__cstr_class   *__stdcall	push				(const __cstr_class *a_text_c);
		void			__stdcall	pop				(void);
		void			__stdcall	pop				(const int32_t a_cnt);
		void			__stdcall	pop_all			();
		__cstr_class   *__stdcall	operator[]		(const int32_t a_at_index);
		void			__stdcall	swap				(const int32_t i1, const int32_t i2);
										__stdcall ~__cstr_stack		();
};
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
