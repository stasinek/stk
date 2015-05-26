//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_cstr_class.h"
#include "./../text/tsoft_cstr_manipulation.h"
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::__cstr_class(void)
:	f_ptr(NULL), f_ptr_size(0), f_ptr_dup(NULL), f_subs(NULL),f_subs_size(0)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif

__init(1,"\0");
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::__cstr_class(const uint32_t a_initial_size)
:	f_ptr(NULL), f_ptr_size(0), f_ptr_dup(NULL), f_subs(NULL),f_subs_size(0)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif

__init(a_initial_size,"\0");
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::__cstr_class(const char* __restrict__ a_text_to_clone)
:	f_ptr(NULL), f_ptr_size(0), f_ptr_dup(NULL), f_subs(NULL),f_subs_size(0)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif
    __init(ts::cstr::len(a_text_to_clone)+1,a_text_to_clone);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::__cstr_class(const uint32_t a_initial_size,const char* __restrict__ a_text_to_clone)
:	f_ptr(NULL), f_ptr_size(0), f_ptr_dup(NULL), f_subs(NULL),f_subs_size(0)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif
    __init(a_initial_size, a_text_to_clone);
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::__init(const uint32_t a_initial_size, const char* __restrict__ a_text_to_clone)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif

        if (a_initial_size==0 || a_text_to_clone==NULL) {
                f_ptr_size = 0;
                f_ptr = ts::cstr::allocex(f_ptr_size + 1,"\0");
                return;
        }
        else
        {
                f_ptr_size = a_initial_size;
                f_ptr = ts::cstr::allocex(f_ptr_size + 1, a_text_to_clone);
                return;
        }
f_subs_size = 32;
f_subs = ts::cstr::alloc(f_subs_size);
}
//---------------------------------------------------------------------------

const char* __stdcall ts::__cstr_class::set(const char* __restrict__ a_text_to_clone)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif
        if (a_text_to_clone==NULL) {
                f_ptr[0] = '\0';
                return f_ptr;
        }
        else
        {
                register uint32_t container_len = ts::cstr::len(a_text_to_clone);
                if (f_ptr_size < container_len) {
                        f_ptr = ts::cstr::realloc(f_ptr, container_len + 1);
                }
                ts::cstr::mov(f_ptr, a_text_to_clone);
                return f_ptr;
        }
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__cstr_class::add(const char* __restrict__ a_text_to_clone)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif

        register uint32_t add_size, new_size;
        if (a_text_to_clone!=NULL) {
                add_size = ts::cstr::len(a_text_to_clone);
        }
        else {
                add_size = 0;
        }
                new_size = ts::cstr::len(f_ptr) + add_size;
        if (new_size > f_ptr_size) {
                reserve(new_size);
        }
        return ts::cstr::cat(f_ptr,a_text_to_clone);
}
//---------------------------------------------------------------------------
const char	   *__stdcall	ts::__cstr_class::substr(uint32_t a_pos, uint32_t a_len) const
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif
if (f_subs_size < a_len + 1)
{
    f_subs_size = a_len + 1;
    f_subs = ts::cstr::realloc(f_subs,f_subs_size);
}
ts::cstr::substr(f_subs,f_ptr,a_pos,a_len);
return f_subs;
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::reserve(const uint32_t a_new_size)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif

        f_ptr_size = a_new_size;
        f_ptr = ts::cstr::realloc(f_ptr, f_ptr_size + 1);
        f_ptr[f_ptr_size] = '\0';
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::resize(const uint32_t a_new_len)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif
register uint32_t lp = ts::cstr::len(f_ptr) +1;
if (a_new_len <= lp) f_ptr[a_new_len] = '\0';
else ts::cstr::set_end(f_ptr,'\0',lp,a_new_len);
}
//---------------------------------------------------------------------------

inline void __stdcall ts::__cstr_class::clear(void)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif
if (f_ptr!=NULL) f_ptr[0]= '\0';
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_class::shrink_to_fit(void)
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif

if (f_ptr!=NULL && f_ptr_size!=0) {
        f_ptr_size = ts::cstr::len(f_ptr);
        f_ptr  = ts::cstr::realloc(f_ptr, f_ptr_size + 1);
        }
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_class::~__cstr_class()
{
#ifdef __DEBUG_CSTR_CLASS__
__DEBUG_FUNC_CALLED__
#endif

        if (f_subs!=NULL) delete f_subs;
        if (f_ptr!=NULL) ts::cstr::free(f_ptr);
        if (f_ptr_dup!=NULL) ts::cstr::free(f_ptr_dup);
        f_ptr = NULL;
        f_ptr_dup = NULL;
        f_ptr_size = 0;
}
//---------------------------------------------------------------------------
