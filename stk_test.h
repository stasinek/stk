//---------------------------------------------------------------------------
#ifndef __stk_test_h
#define __stk_test_h
//---------------------------------------------------------------------------
#include "./stk_MAIN.h"
//---------------------------------------------------------------------------
#include "./text/stk_cstr_utils.h"
#include "./mem/stk_mem.h"
#include "./cpu/stk_cpu.h"
#include "./threads/stk_threads.h"
#include "./time/stk_time.h"
#include "./koperek/stk_kop32_API.h"
#include "./koperek/stk_kop32_class.h"
#include "./koperek/stk_kop32_controler.h"
#include "./compression/stk_compression_API.h"
#include "./cipher/stk_cipher_API.h"
#include "./hash/stk_hash_API.h"
#include "./stk_vector.h"
#include "./3d/stk_3dvector.h"
#include "./stk_tree.h"
#include "./process_journal/stk_journal.h"
#include "./io/stk_console.h"

namespace stk { namespace test {
extern "C" STK_IMPEXP int STK_IMPEXP  __stdcall start_test(int argc, char *argv[]);
#ifdef __WATCOMC__
extern "C" void stk_atexit(void);
#else
void __cdecl stk_atexit(void);
#endif
}}

//---------------------------------------------------------------------------
#endif
