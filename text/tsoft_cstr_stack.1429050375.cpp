//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_text_stack.h"
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(void)
: f_initial_count(0), f_count(0), f_initial_text_class_size(0), f_text_c(NULL)
{
		set_count(STACKCNT, STACKSTR);
}
//---------------------------------------------------------------------------

__stdcall ts::__cstr_stack::__cstr_stack(__int32 a_initial_count, __int32 a_initial_text_class_size)
: f_initial_count(0), f_count(0), f_initial_text_class_size(0), f_text_c(NULL)
{
		if (a_initial_text_class_size<=0)
				a_initial_text_class_size = STACKSTR;
		if (a_initial_count<=0)
		a_initial_count = STACKCNT;
		set_count(a_initial_count,a_initial_text_class_size);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_stack::get_count(void)
{
		return f_count;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__cstr_stack::set_count(uint32_t a_count, __int32 a_text_class_size)
{
	if (a_count <0) a_count = 0;
		if (a_text_class_size<=0) a_text_class_size = 1;
		if (f_initial_count < 0)
				f_initial_count=0;
		if (f_initial_count==0 && a_count==0) {
		f_initial_count = a_count;
				f_initial_text_class_size = a_text_class_size;
				f_text_c = NULL;
				return a_count;
		} else if (f_initial_count==0 && a_count >0) {
				f_text_c =  (__cstr_class**)mem32::alloc(a_count * sizeof(__cstr_class*));
				for (;;) {
						f_text_c[f_initial_count] = new __cstr_class(a_text_class_size);
						if (++f_initial_count == a_count)
								break;
				}
				f_initial_text_class_size = a_text_class_size;
		return a_count;
		} else if (f_initial_count < a_count) {
				f_text_c =   (__cstr_class**)mem32::realloc(f_text_c,a_count * sizeof(__cstr_class*));
		for (;;) {
						f_text_c[f_initial_count] = new __cstr_class(a_text_class_size);
			if (++f_initial_count == a_count)
				break;
		}
				f_initial_text_class_size = a_text_class_size;
		return a_count;
	} else if (f_initial_count > a_count && a_count!=0) {
		for (;;) {
			f_initial_count--;
						delete f_text_c[f_initial_count];
						f_text_c[f_initial_count] = NULL;
			if (f_initial_count==a_count)
				break;
		}
				f_text_c =   (__cstr_class**)mem32::realloc(f_text_c,a_count * sizeof(__cstr_class*));
				f_initial_text_class_size = a_text_class_size;
		return a_count;
	} else if (f_initial_count > a_count && a_count==0) {
		for (;;) {
			f_initial_count--;
						delete f_text_c[f_initial_count];
						f_text_c[f_initial_count] = NULL;
			if (f_initial_count==a_count)
				break;
		}
				mem32::free(f_text_c);
				f_text_c = NULL;
				f_initial_text_class_size = a_text_class_size;
		return a_count;
	} else {
		f_initial_count = a_count;
				f_initial_text_class_size = a_text_class_size;
		return a_count;
	}
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::pop(uint32_t a_count)
{
		if (a_count > f_count) a_count = f_count;
		if (a_count <= 0)
		return;
	for (;;) {
				a_count--;
		f_count--;
				f_text_c[f_count]->resize(f_initial_text_class_size);
				if (a_count==0 || f_count==0) break;
	}
}
//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::pop(void)
{
		pop(1);
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(__int32 a_text_class_size)
{
	if (f_count>=f_initial_count-1) {
				f_text_c =   (__cstr_class**)mem32::realloc(f_text_c,2 * f_initial_count * sizeof(__cstr_class*));
		for (f_count = (f_initial_count * 2) - 1;; f_count--) {
						f_text_c[f_count] = new __cstr_class(f_initial_text_class_size);
			if (f_count==f_initial_count)
				break;
		}
	} else
		f_count++;
		while (f_text_c[f_count]->c_size() < a_text_class_size) f_text_c[f_count]->resize(a_text_class_size);
		return f_text_c[f_count];
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(char *a_text_to_clone)
{
		register __int32 len = ts::cstr::len(a_text_to_clone);
		register __cstr_class *t = push(len);
		t->set(a_text_to_clone);
	return t;
}
//---------------------------------------------------------------------------

ts::__cstr_class *__stdcall ts::__cstr_stack::push(__int32 a_text_class_size, char *a_text_to_clone)
{
		register __cstr_class *t = push(a_text_class_size);
		t->set(a_text_to_clone);
	return t;
}
//---------------------------------------------------------------------------
ts::__cstr_class *__stdcall ts::__cstr_stack::push(void)
{
return push(f_initial_text_class_size);
}

//---------------------------------------------------------------------------

void __stdcall ts::__cstr_stack::swap(__int32 i1, __int32 i2)
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
