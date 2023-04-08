//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../io/stk_console.h"
#include "./../text/stk_cstr_utils.h"
#include "./../mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_database.h"
#include "stk_database_items.h"
//---------------------------------------------------------------------------
// DATABASE_ITEMS::ATOM
//---------------------------------------------------------------------------
__stdcall stk::__database_items::__atom::__atom(void)
{
text_size = ATOM_TEXT_SIZE;
text = stk::cstr::allocex(text_size + 1,"\0");
reset();
}
//---------------------------------------------------------------------------
void __stdcall stk::__database_items::__atom::set(char* a_text)
{
register uint32_t a_text_len = stk::cstr::len(a_text);
if (text_size < a_text_len) {
    text_size = a_text_len;
    text = stk::cstr::reallocex(text,text_size + 1,"\0");
    }
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::__atom::reset(void)
{
for (register uint32_t i = 0; i < ATOM_NUMBERS_COUNT; i++) {
    numbers[i]=0;
    pointer[i] = NULL;
    }
if (text_size!=ATOM_TEXT_SIZE) {
    text_size =ATOM_TEXT_SIZE;
    text = stk::cstr::reallocex(text,text_size + 1,"\0");
    }
}
//---------------------------------------------------------------------------
__stdcall stk::__database_items::__atom::~__atom(void)
{
text_size = 0;
stk::cstr::free(text);
text = NULL;
}
//---------------------------------------------------------------------------
// DATABASE_ITEMS
//---------------------------------------------------------------------------

__stdcall  stk::__database_items::__database_items(void)
:       f_this_class_owner(NULL),
        f_atom_matrix(NULL),
        f_atom_matrix_count(0)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
f_temp_atom = new __atom();
}
//---------------------------------------------------------------------------

__stdcall  stk::__database_items::__database_items(const stk::__database *a_owner)
:       f_this_class_owner((stk::__database*)a_owner),
        f_atom_matrix(NULL),
        f_atom_matrix_count(0)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
f_temp_atom = new __atom();
}
//---------------------------------------------------------------------------

__stdcall stk::__database_items::~__database_items()
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
delete f_temp_atom;
}
//---------------------------------------------------------------------------
/*
const stk::__database_items::__atom* __stdcall stk::__database_items::operator [] (const uint32_t a_index)
{
// instead of placeing static __atom there, and double the code for setting it, use special +count reserved object on list for const protected version of this function
// class destructor would delete it anyway after class cleanup, static object wouldnt?
// it would cost much CPU and memory overheat but it's safier than struct
// __atom should be declared as class with operators overload etc.
// meantime..
   set(f_atom_matrix[count()], f_atom_matrix[a_index]);
return f_atom_matrix[count()];
}
*/
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__database_items::set_count(const uint32_t a_count)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        if (f_atom_matrix_count==a_count) return a_count;
        if (f_atom_matrix_count< a_count) {
                if (f_atom_matrix_count==0 && a_count>0)
                        f_atom_matrix = (stk::__database_items::__atom**)stk::mem::alloc(a_count * sizeof(stk::__database_items::__atom*));
           else f_atom_matrix = (stk::__database_items::__atom**)stk::mem::realloc((void*)f_atom_matrix,a_count * sizeof(stk::__database_items::__atom*));
           for (uint32_t iT = f_atom_matrix_count; iT < a_count; iT++)
                        {
                        f_atom_matrix[iT] = new stk::__database_items::__atom();
                        }
                f_atom_matrix_count =a_count;
                return a_count;
        } else {
           for (uint32_t iT = a_count; iT < f_atom_matrix_count; iT++)
                   {
                        delete f_atom_matrix[iT]; //kasowanie atoma
                        }
                f_atom_matrix =(stk::__database_items::__atom**)stk::mem::realloc((void*)f_atom_matrix,a_count * sizeof(stk::__database_items::__atom*));
                f_atom_matrix_count =a_count;
        }
        if (f_atom_matrix_count==0 && f_atom_matrix!=NULL)
                {
                stk::mem::free((void*)f_atom_matrix);
                }
                return a_count;
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::clear(void)
{
set_count(0);
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::clear_all(void)
{
clear();
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::set(const uint32_t a_index_S, const stk::__database_items::__atom *a_atom)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        for (register uint32_t x = 0; x < ATOM_NUMBERS_COUNT; x++) {
                f_atom_matrix[a_index_S]->numbers[x] = a_atom->numbers[x];
                f_atom_matrix[a_index_S]->pointer[x]   = a_atom->pointer[x];
        }
        set_text(a_index_S, a_atom->text);
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::set_text(const uint32_t a_index_S, const char *a_text)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
stk::con::prints("__database_items::set_text(a_index_S:%d,a_text)\r\na_text:%s)",a_index_S,a_text);
stk::con::print("\r\n\r\n");
#endif

        register uint32_t a_size = stk::cstr::len(a_text);

        if(a_size > f_atom_matrix[a_index_S]->text_size || a_size + ATOM_TEXT_SIZE < f_atom_matrix[a_index_S]->text_size) {
           f_atom_matrix[a_index_S]->text_size = a_size;
           f_atom_matrix[a_index_S]->text = stk::cstr::realloc(f_atom_matrix[a_index_S]->text, f_atom_matrix[a_index_S]->text_size + 1);
        }
        stk::mem::mov(f_atom_matrix[a_index_S]->text,a_text,a_size + 1);
}
//---------------------------------------------------------------------------

void    __stdcall stk::__database_items::set_text_size(const uint32_t a_index_S, const uint32_t a_text_size)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        f_atom_matrix[a_index_S]->text = stk::cstr::realloc(f_atom_matrix[a_index_S]->text,a_text_size + 1);
}
//---------------------------------------------------------------------------

void    __stdcall stk::__database_items::set_numbers(const uint32_t a_index_S, const uint32_t a_column_Y, const uint32_t a_value)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
stk::con::prints("__database_items::set_numbers(a_index_S:%d,a_column_Y:%d,a_value:%d)",a_index_S,a_column_Y,a_value);
stk::con::print("\r\n\r\n");
#endif
        f_atom_matrix[a_index_S]->numbers[a_column_Y] = a_value;
}
//---------------------------------------------------------------------------

void    __stdcall stk::__database_items::set_pointer(const uint32_t a_index_S, const uint32_t a_column_Y, void *a_pointer)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
stk::con::prints("__database_items::set_pointer(a_index_S:%d,a_column_Y:%d,a_pointer:%016llx)",a_index_S,a_column_Y,(uint64_t)a_pointer);
stk::con::print("\r\n\r\n");
#endif
        f_atom_matrix[a_index_S]->pointer[a_column_Y] = a_pointer;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__database_items::search_pointer_ex(const uint32_t a_istart, const uint32_t a_column_Y, const void *a_pointer) const
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        for (uint32_t iT = a_istart; iT < count(); iT++) {
                if (f_atom_matrix[iT]->pointer[a_column_Y]==a_pointer) {
                        return iT;
                }
        }
        return -1;
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::__database_items::search_pointer(const uint32_t a_column_Y, const void* a_pointer) const
{
return search_pointer_ex(0,a_column_Y,a_pointer);
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__database_items::search_numbers_ex(const uint32_t a_istart, const uint32_t a_column_Y, uint32_t a_numbers) const
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        for (uint32_t iT = a_istart; iT < count(); iT++) {
                if (f_atom_matrix[iT]->numbers[a_column_Y]==a_numbers) {
                        return iT;
                }
        }
        return -1;
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::__database_items::search_numbers(const uint32_t a_column_Y, uint32_t a_numbers) const
{
return search_numbers_ex(0,a_column_Y,a_numbers);
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__database_items::search_text_ex(const uint32_t a_istart, const char* __restrict__ a_Char) const
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        for (uint32_t iT = a_istart; iT < count(); iT++)  {
                if (stk::cstr::compare(f_atom_matrix[iT]->text,a_Char)==0) {
                        return iT;
                }
        }
        return -1;
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::__database_items::search_text(const char* __restrict__ a_Char) const
{
return search_text_ex(0,a_Char);
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__database_items::add(const stk::__database_items::__atom * __restrict__ a_atom)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
if (a_atom->text!=NULL) stk::con::prints("__database_items::add_atom(a_atom)\r\na_atom->text:%s)",a_atom->text);
else
stk::con::print("__database_items::add_atom(a_atom->text=NULL)");
stk::con::print("\r\n\r\n");
#endif

        set_count(count()+1);
        set(count()-1, a_atom);
        return  count()-1;
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__database_items::add_text(const char* __restrict__ a_text)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
stk::con::prints("__database_items::add_text(a_text)\r\na_text:%s",a_text);
stk::con::print("\r\n\r\n");
#endif
        set_count(count()+1); set_text(count()-1, a_text);
          return  count()-1;
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__database_items::insert(const uint32_t a_index, const stk::__database_items::__atom *a_atom)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
if (a_atom->text!=NULL) stk::con::prints("__database_items::insert(a_index:%d,a_atom)\r\na_atom->text:%s",a_index,a_atom->text);
else
stk::con::prints("__database_items::insert(a_index:%d,a_atom->text=NULL)",a_index);
stk::con::print("\r\n\r\n");
#endif

        set_count(count()+1);
     //TODO: change static to something else for MULTITHREADED app
        static stk::__database_items::__atom c_atom;
        stk::mem::mov(&c_atom,f_atom_matrix[count()-1],sizeof(stk::__database_items::__atom));
        for (uint32_t iT = count()-1; iT > a_index; iT--) {
                stk::mem::mov(f_atom_matrix[iT],f_atom_matrix[iT-1], sizeof(stk::__database_items::__atom));
        }
        stk::mem::mov(f_atom_matrix[a_index],&c_atom,sizeof(stk::__database_items::__atom));
        set(a_index, a_atom);
        return count();
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__database_items::cut(const uint32_t a_index)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
stk::con::prints("__database_items::cut(a_index:%d)\r\ntext[a_index]:%s",a_index,f_atom_matrix[a_index]->text);
stk::con::print("\r\n\r\n");
#endif
        stk::__database_items::__atom *d_atom = f_atom_matrix[a_index];
        register uint32_t last_atom_index = count()-1;
        swap(a_index, last_atom_index); set_count(last_atom_index);
        return count();
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::swap(const uint32_t a_index_1, const uint32_t a_index_2)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        stk::__database_items::__atom  *t_atom = f_atom_matrix[a_index_1];
        f_atom_matrix[a_index_1] = f_atom_matrix[a_index_2];
        f_atom_matrix[a_index_2] = t_atom;
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::sort_text()
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
     //simple slowest, bubble sort
        for (uint32_t index1 = 0; index1 < count(); index1++)
        for (uint32_t index2 = index1 + 1; index2 < count(); index2++) {
                if (stk::cstr::compare(f_atom_matrix[index1]->text,f_atom_matrix[index2]->text) > 0) {
                        swap(index1, index2);
                }
        }
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::sort_numbers(const uint32_t a_column)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        register uint32_t column = a_column;
        for (uint32_t index1 = 0; index1 < count(); index1++)
        for (uint32_t index2 = index1 + 1; index2 < count(); index2++) {
                if (f_atom_matrix[index1]->numbers[column] > f_atom_matrix[index2]->numbers[column]) {
                        swap(index1, index2);
                }
        }
}
//---------------------------------------------------------------------------

void __stdcall stk::__database_items::sort_pointer(const uint32_t a_column)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_CALLED("")
#endif
        register uint32_t column = a_column;
        for (uint32_t index1 = 0; index1 < count(); index1++)
        for (uint32_t index2 = index1 + 1; index2 < count(); index2++) {
                if (f_atom_matrix[index1]->pointer[column] > f_atom_matrix[index2]->pointer[column]) {
                        swap(index1, index2);
                }
        }
}
//---------------------------------------------------------------------------

const char *__stdcall stk::__database_items::serialize(const char* __restrict__ a_format) const
{
return stk::CSTR_FROM_DATABASE(f_temp_atom->text,a_format,this->f_this_class_owner);
}
//---------------------------------------------------------------------------

const stk::__database_items::__atom* __stdcall stk::__database_items::operator [] (const uint32_t a_index) const
{
return f_atom_matrix[a_index];
}
//---------------------------------------------------------------------------

const stk::__database_items::__atom*  __stdcall stk::__database_items::operator [] (const uint32_t a_index)
{
return f_atom_matrix[a_index];
}
//---------------------------------------------------------------------------

const stk::__database_items::__atom* __stdcall stk::__database_items::get(const uint32_t a_index_G) const
{
return f_atom_matrix[a_index_G];
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__database_items::get_text_size(const uint32_t a_index_G) const
{
return  f_atom_matrix[a_index_G]->text_size;
}
//---------------------------------------------------------------------------

const char* __stdcall stk::__database_items::get_text(const uint32_t a_index_G) const
{
return f_atom_matrix[a_index_G]->text;
}
//---------------------------------------------------------------------------

void* __stdcall stk::__database_items::get_pointer(const uint32_t a_index_G, const uint32_t a_column_Y) const
{
return f_atom_matrix[a_index_G]->pointer[a_column_Y];
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__database_items::get_numbers(const uint32_t a_index_G, const uint32_t a_column_Y) const
{
 return f_atom_matrix[a_index_G]->numbers[a_column_Y];
}
//---------------------------------------------------------------------------
uint32_t  __stdcall stk::__database_items::count() const
{
return f_atom_matrix_count;
}
//---------------------------------------------------------------------------

stk::__database_items::__atom *__stdcall stk::C_TO_ATOM(stk::__database_items::__atom *a_atom, const char* __restrict__ a_text) {
       a_atom->set((char*)a_text);
return a_atom;
}
//---------------------------------------------------------------------------

char *__stdcall stk::ATOM_TO_C(char* a_text,const stk::__database_items::__atom *a_atom) {
return stk::cstr::mov(a_text,a_atom->text);
}
