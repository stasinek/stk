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
						int32_t number[ATOM_ELEMENT_SIZE];
						  void *data[ATOM_ELEMENT_SIZE];
						int32_t text_size;
						  char *text;
				};
		private:
				__atom **f_atom_matrix;
				int32_t  f_atom_matrix_count;
		public:
				//------------------------------------
				int32_t			__stdcall	count					(void) const;
				int32_t			__stdcall	set_count				(const uint32_t a_count);
				//------------------------------------
												__stdcall	__database_items		(const __database *a_owner);
												__stdcall	__database_items		(void);
				//------------------------------------
				void			__stdcall	set						(const int32_t a_index_S, const __atom* __restrict__ a_whole_atom);
				void			__stdcall	set_text				(const int32_t a_index_S, const char* __restrict__ a_text);
				void			__stdcall	set_text_size			(const int32_t a_index_S, const int32_t a_text_size);
				void			__stdcall	set_number				(const int32_t a_index_S, const int32_t a_column_Y, const int32_t a_number);
				void			__stdcall	set_data  				(const int32_t a_index_S, const int32_t a_column_Y, void *a_ptr);
				//------------------------------------
				const __atom*	__stdcall	operator []				(int32_t a_index) const;
				const __atom   *__stdcall	get						(const int32_t a_index_G) const;
				const char	   *__stdcall	get_text				(const int32_t a_index_G) const;
				int32_t				 __stdcall	get_text_size			(const int32_t a_index_G) const;
				int32_t				 __stdcall	get_number				(const int32_t a_index_G, const int32_t a_column_Y) const;
				void		   *__stdcall	get_data 				(const int32_t a_index_G, const int32_t a_column_Y) const;
				//------------------------------------
				void			__stdcall	clear					(void);
				void			__stdcall	clear_all				(void);
				//------------------------------------
				int32_t				 __stdcall	add						(const __atom * __restrict__ a_whole_atom);
				int32_t				 __stdcall	add_text				(const char* __restrict__ a_text);
				int32_t				 __stdcall	add_data				(const int32_t a_column_Y, void *a_pointer);
				int32_t				 __stdcall	add_number				(const int32_t a_column_Y, const int32_t a_value);
				int32_t				 __stdcall	insert					(const int32_t a_index_I, const __atom *a_whole_atom);
				int32_t				 __stdcall	insert_text				(const int32_t a_index_I, const char* __restrict__ a_text);
				int32_t				 __stdcall	insert_number			(const int32_t a_index_I, const int32_t a_column_Y, const int32_t a_value);
				int32_t				 __stdcall	insert_data				(const int32_t a_index_I, const int32_t a_column_Y, void *a_pointer);
				int32_t				 __stdcall	cut										 (const int32_t a_index_C);
				int32_t				 __stdcall	search					(const int32_t a_index_S, const __atom * __restrict__ a_whole_atom) const;
				int32_t				 __stdcall	search_text				(const int32_t a_index_S, const char* __restrict__ a_char) const;
				int32_t				 __stdcall	search_number			(const int32_t a_index_S, const int32_t a_column_Y, const int32_t a_number_value) const;
				int32_t				 __stdcall	search_data				(const int32_t a_index_S, const int32_t a_column_Y, const void *a_pointer) const;
				void						__stdcall	sort_text				(void);
				void			__stdcall	sort_number				(const int32_t a_column_Y);
				void			__stdcall	sort_data					(const int32_t a_column_Y);
				void			__stdcall	swap										(const int32_t a_index_P, const int32_t a_index_B);
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
