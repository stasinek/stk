//---------------------------------------------------------------------------
#ifndef __STK_TEST_h__
#define __STK_TEST_h__
//---------------------------------------------------------------------------
#include "./stk_main.h"
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
#include "./3D/stk_3Dvector.h"
#include "./stk_tree.h"
#include "./process_journal/stk_journal.h"
#include "./io/stk_console.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace test {
#endif
//---------------------------------------------------------------------------
extern int i;
extern STK_IMPEXP int __stdcall start_test(int argc, char *argv[]);
#ifdef __WATCOMC__
extern void stk_atexit(void);
#else
extern STK_IMPEXP void __cdecl stk_atexit(void);
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}
#endif
//---------------------------------------------------------------------------
#endif
