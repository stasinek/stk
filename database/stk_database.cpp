//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#pragma hdrstop
#include "./../io/stk_console.h"
#include "./../text/stk_cstr_utils.h"
#include "./../mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_database.h"
//---------------------------------------------------------------------------

__stdcall stk::__database::__database(void)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("__database()")
#endif
f_owner = NULL;
f_alias = new stk::__database_alias();
f_items = new stk::__database_items(this);
}
//---------------------------------------------------------------------------

__stdcall stk::__database::__database(const stk::__database *__restrict__ a_owner)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("__database(const this*)")
#endif
f_owner = (stk::__database *)a_owner;
f_alias = new stk::__database_alias();
f_items = new stk::__database_items(this);
}
//---------------------------------------------------------------------------

__stdcall stk::__database::__database(const stk::__database *__restrict__ a_owner, const char* __restrict__ a_alias)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("__database(const this*,const char*)")
#endif
f_owner = (stk::__database *)a_owner;
f_alias = new stk::__database_alias(owner()->alias());
f_items = new stk::__database_items(this);
}
//---------------------------------------------------------------------------

__stdcall stk::__database::~__database(void)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("~__database()")
#endif
delete f_items;
delete f_alias;
}
//---------------------------------------------------------------------------

const char* __stdcall stk::__database::set_alias(const char*a_alias)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("set_alias(const char*)")
#endif
   if (a_alias==NULL) {
           f_alias->set("\0");
          }
  else f_alias->set(a_alias);
return f_alias->c_str();
}
//---------------------------------------------------------------------------

const stk::__database* __stdcall stk::__database::set_owner(stk::__database *a_owner)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("set_owner(this*)")
#endif
   if (a_owner==NULL) {
           f_alias->set("\0");
          }
  else f_alias->set(owner()->alias());
           // planed in future*
           // if aliases different, flush, close the previous "alias" file;
           f_owner = a_owner;
return f_owner;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__database::set(stk::__database* __restrict__ a_database)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("set(this*)")
#endif
        if (a_database==NULL) {
                items()->set_count(0);
                return 0;
        }
        else {
                int32_t  iT = 0, iX = a_database->items()->count();
                items()->set_count(iX);
                for (; iT < iX; iT++)
                        items()->set(iT,a_database->items()->get(iT));
        }
        return items()->count();
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__database::load(const char* __restrict__ a_format)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("load(const char*)")
#endif
        int f_hand = open(this->alias(),_O_BINARY|_O_RDONLY,_S_IREAD);
        if (f_hand==-1) {
                return -1;
        }
        int32_t size = filelength(f_hand);
        char *lptemp = stk::cstr::alloc(size);
        size = _read(f_hand,lptemp,size);
        if (size==-1) {
                return -1;
        }
        DATABASE_FROM_CSTR(this, a_format, lptemp);
        stk::cstr::free(lptemp);
        _close(f_hand);
        return size;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__database::save(const char* __restrict__ a_format) const
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("save(const char*) const")
#endif
        int f_hand = _sopen(this->alias(),_O_BINARY|_O_CREAT|_O_WRONLY,_S_IWRITE);
        if (f_hand==-1) {
                return -1;
        }
        char *lptemp = new char[255];
        CSTR_FROM_DATABASE(lptemp, a_format, this);
        int32_t size = stk::cstr::len(lptemp);
        size = _write(f_hand,lptemp,size);
        if (size==-1) {
                return -1;
        }
        _close(f_hand);
        return size;
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::__database::export_to(char *a_data, const char* __restrict__ a_format) const
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("export_to(char*,const char*)")
#endif
        char *x = new char[32 * this->items()->count()];
        CSTR_FROM_DATABASE(x, a_format, this);
        stk::cstr::mov((char*)a_data,x);
#ifdef __DEBUG_DATABASE__
stk::con::prints("__database::export_to(a_data,a_format:%s)\r\nreturn len:%d\r\na_data:%s",a_format,stk::cstr::len(a_data),a_data);
stk::con::print("\r\n\r\n");
#endif
        delete x;
        return stk::cstr::len(a_data);
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::__database::import_from(const char* __restrict__ a_data, const char* __restrict__ a_format)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("import_from(const char*,const char*)")
#endif
        DATABASE_FROM_CSTR(this, a_format, a_data);
#ifdef __DEBUG_DATABASE__
stk::con::prints("__database::import_from(a_data,a_format:%s)\r\na_data:%s\r\nreturn %d",a_format,a_data,items()->count());
stk::con::print("\r\n\r\n");
#endif

        return items()->count();
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::__database::add(stk::__database* __restrict__ a_database)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("add(this*)")
#endif
        for (int32_t i = 0, j = a_database->items()->count(); i < j; i++) {
                items()->add(a_database->items()->get(i));
        }
        return items()->count();
}
//---------------------------------------------------------------------------
// SUPPORT, CONVERSIONS, OTHER FUNCTIONS
//---------------------------------------------------------------------------

char *__stdcall stk::CSTR_FROM_DATABASE(char *a_text, const char* __restrict__ a_format, const stk::__database* __restrict__ a_database)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("CSTR_FROM_DATABASE(char*,const char*,const this*)")
#endif
        register char *text = a_text;
        register int32_t text_alloc_size = 255 + 1;
        if (text==NULL)  text = stk::cstr::alloc(text_alloc_size);
        else
        text = stk::cstr::realloc(text,text_alloc_size);
        register int32_t tlen = 255;

        if (a_database->items()->count()==0) text[0] = '\0';
        else if (a_format[0]=='C') {
                for (int32_t t_pos = 0, srclen, iT = 0; ;) {
                        srclen = stk::cstr::len(a_database->items()->get_text(iT));
                        if (t_pos + 1 + srclen + 3 + 1 >= tlen) {
                                tlen = t_pos + 1 + srclen + 3 + 1 + 255 + 1;
                                if (tlen+1 > text_alloc_size) {
                                        text_alloc_size = tlen + 1;
                                        text = stk::cstr::realloc(text,text_alloc_size);
                                        }
                        }
                        stk::mem::mov(&(text[t_pos]), (void*)"\"", 1);
                        t_pos += 1;
                        stk::mem::mov(&(text[t_pos]), a_database->items()->get_text(iT), srclen);
                        t_pos += srclen;
                        stk::mem::mov(&(text[t_pos]), (void*)"\", ", 3);
                        t_pos += 3;
                        if ((uint32_t)++iT>=a_database->items()->count()) { // ucinam 2
                                text[t_pos-2] = '\0';
                                break;
                        }
                }
        } else if (a_format[0]=='L') {
                for (int32_t t_pos = 0, srclen, iT = 0; ;) {
                        srclen = stk::cstr::len(a_database->items()->get_text(iT));
                        if (t_pos + srclen + 2 + 1 >= tlen) {
                                tlen = t_pos + srclen + 2 + 1 + 255 + 1;
                                if (tlen+1 > text_alloc_size) {
                                        text_alloc_size = tlen + 1;
                                        text = stk::cstr::realloc(text,text_alloc_size);
                                        }
                        }
                        stk::mem::mov((char*)(text+t_pos), a_database->items()->get_text(iT), srclen);
                        t_pos += srclen;
                        stk::mem::mov((char*)(text+t_pos), (void*)"\r\n", 2);
                        t_pos += 2;
                        if ((uint32_t)++iT>=a_database->items()->count()) { // ucinam 2
                                text[t_pos-2] = '\0';
                                break;
                        }
                }
        }
        return text;
}
//---------------------------------------------------------------------------

stk::__database *__stdcall stk::DATABASE_FROM_CSTR(stk::__database *a_data, const char* __restrict__ a_format, const char* __restrict__ a_text)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_CALLED("DATABASE_FROM_CSTR(this*,const char*,const char*)")
#endif
        int32_t pos, pos_chk, pos_end = stk::cstr::len(a_text);
        int32_t sep, t_pos, t_posend = 256;
        char *t_text = stk::cstr::alloc(t_posend);
        a_data->items()->set_count(0);
        if (a_format[0]=='C') {
                for (pos = 0; pos < pos_end; pos += sep) {
                        for (; pos < pos_end && a_text[pos]==' '; pos++);
                        sep  = (int32_t)(a_text[pos]=='\"');
                        pos += sep;
                        for (t_pos = 0; pos < pos_end;) {
                                if (sep==0) {
                                        if (a_text[pos+0]==' ' || a_text[pos+0]==',') {
                                                pos++;
                                                break;
                                        }
                                } else {
                                        if (a_text[pos+0]=='\"') {
                                                pos++;
                                                break;
                                        }
                                }
                                if (t_pos +1 >= t_posend) {
                                        t_text = stk::cstr::realloc(t_text, t_posend+=256);
                                }
                                t_text[t_pos++] = a_text[pos++];
                        }
                        t_text[t_pos] = '\0';
                        a_data->items()->add_text(t_text);
                }
                stk::cstr::free(t_text);
        } else if (a_format[0]=='L') {
                for (pos = 0; pos < pos_end; pos = pos_chk) {
                        for (pos_chk = pos; pos_chk < pos_end; pos_chk++)
                                if (a_text[pos_chk]=='\r' || a_text[pos_chk]=='\n') {
                                        break;
                                }
                        if (pos_chk-pos+1 >= t_posend) {
                                t_text = stk::cstr::realloc(t_text, t_posend+=256);
                        }
                        stk::mem::mov(t_text, (char*)(a_text + pos), pos_chk - pos);
                        t_text[pos_chk - pos] = '\0';
                        a_data->items()->add_text(t_text);
                        if (pos_chk==pos_end) {
                                break;
                        }
                        if (a_text[pos_chk]=='\r') {
                                pos_chk++;
                        }
                        if (a_text[pos_chk]=='\n') {
                                pos_chk++;
                        }
                }
                if (pos_end!=0) {
                        if (a_text[pos_end-1]=='\n') {
                                a_data->items()->add_text("");
                                pos_end++;
                        }
                        if (a_text[pos_end-1]=='\r') {
                                a_data->items()->add_text("");
                        }
                }
                stk::cstr::free(t_text);
        }
        return a_data;
}
//---------------------------------------------------------------------------

const stk::__database* __stdcall stk::__database::owner(void) const
{
return f_owner;}
//---------------------------------------------------------------------------

const char* __stdcall stk::__database::alias(void) const
{
return f_alias->c_str();
}
//---------------------------------------------------------------------------

stk::__database_items* __stdcall stk::__database::items(void)
{
return f_items;
}
//---------------------------------------------------------------------------

const stk::__database_items* __stdcall stk::__database::items(void) const
{
return f_items;
}
//---------------------------------------------------------------------------

void __stdcall stk::__database::clear()
{
items()->clear_all();
}
//---------------------------------------------------------------------------


