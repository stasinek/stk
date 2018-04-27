/* vim: set et ts=3 sw=3 sts=3 ft=c:
 *
 * Copyright (C) 2012, 2013, 2014 James McLaughlin et al.  All rights reserved.
 * https://github.com/udp/json-parser
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */
//---------------------------------------------------------------------------
#ifndef __stk_JSON_H
#define __stk_JSON_H
//---------------------------------------------------------------------------
#include "../../mem/stk_mem.h"
#include <stdlib.h>
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
#ifndef __json_char_t
#define __json_char_t char
#endif
#define json_error_max 128
#define json_enable_comments  0x01
//---------------------------------------------------------------------------
#ifndef __json_int_t
   #if !defined(_MSC_VER) && !defined(__BORLANDC__)
      #include <inttypes.h>
      #define __json_int_t int64_t
   #else
      #define __json_int_t __int64
   #endif
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
extern "C"
{
#endif
//---------------------------------------------------------------------------
typedef struct __json_settings {
   unsigned long max_memory;
   int settings;
   /* Custom allocator support (leave null to use stk::mem::alloc/free)
    */
   void * (* mem_alloc) (size_t, int zero, void * user_data);
   void (* mem_free) (void *, void * user_data);
   void * user_data;  /* will be passed to mem_alloc and mem_free */
   size_t value_extra;  /* how much extra space to allocate for values? */
} json_settings;
//---------------------------------------------------------------------------
typedef enum {
   json_none,
   json_object,
   json_array,
   json_integer,
   json_double,
   json_string,
   json_boolean,
   json_null } json_type;
//---------------------------------------------------------------------------
extern const struct json_value json_value_none;
//---------------------------------------------------------------------------
typedef struct __json_object_entry {
    __json_char_t* name;
    unsigned int name_length;
    struct json_value* value;
} json_object_entry;
//---------------------------------------------------------------------------
typedef struct json_value {
   struct json_value* parent;
   json_type type;
   union {
      int boolean;
      __json_int_t integer;
      double dbl;
      struct {
         unsigned int length;
         __json_char_t* ptr; /* null terminated */
      } string;

      struct {
         unsigned int length;
         json_object_entry* values;
         #if defined(__cplusplus) && __cplusplus >= 201103L
         decltype(values) begin () const {
             return values;
         }
         decltype(values) end () const {
            return values + length;
         }
         #endif
      } object;

      struct {
         unsigned int length;
         struct json_value** values;
         #if defined(__cplusplus) && __cplusplus >= 201103L
         decltype(values) begin () const {
            return values;
         }
         decltype(values) end () const {
             return values + length;
         }
         #endif
      } array;
   } u;

   union {
      struct json_value* next_alloc;
      void* object_mem;
   } _reserved;
   #ifdef JSON_TRACK_SOURCE
   /* Location of the value in the source JSON */
   unsigned int line, col;
   #endif
   /* Some C++ operator sugar */
   #ifdef __cplusplus
      public:
         inline json_value ()
         {  stk::mem::set(this, 0, sizeof (json_value));
         }
         inline const struct json_value &operator [] (int index) const
         {
            if (type != json_array || index < 0
                     || ((unsigned int) index) >= u.array.length)
            {
               return json_value_none;
            }

            return *u.array.values [index];
         }
         inline const struct json_value &operator [] (const char * index) const
         {
            if (type != json_object)
               return json_value_none;

            for (unsigned int i = 0; i < u.object.length; ++ i)
               if (!strcmp (u.object.values [i].name, index))
                  return *u.object.values [i].value;

            return json_value_none;
         }
         inline operator const char * () const
         {
            switch (type)
            {
               case json_string:
                  return u.string.ptr;

               default:
                  return "";
            };
         }
         inline operator __json_int_t() const
         {
            switch (type)
            {
               case json_integer:
                  return u.integer;

               case json_double:
                  return (__json_int_t) u.dbl;

               default:
                  return 0;
            };
         }

         inline operator bool () const
         {
            if (type != json_boolean)
               return false;

            return u.boolean != 0;
         }
         inline operator double () const
         {
            switch (type)
            {
               case json_integer:
                  return (double) u.integer;

               case json_double:
                  return u.dbl;

               default:
                  return 0;
            };
         }
   #endif
} json_value;
//---------------------------------------------------------------------------
json_value* json_parse(const __json_char_t * json, size_t length);
json_value* json_parse_ex(json_settings * settings, const __json_char_t * json, size_t length, char * error);
void json_value_free(json_value *);
void json_value_free_ex(json_settings * settings, json_value *);
/* Not usually necessary, unless you used a custom mem_alloc and now want to
 * use a custom mem_free. */
//---------------------------------------------------------------------------
#ifdef __cplusplus
   } /* STK_extern "C" */
   } // namespace stk
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
