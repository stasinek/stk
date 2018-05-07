//---------------------------------------------------------------------------
#ifndef __stk_text_stack_h
#define __stk_text_stack_h
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#include "stk_cstr_class.h"
#include "./../stk_vector.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
#define STACKCNT	(uint32_t)1024
#define STACKSTR	(uint32_t)1024 // 64*1024=64kB ONE MEMORY SEGMENT
//---------------------------------------------------------------------------
class  STK_IMPEXP __cstr_stack : public __vector<__cstr_class*> {
protected:
        void			STK_IMPEXP  __stdcall	__init              	(const uint32_t a_count, const uint32_t a_text_class_size);
private:
        uint32_t  f_text_class_size;
public:
                        STK_IMPEXP  __stdcall	__cstr_stack			();
                        STK_IMPEXP  __stdcall	__cstr_stack			(const uint32_t a_count);
                        STK_IMPEXP  __stdcall	__cstr_stack			(const uint32_t a_count, const uint32_t a_text_class_size);
        uint32_t        STK_IMPEXP  __stdcall	set_size				(const uint32_t a_count);
        uint32_t        STK_IMPEXP  __stdcall	set_default_text_size	(const uint32_t a_text_class_size);

        __cstr_class    STK_IMPEXP *__stdcall	push					(const uint32_t a_text_class_size);
        __cstr_class    STK_IMPEXP *__stdcall	push					(const uint32_t a_text_class_size, const char *a_text_to_clone);
        __cstr_class    STK_IMPEXP *__stdcall	push					(const char *a_text_to_clone);
        __cstr_class    STK_IMPEXP *__stdcall	push					(void);
        __cstr_class    STK_IMPEXP *__stdcall	push					(const __cstr_class *a_text_c);
        void			STK_IMPEXP  __stdcall	pop						(void);
        void			STK_IMPEXP  __stdcall	pop						(const uint32_t a_cnt);
virtual                 STK_IMPEXP  __stdcall ~__cstr_stack				(void);
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}
#endif
//---------------------------------------------------------------------------
#endif
