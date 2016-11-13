//---------------------------------------------------------------------------
#ifndef __vector_h
#define __vector_h
//---------------------------------------------------------------------------
#include "./mem/tsoft_mem.h"
#include "./text/tsoft_cstr_manipulation.h"
#include "./io/tsoft_console.h"
#include "./tsoft_main.h"
//---------------------------------------------------------------------------
//implementation of std::vector, much simpler without iterator, allocator etc.
//---------------------------------------------------------------------------
namespace ts { template<class T> class __vector {
#define __vector_RESERVED_AT_INIT(T) ((4096-32-32-4)/sizeof(T))
private:
    uint32_t f_ptrs_ocupied, f_ptrs_reserved; T *f_ptrs;
public:
//---------------------------------------------------------------------------
inline __vector(const uint32_t a_count = __vector_RESERVED_AT_INIT(T))
    : f_ptrs_ocupied(0), f_ptrs_reserved(0), f_ptrs(NULL)
    {
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    this->resize(a_count);
}
//---------------------------------------------------------------------------
virtual inline  __stdcall ~__vector(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    this->resize(0);
}
//---------------------------------------------------------------------------
inline uint32_t __stdcall push(const T& a_new)
{
return this->add(a_new);
}
//---------------------------------------------------------------------------
uint32_t __stdcall add(const T& a_new)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
        if (f_ptrs_ocupied >= f_ptrs_reserved) {
            this->resize(2  * f_ptrs_reserved);
           }
        f_ptrs[f_ptrs_ocupied++]= a_new;
        return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------
T __stdcall pop()
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
T __stdcall remove(const uint32_t a_index)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
        if (f_ptrs_ocupied==0) {
            return NULL;
        }
        T ret = f_ptrs[a_index];
        f_ptrs_ocupied--;
        if (f_ptrs_ocupied!=0 ? f_ptrs_ocupied-a_index > 0 : false) {
        ts::mem32::mov((void*)&f_ptrs[a_index],(void*)&f_ptrs[a_index+1],f_ptrs_ocupied-a_index);
        }
        else this->cleared();
        return ret;
}
//---------------------------------------------------------------------------
uint32_t __stdcall insert(const T& a_new,const uint32_t a_index)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
        this->add(a_new);
        if (f_ptrs_ocupied > 1) {
        ts::mem32::mov((void*)&f_ptrs[a_index+1],(void*)&f_ptrs[a_index],f_ptrs_ocupied-a_index-1);
        T tmp = f_ptrs[a_index];
        f_ptrs[f_ptrs_ocupied-1] = tmp;
        }
        return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------
void __stdcall swap(const uint32_t a_index1,const uint32_t a_index2)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
           T *t = &f_ptrs[a_index1];
        &f_ptrs[a_index1] = &f_ptrs[a_index2];
        &f_ptrs[a_index1] = t;
}
//---------------------------------------------------------------------------
inline T& __stdcall front(void) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    return f_ptrs[f_ptrs_ocupied];
}
//---------------------------------------------------------------------------
inline T& __stdcall top(void) const
{
    return front();
}
//---------------------------------------------------------------------------
inline T& __stdcall back(void) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    return f_ptrs[0];
}
//---------------------------------------------------------------------------
inline T& __stdcall bottom(void) const
{
    return back();
}
//---------------------------------------------------------------------------
inline T& __stdcall at(const uint32_t a_index) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    return f_ptrs[a_index];
}
//---------------------------------------------------------------------------
inline T& __stdcall operator [] (const uint32_t a_index) const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    return f_ptrs[a_index];
}
//---------------------------------------------------------------------------
inline T& __stdcall set(const uint32_t a_index, const T& a_value) const
{
    return f_ptrs[a_index] = a_value;
}
//---------------------------------------------------------------------------


inline uint32_t __stdcall count(void)  const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    return f_ptrs_ocupied;
}
//---------------------------------------------------------------------------
inline uint32_t __stdcall size(void)  const
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    return f_ptrs_reserved;
}
//---------------------------------------------------------------------------

inline uint32_t __stdcall max_size(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    return (2^16) / sizeof(T);  //65536 elements
}
//---------------------------------------------------------------------------
virtual void __stdcall cleared(void)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
}
//---------------------------------------------------------------------------
inline uint32_t __stdcall set_size(const uint32_t a_new_size)
{
    return this->resize(a_new_size);
}
//---------------------------------------------------------------------------
uint32_t __stdcall resize(const uint32_t a_new_size)
{
#ifdef __DEBUG_VECTOR__
__DEBUG_FUNC_CALLED("")
#endif
    if (f_ptrs_reserved == a_new_size) {
    return a_new_size;
    }
    else
    if (f_ptrs_reserved==0)
    {
    f_ptrs = (T*)ts::mem32::alloc(a_new_size * sizeof(T));
    }
    else
    if (a_new_size==0)
    {
    ts::mem32::free(f_ptrs);
    f_ptrs = NULL;
    }
    else
    {
    f_ptrs = (T*)ts::mem32::realloc(f_ptrs, a_new_size * sizeof(T));
    }
	f_ptrs_reserved = a_new_size;
	return a_new_size;
}
//---------------------------------------------------------------------------
}; }
//---------------------------------------------------------------------------
#endif // __vector_H
