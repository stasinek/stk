//---------------------------------------------------------------------------
#ifndef __stk_database_h
#define __stk_database_h
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#include "stk_database_alias.h"
#include "stk_database_items.h"
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
#define CSV  				1
#define LINES  				2
#define DATA_COUNT_IN_ITEM  8
//---------------------------------------------------------------------------
class __database_alias;
class __database_items;
class __database {
//---------------------------------------------------------------------------
private:
        stk::__database_items *f_items;
        __database *f_owner;
        stk::__cstr_class *f_alias;
//---------------------------------------------------------------------------
public:
//------------------------------------
                        STK_IMPEXP  __stdcall __database(void);
                        STK_IMPEXP  __stdcall __database(const __database *__restrict__ a_owner);
                        STK_IMPEXP  __stdcall __database(const __database *__restrict__ a_owner, const char *__restrict__ a_alias);
//------------------------------------
                int32_t STK_IMPEXP  __stdcall set(__database *a_database);
                int32_t STK_IMPEXP  __stdcall add(__database *a_database);
                int32_t STK_IMPEXP  __stdcall export_to(char *a_data, const char *__restrict__ a_format) const;
                int32_t STK_IMPEXP  __stdcall save(const char *__restrict__ a_format) const;
                int32_t STK_IMPEXP  __stdcall load(const char *__restrict__ a_format);
                int32_t STK_IMPEXP  __stdcall import_from(const char *__restrict__ a_data, const char *__restrict__ a_format);
     const __database*  STK_IMPEXP  __stdcall set_owner(__database *a_owner);
     const char*	    STK_IMPEXP  __stdcall set_alias(const char *a_alias);
     //---------------------------------------------------------------------------
     inline const __database* STK_IMPEXP  __stdcall owner(void) const {
     return f_owner;}
     //---------------------------------------------------------------------------
     const char* STK_IMPEXP  __stdcall alias(void) const {
     return f_alias->c_str();
     }
     //---------------------------------------------------------------------------
     inline __database_items* STK_IMPEXP  __stdcall items(void) {
     return f_items;
     }
     inline const __database_items* STK_IMPEXP  __stdcall items(void) const {
     return f_items;
     }
     //---------------------------------------------------------------------------
     inline void STK_IMPEXP  __stdcall clear() {
     items()->clear_all();
     }
//------------------------------------
                        STK_IMPEXP  __stdcall ~__database(void);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
extern __database  STK_IMPEXP *__stdcall DATA_FROM_C(__database *a_database, const char* __restrict__ a_text, const char* __restrict__ a_format);
extern char  STK_IMPEXP *__stdcall C_FROM_DATA(char *a_text, const char* __restrict__ a_format, const __database* __restrict__ a_database);
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

/*template <typename T> class owner_template {
                T *ptr;
        public:
                STK_IMPEXP  __stdcall owner_template()
                { ptr= NULL; }
                T & operator = (const T &i) {
                        return ptr = i;
                }
                template <typename T2> T2 & operator = (const T2 &i) {
                        T2 &guard = ptr;
                        throw guard; // Never reached.
                }
                operator T const & () const {
                        return ptr;
                }
};
*/

/*

class __csv {
                                private:
                                __database *Owner;
                                char *fcsv;
                        uint32_t  fcsv_size;
                                public:
                                STK_IMPEXP  __stdcall __csv() { Owner = NULL; fcsv = stk::cstr::allocex(1,""); fcsv_size = 0;  }
                                STK_IMPEXP  __stdcall __csv(__database *aOwner) { Owner = aOwner; }
                                void   STK_IMPEXP  __stdcall operator= (char *i);
                                STK_IMPEXP  __stdcall operator char* ();
                                friend __database;
                                STK_IMPEXP  __stdcall ~__csv() { if (fcsv!=NULL) stk::cstr::free(fcsv); }
} csv; friend __csv;

class __lines {
                                private:
                                __database *Owner;
                                char *fLines;
                        uint32_t  fLines_size;
                                public:
                                STK_IMPEXP  __stdcall __lines() { Owner = NULL; fLines = stk::cstr::allocex(1,""); fLines_size = 0; }
                                STK_IMPEXP  __stdcall __lines(__database *aOwner) { __lines(); Owner = aOwner; }
                                void   STK_IMPEXP  __stdcall operator= (char *i);
                                STK_IMPEXP  __stdcall operator char* ();
                                friend __database;
                                STK_IMPEXP  __stdcall ~__lines() { if (fLines!=NULL) stk::cstr::free(fLines); }
} Lines; friend __lines;
struct __atom {
        //------------------------------------
        public:
        //------------------------------------
                 __atom	(void) { }
        //------------------------------------
class __numbers {
                                private:
                                __items *Owner;
                                uint32_t f_numbers;
                                public:
                                STK_IMPEXP  __stdcall __numbers() { Owner = NULL; f_numbers = 0; }
                                STK_IMPEXP  __stdcall __numbers(__items *a_owner) { __numbers(); Owner = a_owner; }
                                void   STK_IMPEXP  __stdcall operator= (uint32_t i);
                                STK_IMPEXP  __stdcall operator uint32_t () { return f_numbers; }
                                STK_IMPEXP  __stdcall ~__numbers() { }
} numbers[8];

class __text {
                                private:
                                __items *Owner;
                                char *f_text; uint32_t f_text_size;
                                public:
                                STK_IMPEXP  __stdcall __text() { Owner = NULL; f_text = stk::cstr::allocex(1,""); f_text_size = 0; }
                                STK_IMPEXP  __stdcall __text(__items *a_owner) { __text(); Owner = a_owner; }
                                void   STK_IMPEXP  __stdcall operator= (char *i);
                                STK_IMPEXP  __stdcall operator char* () { return f_text; }
                                STK_IMPEXP  __stdcall uint32_t size()
                                                { return f_text_size; }
                                STK_IMPEXP  __stdcall ~__text() { if (f_text!=NULL) stk::cstr::free(f_text); }
} text;
//------------------------------------
                                void   STK_IMPEXP  __stdcall operator= (__atom i);
         STK_IMPEXP  __stdcall ~__atom	(void);
//------------------------------------
} **Atoms;
//------------------------------------

*/
