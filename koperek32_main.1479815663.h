//---------------------------------------------------------------------------
#ifndef koperek32_main_h
#define koperek32_main_h
//---------------------------------------------------------------------------
#include "./tsoft_MAIN.h"
//---------------------------------------------------------------------------
extern "C" int __cdecl helloasm3(int par);
//---------------------------------------------------------------------------
#include "./time/tsoft_time.h"
#include "./cpu/tsoft_cpu.h"
#include "./mem/tsoft_mem.h"
#include "./text/tsoft_cstr_manipulation.h"
#include "./koperek/tsoft_kop32_API.h"
#include "./koperek/tsoft_kop32_class.h"
#include "./koperek/tsoft_kop32_controler.h"
#include "./compression/tsoft_compression_API.h"
#include "./cipher/tsoft_cipher_API.h"
#include "./hash/tsoft_hash_API.h"
#include "./process_journal/tsoft_journal.h"
#include "./io/tsoft_console.h"
#include "./ssthreads/tsoft_threads.h"
#include "__vector.h"
#include "./3d/__3dvector.h"
#include "__tree.h"
//---------------------------------------------------------------------------
#ifdef QT_GUI
#include "tapplication.h"
extern void __stdcall Qt_app_main(const int argc, const char *argv[]);
extern void __stdcall Qt_console_print_event_handler(const char *a_text);
extern char __stdcall Qt_console_getch_event_handler(void);
extern void __stdcall Qt_console_error_event_handler(const char *a_text);
extern const char*__stdcall Qt_kop32_event_handler(ts::__kop32_class *akop, const char *a_event, const char *a_code, const char *a_code_ex);
extern TApplication *Application;
extern QThread *Thread[8];
#endif
//---------------------------------------------------------------------------
#endif
