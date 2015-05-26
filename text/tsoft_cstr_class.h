//---------------------------------------------------------------------------
#ifndef __tsoft_text_c_H__
#define __tsoft_text_c_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./tsoft_cstr_manipulation.h"
#include "./../__vector.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
class __cstr_class : public __vector<char> {
//---------------------------------------------------------------------------
	protected:
	void						 __stdcall	__init(const uint32_t a_initial_size, const char* __restrict__ a_c_to_clone);
//-------------------------------
	char *f_ptr;
	uint32_t f_ptr_size;
	mutable char *f_ptr_dup;
	mutable char *f_subs;
	mutable uint32_t f_subs_size;
//-------------------------------
	public:
//-------------------------------
						__stdcall	__cstr_class(void);
						__stdcall	__cstr_class(const char* __restrict__ a_c_to_clone);
						__stdcall	__cstr_class(const uint32_t a_initial_size);
						__stdcall	__cstr_class(const uint32_t a_initial_size, const char* __restrict__ a_c_to_clone);
	   const char*		__stdcall	set(const char* __restrict__ a_c_to_clone);
inline const char      *__stdcall   set(__cstr_class* __restrict__ a_text_c) {
return set(a_text_c->c_str());
}
inline const char      *__stdcall   set(const __int32 a_i_to_clone) {
return set(ts::cstr::itoa(a_i_to_clone));
}
	  const char	   *__stdcall	add(const char* __restrict__ a_c_to_add);
inline      char       *__stdcall   data() {
return f_ptr;
}
inline const char      *__stdcall   at(const uint32_t a_pos) const {
return (const char*)&f_ptr[a_pos];
}
inline const char      *__stdcall   operator[] (const uint32_t a_pos) const {
return at(a_pos);
}
	const   char	   *__stdcall	front(void) const;
	const   char	   *__stdcall	back(void)  const;
	const   char	   *__stdcall	substr(uint32_t a_pos, uint32_t a_len)  const;
inline      uint32_t    __stdcall   len(void) const {
return ts::cstr::len(f_ptr);
}
inline      uint32_t    __stdcall   size(void) const {
return f_ptr_size;
}
		void			__stdcall	reserve(const uint32_t a_new_size);
		void			__stdcall	resize(const uint32_t a_new_len);
		void			__stdcall	shrink_to_fit();
		void			__stdcall	clear();
inline __int32          __stdcall   i(void) const {
return ts::cstr::atoi(f_ptr);
}
inline const char      *__stdcall   c_str(void) const {
return (const char*)f_ptr;
}
inline                  __stdcall   operator const char* () const {
return c_str();
}
inline                  __stdcall   operator __int32 () const {
return i();
}
inline const char      *__stdcall   operator= (const char* __restrict__ a_text_to_clone) {
return set(a_text_to_clone);
}
inline const char      *__stdcall   operator= (const char a_char_to_clone) {
char c[2];
c[0] = a_char_to_clone; c[1] = '\0';
return set(c);
}
inline const char      *__stdcall   operator= (const bool a_bool_to_clone) {
if (a_bool_to_clone) return set("1");
else return set("0");
}
inline const char*		__stdcall	operator= (const __int32 a_i_to_clone) {
return set(a_i_to_clone);
}
										__stdcall  ~__cstr_class();
		__int32			__stdcall	test();
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif

