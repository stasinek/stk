//---------------------------------------------------------------------------
#ifndef __stk_database_H__
#define __stk_database_H__
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#include "stk_database_alias.h"
#include "stk_database_items.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
#define EXPORT_CSV  		1
#define EXPORT_LINES  		2
#define DATA_COUNT_IN_ITEM  8
//---------------------------------------------------------------------------
class __database_alias;
class __database_items;
class STK_IMPEXP __database {
//---------------------------------------------------------------------------
private:
        stk::__database_items *f_items;
        __database *f_owner;
        stk::__cstr_class *f_alias;
//---------------------------------------------------------------------------
public:
                                            __stdcall  __database(void);
                                            __stdcall  __database(const __database *__restrict__ a_owner);
                                            __stdcall  __database(const __database *__restrict__ a_owner, const char *__restrict__ a_alias);
     virtual                                __stdcall __stdcall ~__database(void);
     void                                   __stdcall clear();

     const __database_items*                __stdcall items(void) const;
     __database_items*                      __stdcall items(void);
     int32_t                                __stdcall set(__database *a_database);
     int32_t                                __stdcall add(__database *a_database);
     int32_t                                __stdcall load(const char *__restrict__ a_format);
     int32_t                                __stdcall save(const char *__restrict__ a_format) const;
     int32_t                                __stdcall import_from(const char *__restrict__ a_data, const char *__restrict__ a_format);
     int32_t                                __stdcall export_to(char *a_data, const char *__restrict__ a_format) const;
     const __database*                      __stdcall owner(void) const;
     const __database*                      __stdcall set_owner(__database *a_owner);
     const char*                            __stdcall alias(void) const;
     const char*                            __stdcall set_alias(const char *a_alias);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
extern __database   *__stdcall DATABASE_FROM_CSTR(__database *a_database, const char* __restrict__ a_text, const char* __restrict__ a_format);
extern char         *__stdcall CSTR_FROM_DATABASE(char *a_text, const char* __restrict__ a_format, const __database* __restrict__ a_database);
//---------------------------------------------------------------------------
#ifdef __cplusplus
} //namespace stk
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

/*template <typename T> class owner_template {
                T *ptr;
        public:
                            __stdcall owner_template()
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
                                            __stdcall __csv() { Owner = NULL; fcsv = stk::cstr::allocex(1,""); fcsv_size = 0;  }
                                            __stdcall __csv(__database *aOwner) { Owner = aOwner; }
                                void               __stdcall operator= (char *i);
                                            __stdcall operator char* ();
                                friend __database;
                                            __stdcall ~__csv() { if (fcsv!=NULL) stk::cstr::free(fcsv); }
} csv; friend __csv;

class __lines {
                                private:
                                __database *Owner;
                                char *fLines;
                        uint32_t  fLines_size;
                                public:
                                            __stdcall __lines() { Owner = NULL; fLines = stk::cstr::allocex(1,""); fLines_size = 0; }
                                            __stdcall __lines(__database *aOwner) { __lines(); Owner = aOwner; }
                                void               __stdcall operator= (char *i);
                                            __stdcall operator char* ();
                                friend __database;
                                            __stdcall ~__lines() { if (fLines!=NULL) stk::cstr::free(fLines); }
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
                                            __stdcall __numbers() { Owner = NULL; f_numbers = 0; }
                                            __stdcall __numbers(__items *a_owner) { __numbers(); Owner = a_owner; }
                                void               __stdcall operator= (uint32_t i);
                                            __stdcall operator uint32_t () { return f_numbers; }
                                            __stdcall ~__numbers() { }
} numbers[8];

class __text {
                                private:
                                __items *Owner;
                                char *f_text; uint32_t f_text_size;
                                public:
                                            __stdcall __text() { Owner = NULL; f_text = stk::cstr::allocex(1,""); f_text_size = 0; }
                                            __stdcall __text(__items *a_owner) { __text(); Owner = a_owner; }
                                void               __stdcall operator= (char *i);
                                            __stdcall operator char* () { return f_text; }
                                            __stdcall uint32_t size()
                                                { return f_text_size; }
                                            __stdcall ~__text() { if (f_text!=NULL) stk::cstr::free(f_text); }
} text;
//------------------------------------
                                void               __stdcall operator= (__atom i);
                     __stdcall ~__atom	(void);
//------------------------------------
} **Atoms;
//------------------------------------

*/
