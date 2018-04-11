
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
#include "stk_kop32_API.h"

//---------------------------------------------------------------------------
#include "./../file/eno/stk_file_lzst_header.h"
#include "./../hash/stk_hash_ssc1.h"
#include "./../process_journal/stk_journal.h"
#include "./../io/stk_console.h"
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
stk::__kop32_class *kop32;
static stk::__kop32_class_progress_controler text_progress(kop32);

/*int32_t *hist_l_dict;
int32_t hist_l_dup_max;
int32_t *hist_l_brun;
int32_t hist_l_pattern_max;
int32_t *hist_l_pass;
int32_t hist_l_plain_max;
int32_t *hist_o_dict;
int32_t hist_o_dup_max;
int32_t *hist_e_brun;
int32_t hist_e_pattern_max;
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
        if (text_progress.src->all->readed == 0 || text_progress.src->one->size == 0 || text_progress.src->all->size == 0 || (text_progress.elapsed() == 0)) {
                stk::con::prints("\r[                  ] - <0%% 0kB/s>");
                return 1;
        }
//PROGRESS BAR
        nPos = (uint32_t)(10 *double(text_progress.src->all->readed) / double(text_progress.src->all->size));
        memmove(szPrb, "[                 ]", 12);
        memmove(szPrb, "[����������]", 1+nPos);
        stk::con::prints("\r                                                                                                                                            ");
        stk::con::prints("\r%s %.1lf%c <%.2lf%% ", szPrb, 100 *(double(text_progress.src->all->readed) / double(text_progress.src->all->size)),
                                                  szGfx[(nRot >> 2) &0x03L], 100 *(double(text_progress.dst->all->readed)
                                                                  / double(text_progress.src->all->readed)));
// SPEED MB/s
        if (kop32->options->operation == OPERATION_ENCODE)
                stk::con::prints("%.2lfkB/s> ", double(text_progress.src->all->readed) / double(text_progress.elapsed()) /
                                                          1024);
        if (kop32->options->operation == OPERATION_DECODE)
                stk::con::prints("%.2lfkB/s> ", double(text_progress.src->all->readed) / double(text_progress.elapsed()) /
                                                          1024);
// FILE NAME "?????.???"
//kop32->list->src_main_list->items[kop32->list->cur_i];
        stk::cstr::get_file_name(szTmp, kop32->list->src_main_list->items()->get_text(kop32->list->cur_i));
        if (stk::cstr::len(szTmp) > 30-3) {
                szTmp[30] = 0;
                strcat(szTmp, "...");
        }
        stk::con::prints("\"%s\"", szTmp);
// CHECK ESCAPE CODE if ESC was pressed and if so request STOP
        if (nRot == 0xFFL && kbhit() != 0) {
                if (stk::con::getch() == 0x00L) if (stk::con::getch() == 0x1BL) kop32->abort();
        }
// RETURN SUCCES
        return 1;
}
//---------------------------------------------------------------------------

const char* __stdcall classic_event_handler(stk::__kop32_class *a_kop32, const char *a_event, const char *a_code, const char *a_code_ex)
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

int __stdcall start_kop32_in_text_mode(char *args, stk::__kop32_class_progress_controler::__callback_event_handler *akop32eventhandler, const stk::con::__print_handler *aprinthandler,const stk::con::__getch_handler *agetchhandler)
{
                kop32 = new stk::__kop32_class;
                kop32->progress->callback_event_handler = akop32eventhandler;
                kop32->progress = &text_progress;

                stk::__journal journal;
        journal.create();
        char *c_temp = new char[1024];
        stk::cstr::mov(c_temp, "\0");
        //int32_t s = ::GetModuleFileNameA(NULL, c_temp, MAX_PATH);
        if (stk::cstr::len(args) <=8) {
                if (strstr(args, "-L") != NULL || strstr(args, "--LICENSE") != NULL ||
                                strstr(args, "/LICENSE") != NULL) {
                        stk::con::prints("============================================================================\n");
                        stk::con::prints("\n""This program at current version is FREE software"
                                                                  "This program is distributed in the HOPE that it will be USEFUL,\n"
                                                                  "but WITHOUT ANY WARRANTY;\n""MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.""n"
                                                                  "IMPORTANT!!!!");
                        stk::con::prints("----------------------------------------------------------------------------\n");
                        stk::con::prints("YOU USE AT YOUR OWN RISK. THE AUTHOR WILL NOT BE LIABLE FOR DATA LOSS,\n"
                                                                  "DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR\n"
                                                                  "MISUSING THIS SOFTWARE.\n");
                        stk::con::prints("----------------------------------------------------------------------------\n");
                        stk::con::prints("Press ANY KEY to EXIT \n");
                        stk::con::prints("============================================================================\n");
                        stk::con::getch();
                        return 0xFFFFFFFF;
                } else {
                        stk::con::prints("============================================================================\n");
                        stk::con::prints("ERROR1: incorrect program arguments\n");
                        stk::con::prints("----------------------------------------------------------------------------\n");
                        stk::con::prints("main.exe -operand[sub-options] <multiple infiles/dir ... > <one outfile/dir>\n");
                        stk::con::prints("-C --COPY \n");
                        stk::con::prints("-M --MOVE -> move or rename on the same partition\n");
                        stk::con::prints("-X --REMOVE\n");
                        stk::con::prints("\n");
                        stk::con::prints("-E --ENCODE[ LZS,HUF,ARI,MTF,BWT,CRC,ADLER,XOR,SXQ,STORE,DEFAULT,ULTRA ]\n");
                        stk::con::prints("-P --PASSWORD[ password ] for XOR and SXQ\n");
                        stk::con::prints("-I --DUP[ 256 ] -> set LZSS dict size: 256 < 65536\n");
                        stk::con::prints("-H --CHECKSUM[ CRC32 ] -> CRC32 or SSC1024\n");
                        stk::con::prints("-D --DECODE\n");
                        stk::con::prints("\n");
                        stk::con::prints("-L --LISTING source directories and files\n");
                        stk::con::prints("-A --ARGUMENTS[ special words: #dir #file #size #attr #modified_date]\n");
                        stk::con::prints("\n");
                        stk::con::prints("-B --BUFF[ kB ] -> file buffer size\n");
                        stk::con::prints("-F --CACHED to use MS Windows cache for COPY or ENCODE\n");
                        stk::con::prints("\n");
                        stk::con::prints("All these operations would be done with inclusive comma separated name mask:\n");
                        stk::con::prints("-K --MASK[ name.extension *.exe, *.bmp etc.]\n");
                        stk::con::prints("----------------------------------------------------------------------------\n");
                        stk::con::prints(" Press ANY KEY to exit, M for more.. sstsoft>> (c)2004-2013 sstsoft@wp.pl\n");
                        stk::con::prints("============================================================================\n");
                        stk::con::getch();
                        return 0xFFFFFFFF;
                }
        }
        stk::con::prints("============================================================================\n");
        stk::con::prints("press enter to continue\r\n");
        stk::con::prints("============================================================================\n");
        if (stk::con::getch()=='\r') {
                if (kop32->prepare_options(args))
                        if (kop32->prepare_list())
                                text_progress.initialize_timer();
                if (kop32->exec_all()) {
                        stk::con::prints("\r                                                                                                                                            ");
                        stk::con::prints("\n");
                        stk::con::prints("Finished!\n");
                        stk::con::prints("\n");
                }
                text_progress.freeze_timer();
        } else {
                stk::con::prints("canceled, please wait...\n");
        }
//-------------------------------------------------------------------
        double ratio = 0;
//-------------------------------------------------------------------
        if (text_progress.cancel == true) {
                stk::con::prints("============================================================================\n");
                stk::con::prints("\n ESC -> Operation canceled");
                stk::con::prints("============================================================================\n");
                stk::con::prints("\n");
        } else {
                stk::con::prints("size in                    :  %uB\n", (int32_t)text_progress.src->all->readed);
                if (kop32->options->operation == OPERATION_ENCODE
                                &&  text_progress.src->all->readed!=0) {
                        stk::con::prints("compression ratio  :  ");
                        ratio = double(text_progress.dst->all->readed) / double(text_progress.src->all->readed);
                        stk::con::prints("%.2lf%%, %.2lf bit/B vs 8 bit/B\n", 100 *(ratio), 8 *ratio);
                }
                stk::con::prints("size out              :  %uB\n", (int32_t)text_progress.dst->all->readed);
                stk::con::prints("============================================================================\n");
                stk::con::prints("Time                          :  %.2lfs\n", (double)(text_progress.elapsed()));
                if (text_progress.elapsed()!=0)
                        stk::con::prints("Averange speed      :  %.2lfkB/s\n",
                                                                  ((double)text_progress.src->all->readed / (double)(text_progress.elapsed())) / 1024);
                stk::con::prints("\n");
        }
        delete kop32;
        return 1;
}
//---------------------------------------------------------------------------

int __stdcall start_kop32_in_text_mode(char *args, const stk::con::__print_handler *aprinthandler, const stk::con::__getch_handler *agetchhandler)
{
        stk::con::print_handler = aprinthandler;
        stk::con::getch_handler = agetchhandler;
        return start_kop32_in_text_mode(args, &classic_event_handler, &stk::con::stdout_handler, &stk::con::stdinp_handler);
}
//---------------------------------------------------------------------------

int __stdcall start_kop32_in_text_mode(char *args)
{
        return start_kop32_in_text_mode(args, &stk::con::stdout_handler, &stk::con::stdinp_handler);
}
//---------------------------------------------------------------------------
/*
        if (stk::cstr::pos(args, 0, "..") > 0)
                {
                stk::text::sub(c_temp, args, 1, stk::cstr::strlen(args) - 2);
                stk::text::extract_file_path(c_temp, c_temp);
                stk::text::insert(c_temp, 0, "\"");
                stk::text::cat(c_temp, "\"");
                stk::cstr::mov(cmd_d, c_temp);
                }
        else
                {
                stk::cstr::mov(cmd_d, "\"");
                stk::text::cat(cmd_d, argv[argc - 1]);
                stk::text::cat(cmd_d, "\"");
                }

        if (strchr(argv[argc - 2], '\\'))
                {
                stk::cstr::mov(cmd_s, "\"");
                stk::text::cat(cmd_s, argv[argc - 2]);
                stk::text::cat(cmd_s, "\"");
                }
        else
                {
                getcwd(c_temp, 255);
                stk::cstr::mov(cmd_s, "\"");
                stk::text::cat(cmd_s, c_temp);
                stk::text::cat(cmd_s, "\\");
                stk::text::cat(cmd_s, argv[argc - 2]);
                stk::text::cat(cmd_s, "\"");
                }
        for (int i = 0; i < argc - 2; i++) stk::text::cat(cmd_a, argv[i]);
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
int64_t GetCPUClocks()
{
// Counter
int32_t low, high;
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
        int8_t bla[8], d[8];
        for (int x = 0; x < 8; x++)
                {
                bla[x] = x;
                d[x] = 0;
                }
        stk::memory32::bit_mov(d, 0, bla, 0, 8 *32);
        stk::con::prints("src\n");
        for (int i = 0; i < 8; i++)
        {stk::con::prints("%d\n", bla[i]);}

        stk::con::prints("dst\n");
        for (int i = 0; i < 8; i++)
        {stk::con::prints("%d\n", d[i]);}
// koniec test�w
*/
/*

        char *bar = new char[100+5];
        hist_l_dup_max = 1;
        hist_o_dup_max = 1;
        hist_l_pattern_max = 1;
        hist_e_pattern_max = 1;
        hist_l_plain_max = 1;
        int32_t i, x;
        hist_o_dict = new int32_t[DUP_OFFSET_MAX / 256+1];
        for (i = 0, x = 0; i <= DUP_OFFSET_MAX / 256 && hist_o_dup_max == 1; i++)
                hist_o_dict[i] = 0;
// for debuging,statistics
        hist_l_dict = new int32_t[DUP_LEN_MAX + 1];
        for (i = 0, x = 0; i <= DUP_LEN_MAX && hist_l_dup_max == 1; i++)
                hist_l_dict[i] = 0;
// for debuging,statistics
        hist_e_brun = new int32_t[4+1];
        for (i = 0, x = 0; i <= 4 && hist_e_pattern_max == 1; i++)
                hist_e_brun[i] = 0;
// for debuging,statistics
        hist_l_brun = new int32_t[PATTERN_LEN_MAX + 1];
        for (i = 0, x = 0; i <= PATTERN_LEN_MAX && hist_l_pattern_max == 1; i++)
                hist_l_brun[i] = 0;
// for debuging,statistics
        hist_l_pass = new int32_t[PLAIN_LEN_MAX + 1];
        for (i = 0, x = 0; i <= PLAIN_LEN_MAX && hist_l_plain_max == 1; i++)
                hist_l_pass[i] = 0;
// for debuging,statistics
//koniec statystyk


//STATISTICS FOR DEBUGING
        if (kop32->options.Operation == OPERATION_ENCODE || kop32->options.Operation == OPERATION_DECODE)
                {
//-------------------------------------------------------------------
                fprintf(journal.get_stream(),
                        "TOTAL BYTES IN:%d\nTOTAL BYTES OUT:%d\nRATIO:%.2lf%%, %.2lf bit/B\nTIME: %.2lfs\nSPEED %.2lfkB/s\n", (int32_t)text_progress.src->all->readed, (int32_t)text_progress.dst->all->readed, 100 *(ratio), 8 *ratio, (double)(text_progress.T2 - text_progress.T1 + 1) / 1000.0, (double)text_progress.src->all->readed / (double)(text_progress.T2 - text_progress.T1 + 1) / 1024);
//-------------------------------------------------------------------
                int32_t l, h;
//-------------------------------------------------------------------
                l = 0, h = 0;
                fprintf(journal.get_stream(), "GLOBALLY NORMAL DUP LENGHTS\n");
                for (i = 0, x = 0; i <= DUP_LEN_MAX; i++)
                        {
                        stk::cstr::mov(bar,
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
                        stk::cstr::mov(bar,
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
                        stk::cstr::mov(bar,
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
                        stk::cstr::mov(bar,
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
                        stk::cstr::mov(bar,
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

