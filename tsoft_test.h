//---------------------------------------------------------------------------
#ifndef tsoft_test_h
#define tsoft_test_h
//---------------------------------------------------------------------------
#include "./tsoft_MAIN.h"
//---------------------------------------------------------------------------
#include "./text/tsoft_cstr_manipulation.h"
#include "./mem/tsoft_mem.h"
#include "./cpu/tsoft_cpu.h"
#include "./ssthreads/tsoft_threads.h"
#include "./time/tsoft_time.h"
#include "./koperek/tsoft_kop32_API.h"
#include "./koperek/tsoft_kop32_class.h"
#include "./koperek/tsoft_kop32_controler.h"
#include "./compression/tsoft_compression_API.h"
#include "./cipher/tsoft_cipher_API.h"
#include "./hash/tsoft_hash_API.h"
#include "__vector.h"
#include "./3d/__3dvector.h"
#include "__tree.h"
#include "../apex_memmove.h"
#include "./process_journal/tsoft_journal.h"
#include "./io/tsoft_console.h"

namespace ts { namespace test {
int __stdcall start(int argc, char *argv[]);
#ifdef __WATCOMC__
void atexit(void);
#else
void __cdecl atexit(void);
#endif


}}

//---------------------------------------------------------------------------
#endif
