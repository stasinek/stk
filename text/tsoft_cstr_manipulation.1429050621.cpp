//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_text_manipulation.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------

__int32 __stdcall ts::cstr::len(const char *alpdst)
{
#ifdef BCC
		__asm {
				mov EDI,alpdst
				mov ESI,EDI
				mov ECX,0xFFFFFFFF
				xor EAX,EAX
				cld
				repnz SCASB
				not ECX
				dec ECX
				mov EAX,ECX
		}
// return EAX
#else
		register uint32_t dst_b = (uint32_t)alpdst;
		register uint32_t dst_e = (uint32_t)alpdst;
		register __int32 l;
		while(dst_e!=0xFFFFFFFF) {
				if (((char*)dst_e)[0]==0) break;
				dst_e++;
		}
		l = dst_e - dst_b;
		return l;
//--------------------------
#endif
}
//---------------------------------------------------------------------------
char *__stdcall ts::cstr::alloc(__int32 alen)
{
		return (char*)::calloc(alen,sizeof(char));
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::allocex(__int32 alen, const char *alpsrc)
{
		return ts::cstr::mov(ts::cstr::alloc(alen), alpsrc);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::realloc(char *alpdst, __int32 alen)
{
		return (char*)::realloc(alpdst, alen);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::reallocex(char *alpdst, __int32 alen, const char *alpsrc)
{
		alpdst = ts::cstr::realloc(alpdst,alen);
		ts::cstr::mov(alpdst,alpsrc);
		return alpdst;
}
//---------------------------------------------------------------------------

void __stdcall ts::cstr::free(char *alpdst)
{
		::free(alpdst);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::dup(const char *alpsrc)
{
		register uint32_t src_len = ts::cstr::len(alpsrc);
		return ts::cstr::mov(ts::cstr::alloc(src_len+1),alpsrc);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::dupex(char *alpdst, const char *alpsrc)
{
		register uint32_t src_len = ts::cstr::len(alpsrc);
		return ts::cstr::mov(ts::cstr::realloc(alpdst,src_len+1),alpsrc);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::mov(char *alpdst, const char *alpsrc)
{
		register uint32_t src_len = ts::cstr::len(alpsrc);
		ts::mem32::mov(alpdst,alpsrc,src_len + 1);
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::movn(char *alpdst,const char *alpsrc,__int32 alen)
{
		ts::mem32::mov(alpdst,alpsrc,alen);
		alpdst[alen] = '\0';
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::add(char *alpdst, const char *alpsrc)
{
		register uint32_t dst_len = ts::cstr::len(alpdst);
		ts::cstr::mov((char*)(((uint32_t)alpdst) + dst_len), alpsrc);
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::insert(char *alpdst, __int32 astart, const char *ainsert)
{
		__int32 insertlen = len(ainsert), cellen = len(alpdst);
		if (insertlen==0) return alpdst;
		if (cellen > astart) {
				ts::mem32::mov((char*)((__int32)alpdst+astart+insertlen),(char*)((__int32)alpdst+astart),cellen+1-astart);
		}
		ts::mem32::mov((char*)((__int32)alpdst+astart),(char*)ainsert,insertlen);
		alpdst[cellen+insertlen] = 0;
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::del(char *alpdst, __int32 astart, __int32 alen)
{
		register uint32_t len = ts::cstr::len(alpdst);
		ts::mem32::mov((char*)((__int32)alpdst+astart),(char*)((__int32)alpdst+astart+alen),len-astart-alen);
		alpdst[len-alen] = 0;
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::deln(char *alpdst, __int32 astart, __int32 aend)
{
		register __int32 len = ts::cstr::len(alpdst);
		ts::mem32::mov((char*)((__int32)alpdst+astart),(char*)((__int32)alpdst+aend),len-aend);
		alpdst[len-aend-astart] = 0;
		return alpdst;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::cstr::pos(const char *alpsrc, const __int32 abegin, const char *alpfnd)
{
		__int32 src_size = ts::cstr::len(alpsrc), fnd_size = ts::cstr::len(alpfnd);
		return ts::mem32::pos(alpsrc, src_size, abegin, alpfnd, fnd_size);
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::sub(char *alpdst, const char *alpsrc,__int32 astart, __int32 alen)
{
		ts::mem32::mov(alpdst,(char*)((uint32_t)alpsrc+astart),alen);
		alpdst[alen] = '\0';
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::substr_end(char *alpdst, const char *alpsrc, __int32 astart, __int32 aend)
{
		ts::mem32::mov(alpdst,(char*)((uint32_t)alpsrc+astart),aend-astart);
		alpdst[aend-astart] = '\0';
		return alpdst;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::text::delimiter(const char *alpsrc, char adelimiter, __int32 adirection)
{
		if (adirection < 0) {
				for (__int32 pos = (__int32)ts::cstr::len(alpsrc)-1; pos >= 0; pos--)
						if (alpsrc[pos]==adelimiter) return pos;
				return -1;
		} else {
				for (__int32 pos = 0; pos < (__int32)ts::cstr::len(alpsrc); pos++)
						if (alpsrc[pos]==adelimiter) return pos;
				return -1;
		}
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::replace(char *alpdst, const char *alpfnd, const char *alpexh)
{
		for (__int32 pos = 0, find, lenco = ts::cstr::len(alpfnd), lennaco = ts::cstr::len(alpexh), lencel = ts::cstr::len(alpdst); pos < lencel; pos = find+lennaco) {
				if ((find=ts::cstr::pos(alpdst, pos, alpfnd))==-1)
						break;
				ts::text::del(alpdst, find, lenco);
				ts::text::insert(alpdst, find, alpexh);
		}
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::replace_chr(char *alpdst, char alpfnd, char alpexh)
{
		for (__int32 pos = 0, lencel = len(alpdst); pos < lencel; pos++) {
				if (alpdst[pos]==alpfnd) alpdst[pos] =alpexh;
		}
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::extract_fileroot(char *alpdst, const char *alpsrc)
{
		__int32 delimiter = ts::text::delimiter(alpsrc,'\\',+1);
		if (delimiter>=0) {
				ts::cstr::substr_end(alpdst,alpsrc,0,delimiter);
				return alpdst;
		} else if ((__int32)alpdst!=(__int32)alpsrc) {
				 ts::cstr::mov(alpdst, alpsrc);
				return alpdst;
		}
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::extract_file_path(char *alpdst, const char *alpsrc)
{
		__int32 delimiter = ts::text::delimiter(alpsrc,'\\',-1);
		if (delimiter>=0) {
				ts::cstr::substr_end(alpdst,alpsrc,0,delimiter);
				return alpdst;
		} else if ((__int32)alpdst!=(__int32)alpsrc) {
				 ts::cstr::mov(alpdst,alpsrc);
				return alpdst;
		}
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::extract_file_name(char *alpdst, const char *alpsrc)
{
		__int32 delimiter = ts::text::delimiter(alpsrc, '\\',-1);
		if (delimiter>=0) {
				return ts::cstr::substr_end(alpdst,alpsrc,delimiter+1, len(alpsrc));
		} else if ((__int32)alpdst!=(__int32)alpsrc) {
				return (char*) ts::cstr::mov(alpdst,alpsrc);
		}
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::extract_file_ext(char *alpdst, const char *alpsrc)
{
		__int32 delimiter = ts::text::delimiter(alpsrc, '.',-1);
		if (delimiter>=0) {
				return ts::cstr::substr_end(alpdst,alpsrc,delimiter+1, len(alpsrc));
		} else if ((__int32)alpdst!=(__int32)alpsrc) {
				return (char*) ts::cstr::mov(alpdst,alpsrc);
		}
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::fix_file_path(char *alpdst, const char *alpsrc)
{
		register __int32				  lensrc = len(alpsrc);
		register __int32 lendestination = lensrc;
		if (lensrc==0) {
				alpdst[0]='\0';
				return alpdst;
		}
		while (alpsrc[lensrc-1]=='\\' || alpsrc[lensrc-1]==' ' || alpsrc[lensrc-1]=='"') {
				ts::mem32::mov(alpdst,alpsrc,lensrc-1);
				lensrc--;
				alpdst[lensrc]='\0';
				if (lensrc==0) break;
		}
		while (alpsrc[0]=='"' || alpsrc[0]==' ') {
				ts::mem32::mov(alpdst,(void*)((uint32_t)alpsrc + 1),lensrc-1);
				lensrc--;
				alpdst[lensrc]='\0';
				if (lensrc==0) break;
		}
		if (lendestination==lensrc) ts::mem32::mov(alpdst,alpsrc,lensrc + 1);
		return alpdst;
}
//---------------------------------------------------------------------------


char *__stdcall ts::text::upr(char *alpdst)
{
		register __int32 l = len(alpdst);
		register __int32 i;
		for (i=0; i<l; i++) {
				if ((unsigned char)alpdst[i]>0x61 && (unsigned char)alpdst[i]<0x7A) alpdst[i] &= 0xEF;
				if ((unsigned char)alpdst[i]>0xE0 && (unsigned char)alpdst[i]<0xF6) alpdst[i] &= 0xEF;
				if ((unsigned char)alpdst[i]>0xF8 && (unsigned char)alpdst[i]<0xFE) alpdst[i] &= 0xEF;
		}
		return alpdst;
}
//---------------------------------------------------------------------------

char *__stdcall ts::text::lwr(char *alpdst)
{
		register __int32 l = len(alpdst);
		register __int32 i;
		for (i=0; i<l; i++) {
				if ((unsigned char)alpdst[i]>0x41 && (unsigned char)alpdst[i]<0x5A) alpdst[i] |= 0x10;
				if ((unsigned char)alpdst[i]>0xC0 && (unsigned char)alpdst[i]<0xD6) alpdst[i] |= 0x10;
				if ((unsigned char)alpdst[i]>0xD8 && (unsigned char)alpdst[i]<0xDE) alpdst[i] |= 0x10;
		}
		return alpdst;
}
//---------------------------------------------------------------------------
__int32  __stdcall ts::cstr::cmpex(const char *alp1, const char *alp2)
{
		register __int32 l1 = len(alp1), l2 = len(alp2),  r;
		if (l1>l2) {
				 r = ts::mem32::cmp(alp1,alp2,l2);
				 if (r==0) r = +1;
		}
		else {
				 r = ts::mem32::cmp(alp1,alp2,l1);
				 if (r==0) r = -1;
		}
return r;
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::itoa(__int32 aint)
{
		static char str[32];
		return ts::cstr::itoa(aint,str,10);
}
//---------------------------------------------------------------------------

char *__stdcall ts::cstr::itoa(__int32 aint, char* astr, __int8 abase)
{
		const char *codes = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		__int32 i = 0;
		bool isNegative = false;
		/* Handle 0 explicitely, otherwise empty string is printed for 0 */
		if (aint == 0) {
				astr[i++] = '0';
				astr[i] = '\0';
				return astr;
		}
		// In standard itoa(), negative numbers are handled only with
		// base 10. Otherwise numbers are considered unsigned.
		if (aint < 0 && abase == 10) {
				isNegative = true;
				aint = -aint;
		}
		// Process individual digits
		while (aint != 0) {
				int rem = aint % abase;
				astr[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
				aint = aint/abase;
		}
		// If number is negative, append '-'
		if (isNegative)
				astr[i++] = '-';
		astr[i] = '\0'; // Append string terminator
		// Reverse the string
		ts::mem32::rev(astr,astr, i);
		return astr;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::cstr::atoi(const char *asrc)
{
		return atol(asrc);
}
//---------------------------------------------------------------------------


