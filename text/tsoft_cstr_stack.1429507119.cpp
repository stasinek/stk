//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_text_stack.h"
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_text_manipulation.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(void)
:	f_initial_count(0),
		f_count(0),
		f_initial_text_class_size(0),
		f_text_c(NULL)
{
		__cstr_stack(0);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(const __int32 a_initial_count)
:	f_initial_count(0),
		f_count(0),
		f_initial_text_class_size(0),
		f_text_c(NULL)
{
		__cstr_stack(a_initial_count, 0);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(const __int32 a_initial_count, const __int32 a_initial_text_class_size)
:	f_initial_count(0),
		f_count(0),
		f_initial_text_class_size(0),
		f_text_c(NULL)
{
register __int32 r_is = a_initial_text_class_size;
register __int32 r_ic = a_initial_count;
		if (r_is<=0)
				r_is =1;
		if (r_ic<=0)
				r_ic =1;
		set_count(r_ic + 1024,r_is);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_stack::count(void)
{
		return f_count;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_stack::size(void)
{
		return f_count;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_stack::max_size(void)
{
		return STACKCNT;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_stack::set_count(const uint32_t a_count, const __int32 a_text_class_size)
{
		if (f_initial_count < 0)
				f_initial_count=0;
		if (f_initial_count==0 && a_count==0) {
				f_initial_count = a_count;
				f_initial_text_class_size = a_text_class_size;
				f_text_c = NULL;
				return a_count;
		} else if (f_initial_count==0 && a_count >0) {
				f_text_c =  (ts::__cstr_class**)ts::mem32::alloc(a_count * sizeof(ts::__cstr_class*));
				for (;;) {
						f_text_c[f_initial_count] = new ts::__cstr_class(a_text_class_size);
						if (++f_initial_count == a_count)
								break;
				}
				f_initial_text_class_size = a_text_class_size;
				return a_count;
		} else if (f_initial_count < a_count) {
//		f_text_c =   (ts::__cstr_class**)mem32::realloc(f_text_c, a_count * sizeof(ts::__cstr_class*));
				for (;;) {
						f_text_c[f_initial_count] = new ts::__cstr_class(a_text_class_size);
						if (++f_initial_count == a_count)
								break;
				}
				f_initial_text_class_size = a_text_class_size;
				return a_count;
		} else if (f_initial_count > a_count) {
				for (;;) {
								f_initial_count--;
								delete (ts::__cstr_class*)f_text_c[f_initial_count];
								f_text_c[f_initial_count] = NULL;
								if (f_initial_count==a_count)
										break;
				}
		} else {
				f_initial_count = a_count;
				f_initial_text_class_size = a_text_class_size;
				return a_count;
		}
		if (a_count!=0) {
//		f_text_c =   (ts::__cstr_class**)mem32::realloc(f_text_c,a_count * sizeof(ts::__cstr_class*));
				f_initial_text_class_size = a_text_class_size;
				return a_count;
		} else {
				mem32::free(f_text_c);
				f_text_c = NULL;
				f_initial_text_class_size = a_text_class_size;
				return a_count;
		}
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::operator[] (const __int32 a_at_index)
{
return at(a_at_index);
}

//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::pop(const uint32_t a_count)
{
register __int32 r_to_pop = a_count;
		if (r_to_pop <= 0)
				return;
		for (;;) {
				r_to_pop--; f_count--;
				f_text_c[f_count]->reserve(f_initial_text_class_size);
				if (r_to_pop==0) break;
		}
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::pop(void)
{
		pop(1);
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::at(const __int32 a_at_index)
{
if (f_text_c!=NULL && f_count!=0) return f_text_c[a_at_index];
  else return NULL;
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::top(void)
{
if (f_text_c!=NULL && f_count!=0) return f_text_c[f_count-1];
  else return NULL;
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::bottom(void)
{
if (f_text_c!=NULL && f_count!=0) return f_text_c[0];
  else return NULL;
}
//---------------------------------------------------------------------------

bool __stdcall ts::__cstr_stack::empty(void)
{
return (f_count==0);
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(const __int32 a_text_class_size)
{
		if (f_count>=f_initial_count-1) {
//		f_text_c =   (__cstr_class**)mem32::realloc(f_text_c,2 * f_initial_count * sizeof(__cstr_class*));
				for (f_count = (f_initial_count * 2) - 1;; f_count--) {
						f_text_c[f_count] = new ts::__cstr_class(f_initial_text_class_size);
						if (f_count==f_initial_count)
								break;
				}
		} else
				f_count++;
		while (f_text_c[f_count]->size() < a_text_class_size) f_text_c[f_count]->reserve(a_text_class_size);
		return f_text_c[f_count];
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(const char *a_text_to_clone)
{
		register __int32 len = ts::cstr::len(a_text_to_clone);
		register __cstr_class *t = push(len + 1);
		t->set(a_text_to_clone);
		return t;
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(const __int32 a_text_class_size, const char *a_text_to_clone)
{
		register __cstr_class *t = push(a_text_class_size + 1);
		t->set(a_text_to_clone);
		return t;
}
//---------------------------------------------------------------------------
ts::__cstr_class *__stdcall ts::__cstr_stack::push(void)
{
return push(f_initial_text_class_size);
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::swap(const __int32 i1, const __int32 i2)
{
		register __cstr_class   *ptr_i1 = f_text_c[i1];
		f_text_c[i1] = f_text_c[i2];
		f_text_c[i2] = ptr_i1;
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::~__cstr_stack()
{
		set_count(0,0);

}
//---------------------------------------------------------------------------
