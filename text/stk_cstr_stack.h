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
class  STK_IMPEXP __cstr_stack : public stk::__vector<__cstr_class*> {
protected:
        void			            __stdcall	__init              	(const uint32_t a_count, const uint32_t a_text_class_size);
private:
        uint32_t  f_text_class_size;
public:
                                    __stdcall	__cstr_stack			();
                                    __stdcall	__cstr_stack			(const uint32_t a_count);
                                    __stdcall	__cstr_stack			(const uint32_t a_count, const uint32_t a_text_class_size);
        uint32_t                    __stdcall	set_size				(const uint32_t a_count);
        uint32_t                    __stdcall	set_default_text_size	(const uint32_t a_text_class_size);

        __cstr_class*               __stdcall	push					(const uint32_t a_text_class_size);
        __cstr_class*               __stdcall	push					(const uint32_t a_text_class_size, const char *a_text_to_clone);
        __cstr_class*               __stdcall	push					(const char *a_text_to_clone);
        __cstr_class*               __stdcall	push					(void);
        __cstr_class*               __stdcall	push					(const __cstr_class *a_text_c);
        void			            __stdcall	pop						(void);
        void			            __stdcall	pop						(const uint32_t a_cnt);
virtual                             __stdcall ~__cstr_stack				(void);
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
} // #endif stk namespace
#endif
//---------------------------------------------------------------------------
#endif
