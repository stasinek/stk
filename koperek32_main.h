//---------------------------------------------------------------------------
#ifndef __Kop32_HDR__
#define __Kop32_HDR__
//---------------------------------------------------------------------------
extern "C" int __cdecl helloasm3(int par);
extern   int __stdcall helloasm4(void);
#include <winsock2.h>
#include <windows.h>
//---------------------------------------------------------------------------
#include "./koperek/tsoft_kop32_API.h"
#include "./koperek/tsoft_kop32_class.h"
#include "./koperek/tsoft_kop32_controler.h"
#include "./compression/tsoft_compression_API.h"
#include "./cipher/tsoft_cipher_API.h"
#include "./hash/tsoft_hash_API.h"
#include "./io/tsoft_file_lzss_header.h"
#include "./text/tsoft_cstr_manipulation.h"
#include "./process_journal/tsoft_journal.h"
#include "./io/tsoft_console.h"
#include "./threads/tsoft_threads.h"
#include "./time/tsoft_time.h"
#include "./cpu/tsoft_cpu.h"
#include "./mem/tsoft_mem32.h"
#include "__vector.h"
#include "./3d/__3Dvector.h"
#include "__tree.h"
//---------------------------------------------------------------------------
// extern int main();
// extern void asm_function(void);
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
