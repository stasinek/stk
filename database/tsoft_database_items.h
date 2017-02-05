//---------------------------------------------------------------------------
#ifndef tsoft_database_items_h
#define tsoft_database_items_h
#pragma once
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../text/tsoft_cstr_class.h"
#include "./../text/tsoft_cstr_utils.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
class __database;
class __database_items {
//---------------------------------------------------------------------------
public:
#define ATOM_NUMBERS_COUNT 25
#define ATOM_TEXT_SIZE 255
	class __atom {
	public:
        char*       text;
        uint32_t    text_size;
        uint32_t    number[ATOM_NUMBERS_COUNT];
        void*       data_chunk[ATOM_NUMBERS_COUNT];

		__stdcall __atom(void) {
			text_size = ATOM_TEXT_SIZE;
			text = ts::cstr::allocex(text_size + 1,"\0");
			reset();
		}
		void __stdcall set(char* a_text) {
			register uint32_t a_text_len = ts::cstr::len(a_text);
			if (text_size < a_text_len) {
				text_size = a_text_len;
				text = ts::cstr::reallocex(text,text_size + 1,"\0");
			}
		}
		void __stdcall reset(void) {
			for (register uint32_t i = 0; i < ATOM_NUMBERS_COUNT; i++) {
				number[i]=0;
				data_chunk[i] = NULL;
			}
			if (text_size!=ATOM_TEXT_SIZE) {
				text_size =ATOM_TEXT_SIZE;
				text = ts::cstr::reallocex(text,text_size + 1,"\0");
			}
		}
		__stdcall ~__atom(void) {
			text_size = 0;
			ts::cstr::free(text);
			text = NULL;
		}
	};
protected:
    __database* f_this_class_owner;
    __atom**    f_atom_matrix;
    uint32_t    f_atom_matrix_count;
private:
    __atom*     f_temp_atom;
protected:
	void                    __stdcall       __init                                  (void);
public:
	//------------------------------------
	__stdcall       __database_items                (const __database* a_owner);
	__stdcall       __database_items                (void);
	//------------------------------------
    inline uint32_t __stdcall   count() const {
		return f_atom_matrix_count;
	}
	//------------------------------------
    uint32_t                __stdcall       set_count                       (const uint32_t a_count);
	//------------------------------------
	void                    __stdcall       set                                             (const uint32_t a_index_S, const __atom* __restrict__ a_whole_atom);
    void                    __stdcall       set_text                        (const uint32_t a_index_S, const char* __restrict__ a_text);
	void                    __stdcall       set_text_size                   (const uint32_t a_index_S, const uint32_t a_text_size);
    void                    __stdcall       set_number                      (const uint32_t a_index_S, const uint32_t a_column_Y, const uint32_t a_number);
	void                    __stdcall       set_data_chunk                  (const uint32_t a_index_S, const uint32_t a_column_Y, void* a_ptr);
	//------------------------------------
    inline const ts::__database_items::__atom* __stdcall operator [] (const uint32_t a_index) const {
		return f_atom_matrix[a_index];
	}
	inline const ts::__database_items::__atom* __stdcall operator [] (const uint32_t a_index) {
		return f_atom_matrix[a_index];
	}
	//---------------------------------------------------------------------------
	inline const ts::__database_items::__atom* __stdcall get(const uint32_t a_index_G) const {
		return f_atom_matrix[a_index_G];
	}
	//---------------------------------------------------------------------------
	inline const char* __stdcall get_text(const uint32_t a_index_G) const {
		return f_atom_matrix[a_index_G]->text;
	}
	//---------------------------------------------------------------------------
	inline uint32_t __stdcall get_text_size(const uint32_t a_index_G) const {
		return  f_atom_matrix[a_index_G]->text_size;
	}
	//---------------------------------------------------------------------------
	inline void*   __stdcall get_data_chunk(const uint32_t a_index_G, const uint32_t a_column_Y) const {
		return  f_atom_matrix[a_index_G]->data_chunk[a_column_Y];
	}
	//---------------------------------------------------------------------------
	inline uint32_t __stdcall get_number(const uint32_t a_index_G, const uint32_t a_column_Y) const {
		return f_atom_matrix[a_index_G]->number[a_column_Y];
	}
	//------------------------------------
	void                    __stdcall       clear                                   (void);
	//---------------------------------------------------------------------------
	inline void     __stdcall   clear_all() {
		set_count(0);
	}
	//------------------------------------
	uint32_t                __stdcall       add                                             (const __atom* __restrict__ a_whole_atom);
	uint32_t                __stdcall       add_text                                (const char* __restrict__ a_text);
	uint32_t                __stdcall       add_data_chunk                  (const uint32_t a_column_Y, void* a_pointer);
	uint32_t                __stdcall       add_number                              (const uint32_t a_column_Y, const uint32_t a_value);
	uint32_t                __stdcall       insert                                  (const uint32_t a_index_I, const __atom* a_whole_atom);
	uint32_t                __stdcall       insert_text                             (const uint32_t a_index_I, const char* __restrict__ a_text);
	uint32_t                __stdcall       insert_number                   (const uint32_t a_index_I, const uint32_t a_column_Y, const uint32_t a_value);
	uint32_t                __stdcall       insert_data_chunk               (const uint32_t a_index_I, const uint32_t a_column_Y, void* a_pointer);
	uint32_t                __stdcall       cut                                             (const uint32_t a_index_C);
	int32_t                 __stdcall       search_ex                               (const uint32_t a_index_S, const __atom* __restrict__ a_whole_atom) const;
	int32_t                 __stdcall       search                                  (const __atom* __restrict__ a_whole_atom) const;
	//---------------------------------------------------------------------------
	int32_t                 __stdcall       search_text_ex                  (const uint32_t a_index_S, const char* __restrict__ a_char) const;
	inline int32_t      __stdcall   search_text             (const char* __restrict__ a_Char) const {
		return search_text_ex(0,a_Char);
	}
	//---------------------------------------------------------------------------
	int32_t                             __stdcall       search_number_ex                (const uint32_t a_index_S, const uint32_t a_column_Y, const uint32_t a_number_value) const;
	inline int32_t      __stdcall   search_number           (const uint32_t a_column_Y, uint32_t a_number) const {
		return search_number_ex(0,a_column_Y,a_number);
	}
	//---------------------------------------------------------------------------
	int32_t                             __stdcall       search_data_chunk_ex    (const uint32_t a_index_S, const uint32_t a_column_Y, const void* a_pointer) const;
	inline int32_t      __stdcall   search_data_chunk       (const uint32_t a_column_Y, const void* a_pointer) const {
		return search_data_chunk_ex(0,a_column_Y,a_pointer);
	}
	//---------------------------------------------------------------------------
	void                    __stdcall       sort_text                               (void);
	void                    __stdcall       sort_number                             (const uint32_t a_column_Y);
	void                    __stdcall       sort_data_chunk                 (const uint32_t a_column_Y);
	void                    __stdcall       swap                                    (const uint32_t a_index_P, const uint32_t a_index_B);
	//---------------------------------------------------------------------------
	const char* __stdcall text(const char* __restrict__ a_format) const;
	//------------------------------------
	__stdcall  ~__database_items            ();
	//------------------------------------
	friend class __database;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
ts::__database_items::__atom* __stdcall C_TO_ATOM(ts::__database_items::__atom* a_atom, const char* __restrict__ a_text);
char* __stdcall ATOM_TO_C(char* a_text,const ts::__database_items::__atom* a_atom);
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
