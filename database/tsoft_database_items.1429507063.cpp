//---------------------------------------------------------------------------
#include "tsoft_database_items.h"
//---------------------------------------------------------------------------
#include "tsoft_database.h"
//---------------------------------------------------------------------------
#include "./../io/tsoft_console.h"
#include "./../text/tsoft_text_manipulation.h"
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// DATABASE_ITEMS
//---------------------------------------------------------------------------
__stdcall  ts::__database_items::__database_items(const ts::__database *a_owner)
{
__database_items();
f_this_class_owner = (ts::__database*)a_owner;
}
//---------------------------------------------------------------------------

__stdcall  ts::__database_items::__database_items(void)
:	f_this_class_owner(NULL),
		f_atom_matrix(NULL),
		f_atom_matrix_count(0)
{
f_temp_text_class = new ts::__cstr_class(255);
}
//---------------------------------------------------------------------------

__stdcall ts::__database_items::~__database_items()
{
		delete f_temp_text_class;
}
//---------------------------------------------------------------------------
/*
const ts::__database_items::__atom* __stdcall ts::__database_items::operator [] (const int32_t a_index)
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

const ts::__database_items::__atom* __stdcall ts::__database_items::operator [] (int32_t a_index) const
{
		return f_atom_matrix[a_index];
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::count() const
{
		return f_atom_matrix_count;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::set_count(const uint32_t a_count)
{
		if (f_atom_matrix_count==a_count) return a_count;
		if (f_atom_matrix_count< a_count) {
				if (f_atom_matrix_count==0 && a_count>0) f_atom_matrix = (ts::__database_items::__atom**)ts::mem32::alloc(a_count * sizeof(ts::__database_items::__atom*));
		   else f_atom_matrix =(ts::__database_items::__atom**)ts::mem32::realloc((void*)f_atom_matrix,a_count * sizeof(ts::__database_items::__atom*));
		   for (int32_t iT = f_atom_matrix_count; iT < a_count; iT++)
				   {
						f_atom_matrix[iT] = (ts::__database_items::__atom*)ts::mem32::alloc(sizeof(ts::__database_items::__atom));
						f_atom_matrix[iT]->text_size = 32;
						f_atom_matrix[iT]->text = ts::cstr::alloc(f_atom_matrix[iT]->text_size); //inicjalizacja atoma
						f_atom_matrix[iT]->text[0]   = '\0';
						}
				f_atom_matrix_count =a_count;
				return a_count;
		} else {
		   for (int32_t iT = a_count; iT < f_atom_matrix_count; iT++)
				   {
						ts::cstr::free(f_atom_matrix[iT]->text); //kasowanie atoma
						f_atom_matrix[iT]->text = NULL;
						f_atom_matrix[iT]->text_size = 0;
						ts::mem32::free(f_atom_matrix[iT]);
						f_atom_matrix[iT] = NULL;
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

void __stdcall ts::__database_items::set(const int32_t a_index_S, const ts::__database_items::__atom *a_atom)
{
		for (register int32_t x = 0; x < ATOM_ELEMENT_SIZE; x++) {
				f_atom_matrix[a_index_S]->number[x] = a_atom->number[x];
				f_atom_matrix[a_index_S]->data[x]   = a_atom->data[x];
		}
		set_text(a_index_S, a_atom->text);
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::set_text(const int32_t a_index_S, const char *a_text)
{
		register int32_t a_size = ts::cstr::len(a_text);

		if(a_size > f_atom_matrix[a_index_S]->text_size || a_size < f_atom_matrix[a_index_S]->text_size) {
		   f_atom_matrix[a_index_S]->text_size = a_size;
		   f_atom_matrix[a_index_S]->text = ts::cstr::realloc(f_atom_matrix[a_index_S]->text, f_atom_matrix[a_index_S]->text_size + 1);
		}
		ts::mem32::mov(f_atom_matrix[a_index_S]->text,a_text,a_size + 1);
}
//---------------------------------------------------------------------------

void	__stdcall ts::__database_items::set_text_size(const int32_t a_index_S, const int32_t a_text_size)
{
		f_atom_matrix[a_index_S]->text = ts::cstr::realloc(f_atom_matrix[a_index_S]->text,a_text_size + 1);
}
//---------------------------------------------------------------------------

void	__stdcall ts::__database_items::set_number(const int32_t a_index_S, const int32_t a_column_Y, const int32_t a_value)
{
		f_atom_matrix[a_index_S]->number[a_column_Y] = a_value;
}
//---------------------------------------------------------------------------

void	__stdcall ts::__database_items::set_data(const int32_t a_index_S, const int32_t a_column_Y, void *a_pointer)
{
		f_atom_matrix[a_index_S]->data[a_column_Y] = a_pointer;
}
//---------------------------------------------------------------------------

const ts::__database_items::__atom *__stdcall ts::__database_items::get(const int32_t a_index_G) const
{
		return f_atom_matrix[a_index_G];
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__database_items::get_text(const int32_t a_index_G) const
{
		return f_atom_matrix[a_index_G]->text;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::get_text_size(const int32_t a_index_G) const
{
		return  f_atom_matrix[a_index_G]->text_size;
}
//---------------------------------------------------------------------------

void   *__stdcall ts::__database_items::get_data(const int32_t a_index_G, const int32_t a_column_Y) const
{
		return  f_atom_matrix[a_index_G]->data[a_column_Y];
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::get_number(const int32_t a_index_G, const int32_t a_column_Y) const
{
		return f_atom_matrix[a_index_G]->number[a_column_Y];
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::search_data(const int32_t a_istart, const int32_t a_column_Y, const void *a_pointer) const
{
		for (int32_t iT = a_istart; iT < count(); iT++) {
				if (f_atom_matrix[iT]->data[a_column_Y]==a_pointer) {
						return iT;
				}
		}
		return -1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::search_number(const int32_t a_istart, const int32_t a_column_Y, int32_t a_number) const
{
		for (int32_t iT = a_istart; iT < count(); iT++) {
				if (f_atom_matrix[iT]->number[a_column_Y]==a_number) {
						return iT;
				}
		}
		return -1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::search_text(const int32_t a_istart, const char* __restrict__ a_Char) const
{
		for (int32_t iT = a_istart; iT < count(); iT++)  {
				if (ts::cstr::cmpex(f_atom_matrix[iT]->text,a_Char)==0) {
						return iT;
				}
		}
		return -1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::add(const ts::__database_items::__atom * __restrict__ a_atom)
{
		set_count(count()+1);
		set(count()-1, a_atom);
		return  count()-1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::add_text(const char* __restrict__ a_text)
{
		set_count(count()+1);
		set_text(count()-1, a_text);
		return  count()-1;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::insert(const int32_t a_index, const ts::__database_items::__atom *a_atom)
{
		set_count(count()+1);
		static ts::__database_items::__atom c_atom;
		ts::mem32::mov(&c_atom,f_atom_matrix[count()-1],sizeof(ts::__database_items::__atom));
		for (int32_t iT = count()-1; iT > a_index; iT--) {
				ts::mem32::mov(f_atom_matrix[iT],f_atom_matrix[iT-1], sizeof(ts::__database_items::__atom));
		}
		ts::mem32::mov(f_atom_matrix[a_index],&c_atom,sizeof(ts::__database_items::__atom));
		set(a_index, a_atom);
		return count();
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__database_items::cut(const int32_t a_index)
{
		ts::__database_items::__atom *d_atom = f_atom_matrix[a_index];
		for (int32_t iT = a_index; iT < count()-1; iT++) {
				ts::mem32::mov(f_atom_matrix[iT],f_atom_matrix[iT+1], sizeof(ts::__database_items::__atom));
		}
		ts::mem32::mov(f_atom_matrix[count()-1],&d_atom[0], sizeof(ts::__database_items::__atom));
				   set_count(count()-1);
		return count();
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::swap(const int32_t a_index_1, const int32_t a_index_2)
{
		ts::__database_items::__atom  *e_atom = f_atom_matrix[a_index_1];
		ts::mem32::mov(f_atom_matrix[a_index_1],f_atom_matrix[a_index_2], sizeof(ts::__database_items::__atom));
		ts::mem32::mov(f_atom_matrix[a_index_2],e_atom, sizeof(ts::__database_items::__atom));
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::sort_text()
{
		for (int32_t index1 = 0; index1 < count(); index1++)
		for (int32_t index2 = index1 + 1; index2 < count(); index2++) {
				if (ts::cstr::cmpex(f_atom_matrix[index1]->text,f_atom_matrix[index2]->text) > 0) {
						swap(index1, index2);
				}
		}
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::sort_number(const int32_t a_column)
{
		register int32_t column = a_column;
		for (int32_t index1 = 0; index1 < count(); index1++)
		for (int32_t index2 = index1 + 1; index2 < count(); index2++) {
				if (f_atom_matrix[index1]->number[column] > f_atom_matrix[index2]->number[column]) {
						swap(index1, index2);
				}
		}
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::sort_data(const int32_t a_column)
{
		register int32_t column = a_column;
		for (int32_t index1 = 0; index1 < count(); index1++)
		for (int32_t index2 = index1 + 1; index2 < count(); index2++) {
				if (f_atom_matrix[index1]->data[column] > f_atom_matrix[index2]->data[column]) {
						swap(index1, index2);
				}
		}
}
//---------------------------------------------------------------------------

void __stdcall ts::__database_items::clear_all()
{
		set_count(0);
}
//---------------------------------------------------------------------------

const char *__stdcall ts::__database_items::text(const char *a_format) const
{
		return (ts::TEXT_C_FROM_DATA(f_temp_text_class,a_format,this->f_this_class_owner))->c_str();
}
//---------------------------------------------------------------------------
// SUPPORT, CONVERSIONS, OTHER FUNCTIONS
//---------------------------------------------------------------------------

ts::__database_items::__atom *__stdcall ts::CHAR_TO_DATABASE_ATOM(const char *a_text)
{
		static ts::__database_items::__atom xPARAM = { {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, 0, 0 };
		xPARAM.text_size = ts::cstr::len(a_text);
		xPARAM.text = (char*)a_text;
		return &xPARAM;
}
/*
//---------------------------------------------------------------------------

void  __stdcall ts::__database::__lines::operator=(char *a_Lines)
{
DATA_FROM_text(Owner,a_Lines,LINES);
}
//---------------------------------------------------------------------------

__stdcall ts::__database::__lines::operator char *()
{
ts::cstr::free(f_Lines);
return text_FROM_DATA(&fLines,Owner,LINES);
}
//---------------------------------------------------------------------------

void  __stdcall ts::__database::__csv::operator=(char *a_text)
{
DATA_FROM_text(Owner,a_text,CSV);
}
//---------------------------------------------------------------------------

__stdcall ts::__database::__csv::operator char *()
{
ts::cstr::free(fcsv);
return text_FROM_DATA(&fcsv,Owner,CSV);
}


int32_t __stdcall ts::__database::Include(ts::__database *a_database)
{
 if (a_database==NULL)
		 {return count();
		 }
else
		 {int32_t  iT = count(), iX = iT + a_database->count(); this->count() = iX;
		  for (;iT < iX; iT++)
						{Items[iT]=a_database->items[iT];
						}
		  return count();
		 }
}

void __stdcall ts::__database::__owner::operator= (ts::__database *a_Owner)
{
f_Owner = a_Owner;
}
//---------------------------------------------------------------------------

*/
