//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include <iomanip>
#pragma hdrstop
#include "./../io/stk_console.h"
#include "./../mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_cstr_utils.h"
//---------------------------------------------------------------------------

char     *__stdcall stk::cstr::alloc(size_t a_size) {
return (char*)stk::mem::alloc(a_size);
}
//---------------------------------------------------------------------------

char     *__stdcall stk::cstr::allocex(const size_t a_size, const char *a_src_ptr) {
return mov((char*)alloc(a_size), a_src_ptr);
}
//---------------------------------------------------------------------------

char     *__stdcall stk::cstr::realloc(char *a_dst_ptr, const size_t a_size) {
return (char*)stk::mem::realloc(a_dst_ptr, a_size);
}
//---------------------------------------------------------------------------

char     *__stdcall stk::cstr::reallocex(char *a_dst_ptr, const size_t a_size, const char *a_src_ptr) {
return mov(realloc(a_dst_ptr,a_size),a_src_ptr);
}
//---------------------------------------------------------------------------

void      __stdcall stk::cstr::free(char *a_dst_ptr) {
stk::mem::free(a_dst_ptr);
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::dup(const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t sl = stk::cstr::len(a_src_ptr);
    return stk::cstr::mov_max(stk::cstr::alloc(sl+1),a_src_ptr,sl+1);
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::dupex(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t sl = stk::cstr::len(a_src_ptr);
    return stk::cstr::mov_max(stk::cstr::realloc(a_dst_ptr,sl+1),a_src_ptr,sl+1);
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::catex(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t dl = stk::cstr::len(a_dst_ptr);
    register size_t sl = stk::cstr::len(a_src_ptr);
    return stk::cstr::mov_max((char*)(&a_dst_ptr[dl]),a_src_ptr,sl+1);
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::cat(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t l = stk::cstr::len(a_dst_ptr);
    return stk::cstr::mov((char*)(&a_dst_ptr[l]),a_src_ptr);
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::mov(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register char *ptr_s = (char*)a_src_ptr;
    register char *ptr_d = (char*)a_dst_ptr;
    for (;;ptr_s++,ptr_d++) {
              *ptr_d = *ptr_s;
          if (*ptr_s==0)
          break;
        }
return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::mov_max(char *a_dst_ptr, const char *a_src_ptr, const size_t a_len)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t n = a_len;
    register char *ptr_s = (char*)a_src_ptr;
    register char *ptr_d = (char*)a_dst_ptr;
    for (;;ptr_s++,ptr_d++,n--) {
          if (n==0)
          {*ptr_d = '\0';
           break;
          }
          else *ptr_d = *ptr_s;
          if (*ptr_s==0)
           break;
        }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char* __stdcall stk::cstr::mov_if(char* a_dst_ptr, const char* a_src_ptr, const char c)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
 register char *s = (char*)a_src_ptr;
 register char *d = a_dst_ptr;
 for (; *s; s++) if (*s!=c) *d++ = *s;
 *d = 0;
 return a_dst_ptr;
}
//---------------------------------------------------------------------------

char* __stdcall stk::cstr::mov_if_dups(char* dst, const char* src)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
 register char *s = (char*)src;
 register char *d = dst;
 for (register char last = 0; *s; s++) if (*s != last) *d++ = last = *s;
 *d = 0;
 return dst;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::insert(char *a_dst_ptr, const size_t astart, const char* const ainsert)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t insertlen = stk::cstr::len(ainsert), cellen = stk::cstr::len(a_dst_ptr);
    if (insertlen==0) return a_dst_ptr;
    if (cellen > astart) {
        stk::cstr::mov_max((char*)(&a_dst_ptr[astart+insertlen]),(char*)(&a_dst_ptr[astart]),cellen-astart+1);
    }
    stk::cstr::mov_max((char*)(&a_dst_ptr[astart]),(char*)ainsert,insertlen);
    a_dst_ptr[cellen+insertlen] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::cut(char *a_dst_ptr, const size_t astart, const size_t a_len)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t len = stk::cstr::len(a_dst_ptr);
    register size_t len_mov = len-astart-a_len;
    if (len_mov > 0)stk::cstr::mov_max((char*)(&a_dst_ptr[astart]),(char*)(&a_dst_ptr[astart+a_len]),len_mov);
    a_dst_ptr[len-a_len] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::cut_end(char *a_dst_ptr, const size_t astart, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t len = stk::cstr::len(a_dst_ptr);
    register size_t len_mov = len-(aend+1);
    if (len_mov > 0)stk::cstr::mov_max((char*)(&a_dst_ptr[astart]),(char*)(&a_dst_ptr[aend+1]),len_mov);
    a_dst_ptr[len-(aend+1-astart)] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::pos(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register int32_t src_size = stk::cstr::len(a_src_ptr), fnd_size = stk::cstr::len(a_seach_ptr);
    return stk::mem::pos(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::pos_end(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t src_size = stk::cstr::len(a_src_ptr), fnd_size = stk::cstr::len(a_seach_ptr);
    if (src_size > aend) src_size = aend;
    return stk::mem::pos(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::posr(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    size_t src_size = stk::cstr::len(a_src_ptr), fnd_size = stk::cstr::len(a_seach_ptr);
    return stk::mem::posr(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------

/*size_t __stdcall stk::cstr::posr_end(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t src_size = stk::cstr::len(a_src_ptr), fnd_size = stk::cstr::len(a_seach_ptr);
    if (src_size > aend) src_size = aend;
    return stk::mem::posr(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------
*/
char *__stdcall stk::cstr::substr(char *a_dst_ptr, const char *a_src_ptr, const size_t astart, const size_t a_len)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    stk::cstr::mov_max(a_dst_ptr,(char*)(&a_src_ptr[astart]),a_len);
    a_dst_ptr[a_len] = '\0';
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::substr_end(char *a_dst_ptr, const char *a_src_ptr, const size_t a_start, const size_t a_end)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    stk::cstr::mov_max(a_dst_ptr,(char*)(&a_src_ptr[a_start]),a_end-a_start);
    a_dst_ptr[a_end-a_start] = '\0';
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::chr_end(const char *a_src_ptr, const char a_chr, const size_t a_end)
{
    return stk::mem::chr(a_src_ptr,a_chr,a_end + 1);
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::chr(const char *a_src_ptr, const char a_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register char  c = a_chr;
    register char *src_e = (char*)a_src_ptr;
    register char *src_b = (char*)a_src_ptr;
    for (;;src_e++) {
         if (*src_e==c) return src_e - src_b;
         else
         if (*src_e==0)
         break;
        }
return -1;
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::chrr(const char *a_src_ptr, const char a_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    if (a_chr=='\0')
    return stk::cstr::chr(a_src_ptr,'\0');
    register const char *s_ptr = a_src_ptr;
    register char c = a_chr;
    register intmax_t r  = -1, rt;
    do {
       rt = stk::cstr::chr(&s_ptr[r + 1], c);
       if (rt >= 0)  r += rt + 1;
       else break;
    } while (1);
return r;
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::chr_sum(const char* a_src_ptr, const char a_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    if (a_chr=='\0')
    return 1;
    register const char *s_ptr = a_src_ptr - 1;
    register char c = a_chr;
    register intmax_t rt, sum = 0;
    do {
       rt = stk::cstr::chr(&s_ptr[1], c);
       if (rt>=0) s_ptr = &s_ptr[rt + 1];
       else break;
    } while (1);
return sum;
}
//---------------------------------------------------------------------------

size_t __stdcall stk::cstr::len(const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
return stk::cstr::chr(a_src_ptr,'\0');
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::brks(const char *a_src_ptr, const size_t a_start, const char *a_brk)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register char *r_brk = (char*)a_brk;
    register char *r_src = (char*)a_src_ptr + a_start;
    register size_t pos;
    register size_t brk_pos;
    register size_t brk_len = stk::cstr::len(a_brk);

    for (pos = 0;; pos++) for (brk_pos = 0; brk_pos <= brk_len; brk_pos++) {
     if (r_src[pos]==r_brk[brk_pos]) {
         if (r_brk[brk_pos]=='\0') return NULL;
         else return r_src + a_start + pos;
        }
    }
    return NULL;
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::between_c(char* dst, const char* src, const char c)
{
    return stk::cstr::between_cc(dst,src,c,c);
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::between_cc(char* dst, const char* src, const char l, const char r)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
if (src[0]=='\0')
return -1;
register intmax_t L_pos = chr(src,l) + 1;
if (L_pos<=0) return -1;
register intmax_t R_pos = L_pos + stk::cstr::chrr(&src[L_pos], r) - 1;
if (R_pos< 0) return -1;
register intmax_t len = R_pos - L_pos + 1;

if (len > 0) stk::cstr::mov_max(dst,&src[L_pos],len);
else dst[len] = '\0';
return len;
}
//---------------------------------------------------------------------------

intmax_t __stdcall stk::cstr::between_words(char* dst, const char* src, const char *l, const char *r)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
register size_t src_len = stk::cstr::len(src);
register size_t L_len = stk::cstr::len(l), R_len = stk::cstr::len(r);
if (R_len + L_len > src_len)
return -1;

register size_t L_pos = stk::cstr::pos(src,0,l) + L_len;
if (L_pos< L_len) return -1;
register size_t R_pos = stk::cstr::posr(src,L_pos,r);
if (R_pos< L_pos) return -1;
register size_t len = R_pos - L_pos;

if (len > 0) stk::cstr::mov_max(dst,src + L_pos,len);
else dst[len] = '\0';
return len;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::replace(char *a_dst_ptr, const char *a_seach_ptr, const char *a_exch_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    for (register intmax_t pos = 0, find, len_co = stk::cstr::len(a_seach_ptr), len_naco = stk::cstr::len(a_exch_ptr), lencel = stk::cstr::len(a_dst_ptr);; pos = find + len_naco) {
        if (a_dst_ptr[pos]=='\0')
            break;
        if ((find = stk::cstr::pos(a_dst_ptr, pos, a_seach_ptr))==-1)
            break;
        stk::cstr::cut(a_dst_ptr, find, len_co);
        stk::cstr::insert(a_dst_ptr, find, a_exch_ptr);
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::replace_chr(char *a_dst_ptr, const char a_seach_chr, const char a_exch_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    for (register size_t pos = 0;; pos++) {
     if (a_dst_ptr[pos]=='\0') return a_dst_ptr;
     if (a_dst_ptr[pos]==a_seach_chr) a_dst_ptr[pos] =a_exch_chr;
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::trim(char *a_ptr,char c)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif

register size_t len = stk::cstr::len(a_ptr);
if (len==0)
    return a_ptr;
register size_t c1 = 0;
while (a_ptr[c1]==c && c1 < len) {
    c1++;
}
register size_t c2 = len - 1;
while (a_ptr[c2]==c && c2 > 0) {
    c2--;
}
register size_t len_mov = c2 - c1 + 1;
if (len_mov < len)stk::cstr::mov_max((char*)(&a_ptr[0]),(char*)(&a_ptr[c1]),len_mov);
a_ptr[len_mov] = 0;
return a_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::get_file_root(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    intmax_t delimiter = stk::cstr::chr(a_src_ptr,'\\');
    if (delimiter>=0) {
        stk::cstr::substr_end(a_dst_ptr,a_src_ptr,0,delimiter);
        return a_dst_ptr;
    } else if (a_dst_ptr!=a_src_ptr) {
        stk::cstr::mov(a_dst_ptr, a_src_ptr);
        return a_dst_ptr;
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::get_file_path(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    intmax_t delimiter = stk::cstr::chrr(a_src_ptr,'\\');
    if (delimiter>=0) {
        stk::cstr::substr_end(a_dst_ptr,a_src_ptr,0,delimiter);
        return a_dst_ptr;
    } else if (a_dst_ptr!=a_src_ptr) {
         stk::cstr::mov(a_dst_ptr,a_src_ptr);
        return a_dst_ptr;
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::get_file_name(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    intmax_t delimiter = stk::cstr::chrr(a_src_ptr, '\\');
    if (delimiter>=0) {
        return stk::cstr::substr_end(a_dst_ptr,a_src_ptr,delimiter+1, stk::cstr::len(a_src_ptr));
    } else if (a_dst_ptr!=a_src_ptr) {
        return (char*) stk::cstr::mov(a_dst_ptr,a_src_ptr);
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::get_file_extt(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    intmax_t delimiter = stk::cstr::chrr(a_src_ptr, '.');
    if (delimiter>=0) {
        return stk::cstr::substr_end(a_dst_ptr,a_src_ptr,delimiter+1, stk::cstr::len(a_src_ptr));
    } else if (a_dst_ptr!=a_src_ptr) {
        return (char*) stk::cstr::mov(a_dst_ptr,a_src_ptr);
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::fix_file_path(char *a_dst_ptr,const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    register size_t lensrc = stk::cstr::len(a_src_ptr);
    register size_t lendestination;
    char *sb = const_cast<char*>(a_src_ptr),*se = const_cast<char*>(a_src_ptr) + lensrc;
    if (lensrc==0) {
        a_dst_ptr[0]='\0';
        return a_dst_ptr;
    }
    while (sb < se ? sb[0]=='\"' || sb[0]==' ' : false) sb++;
    while (se > sb ? se[0]=='\"' || se[0]==' ' || se[0]=='\\' || se[0]=='/': false) se--;
    lendestination = se-sb;

    if (lendestination > 0) stk::cstr::mov_max(a_dst_ptr,sb,lendestination);
    a_dst_ptr[lendestination]='\0'; return a_dst_ptr;
}
//---------------------------------------------------------------------------

bool __stdcall stk::cstr::luhna_check(const char *digits)
{
#ifdef __DEBUG_MEM32__
__DEBUG_CALLED("")
#endif
    register bool alt = false;
    register intmax_t len = stk::cstr::len(digits);
    register intmax_t sum = 0;
    for(register intmax_t i = len - 1; i >= 0; i--)
    {
      int temp = digits[i];
      if(alt) {
         temp *= 2;
         if(temp > 9)
           {
            temp -= 9; //rownowazne dodaniu cyfr do siebie np. 1+6 = 7, 16-9 = 7
           }
        }
      sum += temp; alt = !alt;
    }
    return sum % 10 == 0;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::upr(char *a_dst_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif

    register size_t l = stk::cstr::len(a_dst_ptr);
    register size_t i;
    for (i=0; i < l; i++) {
        if (((unsigned char)a_dst_ptr[i]>=0x61L) &&  ((unsigned char)a_dst_ptr[i]<=0x7AL)) a_dst_ptr[i] = a_dst_ptr[i] & 0xDFL;         //a-z
        else
        if (((unsigned char)a_dst_ptr[i]>=0xE0L) && (((unsigned char)a_dst_ptr[i] <0xFEL) || ((unsigned char)a_dst_ptr[i]==0xFFL))) a_dst_ptr[i] = a_dst_ptr[i] & 0xDFL;                //lacinskie literki male
        // kasowanie najbardziej znacznego bitu, przesuwa w tabeli o szczebelek obie grupy
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::lwr(char *a_dst_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif

    register size_t l = stk::cstr::len(a_dst_ptr);
    register size_t i;
    for (i=0; i < l; i++) {
        if (((unsigned char)a_dst_ptr[i]>=0x41L) && ((unsigned char)a_dst_ptr[i]<=0x5AL)) a_dst_ptr[i] = a_dst_ptr[i] | 0x20L; //A-Z
        else
        if (((unsigned char)a_dst_ptr[i]>=0xC0L) && ((unsigned char)a_dst_ptr[i]<=0xDFL)) a_dst_ptr[i] = a_dst_ptr[i] | 0x20L; //£ACIÑSKIE
        // dodanie najbardziej znacznego bitu przesuwa o szczebelek
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

intmax_t  __stdcall stk::cstr::compare(const char *alp1, const char *alp2)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif

    register size_t l1 = stk::cstr::len(alp1), l2 = stk::cstr::len(alp2),  r;
    if (l1>l2) {
        r = stk::mem::cmp(alp1,alp2,l2);
//      cmp != equal
        if (r==0) r = +1;
    }
    else
    if (l1<l2) {
        r = stk::mem::cmp(alp1,alp2,l1);
//      cmp != equal
        if (r==0) r = -1;
    }
    else {
        r = stk::mem::cmp(alp1,alp2,l1);
    }
    return r;
}
//---------------------------------------------------------------------------

intmax_t  __stdcall stk::cstr::compare_max(const char *alp1, const char *alp2, const size_t a_end)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif

    register size_t l1 = stk::cstr::len(alp1), l2 = stk::cstr::len(alp2),  r;
    if (l1 > a_end) l1 = a_end;
    if (l2 > a_end) l2 = a_end;

    if (l1>l2) {
        r = stk::mem::cmp(alp1,alp2,l2);
//      cmp != equal
        if (r==0) r = +1;
    }
    else
    if (l1<l2) {
        r = stk::mem::cmp(alp1,alp2,l1);
//      cmp != equal
        if (r==0) r = -1;
    }
    else {
        r = stk::mem::cmp(alp1,alp2,l1);
    }
    return r;

}
//---------------------------------------------------------------------------

bool  __stdcall stk::cstr::test(const char *alp1, const char *alp2)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
return compare(alp1,alp2)==0;
}
//---------------------------------------------------------------------------

const char *__stdcall stk::cstr::itoa(const int a_int)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    return stk::cstr::itoa(a_int,10);
}
//---------------------------------------------------------------------------

const char *__stdcall stk::cstr::itoa(const int a_int, const int8_t a_base)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    static char str[32];
    return stk::cstr::itoa(a_int,str,a_base);
}
//---------------------------------------------------------------------------

const char *__stdcall stk::cstr::itoa(const int aint, char* astr, const int8_t abase)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif

    const char *codes = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    register int r_int = aint;
    register int i = 0;
    register bool isNegative = false;
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (r_int == 0) {
        astr[i++] = '0';
        astr[i] = '\0';
        return astr;
    }
    // In standard ltoa(), negative numbers are handled only with
    // base 10. Otherwise numbers are considered unsigned.
    if (r_int < 0 && abase == 10) {
        isNegative = true;
        r_int = -r_int;
    }
    // Process individual digits
    while (r_int != 0) {
        register size_t rem = r_int % abase;
        astr[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        r_int = r_int/abase;
    }
    // If number is negative, append '-'
    if (isNegative)
        astr[i++] = '-';
    astr[i] = '\0'; // Append string terminator
    // Reverse the string
    stk::mem::rev(astr,astr, i);
    return astr;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::cstr::atoi(const char *a_src)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
    return ::atol(a_src);
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::set(char *alpdst, const char a_znak_byte, const size_t astart, const size_t alen)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
stk::mem::set((char*)alpdst+astart,a_znak_byte,alen);
return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall stk::cstr::set_end(char *alpdst, const char a_znak, const size_t astart, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif
stk::mem::set((char*)alpdst+astart,a_znak,aend-astart);
return alpdst;
}
//---------------------------------------------------------------------------

/*
The standard ASCII table defines 128 character codes (from 0 to 127), of
which, the first 32 are control codes (non-printable), and the remaining 96
character codes are representable characters:
*/
#ifndef __WATCOMC__
#include <iostream>
#include <iomanip>

int main_ascii()
{
#ifdef __DEBUG_CSTR__
__DEBUG_CALLED("")
#endif

    char cmd[32][4]= {"NUL","SOH","STX","ETX","EOT","ENQ","ACK","BEL","BS","TAB",
                      "LF","VT","FF","CR","SO","SI","DLE","DC1","DC2","DC3","DC4","NAK",
                      "SYN","ETB","CAN","EM","SUB","ESC","FS","GS","RS","US"};
     std::cout << "The standard ASCII table defines 128 character codes (from 0 to 127),";
     std::cout << "\n of which,the first 32 are control codes (non-printable), and the";
     std::cout << "\n remaining 96 charactercodes are representable characters:\n";
        std::cout << "*";
    register int i,j;
    for( i = 0 ; i < 10 ; i++)
        std::cout << std::setw(4) << i;

    for( i = 0x41 ; i < 0x47 ; i++)
        std::cout << std::setw(4) << static_cast<char>(i);
        std::cout << std::endl << "-- ";

    for( i = 0 ; i < 16 ; i++)
     std::cout << std::left << "--- ";

    for( i = 0 ; i < 2 ; i++ )
        {
            std::cout << std::endl <<  i << "| " ;

    for(j = 0 ; j < 16 ; j++)
        std::cout << std::setw(4) << std::left << cmd[i*16+j];
        }
    for( i = 2 ; i < 8 ; i++ )
        {
        std::cout << std::endl << i << "| " ;
    for( j = 0 ; j < 16 ; j++)
            if((i*16 + j) != 127 )
         std::cout << std::setw(4) << std::left << static_cast<char>(i*16+j);
        }
    std::cout << std::endl << std::endl;
    return 0;
}
#endif

/*Program's output
The standard ASCII table defines 128 character codes (from 0 to 127),
 of which,the first 32 are control codes (non-printable), and the
 remaining 96 charactercodes are representable characters:
*   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
-- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
0| NUL SOH STX ETX EOT ENQ ACK BEL BS  TAB LF  VT  FF  CR  SO  SI
1| DLE DC1 DC2 DC3 DC4 NAK SYN ETB CAN EM  SUB ESC FS  GS  RS  US
2|     !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /
3| 0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
4| @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O
5| P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _
6| `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o
7| p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~
*/
