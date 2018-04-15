//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
//
// CONSOLE APP
//
//---------------------------------------------------------------------------
#include "stk_kop32_API.h"
//---------------------------------------------------------------------------
#include "./../process_journal/stk_journal.h"
#include "./../hash/stk_hash_ssc1.h"
#include "./../file/eno/stk_file_lzst_header.h"
#include "./../io/stk_console.h"
#include "./../text/stk_cstr_utils.h"
//---------------------------------------------------------------------------
#include <wincon.h>
#include <direct.h>
#include <time.h>
#include <fcntl.h>
//---------------------------------------------------------------------------
// The main class
//---------------------------------------------------------------------------
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

//---------------------------------------------------------------------------
// The callback function
//---------------------------------------------------------------------------
int32_t __stdcall stk::__kop32::text_monitor_proc(stk::__kop32_class *akop)
{
#ifdef __DEBUG_KOP32_CONSOLE__
__DEBUG_FUNC_CALLED("text_monitor_proc(this*)")
#endif
                static char szPrb[13] = "[          ]";
                static UINT nPos = 0;
                static char szTmp[80];
                static char szGfx[] = "-\\|/";
                static UINT nRot = 0;
                nRot = (nRot+1) &0x0FL;
// PREVENT DIVISION BY '0'
                if (akop->progress->src->all->readed == 0 || akop->progress->src->one->size == 0 || akop->progress->src->all->size == 0 || (akop->progress->elapsed() == 0)) {
                                stk::con::prints("\r[                             ] - <0%% 0kB/s>");
                                return 1;
                }
//PROGRESS BAR
                nPos = (int)(10 *double(akop->progress->src->all->readed) / double(akop->progress->src->all->size));
                memmove(szPrb, "[                                 ]", 12);
                memmove(szPrb, "[**********]", 1+nPos);

                stk::con::prints("\r%79s"," ");
                stk::con::prints("\r%s %.1lf%c <%.2lf%% ", szPrb, 100 *(double(akop->progress->src->all->readed) / double(akop->progress->src->all->size)),
                                                                                                  szGfx[(nRot >> 2) &0x03L], 100 *(double(akop->progress->dst->all->readed)
                                                                                                                                  / double(akop->progress->src->all->readed)));
// SPEED MB/s
                if (akop->options->operation == OPERATION_ENCODE)
                                stk::con::prints("%.2lfkB/s> ", double(akop->progress->src->all->readed) / double(akop->progress->elapsed()) /
                                                                                                                  1024);
                if (akop->options->operation == OPERATION_DECODE)
                                stk::con::prints("%.2lfkB/s> ", double(akop->progress->src->all->readed) / double(akop->progress->elapsed()) /
                                                                                                                  1024);
// FILE NAME "?????.???"
                stk::cstr::get_file_name(szTmp, akop->list->src_main_list->items()->get_text(akop->list->cur_i));
                if (stk::cstr::len(szTmp) > 30-3) {
                                szTmp[30] = 0;
                                strcat(szTmp, "...");
                }
                stk::con::prints("\"%s\"", szTmp);
// CHECK ESCAPE CODE if ESC was pressed and if so request STOP
                if (nRot == 0xFFL && kbhit() != 0) {
                                if (stk::con::getch() == 0x00L) if (stk::con::getch() == 0x1BL) akop->abort();
                }
// RETURN SUCCES
                return 1;
}
//---------------------------------------------------------------------------

const char *__stdcall stk::__kop32::text_event_handler(stk::__kop32_class *akop,const char *aevent, const char *acode, const char *acode_ex)
{
#ifdef __DEBUG_KOP32_CONSOLE__
__DEBUG_FUNC_CALLED("console_event_handler(...)")
#endif
                if (stk::cstr::compare(aevent,"PROGRESS")==0)
                {
                                text_monitor_proc(akop);
                                return "OK";
                }
                else
                if (stk::cstr::compare(aevent,"ASK_USER")==0)
                {
                                stk::con::printr("==========",8);
                                stk::con::prints("press enter to continue\r\n");
                                stk::con::printr("==========",8);
                                register  char c =  stk::con::getch();
                                if (c=='\r' || c == '\n') return "OK\0";
                                else return "CANCEL\0";
                }
                else
                if (stk::cstr::compare(aevent,"SHOW_LICENSE")==0)
                {
                                stk::con::print("\r\n");
                                stk::con::printr("==========",8);
                                stk::con::prints("This program at current version is FREE software");
                                stk::con::prints("This program is distributed in the HOPE that it will be USEFUL,\n");
                                stk::con::prints("but WITHOUT ANY WARRANTY;\n""MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE\n");
                                stk::con::prints("IMPORTANT!!!!");
                                stk::con::printr("----------",8);
                                stk::con::prints("YOU USE AT YOUR OWN RISK. THE AUTHOR WILL NOT BE LIABLE FOR DATA LOSS,\n");
                                stk::con::prints("DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR\n");
                                stk::con::prints("MISUSING THIS SOFTWARE.\n");
                                stk::con::printr("----------",8);
                                stk::con::prints("Press ANY KEY to EXIT \n");
                                stk::con::printr("==========",8);
                                register  char c =  stk::con::getch();
                                if (c=='\r' || c == '\n') return "OK\0";
                                else return "CANCEL\0";
                }
                else
                if (stk::cstr::compare(aevent,"SHOW_COMMAND_ARGS")==0)
                {
                                stk::con::print("\r\n");
                                stk::con::printr("==========",8);
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
                                stk::con::printr("----------",8);
                                stk::con::prints(" Press ANY KEY to exit, M for more.. sstsoft>> (c)2004-2013 sstsoft@wp.pl\n");
                                stk::con::printr("==========",8);
                                register  char c =  stk::con::getch();
                                if (c=='\r' || c == '\n') return "OK";
                                else return "CANCEL";
                }
                else
                if (stk::cstr::compare(aevent,"ASK_USER_REPLACE")==0)
                {
                                return "YES\0";
                }
                else
                if (stk::cstr::compare(aevent,"FINISHED")==0)
                {
                                double ratio;
                                stk::con::print("\r\n");
                                stk::con::print("\r\n");
                                stk::con::prints("Operation finished!\r\n");
                                stk::con::printr("==========",8);
                                stk::con::prints("Size in\t\t\t%uB\r\n",(int32_t)akop->progress->src->all->readed);
                                if (akop->options->operation == OPERATION_ENCODE
                                &&  akop->progress->src->all->readed!=0) {
                                                stk::con::prints("Compression ratio\t");
                                                ratio = double(akop->progress->dst->all->readed) / double(akop->progress->src->all->readed);
                                                stk::con::prints("%.2lf%%, %.2lf bit/B vs 8 bit/B\r\n", 100 *(ratio), 8 *ratio);
                                }
                                stk::con::prints("Size out\t\t%uB\r\n", (int32_t)akop->progress->dst->all->readed);
                                stk::con::printr("----------",8);
                                stk::con::prints("Time\t\t\t%.2lfs\r\n", (double)(akop->progress->elapsed()));
                                if (akop->progress->elapsed()!=0)
                                                stk::con::prints("Averange speed\t\t%.2lfkB/s\n",
                                                ((double)akop->progress->src->all->readed / (double)(akop->progress->elapsed())) / 1024);
                                stk::con::printr("==========",8);
                                stk::con::print("\r\n");
                                return "OK\0";
                }
                else
                if (stk::cstr::compare(aevent,"CANCELED")==0)
                {
                                stk::con::print("\r\n");
                                stk::con::printr("==========",8);
                                stk::con::prints("operation canceled, please wait...\n");
                                stk::con::printr("==========",8);
                                stk::con::prints("\n");
                                return "OK\0";
                }
                else
                if (stk::cstr::compare(aevent,"ERROR")==0)
                {
                                stk::con::prints("%s,%s",acode,acode_ex);
                                return "OK";
                }
                                return "OK";

}
//---------------------------------------------------------------------------
void __stdcall stk::__kop32::set_text_handlers(char (__stdcall *a_getch_event_handler)(void),void (__stdcall *a_print_event_handler)(const char*),void (__stdcall *a_error_event_handler)(const char*))
{
#ifdef __DEBUG_KOP32_CONSOLE__
__DEBUG_FUNC_CALLED("set_console_handlers()")
#endif
stk::con::set_console_handlers(a_getch_event_handler,a_print_event_handler,a_error_event_handler);
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__kop32::start_in_text_mode(const char *args)
{
#ifdef __DEBUG_KOP32_CONSOLE__
__DEBUG_FUNC_CALLED("start_in_console_mode()")
#endif
                int32_t ret = start(args,&stk::__kop32::text_event_handler);
                 return ret;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__kop32::start(const char *args, const char* (__stdcall *a_kop32_event_handler)(stk::__kop32_class*,const char*,const char*,const char*))
{
#ifdef __DEBUG_KOP32_CONSOLE__
__DEBUG_FUNC_CALLED("start()")
#endif
                stk::__kop32_class *kop32 = new stk::__kop32_class;
                if (a_kop32_event_handler!=NULL) kop32->progress->callback_event_handler = a_kop32_event_handler;
                stk::__journal *journal = new stk::__journal();
                journal->create();
                char *c_temp = new char[1024];
                stk::cstr::mov(c_temp, "\0");
                //int32_t s = ::GetModuleFileNameA(NULL, c_temp, MAX_PATH);
                if (stk::cstr::len(args) <=8)
                {
                                if (strstr(args, "-L") != NULL || strstr(args, "--LICENSE") != NULL || strstr(args, "/LICENSE") != NULL)
                                {
                                kop32->do_event("SHOW_LICENSE","SHORT","EN");
                                return 0xFFFFFFFFL;
                                }
                                else
                                {
                                kop32->do_event("SHOW_COMMAND_ARGS","SHORT","EN");
                                return 0xFFFFFFFFL;
                                }
                }
                int ret = 0;
                if (stk::cstr::compare((char*)kop32->do_event("ASK_USER",0,0),(char*)"OK")==0)
                {
                                if (kop32->prepare_options(args))
                                if (kop32->prepare_list()) ret = kop32->exec_all();
                }
                else
                if (ret)
                {
                                kop32->do_event("FINISHED","","");
                }
                else
                {
                                kop32->do_event("CANCELED","","");
                }
//-------------------------------------------------------------------
                double ratio;
//-------------------------------------------------------------------
                delete kop32;
                return 1;
}
//---------------------------------------------------------------------------
/*
                if (stk::cstr::pos(args, 0, "..") > 0)
                                {
                                stk::text::sub(c_temp, args, 1, stk::cstr::len(args) - 2);
                                stk::cstr::extract_file_path(c_temp, c_temp);
                                stk::cstr::insert(c_temp, 0, "\"");
                                stk::cstr::cat(c_temp, "\"");
                                stk::cstr::mov(cmd_d, c_temp);
                                }
                else
                                {
                                stk::cstr::mov(cmd_d, "\"");
                                stk::cstr::cat(cmd_d, argv[argc - 1]);
                                stk::cstr::cat(cmd_d, "\"");
                                }

                if (strchr(argv[argc - 2], '\\'))
                                {
                                stk::cstr::mov(cmd_s, "\"");
                                stk::cstr::cat(cmd_s, argv[argc - 2]);
                                stk::cstr::cat(cmd_s, "\"");
                                }
                else
                                {
                                getcwd(c_temp, 255);
                                stk::cstr::mov(cmd_s, "\"");
                                stk::cstr::cat(cmd_s, c_temp);
                                stk::cstr::cat(cmd_s, "\\");
                                stk::cstr::cat(cmd_s, argv[argc - 2]);
                                stk::cstr::cat(cmd_s, "\"");
                                }
                for (int i = 0; i < argc - 2; i++) stk::cstr::cat(cmd_a, argv[i]);
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
__emit__(0x0fL);
__emit__(0x031L); // RDTSC
__asm mov &low, EAX
__asm mov &high, EDX
__asm pop EDX
__asm pop EAX
// Return result
return 0;
 } */

/*#define CYCLES_BGN()\
//__asm {tsc_            }\
//__asm {push EAX         }\
//#define CYCLES_END()\
//__asm {push EAX         }\
//__asm {tsc_            }\
//__asm { mov ECX,EAX  }\
//__asm { pop EAX         }\
//__asm { mov EBX,EAX  }\
//__asm { pop EAX         }\
//__asm { sub ECX,EAX  }\
//__asm { sub ECX,0x0EL }\
//__asm { mov EAX,EBX  }*/


/*/// testy bibliotek po zmianie wstawek assemblera x86 na czyste C
                int8_t bla[8], d[8];
                for (int x = 0; x < 8; x++)
                                {
                                bla[x] = x;
                                d[x] = 0;
                                }
                stk::mem::bit_mov(d, 0, bla, 0, 8 *32);
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
                                                "TOTAL BYTES IN:%d\nTOTAL BYTES OUT:%d\nRATIO:%.2lf%%, %.2lf bit/B\nTIME: %.2lfs\nSPEED %.2lfkB/s\n", (int32_t)kop32->progress->src->all->readed, (int32_t)kop32->progress->dst->all->readed, 100 *(ratio), 8 *ratio, (double)(kop32->progress->T2 - kop32->progress->T1 + 1) / 1000.0, (double)kop32->progress->src->all->readed / (double)(kop32->progress->T2 - kop32->progress->T1 + 1) / 1024);
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

