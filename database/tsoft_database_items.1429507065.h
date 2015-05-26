//---------------------------------------------------------------------------
#ifndef __tsoft_database_items_H__
#define __tsoft_database_items_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../text/tsoft_text_class.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
class __database;
class __database_items {
//---------------------------------------------------------------------------
		protected:
				__database *f_this_class_owner;
				ts::__cstr_class *f_temp_text_class;
		public:
#define ATOM_ELEMENT_SIZE 10
				struct __atom {
						__int32 number[ATOM_ELEMENT_SIZE];
						  void *data[ATOM_ELEMENT_SIZE];
						__int32 text_size;
						  char *text;
				};
		private:
				__atom **f_atom_matrix;
				__int32  f_atom_matrix_count;
		public:
				//------------------------------------
				__int32			__stdcall	count					(void) const;
				__int32			__stdcall	set_count				(const uint32_t a_count);
				//------------------------------------
												__stdcall	__database_items		(const __database *a_owner);
												__stdcall	__database_items		(void);
				//------------------------------------
				void			__stdcall	set						(const __int32 a_index_S, const __atom* __restrict__ a_whole_atom);
				void			__stdcall	set_text				(const __int32 a_index_S, const char* __restrict__ a_text);
				void			__stdcall	set_text_size			(const __int32 a_index_S, const __int32 a_text_size);
				void			__stdcall	set_number				(const __int32 a_index_S, const __int32 a_column_Y, const __int32 a_number);
				void			__stdcall	set_data  				(const __int32 a_index_S, const __int32 a_column_Y, void *a_ptr);
				//------------------------------------
				const __atom*	__stdcall	operator []				(__int32 a_index) const;
				const __atom   *__stdcall	get						(const __int32 a_index_G) const;
				const char	   *__stdcall	get_text				(const __int32 a_index_G) const;
				__int32				 __stdcall	get_text_size			(const __int32 a_index_G) const;
				__int32				 __stdcall	get_number				(const __int32 a_index_G, const __int32 a_column_Y) const;
				void		   *__stdcall	get_data 				(const __int32 a_index_G, const __int32 a_column_Y) const;
				//------------------------------------
				void			__stdcall	clear					(void);
				void			__stdcall	clear_all				(void);
				//------------------------------------
				__int32				 __stdcall	add						(const __atom * __restrict__ a_whole_atom);
				__int32				 __stdcall	add_text				(const char* __restrict__ a_text);
				__int32				 __stdcall	add_data				(const __int32 a_column_Y, void *a_pointer);
				__int32				 __stdcall	add_number				(const __int32 a_column_Y, const __int32 a_value);
				__int32				 __stdcall	insert					(const __int32 a_index_I, const __atom *a_whole_atom);
				__int32				 __stdcall	insert_text				(const __int32 a_index_I, const char* __restrict__ a_text);
				__int32				 __stdcall	insert_number			(const __int32 a_index_I, const __int32 a_column_Y, const __int32 a_value);
				__int32				 __stdcall	insert_data				(const __int32 a_index_I, const __int32 a_column_Y, void *a_pointer);
				__int32				 __stdcall	cut										 (const __int32 a_index_C);
				__int32				 __stdcall	search					(const __int32 a_index_S, const __atom * __restrict__ a_whole_atom) const;
				__int32				 __stdcall	search_text				(const __int32 a_index_S, const char* __restrict__ a_char) const;
				__int32				 __stdcall	search_number			(const __int32 a_index_S, const __int32 a_column_Y, const __int32 a_number_value) const;
				__int32				 __stdcall	search_data				(const __int32 a_index_S, const __int32 a_column_Y, const void *a_pointer) const;
				void						__stdcall	sort_text				(void);
				void			__stdcall	sort_number				(const __int32 a_column_Y);
				void			__stdcall	sort_data					(const __int32 a_column_Y);
				void			__stdcall	swap										(const __int32 a_index_P, const __int32 a_index_B);
				//------------------------------------
				const char	   *__stdcall 	text					(const char* __restrict__ a_format) const;
				//------------------------------------
												__stdcall  ~__database_items		();
				//------------------------------------
				friend __database;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
__database_items::__atom *__stdcall CHAR_TO_DATABASE_ATOM	(const char* __restrict__ a_text);
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
