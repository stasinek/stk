//---------------------------------------------------------------------------
#ifndef __stk_database_items_h
#define __stk_database_items_h
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_main.h"
#include "./../text/stk_cstr_class.h"
#include "./../text/stk_cstr_utils.h"
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
class __database;
class STK_IMPEXP __database_items {
//---------------------------------------------------------------------------
public:
#define ATOM_NUMBERS_COUNT 16
#define ATOM_TEXT_SIZE 255
    class STK_IMPEXP __atom {
    public:
        uint64_t    text_size;
        char*       text;
        void*       pointer[ATOM_NUMBERS_COUNT];
        uint64_t    numbers[ATOM_NUMBERS_COUNT];
             __stdcall  __atom(void);
             __stdcall ~__atom(void);
        void __stdcall set(char* a_text);
        void __stdcall reset(void);
    };
protected:
    __database* f_this_class_owner;
    __atom**    f_atom_matrix;
    uint32_t    f_atom_matrix_count;
private:
    __atom*     f_temp_atom;
protected:
    void                                __stdcall       __init              (void);
public:
    //------------------------------------
                                        __stdcall       __database_items    (const __database* a_owner);
                                        __stdcall       __database_items    (void);
    virtual                             __stdcall      ~__database_items    (void);
    //------------------------------------
    uint32_t                            __stdcall       set_count           (const uint32_t a_count);
    uint32_t                            __stdcall       count               (void) const;
    //------------------------------------
    const __atom*                       __stdcall       operator []         (const uint32_t a_index);
    const __atom*                       __stdcall       operator []         (const uint32_t a_index) const;
    //------------------------------------
    void                                __stdcall       set                 (const uint32_t a_index_S, const __atom* __restrict__ a_whole_atom);
    void                                __stdcall       set_numbers         (const uint32_t a_index_S, const uint32_t a_column_Y, const uint32_t a_numbers);
    void                                __stdcall       set_text_size       (const uint32_t a_index_S, const uint32_t a_text_size);
    void                                __stdcall       set_text            (const uint32_t a_index_S, const char* __restrict__ a_text);
    void                                __stdcall       set_pointer         (const uint32_t a_index_S, const uint32_t a_column_Y, void* a_ptr);
    //------------------------------------
    const __atom*                       __stdcall       get                 (const uint32_t a_index_G) const;
    uint32_t                            __stdcall       get_numbers         (const uint32_t a_index_G, const uint32_t a_column_Y) const;
    uint32_t                            __stdcall       get_text_size       (const uint32_t a_index_G) const;
    const char*                         __stdcall       get_text            (const uint32_t a_index_G) const;
    void*                               __stdcall       get_pointer         (const uint32_t a_index_G, const uint32_t a_column_Y) const;
    //------------------------------------
    void                                __stdcall       clear               (void);
    void                                __stdcall       clear_all           (void);
    //------------------------------------
    uint32_t                            __stdcall       add                 (const __atom* __restrict__ a_whole_atom);
    uint32_t                            __stdcall       add_text            (const char* __restrict__ a_text);
    uint32_t                            __stdcall       add_pointer         (const uint32_t a_column_Y, void* a_pointer);
    uint32_t                            __stdcall       add_numbers         (const uint32_t a_column_Y, const uint32_t a_value);
    void                                __stdcall       swap                (const uint32_t a_index_P, const uint32_t a_index_B);
    uint32_t                            __stdcall       insert              (const uint32_t a_index_I, const __atom* a_whole_atom);
    uint32_t                            __stdcall       insert_numbers      (const uint32_t a_index_I, const uint32_t a_column_Y, const uint32_t a_value);
    uint32_t                            __stdcall       insert_text         (const uint32_t a_index_I, const char* __restrict__ a_text);
    uint32_t                            __stdcall       insert_pointer      (const uint32_t a_index_I, const uint32_t a_column_Y, void* a_pointer);
    uint32_t                            __stdcall       cut                 (const uint32_t a_index_C);
    //---------------------------------------------------------------------------
    int32_t                             __stdcall       search_ex           (const uint32_t a_index_S, const __atom* __restrict__ a_whole_atom) const;
    int32_t                             __stdcall       search              (const __atom* __restrict__ a_whole_atom) const;
    int32_t                             __stdcall       search_numbers_ex   (const uint32_t a_index_S, const uint32_t a_column_Y, const uint32_t a_numbers_value) const;
    int32_t                             __stdcall       search_numbers      (const uint32_t a_column_Y, uint32_t a_numbers) const;
    int32_t                             __stdcall       search_text_ex      (const uint32_t a_index_S, const char* __restrict__ a_char) const;
    int32_t                             __stdcall       search_text         (const char* __restrict__ a_Char) const;
    int32_t                             __stdcall       search_pointer_ex   (const uint32_t a_index_S, const uint32_t a_column_Y, const void* a_pointer) const;
    int32_t                             __stdcall       search_pointer      (const uint32_t a_column_Y, const void* a_pointer) const;
    //---------------------------------------------------------------------------
    void                                __stdcall       sort_numbers        (const uint32_t a_column_Y);
    void                                __stdcall       sort_text           (void);
    void                                __stdcall       sort_pointer        (const uint32_t a_column_Y);
    //---------------------------------------------------------------------------
    const char*                         __stdcall       serialize           (const char* __restrict__ a_format) const;
    //---------------------------------------------------------------------------
    friend class __database;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
stk::__database_items::__atom*             __stdcall C_TO_ATOM(stk::__database_items::__atom* a_atom, const char* __restrict__ a_text);
char*             __stdcall ATOM_TO_C(char* a_text,const stk::__database_items::__atom* a_atom);
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
