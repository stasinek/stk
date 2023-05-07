//---------------------------------------------------------------------------
#ifndef __stk_cstr_class_h__
#define __stk_cstr_class_h__
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_main.h"
#include "./stk_cstr_utils.h"
#include "./../stk_vector.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __cstr_class : public stk::__vector<char> {
//---------------------------------------------------------------------------
    protected:
    void				            __stdcall	__init(const uint32_t a_initial_size, const char* __restrict__ a_c_to_clone);
//-------------------------------
    mutable uint32_t f_subs_size;
    mutable char *f_subs;
    mutable char *f_ptr_dup;
//-------------------------------
    public:
//-------------------------------
                                    __stdcall	__cstr_class();
                                    __stdcall	__cstr_class(const uint32_t a_initial_size);
                                    __stdcall	__cstr_class(const char* __restrict__ a_c_to_clone);
                                    __stdcall	__cstr_class(const uint32_t a_initial_size, const char *__restrict__ a_c_to_clone);
virtual                             __stdcall  ~__cstr_class(void);
       const char*		            __stdcall	set(const char* __restrict__ a_c_to_clone);
inline const char*                  __stdcall   set(__cstr_class* __restrict__ a_text_c)
{
    return set(a_text_c->c_str());
}
inline const char*                  __stdcall   set(const uint32_t a_i_to_clone)
{
    return set(stk::cstr::itoa(a_i_to_clone));
}
       const char*	                __stdcall	add(const char* __restrict__ a_c_to_add);
       const char*                  __stdcall	substr(uint32_t a_pos, uint32_t a_len)  const;
inline      uint32_t                __stdcall   len(void) const
{
    return stk::cstr::len(&stk::__vector<char>::bottom());
}
        void			            __stdcall	reserve(const uint32_t a_new_size);
        void			            __stdcall	resize(const uint32_t a_new_len);
        void			            __stdcall	shrink_to_fit();
        void			            __stdcall	clear();
inline uint32_t                     __stdcall   i(void) const
{
    return stk::cstr::atoi(&stk::__vector<char>::bottom());

}
inline       char*                  __stdcall   data()
{
    return &stk::__vector<char>::bottom();
}
inline const char*                  __stdcall   at(const uint32_t a_pos) const
{
    return const_cast<const char*>(&stk::__vector<char>::at(a_pos));
}
inline const char*                  __stdcall   c_str(void) const
{
    return const_cast<const char*>(&stk::__vector<char>::bottom());
}
inline                              __stdcall   operator const char* () const
{
    return c_str();
}
inline                              __stdcall   operator uint32_t () const
{
    return i();
}
inline const char*                  __stdcall   operator= (const char* __restrict__ a_text_to_clone)
{
    return set(a_text_to_clone);
}
inline const char*                  __stdcall   operator= (const char a_char_to_clone)
{
    char c[2]; c[0] = a_char_to_clone; c[1] = '\0'; return set(c);

}
inline const char*                  __stdcall   operator= (const bool a_bool_to_clone)
{
    if (a_bool_to_clone) return set("1"); else return set("0");
}
inline const char*                  __stdcall	operator= (const uint32_t a_i_to_clone)
{
    return set(a_i_to_clone);
}
//---------------------------------------------------------------------------
}; //class __cstr_class
//---------------------------------------------------------------------------
#ifdef __cplusplus
} //namespace stk
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

