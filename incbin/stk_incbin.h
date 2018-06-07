//---------------------------------------------------------------------------
#ifndef __stk_incbin_H__
#define __stk_incbin_H__
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_MAIN.h"
//---------------------------------------------------------------------------

#if (__BORLANDC__ > 0x551)

#define __incbin(variable, filename) do {                       \
} while(0);

#endif

#if defined(__WATCOMC__)
#define __incbin(variable, filename) do {                       \
} while(0);
#endif

/* Microsoft C/C++-compatible compiler */
#if defined(__MSVC__)
#define __incbin(variable, filename) do {                       \
} while(0);
#endif

#if defined (__GNUC__) || defined(__MINGW__) || defined(__CLANG__) || defined(__llvm__)

// Solution based on function posted by "mfro" found on http://www.atari-forum.com/viewtopic.php?t=26393
// Changes from https://www.devever.net/~hl/incbin
// GAS manual
//
// The filename must be written in with absolute path because for ex. QtCreator creates .s files in TEMP or in MOC created folder, so GAS is looking in this folder rather than .cpp file folder where code is compiled
// currently it doesn't compile because of error's i can't understand ;)
// GAS manual is big
// 

#define incbin(variable, filename)                                 \
    __asm__ (                                                      \
         ".section .data"                                       "\n"\
        ".global _"#variable                                    "\n"\
        ".type _"#variable", @object"                           "\n"\
        ".align 32"                                             "\n"\
        "_"#variable": .incbin "#filename                       "\n"\
        ".global _"#variable"_size"                             "\n"\
        ".type _"#variable"_size, @object"                      "\n"\
        ".align 32"                                             "\n"\
        #variable"_size: .int "#variable"_size - _"#variable    "\n"\
        ".int 0"                                                "\n"\
        :                                                           \
        :                                                           \
        :                                                           \
        );
#define MY_RESOURCE 300
#define MY_RESOURCE_NAME "file-with-data.txt"
// .rc
//MY_RESOURCE RCDATA "file-with-data.txt"

uint32_t   __stdcall incbin_rc(char** resource_data, uint32_t RESOURCE_ID);
#endif

//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
