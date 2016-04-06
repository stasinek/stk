//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_cstr_stack.h"
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(void)
:
        __vector<__cstr_class*>(0),
        f_text_class_size(0)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        __init(0,0);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(const uint32_t a_size)
:
        __vector<__cstr_class*>(a_size),
        f_text_class_size(0)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        __init(a_size,64-4);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(const uint32_t a_size, const uint32_t a_text_size)
:
        __vector<__cstr_class*>(a_size),
        f_text_class_size(0)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        __init(a_size,a_text_size);
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::__init(const uint32_t a_size, const uint32_t a_text_size)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
register __int32 r_tcs = a_text_size;
register __int32 r_s = a_size;
        set_default_text_size(r_tcs);
        set_size(r_s);
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::__cstr_stack::set_size(const uint32_t a_size)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        register uint32_t curs = __vector<ts::__cstr_class*>::count();
        register uint32_t news = a_size;
        // first of all, change top stack pointer(count) to lower value than it's new size
        if (curs < news) {
            for (;;) {
                __vector<ts::__cstr_class*>::push(new ts::__cstr_class(f_text_class_size));
                        if (++curs == news)
                                break;
                }
        }
        else
        if (curs > news) {
                for (;;) {
                delete __vector<ts::__cstr_class*>::pop();
                        if (--curs == news)
                                break;
                }
        }
        return curs;
}
//---------------------------------------------------------------------------

inline uint32_t __stdcall ts::__cstr_stack::set_default_text_size(const uint32_t a_text_class_size)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
return f_text_class_size = a_text_class_size;
}

//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::pop(const uint32_t a_count)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
register __int32 r_to_pop = a_count;
        if (r_to_pop <= 0)
                return;
        for (;;) {
                r_to_pop--;
                delete __vector<ts::__cstr_class*>::pop();
                if (r_to_pop==0) break;
        }
}
//---------------------------------------------------------------------------

inline void __stdcall ts::__cstr_stack::pop(void)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        pop(1);
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(const uint32_t a_text_class_size)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        __vector<ts::__cstr_class*>::push(new ts::__cstr_class(a_text_class_size));
        return __vector<ts::__cstr_class*>::top();
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(const char *a_text_to_clone)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        register __int32 len = ts::cstr::len(a_text_to_clone);
        register __cstr_class *t = this->push(len + 1);
        t->set(a_text_to_clone);
        return t;
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(const uint32_t a_text_class_size, const char *a_text_to_clone)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        register __cstr_class *t = push(a_text_class_size);
        t->set(a_text_to_clone);
        return t;
}
//---------------------------------------------------------------------------
inline ts::__cstr_class *__stdcall ts::__cstr_stack::push(void)
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        return this->push(f_text_class_size);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::~__cstr_stack()
{
#ifdef __DEBUG_CSTR_STACK__
__DEBUG_FUNC_CALLED__
#endif
        set_default_text_size(0);
        set_size(0);
}
//---------------------------------------------------------------------------
