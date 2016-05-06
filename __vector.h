//---------------------------------------------------------------------------
#ifndef vector_h
#define vector_h
//---------------------------------------------------------------------------
#include "./mem/tsoft_mem32.h"
#include "./text/tsoft_cstr_manipulation.h"
#include "./tsoft_main.h"
//---------------------------------------------------------------------------
//implementation of std::vector, much simpler "wheel" without iterator, allocator etc :<
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
#define __vector_DEFAULT_RESERVED(T) ((4096-32-4-32)/sizeof(T))
template <class a_element_T> class __vector {
private:
    a_element_T *f_ptrs; uint32_t f_ptrs_ocupied, f_ptrs_reserved;
public:
//---------------------------------------------------------------------------
inline __vector(const uint32_t a_count = __vector_DEFAULT_RESERVED(a_element_T))
    :
      f_ptrs(NULL),
      f_ptrs_ocupied(0), f_ptrs_reserved(0)
    {
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    this->resize(a_count);
}
//---------------------------------------------------------------------------
inline ~__vector(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    this->resize(0);
}
//---------------------------------------------------------------------------
inline uint32_t __stdcall push(const a_element_T& a_new)
{
return this->add(a_new);
}
//---------------------------------------------------------------------------
uint32_t __stdcall add(const a_element_T& a_new)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
        if (f_ptrs_ocupied >= f_ptrs_reserved) {
        this->resize(2  * f_ptrs_reserved);
        }
        f_ptrs[f_ptrs_ocupied++]= a_new;
        return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------
a_element_T __stdcall pop()
{
if (this->count()>0) return this->remove(this->count()-1);
else return NULL;
}
//---------------------------------------------------------------------------
inline void  __stdcall pop_all()
{
return this->resize(0);
}
//---------------------------------------------------------------------------
a_element_T __stdcall remove(const uint32_t a_index)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
        if (f_ptrs_ocupied==0) {
            return NULL;
        }
        a_element_T ret = f_ptrs[a_index];
        f_ptrs_ocupied--;
        if (f_ptrs_ocupied!=0 ? f_ptrs_ocupied-a_index > 0 : false) {
        ts::mem32::mov((void*)&f_ptrs[a_index],(void*)&f_ptrs[a_index+1],f_ptrs_ocupied-a_index);
        }
        else this->cleared();
        return ret;
}
//---------------------------------------------------------------------------
uint32_t __stdcall insert(const a_element_T& a_new,const uint32_t a_index)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
        this->add(a_new);
        if (f_ptrs_ocupied > 1) {
        ts::mem32::mov((void*)&f_ptrs[a_index+1],(void*)&f_ptrs[a_index],f_ptrs_ocupied-a_index-1);
        a_element_T tmp = f_ptrs[a_index];
        f_ptrs[f_ptrs_ocupied-1] = tmp;
        }
        return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------
void __stdcall swap(const uint32_t a_index1,const uint32_t a_index2)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
           a_element_T *t = &f_ptrs[a_index1];
        &f_ptrs[a_index1] = &f_ptrs[a_index2];
        &f_ptrs[a_index1] = t;
}
//---------------------------------------------------------------------------
inline a_element_T& __stdcall front(void) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    return f_ptrs[f_ptrs_ocupied];
}
//---------------------------------------------------------------------------
inline a_element_T& __stdcall top(void) const
{
    return front();
}
//---------------------------------------------------------------------------
inline a_element_T& __stdcall back(void) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    return f_ptrs[0];
}
//---------------------------------------------------------------------------
inline a_element_T& __stdcall bottom(void) const
{
    return back();
}
//---------------------------------------------------------------------------
inline a_element_T& __stdcall at(const uint32_t a_index) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    return f_ptrs[a_index];
}
//---------------------------------------------------------------------------
inline a_element_T& __stdcall operator [] (const uint32_t a_index) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    return f_ptrs[a_index];
}
//---------------------------------------------------------------------------
inline a_element_T& __stdcall set(const uint32_t a_index, const a_element_T& a_value) const
{
    return f_ptrs[a_index] = a_value;
}
//---------------------------------------------------------------------------


inline uint32_t __stdcall count(void)  const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------
inline uint32_t __stdcall size(void)  const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    return f_ptrs_reserved;
}
//---------------------------------------------------------------------------

inline uint32_t __stdcall max_size(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    return (2^16) / sizeof(a_element_T);  //65536 elements
}
//---------------------------------------------------------------------------
virtual void __stdcall cleared(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
}
//---------------------------------------------------------------------------
inline uint32_t __stdcall set_size(uint32_t a_new_size)
{
    return this->resize(a_new_size);
}
//---------------------------------------------------------------------------
uint32_t __stdcall resize(uint32_t a_new_size)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED__
#endif
    if (f_ptrs_reserved == a_new_size) {
    return a_new_size;
    }
    else
    if (f_ptrs_reserved==0)
    {
    f_ptrs = (a_element_T*)ts::mem32::alloc(a_new_size * sizeof(a_element_T));
    }
    else
    if (a_new_size==0)
    {
    ts::mem32::free(f_ptrs);
    f_ptrs = NULL;
    }
    else
    {
    f_ptrs = (a_element_T*)ts::mem32::realloc(f_ptrs, a_new_size * sizeof(a_element_T));
    }
	f_ptrs_reserved = a_new_size;
	return a_new_size;
}
//---------------------------------------------------------------------------
};
}
//---------------------------------------------------------------------------
#endif // __vector_H
