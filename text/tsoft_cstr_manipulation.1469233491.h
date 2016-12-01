//---------------------------------------------------------------------------
#ifndef tsoft_cstr_manipulation_H
#define tsoft_cstr_manipulation_H
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../mem/tsoft_mem.h"
//---------------------------------------------------------------------------
namespace ts { namespace cstr {
//---------------------------------------------------------------------------
        extern char     *__stdcall alloc                (const size_t a_size);
        extern char     *__stdcall allocex              (const size_t a_size, char const*a_src_ptr);
//---------------------------------------------------------------------------
        extern char     *__stdcall realloc              (char *a_dst_ptr, const size_t a_size);
        extern char     *__stdcall reallocex            (char *a_dst_ptr, const size_t a_size, char const*a_src_ptr);
//---------------------------------------------------------------------------
        extern void      __stdcall free                 (char *a_dst_ptr);
//---------------------------------------------------------------------------
        extern char		*__stdcall dup					(char const*a_src_ptr);
        extern char		*__stdcall dupex				(char *a_dst_ptr, char const*a_src_ptr);
//---------------------------------------------------------------------------
        extern char		*__stdcall mov					(char *a_dst_ptr, char const*a_src_ptr);
        extern char		*__stdcall mov_max				(char *a_dst_ptr, char const*a_src_ptr, const size_t a_end);
        extern char     *__stdcall mov_if               (char* a_dst_ptr, const char* a_src_ptr, const char c);
        extern char*     __stdcall mov_if_dups          (char* a_dst_ptr, const char* a_src_ptr);
//---------------------------------------------------------------------------
        extern char		*__stdcall catex 				(char *a_dst_ptr, char const*a_src_ptr);
        extern char		*__stdcall cat					(char *a_dst_ptr, char const*a_src_ptr);
        extern char		*__stdcall insert				(char *a_dst_ptr, const size_t a_start, const char* insert);
        extern char		*__stdcall cut					(char *a_dst_ptr, const size_t a_start, const size_t a_count);
        extern char		*__stdcall cut_end				(char *a_dst_ptr, const size_t a_start, const size_t a_end);
        extern char		*__stdcall substr	 			(char *a_dst_ptr, char const*a_src_ptr, const size_t a_start, const size_t a_count);
        extern char		*__stdcall substr_end			(char *a_dst_ptr, char const*a_src_ptr, const size_t a_start, const size_t a_end);
        extern intmax_t	 __stdcall pos					(char const*a_src_ptr, const size_t a_start, char const*a_fnd_ptr);
        inline intmax_t	 __stdcall pos					(char const*a_src_ptr, int a_start, char const*a_fnd_ptr) {
			return pos((const char*)a_src_ptr,(const int)a_start,(const char*)a_fnd_ptr);
		}
        extern intmax_t	 __stdcall pos_end				(char const*a_src_ptr, const size_t a_start, char const*a_fnd_ptr, const size_t a_end);
        extern intmax_t	 __stdcall posr		 			(char const*a_src_ptr, const size_t a_start, char const*a_fnd_ptr);
        extern intmax_t	 __stdcall compare				(char const*alp1, char const*alp2);
        extern intmax_t	 __stdcall compare_max			(char const*alp1, char const*alp2, const size_t a_end);
        extern bool	 	 __stdcall test					(char const*alp1, char const*alp2);
        extern intmax_t  __stdcall between_c            (char* dst, const char* src, const char  c);
        extern intmax_t  __stdcall between_cc           (char* dst, const char* src, const char  l, const char  r);
        extern intmax_t  __stdcall between_words        (char* dst, const char* src, char const*l, char const*r);
        // bool account number-digits checksum is ok
        extern bool      __stdcall luhna_check          (char const*digits);
//---------------------------------------------------------------------------
        extern char		*__stdcall replace_chr  		(char *a_dst_ptr, const char  a_fnd_ptr, const char a_exch_ptr);
        extern char		*__stdcall replace				(char *a_dst_ptr, char const*a_fnd_ptr, char const*a_exch_ptr);
        extern char		*__stdcall upr					(char *a_dst_ptr);
        extern char		*__stdcall lwr					(char *a_dst_ptr);
        extern char		*__stdcall trim					(char *a_dst_ptr);
//---------------------------------------------------------------------------
        extern char		*__stdcall set					(char *a_dst_ptr, const char a_znak, const size_t a_start, const size_t a_count);
        extern char		*__stdcall set_end				(char *a_dst_ptr, const char a_znak, const size_t a_start, const size_t a_end);
        extern intmax_t	 __stdcall chr					(char const*a_src_ptr, const char a_chr);
        extern intmax_t	 __stdcall chr_end				(char const*a_src_ptr, const char a_chr, const size_t a_end);
        extern intmax_t	 __stdcall chrr  				(char const*a_src_ptr, const char a_chr);
        //extern intmax_t	 __stdcall chrr_end				(char const*a_src_ptr, const char a_chr);
        extern intmax_t   __stdcall chr_sum             (const char* a_str_ptr, const char a_chr);
        //---------------------------------------------------------------------------
        extern size_t	 __stdcall len					(char const*a_src_ptr);
        //---------------------------------------------------------------------------
        extern char     *__stdcall brks 				(char const*a_src_ptr, const size_t a_start, char const*a_brk);
        inline char     *__stdcall brk                  (char const*a_src_ptr, char const*a_brk) {
        	return brks(a_src_ptr,0,a_brk);
        }
        inline size_t   __stdcall spn                  (char const*s, char const*set) {
            register char *r = brks(s,0,set);
            if (r==NULL) return len(s);
            else return r - s;
        }
//---------------------------------------------------------------------------
        //extern char         *__stdcall get_file_name    (char const*a_src_ptr);
        //extern char         *__stdcall get_file_extt    (char const*a_src_ptr);
        //---------------------------------------------------------------------------
        extern char         *__stdcall get_file_root    (char *a_dst_ptr, char const*a_src_ptr);
        extern char         *__stdcall get_file_path    (char *a_dst_ptr, char const*a_src_ptr);
        extern char         *__stdcall get_file_name    (char *a_dst_ptr, char const*a_src_ptr);
        extern char         *__stdcall get_file_extt    (char *a_dst_ptr, char const*a_src_ptr);
        //---------------------------------------------------------------------------
        extern char         *__stdcall fix_file_path    (char *a_dst_ptr, char const*a_src_ptr);
        //---------------------------------------------------------------------------
        extern int		 	 __stdcall atoi             (char const*a_src_ptr);
        extern const char	*__stdcall itoa             (const int a_int, char* a_dst_ptr, const int8_t abase);
        extern const char	*__stdcall itoa             (const int a_int, const int8_t abase);
        extern const char	*__stdcall itoa             (const int a_int);
//---------------------------------------------------------------------------
inline int isupper(char c){
    return (c >= 'A' && c <= 'Z');
}
inline int isalpha(char c){
    return ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'));
}
inline int isspace(char c){
    return (c == ' ' || c == '\t' || c == '\n' || c == '\12');
}
inline int isdigit(char c){
    return (c >= '0' && c <= '9');
}
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif // TSOFT_TEXT_H
