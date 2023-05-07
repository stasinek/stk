//---------------------------------------------------------------------------
#ifndef __stk_array_h__
#define __stk_array_h__
//---------------------------------------------------------------------------
#include "./mem/stk_mem.h"
#include "./text/stk_cstr_utils.h"
#include "./io/stk_console.h"
#include "./stk_main.h"
//---------------------------------------------------------------------------
//implementation of class simmilar to std::vector, much simpler without iterator, allocator etc.
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { template<class TYPE> class  __array {
#define __vector_RESERVED_AT_INIT(TYPE) ((4096-32-32-4)/sizeof(TYPE))
//---------------------------------------------------------------------------
private:
uint32_t f_ptrs_ocupied, f_ptrs_reserved; TYPE *f_ptrs;
//---------------------------------------------------------------------------
public:
                   __stdcall  __array(const uint32_t a_count = __vector_RESERVED_AT_INIT(TYPE));
virtual            __stdcall ~__array(void);
//---------------------------------------------------------------------------
uint32_t           __stdcall  max_size(void);
uint32_t           __stdcall  mem_size(void)  const;
uint32_t           __stdcall  set_size(const uint32_t a_new_size);
uint32_t           __stdcall  count(void)  const;
//---------------------------------------------------------------------------
virtual void       __stdcall  cleared(void);
//---------------------------------------------------------------------------
TYPE&              __stdcall  at(const uint32_t a_index) const;
TYPE&              __stdcall  front(void) const;
TYPE&              __stdcall  back(void) const;
TYPE&              __stdcall  set(const uint32_t a_index, const TYPE& a_value) const;
//---------------------------------------------------------------------------
uint32_t           __stdcall  push(const TYPE& a_new);
void               __stdcall  swap(const uint32_t a_index1,const uint32_t a_index2);
TYPE               __stdcall  pop();
void               __stdcall  pop_all();
//---------------------------------------------------------------------------
uint32_t           __stdcall  insert(const TYPE& a_new,const uint32_t a_index);
TYPE               __stdcall  remove(const uint32_t a_index);
//---------------------------------------------------------------------------
// ALTERNATIVE FNCTION NAMES >>
//---------------------------------------------------------------------------
TYPE&              __stdcall  top(void) const;
TYPE&              __stdcall  bottom(void) const;
TYPE&              __stdcall  operator [] (const uint32_t a_index) const;
uint32_t           __stdcall  add(const TYPE& a_new);
void               __stdcall  exchange(const uint32_t a_index1,const uint32_t a_index2);
uint32_t           __stdcall  resize(const uint32_t a_new_size);
//---------------------------------------------------------------------------
// <<
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
} // #endif namespace stk
#endif
//---------------------------------------------------------------------------
/*template<class TYPE>
uint32_t __stdcall __array<TYPE>::stk::__array<int>::add(const int& a_new)
{
return 0;
}*/
//---------------------------------------------------------------------------

template<class TYPE> __stdcall stk::__array<TYPE>::__array(const uint32_t a_count)
    : f_ptrs_ocupied(0), f_ptrs_reserved(0), f_ptrs(NULL)
    {
#ifdef __DEBUG_VECTOR__
    __DEBUG_CALLED("")
#endif
    this->resize(a_count);
}
//---------------------------------------------------------------------------

template<class TYPE>  __stdcall stk::__array<TYPE>::~__array()
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    this->resize(0);
}
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::count(void)  const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::mem_size(void)  const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    return f_ptrs_reserved;
}
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::max_size(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    return (2^16) / sizeof(TYPE);  //65536 elements
}
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::set_size(const uint32_t a_new_size)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    if (f_ptrs_reserved == a_new_size) {
    return a_new_size;
    }
    else
    if (f_ptrs_reserved==0)
    {
    f_ptrs = (TYPE*)stk::mem::alloc(a_new_size * sizeof(TYPE));
    }
    else
    if (a_new_size==0)
    {
    stk::mem::free(f_ptrs);
    f_ptrs = NULL;
    }
    else
    {
    f_ptrs = (TYPE*)stk::mem::realloc(f_ptrs, a_new_size * sizeof(TYPE));
    }
    f_ptrs_reserved = a_new_size;
    return a_new_size;
}
//---------------------------------------------------------------------------

template<class TYPE> void __stdcall stk::__array<TYPE>::cleared(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
}
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::push(const TYPE& a_new)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
        if (f_ptrs_ocupied >= f_ptrs_reserved) {
            this->resize(2  * f_ptrs_reserved);
           }
        f_ptrs[f_ptrs_ocupied++]= a_new;
        return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE __stdcall stk::__array<TYPE>::pop()
{
if (this->count()>0) return this->remove(this->count()-1);
else return NULL;
}
//---------------------------------------------------------------------------

template<class TYPE> void  __stdcall stk::__array<TYPE>::pop_all()
{
this->resize(0);
}
//---------------------------------------------------------------------------

template<class TYPE> void __stdcall stk::__array<TYPE>::swap(const uint32_t a_index1,const uint32_t a_index2)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
           TYPE t = f_ptrs[a_index1];
        f_ptrs[a_index1] = f_ptrs[a_index2];
        f_ptrs[a_index1] = t;
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE& __stdcall stk::__array<TYPE>::at(const uint32_t a_index) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    return f_ptrs[a_index];
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE& __stdcall stk::__array<TYPE>::front(void) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    return f_ptrs[f_ptrs_ocupied];
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE& __stdcall stk::__array<TYPE>::back(void) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    return f_ptrs[0];
}
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::insert(const TYPE& a_new,const uint32_t a_index)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
        this->add(a_new);
        if (f_ptrs_ocupied > 1) {
        stk::mem::mov((void*)&f_ptrs[a_index+1],(void*)&f_ptrs[a_index],f_ptrs_ocupied-a_index-1);
        TYPE tmp = f_ptrs[a_index];
        f_ptrs[f_ptrs_ocupied-1] = tmp;
        }
        return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE __stdcall stk::__array<TYPE>::remove(const uint32_t a_index)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
        if (f_ptrs_ocupied==0) {
            return NULL;
        }
        TYPE ret = f_ptrs[a_index];
        f_ptrs_ocupied--;
        if (f_ptrs_ocupied!=0 ? f_ptrs_ocupied-a_index > 0 : false) {
        stk::mem::mov((void*)&f_ptrs[a_index],(void*)&f_ptrs[a_index+1],f_ptrs_ocupied-a_index);
        }
        else this->cleared();
        return ret;
}
//---------------------------------------------------------------------------
// ALTERNATIVE FNCTION NAMES
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::add(const TYPE& a_new)
{
return this->push(a_new);
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE& __stdcall stk::__array<TYPE>::operator [] (const uint32_t a_index) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_CALLED("")
#endif
    return f_ptrs[a_index];
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE& __stdcall stk::__array<TYPE>::set(const uint32_t a_index, const TYPE& a_value) const
{
    return f_ptrs[a_index] = a_value;
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE& __stdcall stk::__array<TYPE>::top(void) const
{
    return front();
}
//---------------------------------------------------------------------------

template<class TYPE> TYPE& __stdcall stk::__array<TYPE>::bottom(void) const
{
    return back();
}
//---------------------------------------------------------------------------

template<class TYPE> void __stdcall stk::__array<TYPE>::exchange(const uint32_t a_index1,const uint32_t a_index2)
{
return swap(a_index1,a_index2);
}
//---------------------------------------------------------------------------

template<class TYPE> uint32_t __stdcall stk::__array<TYPE>::resize(const uint32_t a_new_size)
{
    return set_size(a_new_size);
}
//---------------------------------------------------------------------------
#endif // __vector_h__
//---------------------------------------------------------------------------
