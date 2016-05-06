
                                  //---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_test.h"
//---------------------------------------------------------------------------
#include <stdio.h>
#include <io.h>
#ifndef _USE_OLD_IOSTREAMS
using namespace std;
#endif

#define TESTUJ_INIT(t_size,r_times)\
__int64 t;\
__int64 TESTUJ_SIZE = t_size;\
__int64 RANDOM_TIMES = r_times;\
__int64 time;\
char *in  = ts::cstr::alloc(TESTUJ_SIZE);\
char *out = ts::cstr::alloc(TESTUJ_SIZE);\
double speed,s;\
        for (__int64 x = 0; x < TESTUJ_SIZE; x++) {\
                if ((x % 65536)==0) { srand(::clock()); }\
                in[x] = (char)rand();\
                if (in[x]== 0 )  in[x] = 'x';\
                else\
                if (in[x]=='a')  in[x] = 'z';\
                else\
                if (in[x]=='A')  in[x] = 'Z';\
                }\
                in[TESTUJ_SIZE-1] = '\0';\
                in[TESTUJ_SIZE/2] = 'a';

#define TESTUJ_EXIT()\
                        ts::cstr::free(out); ts::cstr::free(in);

//double(1000 / (1024*1024));

#define TESTUJ(func) ts::cpu::tsc_start();\
        time = ts::time::clock_ms();\
        printf(#func"\n");\
        printf("WYKONUJE...\n");\
        func;\
        time = ts::time::clock_ms() - time;\
        printf("CZAS=%lldms\n",time);\
        if (time!=0) speed = double(double(1000*TESTUJ_SIZE)/double(1024*1024)) / double(time);\
                else speed = 0;\
        printf("in=%lld, out=%d, %5.2lfMB/s\n",TESTUJ_SIZE,r,double(speed));\
        ts::cpu::tsc_checkpoint();\
        for (s = 0; s < speed;s+=1000/80) printf("#");\
        printf("\n");\
        printf("%lld.cpu ticks\r\n\n",ts::cpu::tsc_elapsed());

#define TESTUJ_RANDOM(func) TESTUJ(for (t = 0; t < RANDOM_TIMES;  t++) { func } )

/*void test_CreateConsole()
{
if (AllocConsole()) {
int ifd = _open_osfhandle((intptr_t)GetStdHandle(STD_INPUT_HANDLE), _O_TEXT);
*stdin  = *fdopen(ifd, "r");
setvbuf( stdin, NULL, _IONBF, 0 );
// redirect unbuffered STDIN to the console
int ofd = _open_osfhandle((intptr_t)GetStdHandle(STD_OUTPUT_HANDLE), _O_TEXT);
*stdout = *fdopen(ofd, "w");
 setvbuf( stdout, NULL, _IONBF, 0 );
// redirect unbuffered STOUT to the console
int efd = _open_osfhandle((intptr_t)GetStdHandle(STD_ERROR_HANDLE), _O_TEXT);
*stderr = *fdopen(efd, "w");
setvbuf( stderr, NULL, _IONBF, 0 );
// redirect unbuffered STERR to the console
}
}*/
//---------------------------------------------------------------------------

void __stdcall test_ConsolePrintHandler(const char *a_text)
{
fputs(a_text,stdout);
}
//---------------------------------------------------------------------------

char __stdcall test_ConsoleGetchHandler(void)
{
return (char)getchar();
}
//---------------------------------------------------------------------------

#ifdef __WATCOMC__
void test_before_exit(void)
#else
void __cdecl test_before_exit(void)
#endif
{
#ifdef __BORLANDC__
system("pause");
#endif
}
//---------------------------------------------------------------------------
int i asm("i");
#include <iostream>
#include <stdio.h>
#include <conio.h>

int __stdcall ts::test::test_main(int argc, char *argv[])
{
atexit(&test_before_exit);
system("COLOR A");
register __int32 r = 0;
ts::console::set_console_handlers(&test_ConsoleGetchHandler, &test_ConsolePrintHandler,NULL);
char *args = new char[4096];
args[0] = '\0';

printf("Inicjuje zmienne...\n");
TESTUJ_INIT(100000000,10000)
printf("Rozmiar buforow %lldMB\n",TESTUJ_SIZE/1024/1024);
printf("Ilosc wykonan w trybie \"random\" t < %lld\n",RANDOM_TIMES);
printf("TESTY:\n");

printf("[  %d]\t",__LINE__);
TESTUJ(ts::cpu::cpu_test();)

if (ts::hash::crc32::test_CRC32(1)) printf("CRC32 OK\n");

printf("[  %d]\t",__LINE__);
TESTUJ(ts::hash::crc32::calc_CRC32(in,TESTUJ_SIZE,0);)
printf("[  %d]\t",__LINE__);
TESTUJ(ts::hash::crc32::calc_CRC32_bitwise(in,TESTUJ_SIZE,0);)
printf("[  %d]\t",__LINE__);
TESTUJ(ts::hash::adler32::calc_ADLER32(in,TESTUJ_SIZE);)
printf("[  %d]\t",__LINE__);
TESTUJ(::strlen(in);)
TESTUJ(ts::cstr::len(in);)
printf("[  %d]\t",__LINE__);
TESTUJ(::strchr(in,'\0');)
TESTUJ(ts::cstr::chr(in,'\0');)
TESTUJ(::strrchr(in,'a');)
TESTUJ(ts::cstr::chrr(in,'a');)
TESTUJ(ts::cstr::chr_sum(in,'a');)
TESTUJ(memchr(in,'\0',TESTUJ_SIZE);)
TESTUJ_RANDOM(memchr(&in[(t*TESTUJ_SIZE)/RANDOM_TIMES],'\0',TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(ts::mem32::chr(in,'\0',TESTUJ_SIZE);)
TESTUJ_RANDOM(ts::mem32::chr(&in[(t*TESTUJ_SIZE)/RANDOM_TIMES],'\0',TESTUJ_SIZE/RANDOM_TIMES);)
printf("[  %d]\t",__LINE__);
TESTUJ(::strcpy(out,in);)
TESTUJ(ts::cstr::mov(out,in);)
printf("[  %d]\t",__LINE__);
TESTUJ(memset(out,'A',TESTUJ_SIZE);)
TESTUJ_RANDOM(memset(&out[(t*TESTUJ_SIZE)/RANDOM_TIMES],'A',TESTUJ_SIZE/RANDOM_TIMES);)
//TESTUJ(ts::mem32::set(out,'A',TESTUJ_SIZE);)
//TESTUJ_RANDOM(ts::mem32::set(&out[(t*TESTUJ_SIZE)/RANDOM_TIMES],'A',TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(ts::mem32::setex(out,&"AA",2,TESTUJ_SIZE/2);)
TESTUJ(ts::mem32::setex(out,&"AAAAAAAA",8,TESTUJ_SIZE/8);)
TESTUJ(ts::mem32::setex(out,&"AAAAAAAAAAAAAAAA",16,TESTUJ_SIZE/16);)
TESTUJ(ts::mem32::setex(out,&"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",64,TESTUJ_SIZE/64);)
TESTUJ(memcpy(out,in,TESTUJ_SIZE);)
TESTUJ_RANDOM(memcpy(&out[(t*TESTUJ_SIZE)/RANDOM_TIMES],in,TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(memmove(out,in,TESTUJ_SIZE);)
TESTUJ_RANDOM(memmove(&out[(t*TESTUJ_SIZE)/RANDOM_TIMES],&in[((t*TESTUJ_SIZE)/RANDOM_TIMES)],TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(ts::mem32::mov(out,in,TESTUJ_SIZE);)
TESTUJ_RANDOM(ts::mem32::mov(&out[(t*TESTUJ_SIZE)/RANDOM_TIMES],&in[(t*TESTUJ_SIZE)/RANDOM_TIMES],TESTUJ_SIZE/RANDOM_TIMES);)
//TESTUJ(r = ts::compression::compress_LZS(out,in,TESTUJ_SIZE,1000));
//TESTUJ(ts::cipher::cript_MTF(in,TESTUJ_SIZE););
//TESTUJ(r = ts::compression::compress_HUF(out,in,TESTUJ_SIZE,1000));

printf("Serdecznie dziekuje za pomoc :)\n");
TESTUJ_EXIT()
                char text[100], *texti = "test () beginbeginendend";
                if (ts::cstr::between(text,texti,'(',')')>=0)
                printf("\"%s\"\n",text);
                else printf("not found between\n");
                if (ts::cstr::between_words(text,texti,"begin","end")>=0)
                printf("\"%s\"\n",text);
                else printf("not found between\n");
delete args;
return r;
}
//---------------------------------------------------------------------------




