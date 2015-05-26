//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_text_H__
#define __tsoft_text_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace text { namespace c_str {
//---------------------------------------------------------------------------
		extern __int32 __stdcall len(const char *alpdst);
		extern char	*__stdcall alloc(__int32 asize);
		extern char	*__stdcall allocex(__int32 asize, const char *alpsrc);
		extern char	*__stdcall dup(const char *alpsrc);
		extern char	*__stdcall dupex(char *alpdst, const char *alpsrc);
		extern char	*__stdcall realloc(char *alpdst,__int32 alen);
		extern char	*__stdcall reallocex(char *alpdst, __int32 alen, const char *alpsrc);
		extern void	 __stdcall free(char *alpdst);
//---------------------------------------------------------------------------
		extern char	*__stdcall mov(char *alpdst, const char *alpsrc);
		extern char	*__stdcall movn(char *alpdst, const char *alpsrc, __int32 alenght);
//---------------------------------------------------------------------------
		extern char	*__stdcall add(char *alpdst, const char *alpsrc);
		extern char	*__stdcall insert(char *alpdst, const __int32 astart, const char *insert);
		extern char	*__stdcall del(char *alpdst, const __int32 astart, const __int32 alen);
		extern char	*__stdcall deln(char *alpdst,const  __int32 astart, const __int32 aend);
		extern char	*__stdcall sub(char *alpdst, const char *alpsrc, const __int32 astart,const __int32 alen);
		extern char	*__stdcall subend(char *alpdst, const char *alpsrc, const __int32 astart, const __int32 aend);
		extern __int32  __stdcall pos(const char *alpsrc, const __int32 abegin, const char *alpfnd);
		extern char	*__stdcall upr(char *alpdst);
		extern char	*__stdcall lwr(char *alpdst);
		extern __int32  __stdcall cmp(const char *alp1, const char *alp2);
//---------------------------------------------------------------------------
		extern char	*__stdcall replace(char *alpdst, const char *alpfnd, const char *alpexh);
		extern char	*__stdcall replace_chr(char *alpdst, const char alpfnd, const char alpexh);
//---------------------------------------------------------------------------
		extern __int32  __stdcall delimiter(const char *alpsrc, const char delimiter, const __int32 adirection);
//---------------------------------------------------------------------------
		extern char	*__stdcall extract_fileroot(char *alpdst, const char *alpsrc);
		extern char	*__stdcall extract_file_path(char *alpdst, const char *alpsrc);
		extern char	*__stdcall extract_file_name(char *alpdst, const char *alpsrc);
		extern char	*__stdcall extract_file_ext(char *alpdst, const char *alpsrc);
//---------------------------------------------------------------------------
		extern char	*__stdcall fix_file_path(char *alpdst, const char *alpsrc);
//---------------------------------------------------------------------------
				extern const char	*__stdcall ltoa(const __int32 aint, char* astr, const __int8 abase);
				extern const char	*__stdcall ltoa(const __int32 aint, const __int8 abase);
				extern const char	*__stdcall ltoa(const __int32 aint);
				extern __int32  __stdcall atol(const char *astr);
//---------------------------------------------------------------------------
}}}
//---------------------------------------------------------------------------
#endif // TSOFT_TEXT_H
