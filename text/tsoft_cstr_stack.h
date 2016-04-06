//---------------------------------------------------------------------------
#ifndef __tsoft_text_stack_H__
#define __tsoft_text_stack_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "tsoft_cstr_class.h"
#include "./../__vector.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
#define STACKCNT	(__int32)1024
#define STACKSTR	(__int32)1024 // 64*1024=64kB ONE MEMORY SEGMENT
class  __cstr_stack : public __vector<__cstr_class*> {
protected:
		void			__stdcall	__init				(const uint32_t a_count, const uint32_t a_text_class_size);
private:
		uint32_t  f_text_class_size;
public:
__stdcall				__cstr_stack						();
__stdcall				__cstr_stack						(const uint32_t a_count);
__stdcall				__cstr_stack						(const uint32_t a_count, const uint32_t a_text_class_size);
		uint32_t		__stdcall	set_size				(const uint32_t a_count);
		uint32_t		__stdcall	set_default_text_size	(const uint32_t a_text_class_size);

		__cstr_class   *__stdcall	push					(const uint32_t a_text_class_size);
		__cstr_class   *__stdcall	push					(const uint32_t a_text_class_size, const char *a_text_to_clone);
		__cstr_class   *__stdcall	push					(const char *a_text_to_clone);
		__cstr_class   *__stdcall	push					(void);
		__cstr_class   *__stdcall	push					(const __cstr_class *a_text_c);
		void			__stdcall	pop						(void);
		void			__stdcall	pop						(const uint32_t a_cnt);
__stdcall ~__cstr_stack				();
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
