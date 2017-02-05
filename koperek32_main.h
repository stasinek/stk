//---------------------------------------------------------------------------
#ifndef koperek32_main_h
#define koperek32_main_h
//---------------------------------------------------------------------------
#include "./tsoft_MAIN.h"
//---------------------------------------------------------------------------
//extern "C" int __cdecl helloasm3(int par);
//---------------------------------------------------------------------------
#include "./time/tsoft_time.h"
#include "./cpu/tsoft_cpu.h"
#include "./mem/tsoft_mem.h"
#include "./text/tsoft_cstr_utils.h"
#include "./koperek/tsoft_kop32_API.h"
#include "./koperek/tsoft_kop32_class.h"
#include "./koperek/tsoft_kop32_controler.h"
#include "./compression/tsoft_compression_API.h"
#include "./cipher/tsoft_cipher_API.h"
#include "./hash/tsoft_hash_API.h"
#include "./process_journal/tsoft_journal.h"
#include "./io/tsoft_console.h"
#include "./sthreads/tsoft_threads.h"
#include "__vector.h"
#include "./3d/__3dvector.h"
#include "__tree.h"
//---------------------------------------------------------------------------
#ifdef QT_GUI
#include "tapplication.h"
extern void __stdcall Qt_AppMain(const int argc, const char *argv[]);
extern void __stdcall Qt_PrintEventHandler(const char *a_text);
extern char __stdcall Qt_GetchEventHandler(void);
extern void __stdcall Qt_ErrorEventHandler(const char *a_text);
extern const char*__stdcall Qt_Kop32EventHandler(ts::__kop32_class *akop, const char *a_event, const char *a_code, const char *a_code_ex);
extern TApplication *Application;
extern QThread *Thread[8];
#else
extern void __stdcall text_AppMain(const int argc, const char *argv[]);
extern void __stdcall text_PrintEventHandler(const char *a_text);
extern char __stdcall text_GetchEventHandler(void);
extern void __stdcall text_ErrorEventHandler(const char *a_text);
extern const char*__stdcall text_Kop32EventHandler(ts::__kop32_class *akop, const char *a_event, const char *a_code, const char *a_code_ex);
#endif
//---------------------------------------------------------------------------
#endif
