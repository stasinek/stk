//---------------------------------------------------------------------------
#ifndef __list_CLASS_H
#define __list_CLASS_H
//---------------------------------------------------------------------------
#include "./mem/tsoft_mem32.h"
#include "./io/tsoft_console.h"
#include "./tsoft_main.h"
//---------------------------------------------------------------------------
//implementation of std::list ;)
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
template <class a_element_T> class __list {
private:
	a_element_T *ptrs; uint32_t f_ptrs_size;
	uint32_t f_front,f_back;
	bool f_full;
public:
//---------------------------------------------------------------------------
	__list(uint32_t a_count = (4096/sizeof(a_element_T*)))
	: ptrs(NULL),f_ptrs_size(0),f_front(0),f_back(0),
	  f_full(false)
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		this->resize(a_count);
	}
//---------------------------------------------------------------------------
	~__list(void)
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		this->resize(0);
	}
//---------------------------------------------------------------------------
	bool __stdcall push_back(a_element_T a_new)
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
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
	a_element_T __stdcall pop_front(void)
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		 if (f_front==f_back && f_full==false) {
			 return NULL;
		 }
		a_element_T ret = ptrs[f_front];
		f_full=false;
		f_front+=1;
		 if (f_front >=f_ptrs_size) {
			 f_front =0;
		 }
		if (f_front==f_back) this->cleared();
		return ret;
	};
//---------------------------------------------------------------------------
	a_element_T __stdcall front(void) const
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		 if (f_front==f_back && f_full==false) {
			 return 0;
		 }
	return ptrs[f_front];
}
//---------------------------------------------------------------------------
	a_element_T __stdcall back(void) const
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		 if (f_front==f_back && f_full==false) {
			 return 0;
		 }
	return ptrs[f_back];
}
//---------------------------------------------------------------------------
	uint32_t __stdcall count(void)  const
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		if (f_full) return f_ptrs_size;
		if (f_back >=f_front) return (f_back - f_front);
		return (f_ptrs_size - f_front + f_back);
	}
//---------------------------------------------------------------------------
	uint32_t __stdcall size(void)  const
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		return f_ptrs_size;
	}
//---------------------------------------------------------------------------
	virtual void __stdcall overflowed(void)
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif

	}
//---------------------------------------------------------------------------
	virtual void __stdcall cleared(void)
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif

	}
//---------------------------------------------------------------------------
	bool __stdcall is_full(void) const
	{
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
	return f_full;
	}
//---------------------------------------------------------------------------
	void __stdcall resize(uint32_t a_new_size)
	 {
#ifdef __DEBUG_LIST__
__DEBUG_FUNC_CALLED__
#endif
		if (f_ptrs_size==a_new_size)
		{
			return;
		}
		if (a_new_size > f_ptrs_size)
		{
			if (f_ptrs_size==0)
				{
				ptrs = (a_element_T*)ts::mem32::alloc(a_new_size * sizeof(a_element_T));
				}
			else
				{
				ptrs = (a_element_T*)ts::mem32::realloc(ptrs, a_new_size * sizeof(a_element_T));
				}
		}
		else
		{
			 if (a_new_size==0)
				{
				ts::mem32::free(ptrs);
				}
			else
				{
				ptrs = (a_element_T*)ts::mem32::realloc(ptrs, a_new_size * sizeof(a_element_T));
				}
		}
			f_ptrs_size = a_new_size;
			return;
	}
//---------------------------------------------------------------------------
};
}
//---------------------------------------------------------------------------
#endif // __list_CLASS_H
