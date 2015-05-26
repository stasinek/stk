//---------------------------------------------------------------------------
#ifndef __tsoft_database_H__
#define __tsoft_database_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "tsoft_database_alias.h"
#include "tsoft_database_items.h"
//---------------------------------------------------------------------------
namespace ts {
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
        ts::__database_items *f_items;
        __database *f_owner;
        ts::__cstr_class *f_alias;
//---------------------------------------------------------------------------
public:
//------------------------------------
                        __stdcall __database(void);
                        __stdcall __database(const __database *__restrict__ a_owner);
                        __stdcall __database(const __database *__restrict__ a_owner, const char *__restrict__ a_alias);
//------------------------------------
                __int32 __stdcall set(__database *a_database);
                __int32 __stdcall add(__database *a_database);
                __int32 __stdcall export_to(char *a_data, const char *__restrict__ a_format) const;
                __int32 __stdcall save(const char *__restrict__ a_format) const;
                __int32 __stdcall load(const char *__restrict__ a_format);
                __int32 __stdcall import_from(const char *__restrict__ a_data, const char *__restrict__ a_format);
     const __database*  __stdcall set_owner(__database *a_owner);
     const char*	    __stdcall set_alias(const char *a_alias);
     //---------------------------------------------------------------------------
     inline const __database* __stdcall owner(void) const {
     return f_owner;}
     //---------------------------------------------------------------------------
     const char* __stdcall alias(void) const {
     return f_alias->c_str();
     }
     //---------------------------------------------------------------------------
     inline __database_items* __stdcall items(void) {
     return f_items;
     }
     inline const __database_items* __stdcall items(void) const {
     return f_items;
     }
     //---------------------------------------------------------------------------
     inline void __stdcall clear() {
     items()->clear_all();
     }
//------------------------------------
                        __stdcall ~__database(void);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
extern __database *__stdcall DATA_FROM_C(__database *a_database, const char* __restrict__ a_text, const char* __restrict__ a_format);
extern char *__stdcall C_FROM_DATA(char *a_text, const char* __restrict__ a_format, const __database* __restrict__ a_database);
//---------------------------------------------------------------------------
}
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
                        __int32  fcsv_size;
                                public:
                                __stdcall __csv() { Owner = NULL; fcsv = ts::cstr::allocex(1,""); fcsv_size = 0;  }
                                __stdcall __csv(__database *aOwner) { Owner = aOwner; }
                                void   __stdcall operator= (char *i);
                                __stdcall operator char* ();
                                friend __database;
                                __stdcall ~__csv() { if (fcsv!=NULL) ts::cstr::free(fcsv); }
} csv; friend __csv;

class __lines {
                                private:
                                __database *Owner;
                                char *fLines;
                        __int32  fLines_size;
                                public:
                                __stdcall __lines() { Owner = NULL; fLines = ts::cstr::allocex(1,""); fLines_size = 0; }
                                __stdcall __lines(__database *aOwner) { __lines(); Owner = aOwner; }
                                void   __stdcall operator= (char *i);
                                __stdcall operator char* ();
                                friend __database;
                                __stdcall ~__lines() { if (fLines!=NULL) ts::cstr::free(fLines); }
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
                                __int32 f_numbers;
                                public:
                                __stdcall __numbers() { Owner = NULL; f_numbers = 0; }
                                __stdcall __numbers(__items *a_owner) { __numbers(); Owner = a_owner; }
                                void   __stdcall operator= (__int32 i);
                                __stdcall operator __int32 () { return f_numbers; }
                                __stdcall ~__numbers() { }
} numbers[8];

class __text {
                                private:
                                __items *Owner;
                                char *f_text; __int32 f_text_size;
                                public:
                                __stdcall __text() { Owner = NULL; f_text = ts::cstr::allocex(1,""); f_text_size = 0; }
                                __stdcall __text(__items *a_owner) { __text(); Owner = a_owner; }
                                void   __stdcall operator= (char *i);
                                __stdcall operator char* () { return f_text; }
                                __stdcall __int32 size()
                                                { return f_text_size; }
                                __stdcall ~__text() { if (f_text!=NULL) ts::cstr::free(f_text); }
} text;
//------------------------------------
                                void   __stdcall operator= (__atom i);
         __stdcall ~__atom	(void);
//------------------------------------
} **Atoms;
//------------------------------------

*/
