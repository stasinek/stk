//---------------------------------------------------------------------------
#ifndef __stk_list_H__
#define __stk_list_H__
//---------------------------------------------------------------------------
#include "./mem/stk_mem.h"
#include "./io/stk_console.h"
#include "./stk_main.h"
//---------------------------------------------------------------------------
//implementation of std::list ;)
//---------------------------------------------------------------------------
namespace stk { template <class T> class __list {
private:
    T *ptrs; uint32_t f_ptrs_size;
    uint32_t f_front,f_back;
    bool f_full;
public:
//---------------------------------------------------------------------------
    __list(uint32_t a_count = (4096 / sizeof(T*)))
    : ptrs(NULL),f_ptrs_size(0),f_front(0),f_back(0),
      f_full(false)
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::__list()")
#endif
        this->resize(a_count);
    }
//---------------------------------------------------------------------------
    ~__list(void)
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::~__list")
#endif
        this->resize(0);
    }
//---------------------------------------------------------------------------
    bool   __stdcall push_back(T a_new)
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::push_back()")
#endif
        if (f_full) {
            this->overflowed(); return false;
        }
        ptrs[f_back]= a_new;
             f_back+=1;
         if (f_back >= f_ptrs_size) {
             f_back =0;
         }
         if (f_back==f_front) f_full = true;
        return true;
    };
//---------------------------------------------------------------------------
    T   __stdcall pop_front(void)
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::pop_front()")
#endif
         if (f_front==f_back && f_full==false) {
             return NULL;
         }
        T ret = ptrs[f_front];
        f_full=false;
        f_front+=1;
         if (f_front >=f_ptrs_size) {
             f_front =0;
         }
        if (f_front==f_back) this->cleared();
        return ret;
    };
//---------------------------------------------------------------------------
    T   __stdcall front(void) const
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::front() const")
#endif
         if (f_front==f_back && f_full==false) {
             return 0;
         }
    return ptrs[f_front];
}
//---------------------------------------------------------------------------
    T   __stdcall back(void) const
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::back() const")
#endif
         if (f_front==f_back && f_full==false) {
             return 0;
         }
    return ptrs[f_back];
}
//---------------------------------------------------------------------------
    uint32_t   __stdcall count(void)  const
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::count() const")
#endif
        if (f_full) return f_ptrs_size;
        if (f_back >=f_front) return (f_back - f_front);
        return (f_ptrs_size - f_front + f_back);
    }
//---------------------------------------------------------------------------
    uint32_t   __stdcall size(void)  const
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("")
#endif
        return f_ptrs_size;
    }
//---------------------------------------------------------------------------
    virtual void   __stdcall overflowed(void)
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::overflowed()")
#endif

    }
//---------------------------------------------------------------------------
    virtual void   __stdcall cleared(void)
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::cleared()")
#endif

    }
//---------------------------------------------------------------------------
    bool   __stdcall is_full(void) const
    {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::is_full()")
#endif
    return f_full;
    }
//---------------------------------------------------------------------------
    void   __stdcall resize(uint32_t a_new_size)
     {
#ifdef __DEBUG_LIST__
__DEBUG_CALLED("stk::__list::resize()")
#endif
        if (f_ptrs_size==a_new_size)
        {
            return;
        }
        if (a_new_size > f_ptrs_size)
        {
            if (f_ptrs_size==0)
                {
                ptrs = (T*)stk::mem::alloc(a_new_size * sizeof(T));
                }
            else
                {
                ptrs = (T*)stk::mem::realloc(ptrs, a_new_size * sizeof(T));
                }
        }
        else
        {
             if (a_new_size==0)
                {
                stk::mem::free(ptrs);
                }
            else
                {
                ptrs = (T*)stk::mem::realloc(ptrs, a_new_size * sizeof(T));
                }
        }
            f_ptrs_size = a_new_size;
            return;
    }
//---------------------------------------------------------------------------
}; }
//---------------------------------------------------------------------------
#endif // __list_CLASS_H
