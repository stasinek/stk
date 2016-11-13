//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_text_H__
#define __tsoft_text_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace text {
//---------------------------------------------------------------------------
		extern int32_t __stdcall len(const char *alpdst);
				extern char	*__stdcall alloc(int32_t asize);
				extern char	*__stdcall allocex(int32_t asize, const char *alpsrc);
				extern char	*__stdcall dup(const char *alpsrc);
				extern char	*__stdcall dupex(char *alpdst, const char *alpsrc);
				extern char	*__stdcall realloc(char *alpdst,int32_t alen);
				extern char	*__stdcall reallocex(char *alpdst, int32_t alen, const char *alpsrc);
				extern void	 __stdcall free(char *alpdst);
//---------------------------------------------------------------------------
				extern char	*__stdcall mov(char *alpdst, const char *alpsrc);
				extern char	*__stdcall movn(char *alpdst, const char *alpsrc, int32_t alenght);
//---------------------------------------------------------------------------
				extern char	*__stdcall add(char *alpdst, const char *alpsrc);
				extern char	*__stdcall insert(char *alpdst, const int32_t astart, const char *insert);
				extern char	*__stdcall del(char *alpdst, const int32_t astart, const int32_t alen);
				extern char	*__stdcall deln(char *alpdst,const  int32_t astart, const int32_t aend);
				extern char	*__stdcall sub(char *alpdst, const char *alpsrc, const int32_t astart,const int32_t alen);
				extern char	*__stdcall subend(char *alpdst, const char *alpsrc, const int32_t astart, const int32_t aend);
				extern int32_t  __stdcall pos(const char *alpsrc, const int32_t abegin, const char *alpfnd);
				extern char	*__stdcall upr(char *alpdst);
				extern char	*__stdcall lwr(char *alpdst);
				extern int32_t  __stdcall cmp(const char *alp1, const char *alp2);
//---------------------------------------------------------------------------
				extern char	*__stdcall replace(char *alpdst, const char *alpfnd, const char *alpexh);
				extern char	*__stdcall replace_chr(char *alpdst, const char alpfnd, const char alpexh);
//---------------------------------------------------------------------------
				extern int32_t  __stdcall delimiter(const char *alpsrc, const char delimiter, const int32_t adirection);
//---------------------------------------------------------------------------
				extern char	*__stdcall extract_fileroot(char *alpdst, const char *alpsrc);
				extern char	*__stdcall extract_file_path(char *alpdst, const char *alpsrc);
				extern char	*__stdcall extract_file_name(char *alpdst, const char *alpsrc);
				extern char	*__stdcall extract_file_ext(char *alpdst, const char *alpsrc);
//---------------------------------------------------------------------------
				extern char	*__stdcall fix_file_path(char *alpdst, const char *alpsrc);
//---------------------------------------------------------------------------
				extern char 	*__stdcall itoa(int32_t aint, char* astr, int8_t abase);
				extern char	*__stdcall itoa(int32_t aint);
				extern int32_t  __stdcall atoi(const char *astr);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif // TSOFT_TEXT_H
