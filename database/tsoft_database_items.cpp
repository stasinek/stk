//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../io/tsoft_console.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../mem/tsoft_mem.h"
//---------------------------------------------------------------------------
#include "tsoft_database.h"
//---------------------------------------------------------------------------
#include "tsoft_database_items.h"
//---------------------------------------------------------------------------
// DATABASE_ITEMS
//---------------------------------------------------------------------------

__stdcall  ts::__database_items::__database_items(void)
:       f_this_class_owner(NULL),
        f_atom_matrix(NULL),
        f_atom_matrix_count(0)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
    f_temp_atom = new __atom();
}
//---------------------------------------------------------------------------
__stdcall  ts::__database_items::__database_items(const ts::__database *a_owner)
:       f_this_class_owner((ts::__database*)a_owner),
        f_atom_matrix(NULL),
        f_atom_matrix_count(0)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
    f_temp_atom = new __atom();
}
//---------------------------------------------------------------------------

__stdcall ts::__database_items::~__database_items()
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
    delete f_temp_atom;
}
//---------------------------------------------------------------------------
/*
const ts::__database_items::__atom* __stdcall ts::__database_items::operator [] (const uint32_t a_index)
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

uint32_t __stdcall ts::__database_items::set_count(const uint32_t a_count)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        if (f_atom_matrix_count==a_count) return a_count;
        if (f_atom_matrix_count< a_count) {
                if (f_atom_matrix_count==0 && a_count>0)
                        f_atom_matrix = (ts::__database_items::__atom**)ts::mem32::alloc(a_count * sizeof(ts::__database_items::__atom*));
           else f_atom_matrix = (ts::__database_items::__atom**)ts::mem32::realloc((void*)f_atom_matrix,a_count * sizeof(ts::__database_items::__atom*));
           for (uint32_t iT = f_atom_matrix_count; iT < a_count; iT++)
                        {
                        f_atom_matrix[iT] = new ts::__database_items::__atom();
                        }
                f_atom_matrix_count =a_count;
                return a_count;
        } else {
           for (uint32_t iT = a_count; iT < f_atom_matrix_count; iT++)
                   {
                        delete f_atom_matrix[iT]; //kasowanie atoma
                        }
                f_atom_matrix =(ts::__database_items::__atom**)ts::mem32::realloc((void*)f_atom_matrix,a_count * sizeof(ts::__database_items::__atom*));
                f_atom_matrix_count =a_count;
        }
        if (f_atom_matrix_count==0 && f_atom_matrix!=NULL)
                {
                ts::mem32::free((void*)f_atom_matrix);
                }
                return a_count;
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::set(const uint32_t a_index_S, const ts::__database_items::__atom *a_atom)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        for (register uint32_t x = 0; x < ATOM_NUMBERS_COUNT; x++) {
                f_atom_matrix[a_index_S]->number[x] = a_atom->number[x];
                f_atom_matrix[a_index_S]->data_chunk[x]   = a_atom->data_chunk[x];
        }
        set_text(a_index_S, a_atom->text);
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::set_text(const uint32_t a_index_S, const char *a_text)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
ts::con::prints("__database_items::set_text(a_index_S:%d,a_text)\r\na_text:%s)",a_index_S,a_text);
ts::con::print("\r\n\r\n");
#endif

        register uint32_t a_size = ts::cstr::len(a_text);

        if(a_size > f_atom_matrix[a_index_S]->text_size || a_size + ATOM_TEXT_SIZE < f_atom_matrix[a_index_S]->text_size) {
           f_atom_matrix[a_index_S]->text_size = a_size;
           f_atom_matrix[a_index_S]->text = ts::cstr::realloc(f_atom_matrix[a_index_S]->text, f_atom_matrix[a_index_S]->text_size + 1);
        }
        ts::mem32::mov(f_atom_matrix[a_index_S]->text,a_text,a_size + 1);
}
//---------------------------------------------------------------------------

void    __stdcall ts::__database_items::set_text_size(const uint32_t a_index_S, const uint32_t a_text_size)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        f_atom_matrix[a_index_S]->text = ts::cstr::realloc(f_atom_matrix[a_index_S]->text,a_text_size + 1);
}
//---------------------------------------------------------------------------

void    __stdcall ts::__database_items::set_number(const uint32_t a_index_S, const uint32_t a_column_Y, const uint32_t a_value)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
ts::con::prints("__database_items::set_number(a_index_S:%d,a_column_Y:%d,a_value:%d)",a_index_S,a_column_Y,a_value);
ts::con::print("\r\n\r\n");
#endif
        f_atom_matrix[a_index_S]->number[a_column_Y] = a_value;
}
//---------------------------------------------------------------------------

void    __stdcall ts::__database_items::set_data_chunk(const uint32_t a_index_S, const uint32_t a_column_Y, void *a_pointer)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
ts::con::prints("__database_items::set_data_chunk(a_index_S:%d,a_column_Y:%d,a_pointer:%d)",a_index_S,a_column_Y,(uint32_t)a_pointer);
ts::con::print("\r\n\r\n");
#endif
        f_atom_matrix[a_index_S]->data_chunk[a_column_Y] = a_pointer;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::search_data_chunk_ex(const uint32_t a_istart, const uint32_t a_column_Y, const void *a_pointer) const
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        for (uint32_t iT = a_istart; iT < count(); iT++) {
                if (f_atom_matrix[iT]->data_chunk[a_column_Y]==a_pointer) {
                        return iT;
                }
        }
        return -1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::search_number_ex(const uint32_t a_istart, const uint32_t a_column_Y, uint32_t a_number) const
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        for (uint32_t iT = a_istart; iT < count(); iT++) {
                if (f_atom_matrix[iT]->number[a_column_Y]==a_number) {
                        return iT;
                }
        }
        return -1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::search_text_ex(const uint32_t a_istart, const char* __restrict__ a_Char) const
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        for (uint32_t iT = a_istart; iT < count(); iT++)  {
                if (ts::cstr::compare(f_atom_matrix[iT]->text,a_Char)==0) {
                        return iT;
                }
        }
        return -1;
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::__database_items::add(const ts::__database_items::__atom * __restrict__ a_atom)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
if (a_atom->text!=NULL) ts::con::prints("__database_items::add_atom(a_atom)\r\na_atom->text:%s)",a_atom->text);
else
ts::con::print("__database_items::add_atom(a_atom->text=NULL)");
ts::con::print("\r\n\r\n");
#endif

        set_count(count()+1);
        set(count()-1, a_atom);
        return  count()-1;
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::__database_items::add_text(const char* __restrict__ a_text)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
ts::con::prints("__database_items::add_text(a_text)\r\na_text:%s",a_text);
ts::con::print("\r\n\r\n");
#endif
        set_count(count()+1); set_text(count()-1, a_text);
          return  count()-1;
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::__database_items::insert(const uint32_t a_index, const ts::__database_items::__atom *a_atom)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
if (a_atom->text!=NULL) ts::con::prints("__database_items::insert(a_index:%d,a_atom)\r\na_atom->text:%s",a_index,a_atom->text);
else
ts::con::prints("__database_items::insert(a_index:%d,a_atom->text=NULL)",a_index);
ts::con::print("\r\n\r\n");
#endif

        set_count(count()+1);
        static ts::__database_items::__atom c_atom;
        ts::mem32::mov(&c_atom,f_atom_matrix[count()-1],sizeof(ts::__database_items::__atom));
        for (uint32_t iT = count()-1; iT > a_index; iT--) {
                ts::mem32::mov(f_atom_matrix[iT],f_atom_matrix[iT-1], sizeof(ts::__database_items::__atom));
        }
        ts::mem32::mov(f_atom_matrix[a_index],&c_atom,sizeof(ts::__database_items::__atom));
        set(a_index, a_atom);
        return count();
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::__database_items::cut(const uint32_t a_index)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_DATABASE_ITEMS__
ts::con::prints("__database_items::cut(a_index:%d)\r\ntext[a_index]:%s",a_index,f_atom_matrix[a_index]->text);
ts::con::print("\r\n\r\n");
#endif
        ts::__database_items::__atom *d_atom = f_atom_matrix[a_index];
        register uint32_t last_atom_index = count()-1;
        swap(a_index, last_atom_index); set_count(last_atom_index);
        return count();
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::swap(const uint32_t a_index_1, const uint32_t a_index_2)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        ts::__database_items::__atom  *t_atom = f_atom_matrix[a_index_1];
        f_atom_matrix[a_index_1] = f_atom_matrix[a_index_2];
        f_atom_matrix[a_index_2] = t_atom;
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::sort_text()
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        // simple slowest, bubble sort
        for (uint32_t index1 = 0; index1 < count(); index1++)
        for (uint32_t index2 = index1 + 1; index2 < count(); index2++) {
                if (ts::cstr::compare(f_atom_matrix[index1]->text,f_atom_matrix[index2]->text) > 0) {
                        swap(index1, index2);
                }
        }
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::sort_number(const uint32_t a_column)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        register uint32_t column = a_column;
        for (uint32_t index1 = 0; index1 < count(); index1++)
        for (uint32_t index2 = index1 + 1; index2 < count(); index2++) {
                if (f_atom_matrix[index1]->number[column] > f_atom_matrix[index2]->number[column]) {
                        swap(index1, index2);
                }
        }
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::sort_data_chunk(const uint32_t a_column)
{
#ifdef __DEBUG_DATABASE_ITEMS__
__DEBUG_FUNC_CALLED("")
#endif
        register uint32_t column = a_column;
        for (uint32_t index1 = 0; index1 < count(); index1++)
        for (uint32_t index2 = index1 + 1; index2 < count(); index2++) {
                if (f_atom_matrix[index1]->data_chunk[column] > f_atom_matrix[index2]->data_chunk[column]) {
                        swap(index1, index2);
                }
        }
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__database_items::text(const char* __restrict__ a_format) const
{
return ts::C_FROM_DATA(f_temp_atom->text,a_format,this->f_this_class_owner);
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

ts::__database_items::__atom *__stdcall ts::C_TO_ATOM(ts::__database_items::__atom *a_atom, const char* __restrict__ a_text) {
       a_atom->set((char*)a_text);
return a_atom;
}
//---------------------------------------------------------------------------

char *__stdcall ts::ATOM_TO_C(char* a_text,const ts::__database_items::__atom *a_atom) {
return ts::cstr::mov(a_text,a_atom->text);
}
