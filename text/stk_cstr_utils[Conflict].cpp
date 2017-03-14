//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_cstr_utils.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------

char     *__stdcall ts::cstr::alloc(size_t a_size) {
return (char*)ts::mem::alloc(a_size);
}
//---------------------------------------------------------------------------

char     *__stdcall ts::cstr::allocex(const size_t a_size, const char *a_src_ptr) {
return mov((char*)alloc(a_size), a_src_ptr);
}
//---------------------------------------------------------------------------

char     *__stdcall ts::cstr::realloc(char *a_dst_ptr, const size_t a_size) {
return (char*)ts::mem::realloc(a_dst_ptr, a_size);
}
//---------------------------------------------------------------------------

char     *__stdcall ts::cstr::reallocex(char *a_dst_ptr, const size_t a_size, const char *a_src_ptr) {
return mov(realloc(a_dst_ptr,a_size),a_src_ptr);
}
//---------------------------------------------------------------------------

void      __stdcall ts::cstr::free(char *a_dst_ptr) {
ts::mem::free(a_dst_ptr);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::dup(const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t sl = ts::cstr::len(a_src_ptr);
    return ts::cstr::mov_max(ts::cstr::alloc(sl+1),a_src_ptr,sl+1);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::dupex(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t sl = ts::cstr::len(a_src_ptr);
    return ts::cstr::mov_max(ts::cstr::realloc(a_dst_ptr,sl+1),a_src_ptr,sl+1);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::catex(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t dl = ts::cstr::len(a_dst_ptr);
    register size_t sl = ts::cstr::len(a_src_ptr);
    return ts::cstr::mov_max((char*)(&a_dst_ptr[dl]),a_src_ptr,sl+1);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::cat(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t l = ts::cstr::len(a_dst_ptr);
    return ts::cstr::mov((char*)(&a_dst_ptr[l]),a_src_ptr);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::mov(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
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

char *__stdcall ts::cstr::mov_max(char *a_dst_ptr, const char *a_src_ptr, const size_t a_len)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
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

char* __stdcall ts::cstr::mov_if(char* a_dst_ptr, const char* a_src_ptr, const char c)
{
 register char *s = (char*)a_src_ptr;
 register char *d = a_dst_ptr;
 for (; *s; s++) if (*s!=c) *d++ = *s;
 *d = 0;
 return a_dst_ptr;
}
//---------------------------------------------------------------------------

char* __stdcall ts::cstr::mov_if_dups(char* dst, const char* src)
{
 register char *s = (char*)src;
 register char *d = dst;
 for (register char last = 0; *s; s++) if (*s != last) *d++ = last = *s;
 *d = 0;
 return dst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::insert(char *a_dst_ptr, const size_t astart, const char* const ainsert)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t insertlen = ts::cstr::len(ainsert), cellen = ts::cstr::len(a_dst_ptr);
    if (insertlen==0) return a_dst_ptr;
    if (cellen > astart) {
        ts::cstr::mov_max((char*)(&a_dst_ptr[astart+insertlen]),(char*)(&a_dst_ptr[astart]),cellen-astart+1);
    }
    ts::cstr::mov_max((char*)(&a_dst_ptr[astart]),(char*)ainsert,insertlen);
    a_dst_ptr[cellen+insertlen] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::cut(char *a_dst_ptr, const size_t astart, const size_t a_len)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t len = ts::cstr::len(a_dst_ptr);
    register size_t len_mov = len-astart-a_len;
    if (len_mov > 0)ts::cstr::mov_max((char*)(&a_dst_ptr[astart]),(char*)(&a_dst_ptr[astart+a_len]),len_mov);
    a_dst_ptr[len-a_len] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::cut_end(char *a_dst_ptr, const size_t astart, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t len = ts::cstr::len(a_dst_ptr);
    register size_t len_mov = len-(aend+1);
    if (len_mov > 0)ts::cstr::mov_max((char*)(&a_dst_ptr[astart]),(char*)(&a_dst_ptr[aend+1]),len_mov);
    a_dst_ptr[len-(aend+1-astart)] = 0;
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::pos(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register int32_t src_size = ts::cstr::len(a_src_ptr), fnd_size = ts::cstr::len(a_seach_ptr);
    return ts::mem::pos(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::pos_end(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t src_size = ts::cstr::len(a_src_ptr), fnd_size = ts::cstr::len(a_seach_ptr);
    if (src_size > aend) src_size = aend;
    return ts::mem::pos(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::posr(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    size_t src_size = ts::cstr::len(a_src_ptr), fnd_size = ts::cstr::len(a_seach_ptr);
    return ts::mem::posr(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------

/*size_t __stdcall ts::cstr::posr_end(const char *a_src_ptr, const size_t a_start, const char *a_seach_ptr, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t src_size = ts::cstr::len(a_src_ptr), fnd_size = ts::cstr::len(a_seach_ptr);
    if (src_size > aend) src_size = aend;
    return ts::mem::posr(a_src_ptr, src_size, a_start, a_seach_ptr, fnd_size);
}
//---------------------------------------------------------------------------
*/
char *__stdcall ts::cstr::substr(char *a_dst_ptr, const char *a_src_ptr, const size_t astart, const size_t a_len)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    ts::cstr::mov_max(a_dst_ptr,(char*)(&a_src_ptr[astart]),a_len);
    a_dst_ptr[a_len] = '\0';
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::substr_end(char *a_dst_ptr, const char *a_src_ptr, const size_t a_start, const size_t a_end)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    ts::cstr::mov_max(a_dst_ptr,(char*)(&a_src_ptr[a_start]),a_end-a_start);
    a_dst_ptr[a_end-a_start] = '\0';
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::chr_end(const char *a_src_ptr, const char a_chr, const size_t a_end)
{
    return ts::mem::chr(a_src_ptr,a_chr,a_end + 1);
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::chr(const char *a_src_ptr, const char a_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
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

intmax_t __stdcall ts::cstr::chrr(const char *a_src_ptr, const char a_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    if (a_chr=='\0')
    return ts::cstr::chr(a_src_ptr,'\0');
    register const char *s_ptr = a_src_ptr;
    register char c = a_chr;
    register intmax_t r  = -1, rt;
    do {
       rt = ts::cstr::chr(&s_ptr[r + 1], c);
       if (rt >= 0)  r += rt + 1;
       else break;
    } while (1);
return r;
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::chr_sum(const char* a_src_ptr, const char a_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    if (a_chr=='\0')
    return 1;
    register const char *s_ptr = a_src_ptr - 1;
    register char c = a_chr;
    register intmax_t rt, sum = 0;
    do {
       rt = ts::cstr::chr(&s_ptr[1], c);
       if (rt>=0) s_ptr = &s_ptr[rt + 1];
       else break;
    } while (1);
return sum;
}
//---------------------------------------------------------------------------

size_t __stdcall ts::cstr::len(const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
return ts::cstr::chr(a_src_ptr,'\0');
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::brks(const char *a_src_ptr, const size_t a_start, const char *a_brk)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register char *r_brk = (char*)a_brk;
    register char *r_src = (char*)a_src_ptr + a_start;
    register size_t pos;
    register size_t brk_pos;
    register size_t brk_len = ts::cstr::len(a_brk);

    for (pos = 0;; pos++) for (brk_pos = 0; brk_pos <= brk_len; brk_pos++) {
     if (r_src[pos]==r_brk[brk_pos]) {
         if (r_brk[brk_pos]=='\0') return NULL;
         else return r_src + a_start + pos;
        }
    }
    return NULL;
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::between_c(char* dst, const char* src, const char c)
{
    return ts::cstr::between_cc(dst,src,c,c);
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::between_cc(char* dst, const char* src, const char l, const char r)
{
#ifdef __DEBUG_MEM32__
__DEBUG_FUNC_CALLED("")
#endif
if (src[0]=='\0')
return -1;
register intmax_t L_pos = chr(src,l) + 1;
if (L_pos<=0) return -1;
register intmax_t R_pos = L_pos + ts::cstr::chrr(&src[L_pos], r) - 1;
if (R_pos< 0) return -1;
register intmax_t len = R_pos - L_pos + 1;

if (len > 0) ts::cstr::mov_max(dst,&src[L_pos],len);
else dst[len] = '\0';
return len;
}
//---------------------------------------------------------------------------

intmax_t __stdcall ts::cstr::between_words(char* dst, const char* src, const char *l, const char *r)
{
#ifdef __DEBUG_MEM32__
__DEBUG_FUNC_CALLED("")
#endif
register size_t src_len = ts::cstr::len(src);
register size_t L_len = ts::cstr::len(l), R_len = ts::cstr::len(r);
if (R_len + L_len > src_len)
return -1;

register size_t L_pos = ts::cstr::pos(src,0,l) + L_len;
if (L_pos< L_len) return -1;
register size_t R_pos = ts::cstr::posr(src,L_pos,r);
if (R_pos< L_pos) return -1;
register size_t len = R_pos - L_pos;

if (len > 0) ts::cstr::mov_max(dst,src + L_pos,len);
else dst[len] = '\0';
return len;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::replace(char *a_dst_ptr, const char *a_seach_ptr, const char *a_exch_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    for (register intmax_t pos = 0, find, len_co = ts::cstr::len(a_seach_ptr), len_naco = ts::cstr::len(a_exch_ptr), lencel = ts::cstr::len(a_dst_ptr);; pos = find + len_naco) {
        if (a_dst_ptr[pos]=='\0')
            break;
        if ((find = ts::cstr::pos(a_dst_ptr, pos, a_seach_ptr))==-1)
            break;
        ts::cstr::cut(a_dst_ptr, find, len_co);
        ts::cstr::insert(a_dst_ptr, find, a_exch_ptr);
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::replace_chr(char *a_dst_ptr, const char a_seach_chr, const char a_exch_chr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    for (register size_t pos = 0;; pos++) {
     if (a_dst_ptr[pos]=='\0') return a_dst_ptr;
     if (a_dst_ptr[pos]==a_seach_chr) a_dst_ptr[pos] =a_exch_chr;
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::trim(char *a_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif

register size_t len = ts::cstr::len(a_ptr);
if (len==0)
return a_ptr;
register size_t c1 = 0;
while (a_ptr[c1]==' ' && c1 < len) {
    c1++;
}
register size_t c2 = len - 1;
while (a_ptr[c2]==' ' && c2 > 0) {
    c2--;
}
register size_t len_mov = c2 - c1 + 1;
if (len_mov < len)ts::cstr::mov_max((char*)(&a_ptr[0]),(char*)(&a_ptr[c1]),len_mov);
a_ptr[len_mov] = 0;
return a_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::get_file_root(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    intmax_t delimiter = ts::cstr::chr(a_src_ptr,'\\');
    if (delimiter>=0) {
        ts::cstr::substr_end(a_dst_ptr,a_src_ptr,0,delimiter);
        return a_dst_ptr;
    } else if (a_dst_ptr!=a_src_ptr) {
         ts::cstr::mov(a_dst_ptr, a_src_ptr);
        return a_dst_ptr;
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::get_file_path(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    intmax_t delimiter = ts::cstr::chrr(a_src_ptr,'\\');
    if (delimiter>=0) {
        ts::cstr::substr_end(a_dst_ptr,a_src_ptr,0,delimiter);
        return a_dst_ptr;
    } else if (a_dst_ptr!=a_src_ptr) {
         ts::cstr::mov(a_dst_ptr,a_src_ptr);
        return a_dst_ptr;
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::get_file_name(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    intmax_t delimiter = ts::cstr::chrr(a_src_ptr, '\\');
    if (delimiter>=0) {
        return ts::cstr::substr_end(a_dst_ptr,a_src_ptr,delimiter+1, ts::cstr::len(a_src_ptr));
    } else if (a_dst_ptr!=a_src_ptr) {
        return (char*) ts::cstr::mov(a_dst_ptr,a_src_ptr);
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::get_file_extt(char *a_dst_ptr, const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    intmax_t delimiter = ts::cstr::chrr(a_src_ptr, '.');
    if (delimiter>=0) {
        return ts::cstr::substr_end(a_dst_ptr,a_src_ptr,delimiter+1, ts::cstr::len(a_src_ptr));
    } else if (a_dst_ptr!=a_src_ptr) {
        return (char*) ts::cstr::mov(a_dst_ptr,a_src_ptr);
    }
    return a_dst_ptr;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::fix_file_path(char *a_dst_ptr,const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    register size_t                              lensrc = ts::cstr::len(a_src_ptr);
    register size_t lendestination = lensrc;
    if (lensrc==0) {
        a_dst_ptr[0]='\0';
        return a_dst_ptr;
    }
    while (a_src_ptr[lensrc-1]=='\\' || a_src_ptr[lensrc-1]==' ' || a_src_ptr[lensrc-1]=='"') {
        ts::cstr::mov_max(a_dst_ptr,a_src_ptr,lensrc-1);
        lensrc--;
        a_dst_ptr[lensrc]='\0';
        if (lensrc==0) break;
    }
    while (a_src_ptr[0]=='"' || a_src_ptr[0]==' ') {
        ts::cstr::mov_max(a_dst_ptr,&a_src_ptr[1],lensrc-1);
        lensrc--;
        a_dst_ptr[lensrc]='\0';
        if (lensrc==0) break;
    }
    if (lendestination==lensrc) ts::cstr::mov_max(a_dst_ptr,a_src_ptr,lensrc + 1);
    return a_dst_ptr;
}
//---------------------------------------------------------------------------
/*
char *__stdcall ts::cstr::get_file_name(const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
size_t delimiter = ts::cstr::chrr(a_src_ptr, '/');
    if (delimiter <0) delimiter = ts::cstr::chrr(a_src_ptr, '\\');

    if (delimiter>=0) {
        return (char*)(a_src_ptr + delimiter + 1);
    } else
        return (char*)(a_src_ptr);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::get_file_extt(const char *a_src_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif

size_t delimiter = ts::cstr::chrr(a_src_ptr, '.');
    if (delimiter>=0) {
        return (char*)(a_src_ptr + delimiter);
    } else
        return (char*)(a_src_ptr);
}
//---------------------------------------------------------------------------
*/

bool __stdcall ts::cstr::luhna_check(const char *digits)
{
#ifdef __DEBUG_MEM32__
__DEBUG_FUNC_CALLED("")
#endif
    register bool alt = false;
    register intmax_t len = ts::cstr::len(digits);
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

char *__stdcall ts::cstr::upr(char *a_dst_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif

    register size_t l = ts::cstr::len(a_dst_ptr);
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

char *__stdcall ts::cstr::lwr(char *a_dst_ptr)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif

    register size_t l = ts::cstr::len(a_dst_ptr);
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

intmax_t  __stdcall ts::cstr::compare(const char *alp1, const char *alp2)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif

    register size_t l1 = ts::cstr::len(alp1), l2 = ts::cstr::len(alp2),  r;
    if (l1>l2) {
        r = ts::mem::cmp(alp1,alp2,l2);
//      cmp != equal
        if (r==0) r = +1;
    }
    else
    if (l1<l2) {
        r = ts::mem::cmp(alp1,alp2,l1);
//      cmp != equal
        if (r==0) r = -1;
    }
    else {
        r = ts::mem::cmp(alp1,alp2,l1);
    }
    return r;
}
//---------------------------------------------------------------------------

intmax_t  __stdcall ts::cstr::compare_max(const char *alp1, const char *alp2, const size_t a_end)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif

    register size_t l1 = ts::cstr::len(alp1), l2 = ts::cstr::len(alp2),  r;
    if (l1 > a_end) l1 = a_end;
    if (l2 > a_end) l2 = a_end;

    if (l1>l2) {
        r = ts::mem::cmp(alp1,alp2,l2);
//      cmp != equal
        if (r==0) r = +1;
    }
    else
    if (l1<l2) {
        r = ts::mem::cmp(alp1,alp2,l1);
//      cmp != equal
        if (r==0) r = -1;
    }
    else {
        r = ts::mem::cmp(alp1,alp2,l1);
    }
    return r;

}
//---------------------------------------------------------------------------

bool  __stdcall ts::cstr::test(const char *alp1, const char *alp2)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
return compare(alp1,alp2)==0;
}
//---------------------------------------------------------------------------

const char *__stdcall ts::cstr::itoa(const int a_int)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    return ts::cstr::itoa(a_int,10);
}
//---------------------------------------------------------------------------

const char *__stdcall ts::cstr::itoa(const int a_int, const int8_t a_base)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    static char str[32];
    return ts::cstr::itoa(a_int,str,a_base);
}
//---------------------------------------------------------------------------

const char *__stdcall ts::cstr::itoa(const int aint, char* astr, const int8_t abase)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
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
    ts::mem::rev(astr,astr, i);
    return astr;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::cstr::atoi(const char *a_src)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
    return ::atol(a_src);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::set(char *alpdst, const char a_znak_byte, const size_t astart, const size_t alen)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
ts::mem::set((char*)alpdst+astart,a_znak_byte,alen);
return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::set_end(char *alpdst, const char a_znak, const size_t astart, const size_t aend)
{
#ifdef __DEBUG_CSTR__
__DEBUG_FUNC_CALLED("")
#endif
ts::mem::set((char*)alpdst+astart,a_znak,aend-astart);
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
using namespace std;
 
int main_ascii()
{   int i,j;
    char cmd[32][4]= {"NUL","SOH","STX","ETX","EOT","ENQ","ACK","BEL","BS","TAB",
                      "LF","VT","FF","CR","SO","SI","DLE","DC1","DC2","DC3","DC4","NAK",
                      "SYN","ETB","CAN","EM","SUB","ESC","FS","GS","RS","US"};
     std::cout << "The standard ASCII table defines 128 character codes (from 0 to 127),";
     std::cout << "\n of which,the first 32 are control codes (non-printable), and the";
     std::cout << "\n remaining 96 charactercodes are representable characters:\n";
        std::cout << "*";
    for( i = 0 ; i < 10 ; i++)
        std::cout << setw(4) << i;
 
    for( i = 0x41 ; i < 0x47 ; i++)
        std::cout << setw(4) << static_cast<char>(i);
        std::cout << std::endl << "-- ";
 
    for( i = 0 ; i < 16 ; i++)
     std::cout << left << "--- ";
 
    for( i = 0 ; i < 2 ; i++ )
        {
            std::cout << std::endl <<  i << "| " ;
 
    for(j = 0 ; j < 16 ; j++)
        std::cout << setw(4) << left << cmd[i*16+j];
        }
    for( i = 2 ; i < 8 ; i++ )
        {
        std::cout << std::endl << i << "| " ;
    for( j = 0 ; j < 16 ; j++)
            if((i*16 + j) != 127 )
         std::cout << setw(4) << left << static_cast<char>(i*16+j);
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
