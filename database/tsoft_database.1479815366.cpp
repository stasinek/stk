//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../io/tsoft_console.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../mem/tsoft_mem.h"
//---------------------------------------------------------------------------
#include "tsoft_database.h"
//---------------------------------------------------------------------------

__stdcall ts::__database::__database(void)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("__database()")
#endif
f_owner = NULL;
f_alias = new ts::__database_alias();
f_items = new ts::__database_items(this);
}
//---------------------------------------------------------------------------

__stdcall ts::__database::__database(const ts::__database *__restrict__ a_owner)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("__database(const this*)")
#endif
f_owner = (ts::__database *)a_owner;
f_alias = new ts::__database_alias();
f_items = new ts::__database_items(this);
}
//---------------------------------------------------------------------------

__stdcall ts::__database::__database(const ts::__database *__restrict__ a_owner, const char* __restrict__ a_alias)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("__database(const this*,const char*)")
#endif
f_owner = (ts::__database *)a_owner;
f_alias = new ts::__database_alias(owner()->alias());
f_items = new ts::__database_items(this);
}
//---------------------------------------------------------------------------

__stdcall ts::__database::~__database(void)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("~__database()")
#endif
delete f_items;
delete f_alias;
}
//---------------------------------------------------------------------------

const char* __stdcall ts::__database::set_alias(const char*a_alias)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("set_alias(const char*)")
#endif
   if (a_alias==NULL) {
           f_alias->set("\0");
          }
  else f_alias->set(a_alias);
return f_alias->c_str();
}
//---------------------------------------------------------------------------

const ts::__database* __stdcall ts::__database::set_owner(ts::__database *a_owner)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("set_owner(this*)")
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

int32_t __stdcall ts::__database::set(ts::__database* __restrict__ a_database)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("set(this*)")
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

int32_t __stdcall ts::__database::load(const char* __restrict__ a_format)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("load(const char*)")
#endif
        int f_hand = open(this->alias(),_O_BINARY|_O_RDONLY,_S_IREAD);
        if (f_hand==-1) {
                return -1;
        }
        int32_t size = filelength(f_hand);
        char *lptemp = ts::cstr::alloc(size);
        size = _read(f_hand,lptemp,size);
        if (size==-1) {
                return -1;
        }
        DATA_FROM_C(this, a_format, lptemp);
        ts::cstr::free(lptemp);
        _close(f_hand);
        return size;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database::save(const char* __restrict__ a_format) const
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("save(const char*) const")
#endif
        int f_hand = _sopen(this->alias(),_O_BINARY|_O_CREAT|_O_WRONLY,_S_IWRITE);
        if (f_hand==-1) {
                return -1;
        }
        char *lptemp = new char[255];
        C_FROM_DATA(lptemp, a_format, this);
        int32_t size = ts::cstr::len(lptemp);
        size = _write(f_hand,lptemp,size);
        if (size==-1) {
                return -1;
        }
        _close(f_hand);
        return size;
}
//---------------------------------------------------------------------------
int32_t __stdcall ts::__database::export_to(char *a_data, const char* __restrict__ a_format) const
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("export_to(char*,const char*)")
#endif
        char *x = new char[32 * this->items()->count()];
        C_FROM_DATA(x, a_format, this);
        ts::cstr::mov((char*)a_data,x);
#ifdef __DEBUG_DATABASE__
ts::con::prints("__database::export_to(a_data,a_format:%s)\r\nreturn len:%d\r\na_data:%s",a_format,ts::cstr::len(a_data),a_data);
ts::con::print("\r\n\r\n");
#endif
        delete x;
        return ts::cstr::len(a_data);
}
//---------------------------------------------------------------------------
int32_t __stdcall ts::__database::import_from(const char* __restrict__ a_data, const char* __restrict__ a_format)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("import_from(const char*,const char*)")
#endif
        DATA_FROM_C(this, a_format, a_data);
#ifdef __DEBUG_DATABASE__
ts::con::prints("__database::import_from(a_data,a_format:%s)\r\na_data:%s\r\nreturn %d",a_format,a_data,items()->count());
ts::con::print("\r\n\r\n");
#endif

        return items()->count();
}
//---------------------------------------------------------------------------
int32_t __stdcall ts::__database::add(ts::__database* __restrict__ a_database)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("add(this*)")
#endif
        for (int32_t i = 0, j = a_database->items()->count(); i < j; i++) {
                items()->add(a_database->items()->get(i));
        }
        return items()->count();
}
//---------------------------------------------------------------------------
// SUPPORT, CONVERSIONS, OTHER FUNCTIONS
//---------------------------------------------------------------------------

char *__stdcall ts::C_FROM_DATA(char *a_text, const char* __restrict__ a_format, const ts::__database* __restrict__ a_database)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("C_FROM_DATA(char*,const char*,const this*)")
#endif
        register char *text = a_text;
        register int32_t text_alloc_size = 255 + 1;
        if (text==NULL)  text = ts::cstr::alloc(text_alloc_size);
        else
        text = ts::cstr::realloc(text,text_alloc_size);
        register int32_t tlen = 255;

        if (a_database->items()->count()==0) text[0] = '\0';
        else if (a_format[0]=='C') {
                for (int32_t t_pos = 0, srclen, iT = 0; ;) {
                        srclen = ts::cstr::len(a_database->items()->get_text(iT));
                        if (t_pos + 1 + srclen + 3 + 1 >= tlen) {
                                tlen = t_pos + 1 + srclen + 3 + 1 + 255 + 1;
                                if (tlen+1 > text_alloc_size) {
                                        text_alloc_size = tlen + 1;
                                        text = ts::cstr::realloc(text,text_alloc_size);
                                        }
                        }
                        ts::mem32::mov(&(text[t_pos]), (void*)"\"", 1);
                        t_pos += 1;
                        ts::mem32::mov(&(text[t_pos]), a_database->items()->get_text(iT), srclen);
                        t_pos += srclen;
                        ts::mem32::mov(&(text[t_pos]), (void*)"\", ", 3);
                        t_pos += 3;
                        if ((uint32_t)++iT>=a_database->items()->count()) { // ucinam 2
                                text[t_pos-2] = '\0';
                                break;
                        }
                }
        } else if (a_format[0]=='L') {
                for (int32_t t_pos = 0, srclen, iT = 0; ;) {
                        srclen = ts::cstr::len(a_database->items()->get_text(iT));
                        if (t_pos + srclen + 2 + 1 >= tlen) {
                                tlen = t_pos + srclen + 2 + 1 + 255 + 1;
                                if (tlen+1 > text_alloc_size) {
                                        text_alloc_size = tlen + 1;
                                        text = ts::cstr::realloc(text,text_alloc_size);
                                        }
                        }
                        ts::mem32::mov((char*)(text+t_pos), a_database->items()->get_text(iT), srclen);
                        t_pos += srclen;
                        ts::mem32::mov((char*)(text+t_pos), (void*)"\r\n", 2);
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

ts::__database *__stdcall ts::DATA_FROM_C(ts::__database *a_data, const char* __restrict__ a_format, const char* __restrict__ a_text)
{
#ifdef __DEBUG_DATABASE__
__DEBUG_FUNC_CALLED("DATA_FROM_C(this*,const char*,const char*)")
#endif
        int32_t pos, pos_chk, pos_end = ts::cstr::len(a_text);
        int32_t sep, t_pos, t_posend = 256;
        char *t_text = ts::cstr::alloc(t_posend);
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
                                        t_text = ts::cstr::realloc(t_text, t_posend+=256);
                                }
                                t_text[t_pos++] = a_text[pos++];
                        }
                        t_text[t_pos] = '\0';
                        a_data->items()->add_text(t_text);
                }
                ts::cstr::free(t_text);
        } else if (a_format[0]=='L') {
                for (pos = 0; pos < pos_end; pos = pos_chk) {
                        for (pos_chk = pos; pos_chk < pos_end; pos_chk++)
                                if (a_text[pos_chk]=='\r' || a_text[pos_chk]=='\n') {
                                        break;
                                }
                        if (pos_chk-pos+1 >= t_posend) {
                                t_text = ts::cstr::realloc(t_text, t_posend+=256);
                        }
                        ts::mem32::mov(t_text, (char*)(a_text + pos), pos_chk - pos);
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
                ts::cstr::free(t_text);
        }
        return a_data;
}
//---------------------------------------------------------------------------


