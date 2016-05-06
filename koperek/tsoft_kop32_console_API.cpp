
/* This source has been formatted by an unregistered SourceFormatX */
/* If you want to remove this info, please register this shareware */
/* Please visit http://www.textrush.com to get more information */

// Test exe file for compression classes - very untidy code only used
// for testing compression functions quickly
//
// CONSOLE APP
//
//---------------------------------------------------------------------------
#include <winsock2.h>
#include "tsoft_kop32_API.h"

//---------------------------------------------------------------------------
#include "./../io/tsoft_file_lzss_header.h"
#include "./../hash/tsoft_hash_ssc1.h"
#include "./../process_journal/tsoft_journal.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------
#include <windows.h>
#include <wincon.h>
#include <stdio.h>
#include <conio.h>
#include <direct.h>
#include <time.h>
//#include <dos.h>
//#include <io.h>
#include <fcntl.h>
//---------------------------------------------------------------------------
// The main class
//---------------------------------------------------------------------------
ts::__kop32_class *kop32;
static ts::__kop32_class_progress_controler console_progress(kop32);

/*__int32 *hist_l_dict;
__int32 hist_l_dup_max;
__int32 *hist_l_brun;
__int32 hist_l_pattern_max;
__int32 *hist_l_pass;
__int32 hist_l_plain_max;
__int32 *hist_o_dict;
__int32 hist_o_dup_max;
__int32 *hist_e_brun;
__int32 hist_e_pattern_max;
*/

static uint32_t rdtsc_b;
uint32_t __stdcall c_start()
{
#ifdef BCC
        __asm {rdtsc             }
#else
        return 0;
#endif
}
uint32_t __stdcall c_end(uint32_t b)
{
#ifdef BCC
        __asm {rdtsc             }
        __asm { mov EBX,b}
        __asm { sub EAX,EBX  }
        __asm { sub EAX,0x0E }
#else
        return 1;
#endif
}
//---------------------------------------------------------------------------
// The callback function
//---------------------------------------------------------------------------
int __stdcall classic_monitor_proc()
{
        static char szPrb[13] = "[          ]";
        static UINT nPos = 0;
        static char szTmp[80];
        static char szGfx[] = "-\\|/";
                static UINT nRot = 0;
                nRot = (nRot+1) &0x0FL;
// PREVENT DIVISION BY '0'
        if (console_progress.src->all->readed == 0 || console_progress.src->one->size == 0 || console_progress.src->all->size == 0 || (console_progress.elapsed() == 0)) {
                ts::console::print_formated("\r[                  ] - <0%% 0kB/s>");
                return 1;
        }
//PROGRESS BAR
        nPos = (unsigned int)(10 *double(console_progress.src->all->readed) / double(console_progress.src->all->size));
        memmove(szPrb, "[                 ]", 12);
        memmove(szPrb, "[����������]", 1+nPos);
        ts::console::print_formated("\r                                                                                                                                            ");
        ts::console::print_formated("\r%s %.1lf%c <%.2lf%% ", szPrb, 100 *(double(console_progress.src->all->readed) / double(console_progress.src->all->size)),
                                                  szGfx[(nRot >> 2) &0x03L], 100 *(double(console_progress.dst->all->readed)
                                                                  / double(console_progress.src->all->readed)));
// SPEED MB/s
        if (kop32->options->operation == OPERATION_ENCODE)
                ts::console::print_formated("%.2lfkB/s> ", double(console_progress.src->all->readed) / double(console_progress.elapsed()) /
                                                          1024);
        if (kop32->options->operation == OPERATION_DECODE)
                ts::console::print_formated("%.2lfkB/s> ", double(console_progress.src->all->readed) / double(console_progress.elapsed()) /
                                                          1024);
// FILE NAME "?????.???"
//kop32->list->src_main_list->items[kop32->list->cur_i];
        ts::cstr::extract_file_name(szTmp, kop32->list->src_main_list->items()->get_text(kop32->list->cur_i));
        if (ts::cstr::len(szTmp) > 30-3) {
                szTmp[30] = 0;
                strcat(szTmp, "...");
        }
        ts::console::print_formated("\"%s\"", szTmp);
// CHECK ESCAPE CODE if ESC was pressed and if so request STOP
        if (nRot == 0xFFL && kbhit() != 0) {
                if (ts::console::getch() == 0x00L) if (ts::console::getch() == 0x1BL) kop32->abort();
        }
// RETURN SUCCES
        return 1;
}
//---------------------------------------------------------------------------

const char* __stdcall classic_event_handler(ts::__kop32_class *a_kop32, const char *a_event, const char *a_code, const char *a_code_ex)
{
/*      if (a_op &on_PROGRESSBAR)
                                Classic_monitor_proc();
        if (a_op &on_ASK_USER)
                return mrYes;
        if (a_op &on_REPLACE)
                return mrYes;
        if (a_op &on_ERROR)
                return mrYes;
        return mrYes;
        */
return NULL;
}
//---------------------------------------------------------------------------

int __stdcall start_kop32_in_text_mode(char *args, ts::__kop32_class_progress_controler::__callback_event_handler *akop32eventhandler, const ts::console::__print_handler *aprinthandler,const ts::console::__getch_handler *agetchhandler)
{
                kop32 = new ts::__kop32_class;
                kop32->progress->callback_event_handler = akop32eventhandler;
                kop32->progress = &console_progress;

                ts::__journal journal;
        journal.create();
        char *c_temp = new char[1024];
        ts::cstr::mov(c_temp, "\0");
        //__int32 s = ::GetModuleFileNameA(NULL, c_temp, MAX_PATH);
        if (ts::cstr::len(args) <=8) {
                if (strstr(args, "-L") != NULL || strstr(args, "--LICENSE") != NULL ||
                                strstr(args, "/LICENSE") != NULL) {
                        ts::console::print_formated("============================================================================\n");
                        ts::console::print_formated("\n""This program at current version is FREE software"
                                                                  "This program is distributed in the HOPE that it will be USEFUL,\n"
                                                                  "but WITHOUT ANY WARRANTY;\n""MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.""n"
                                                                  "IMPORTANT!!!!");
                        ts::console::print_formated("----------------------------------------------------------------------------\n");
                        ts::console::print_formated("YOU USE AT YOUR OWN RISK. THE AUTHOR WILL NOT BE LIABLE FOR DATA LOSS,\n"
                                                                  "DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR\n"
                                                                  "MISUSING THIS SOFTWARE.\n");
                        ts::console::print_formated("----------------------------------------------------------------------------\n");
                        ts::console::print_formated("Press ANY KEY to EXIT \n");
                        ts::console::print_formated("============================================================================\n");
                        ts::console::getch();
                        return 0xFFFFFFFF;
                } else {
                        ts::console::print_formated("============================================================================\n");
                        ts::console::print_formated("ERROR1: incorrect program arguments\n");
                        ts::console::print_formated("----------------------------------------------------------------------------\n");
                        ts::console::print_formated("main.exe -operand[sub-options] <multiple infiles/dir ... > <one outfile/dir>\n");
                        ts::console::print_formated("-C --COPY \n");
                        ts::console::print_formated("-M --MOVE -> move or rename on the same partition\n");
                        ts::console::print_formated("-X --REMOVE\n");
                        ts::console::print_formated("\n");
                        ts::console::print_formated("-E --ENCODE[ LZS,HUF,ARI,MTF,BWT,CRC,ADLER,XOR,SXQ,STORE,DEFAULT,ULTRA ]\n");
                        ts::console::print_formated("-P --PASSWORD[ password ] for XOR and SXQ\n");
                        ts::console::print_formated("-I --DUP[ 256 ] -> set LZSS dict size: 256 < 65536\n");
                        ts::console::print_formated("-H --CHECKSUM[ CRC32 ] -> CRC32 or SSC1024\n");
                        ts::console::print_formated("-D --DECODE\n");
                        ts::console::print_formated("\n");
                        ts::console::print_formated("-L --LISTING source directories and files\n");
                        ts::console::print_formated("-A --ARGUMENTS[ special words: #dir #file #size #attr #modified_date]\n");
                        ts::console::print_formated("\n");
                        ts::console::print_formated("-B --BUFF[ kB ] -> file buffer size\n");
                        ts::console::print_formated("-F --CACHED to use MS Windows cache for COPY or ENCODE\n");
                        ts::console::print_formated("\n");
                        ts::console::print_formated("All these operations would be done with inclusive comma separated name mask:\n");
                        ts::console::print_formated("-K --MASK[ name.extension *.exe, *.bmp etc.]\n");
                        ts::console::print_formated("----------------------------------------------------------------------------\n");
                        ts::console::print_formated(" Press ANY KEY to exit, M for more.. sstsoft>> (c)2004-2013 sstsoft@wp.pl\n");
                        ts::console::print_formated("============================================================================\n");
                        ts::console::getch();
                        return 0xFFFFFFFF;
                }
        }
        ts::console::print_formated("============================================================================\n");
        ts::console::print_formated("press enter to continue\r\n");
        ts::console::print_formated("============================================================================\n");
        if (ts::console::getch()=='\r') {
                if (kop32->prepare_options(args))
                        if (kop32->prepare_list())
                                console_progress.initialize_timer();
                if (kop32->exec_all()) {
                        ts::console::print_formated("\r                                                                                                                                            ");
                        ts::console::print_formated("\n");
                        ts::console::print_formated("Finished!\n");
                        ts::console::print_formated("\n");
                }
                console_progress.freeze_timer();
        } else {
                ts::console::print_formated("canceled, please wait...\n");
        }
//-------------------------------------------------------------------
        double ratio = 0;
//-------------------------------------------------------------------
        if (console_progress.cancel == true) {
                ts::console::print_formated("============================================================================\n");
                ts::console::print_formated("\n ESC -> Operation canceled");
                ts::console::print_formated("============================================================================\n");
                ts::console::print_formated("\n");
        } else {
                ts::console::print_formated("size in                    :  %uB\n", (__int32)console_progress.src->all->readed);
                if (kop32->options->operation == OPERATION_ENCODE
                                &&  console_progress.src->all->readed!=0) {
                        ts::console::print_formated("compression ratio  :  ");
                        ratio = double(console_progress.dst->all->readed) / double(console_progress.src->all->readed);
                        ts::console::print_formated("%.2lf%%, %.2lf bit/B vs 8 bit/B\n", 100 *(ratio), 8 *ratio);
                }
                ts::console::print_formated("size out              :  %uB\n", (__int32)console_progress.dst->all->readed);
                ts::console::print_formated("============================================================================\n");
                ts::console::print_formated("Time                          :  %.2lfs\n", (double)(console_progress.elapsed()));
                if (console_progress.elapsed()!=0)
                        ts::console::print_formated("Averange speed      :  %.2lfkB/s\n",
                                                                  ((double)console_progress.src->all->readed / (double)(console_progress.elapsed())) / 1024);
                ts::console::print_formated("\n");
        }
        delete kop32;
        return 1;
}
//---------------------------------------------------------------------------

int __stdcall start_kop32_in_text_mode(char *args, ts::console::__print_handler *aprinthandler,ts::console::__getch_handler *agetchhandler)
{
        ts::console::print_handler = aprinthandler;
        ts::console::getch_handler = agetchhandler;
        return start_kop32_in_text_mode(args, &classic_event_handler, &ts::console::stdout_handler, &ts::console::stdinp_handler);
}
//---------------------------------------------------------------------------

int __stdcall start_kop32_in_text_mode(char *args)
{
        return start_kop32_in_text_mode(args, &ts::console::stdout_handler, &ts::console::stdinp_handler);
}
//---------------------------------------------------------------------------
/*
        if (ts::cstr::pos(args, 0, "..") > 0)
                {
                ts::text::sub(c_temp, args, 1, ts::cstr::strlen(args) - 2);
                ts::text::extract_file_path(c_temp, c_temp);
                ts::text::insert(c_temp, 0, "\"");
                ts::text::cat(c_temp, "\"");
                ts::cstr::mov(cmd_d, c_temp);
                }
        else
                {
                ts::cstr::mov(cmd_d, "\"");
                ts::text::cat(cmd_d, argv[argc - 1]);
                ts::text::cat(cmd_d, "\"");
                }

        if (strchr(argv[argc - 2], '\\'))
                {
                ts::cstr::mov(cmd_s, "\"");
                ts::text::cat(cmd_s, argv[argc - 2]);
                ts::text::cat(cmd_s, "\"");
                }
        else
                {
                getcwd(c_temp, 255);
                ts::cstr::mov(cmd_s, "\"");
                ts::text::cat(cmd_s, c_temp);
                ts::text::cat(cmd_s, "\\");
                ts::text::cat(cmd_s, argv[argc - 2]);
                ts::text::cat(cmd_s, "\"");
                }
        for (int i = 0; i < argc - 2; i++) ts::text::cat(cmd_a, argv[i]);
*/




/*template <typename __T>
class  __callback {
private:
__T * mb_object;
void (__T::* mb_proc)();
__T * me_object;
void (__T::* me_proc)();
public:
__callback() { }
~__callback() { }
void Bind_break_handler(__T * __object, void (__T::* __proc)()) {
mb_object = __object;
mb_proc = __proc;
}
void Bind_error_handler(__T * __object, void (__T::* __proc)()) {
me_object = __object;
me_proc = __proc;
}
void execute_break_handler(int a,int b) {
if (mb_object && mb_proc)
(me_object->*me_proc)(a,b);
else f_break_event_handler(a,b);
}
void execute_error_handler(int a,int b) {
if (me_object && me_proc)
(me_object->*me_proc)(a,b);
else f_error_event_handler(a,b);
}
};
int main() {
callback<test>  c;
test            t1;
c.bind(& t1, & test::function);
c.execute();
return 0;
}*/
/*
//---------------------------------------------------------------------------
callback_monitor *mon;
int __stdcall Static_break_handler(int a, int b)
{
return  mon->Break_handler(a,b);
}
//---------------------------------------------------------------------------
int __stdcall Static_error_handler(int a, int b)
{
return  mon->error_handler(a,b);
}
*/
/*
#include <time.h>
#include <dos.h>
__int64 GetCPUClocks()
{
// Counter
__int32 low, high;
// Use RDTSC instruction to get clocks count
__asm push EAX
__asm push EDX
__emit__(0x0f);
__emit__(0x031); // RDTSC
__asm mov &low, EAX
__asm mov &high, EDX
__asm pop EDX
__asm pop EAX
// Return result
return 0;
 } */

/*#define CYCLES_BGN()\
//__asm {rdtsc           }\
//__asm {push EAX         }\
//#define CYCLES_END()\
//__asm {push EAX         }\
//__asm {rdtsc           }\
//__asm { mov ECX,EAX  }\
//__asm { pop EAX         }\
//__asm { mov EBX,EAX  }\
//__asm { pop EAX         }\
//__asm { sub ECX,EAX  }\
//__asm { sub ECX,0x0E }\
//__asm { mov EAX,EBX  }*/


/*/// testy bibliotek po zmianie wstawek assemblera x86 na czyste C
        __int8 bla[8], d[8];
        for (int x = 0; x < 8; x++)
                {
                bla[x] = x;
                d[x] = 0;
                }
        ts::memory32::bit_mov(d, 0, bla, 0, 8 *32);
        ts::console::print_formated("src\n");
        for (int i = 0; i < 8; i++)
        {ts::console::print_formated("%d\n", bla[i]);}

        ts::console::print_formated("dst\n");
        for (int i = 0; i < 8; i++)
        {ts::console::print_formated("%d\n", d[i]);}
// koniec test�w
*/
/*

        char *bar = new char[100+5];
        hist_l_dup_max = 1;
        hist_o_dup_max = 1;
        hist_l_pattern_max = 1;
        hist_e_pattern_max = 1;
        hist_l_plain_max = 1;
        __int32 i, x;
        hist_o_dict = new __int32[DUP_OFFSET_MAX / 256+1];
        for (i = 0, x = 0; i <= DUP_OFFSET_MAX / 256 && hist_o_dup_max == 1; i++)
                hist_o_dict[i] = 0;
// for debuging,statistics
        hist_l_dict = new __int32[DUP_LEN_MAX + 1];
        for (i = 0, x = 0; i <= DUP_LEN_MAX && hist_l_dup_max == 1; i++)
                hist_l_dict[i] = 0;
// for debuging,statistics
        hist_e_brun = new __int32[4+1];
        for (i = 0, x = 0; i <= 4 && hist_e_pattern_max == 1; i++)
                hist_e_brun[i] = 0;
// for debuging,statistics
        hist_l_brun = new __int32[PATTERN_LEN_MAX + 1];
        for (i = 0, x = 0; i <= PATTERN_LEN_MAX && hist_l_pattern_max == 1; i++)
                hist_l_brun[i] = 0;
// for debuging,statistics
        hist_l_pass = new __int32[PLAIN_LEN_MAX + 1];
        for (i = 0, x = 0; i <= PLAIN_LEN_MAX && hist_l_plain_max == 1; i++)
                hist_l_pass[i] = 0;
// for debuging,statistics
//koniec statystyk


//STATISTICS FOR DEBUGING
        if (kop32->options.Operation == OPERATION_ENCODE || kop32->options.Operation == OPERATION_DECODE)
                {
//-------------------------------------------------------------------
                fprintf(journal.get_stream(),
                        "TOTAL BYTES IN:%d\nTOTAL BYTES OUT:%d\nRATIO:%.2lf%%, %.2lf bit/B\nTIME: %.2lfs\nSPEED %.2lfkB/s\n", (__int32)console_progress.src->all->readed, (__int32)console_progress.dst->all->readed, 100 *(ratio), 8 *ratio, (double)(console_progress.T2 - console_progress.T1 + 1) / 1000.0, (double)console_progress.src->all->readed / (double)(console_progress.T2 - console_progress.T1 + 1) / 1024);
//-------------------------------------------------------------------
                __int32 l, h;
//-------------------------------------------------------------------
                l = 0, h = 0;
                fprintf(journal.get_stream(), "GLOBALLY NORMAL DUP LENGHTS\n");
                for (i = 0, x = 0; i <= DUP_LEN_MAX; i++)
                        {
                        ts::cstr::mov(bar,
                                "##############################################################################################################");
                        x = hist_l_dict[i];
                        x = x * 100;
                        x = x / hist_l_dup_max;
                        bar[x] = '\0';
                        fprintf(journal.get_stream(), "%3d=%7d=%s\n", i, hist_l_dict[i], bar);
                        if (i <= 64)
                                l += hist_l_dict[i];
                        else
                                h += hist_l_dict[i];
                        }
                fprintf(journal.get_stream(), "LENGTH<=64 = %d, LENGTH>64 = %d\n", l, h);
//-------------------------------------------------------------------
                l = 0, h = 0;
                fprintf(journal.get_stream(), "GLOBALLY NORMAL DUP OFFSETS/256\n");
                for (i = 0, x = 0; i <= DUP_OFFSET_2 >> 8; i++)
                        {
                        ts::cstr::mov(bar,
                                "##############################################################################################################");
                        x = hist_o_dict[i];
                        x = x * 100;
                        x = x / hist_o_dup_max;
                        bar[x] = '\0';
                        if (i <= 256)
                                fprintf(journal.get_stream(), "%5d=%7d=%s\n", 256 *i, hist_o_dict[i], bar);
                        if (i <= 256 >> 8)
                                l += hist_o_dict[i];
                        else
                                h += hist_o_dict[i];
                        }
                fprintf(journal.get_stream(), "OFFSET<=256 = %d, OFFSET>256 = %d\n", l, h);
//-------------------------------------------------------------------
                l = 0, h = 0;
                fprintf(journal.get_stream(), "GLOBALLY NORMAL PATTERN COUNTES\n");
                for (i = 0, x = 0; i <= PATTERN_LEN_MAX; i++)
                        {
                        ts::cstr::mov(bar,
                                "##############################################################################################################");
                        x = hist_l_brun[i];
                        x = x * 100;
                        x = x / hist_l_pattern_max;
                        bar[x] = '\0';
                        fprintf(journal.get_stream(), "%3d=%7d=%s\n", i, hist_l_brun[i], bar);
                        if (i <= 15)
                                l += hist_l_brun[i];
                        else
                                h += hist_l_brun[i];
                        }
                fprintf(journal.get_stream(), "COUNTE<=15 = %d, COUNTE>15 = %d\n", l, h);
//-------------------------------------------------------------------
                l = 0, h = 0;
                fprintf(journal.get_stream(), "GLOBALLY NORMAL PATTERN ELEMENT SIZES\n");
                for (i = 0, x = 0; i <= 4; i++)
                        {
                        ts::cstr::mov(bar,
                                "##############################################################################################################");
                        x = hist_e_brun[i];
                        x = x * 100;
                        x = x / hist_e_pattern_max;
                        bar[x] = '\0';
                        fprintf(journal.get_stream(), "%3d=%7d=%s\n", i, hist_e_brun[i], bar);
                        if (i <= 1)
                                l += hist_e_brun[i];
                        else
                                h += hist_e_brun[i];
                        }
                fprintf(journal.get_stream(), "ELSIZE<=1 = %d, ELSIZE>1 = %d\n", l, h);
//-------------------------------------------------------------------
                l = 0, h = 0;
                fprintf(journal.get_stream(), "GLOBALLY NORMAL PLAIN LENGTHS\n");
                for (i = 0, x = 0; i <= PLAIN_LEN_MAX; i++)
                        {
                        ts::cstr::mov(bar,
                                "##############################################################################################################");
                        x = hist_l_pass[i];
                        x = x * 100;
                        x = x / hist_l_plain_max;
                        bar[x] = '\0';
                        fprintf(journal.get_stream(), "%3d=%7d=%s\n", i, hist_l_pass[i], bar);
                        if (i <= 64)
                                l += hist_l_pass[i];
                        else
                                h += hist_l_pass[i];
                        }
                fprintf(journal.get_stream(), "LENGTH<=64 = %d, LENGTH>64 = %d\n", l, h);
//-------------------------------------------------------------------

        }
        delete hist_l_pass;
        delete hist_l_brun;
        delete hist_e_brun;
        delete hist_l_dict;
        delete hist_o_dict, bar;

        */

