//---------------------------------------------------------------------------
#ifndef koperek32_main_h
#define koperek32_main_h
//---------------------------------------------------------------------------
#include "./stk_MAIN.h"
//---------------------------------------------------------------------------
//extern "C" int __cdecl helloasm3(int par);
//---------------------------------------------------------------------------
#include "./time/stk_time.h"
#include "./cpu/stk_cpu.h"
#include "./mem/stk_mem.h"
#include "./text/stk_cstr_utils.h"
#include "./koperek/stk_kop32_API.h"
#include "./koperek/stk_kop32_class.h"
#include "./koperek/stk_kop32_controler.h"
#include "./compression/stk_compression_API.h"
#include "./cipher/stk_cipher_API.h"
#include "./hash/stk_hash_API.h"
#include "./process_journal/stk_journal.h"
#include "./io/stk_console.h"
#include "./sthreads/stk_threads.h"
#include "./stk_vector.h"
#include "./3d/stk_3dvector.h"
#include "./stk_tree.h"
//---------------------------------------------------------------------------
#ifdef QT_GUI
#include "tapplication.h"
extern void __stdcall Qt_AppMain(const int argc, const char *argv[]);
extern void __stdcall Qt_PrintEventHandler(const char *a_text);
extern char __stdcall Qt_GetchEventHandler(void);
extern void __stdcall Qt_ErrorEventHandler(const char *a_text);
extern const char*__stdcall Qt_Kop32EventHandler(stk::__kop32_class *akop, const char *a_event, const char *a_code, const char *a_code_ex);
extern TApplication *Application;
extern QThread *Thread[8];
#else
extern void __stdcall text_AppMain(const int argc, const char *argv[]);
extern void __stdcall text_PrintEventHandler(const char *a_text);
extern char __stdcall text_GetchEventHandler(void);
extern void __stdcall text_ErrorEventHandler(const char *a_text);
extern const char*__stdcall text_Kop32EventHandler(stk::__kop32_class *akop, const char *a_event, const char *a_code, const char *a_code_ex);
#endif
//---------------------------------------------------------------------------
#endif
