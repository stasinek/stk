
                                  //---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_test.h"
//---------------------------------------------------------------------------
#include <stdio.h>
#include <io.h>
#ifndef _USE_OLD_IOSTREAMS
using namespace std;
#endif

#define TEST_INIT(t_size,r_times)\
uint64_t t;\
uint64_t TEST_SIZE = t_size;\
uint64_t RANDOM_TIMES = r_times;\
uint64_t time;\
char *in  = ts::cstr::alloc(TEST_SIZE);\
char *out = ts::cstr::alloc(TEST_SIZE);\
double speed,s;\
        for (int64_t x = 0; x < TEST_SIZE; x++) {\
                if ((x % 65536)==0) { srand(::clock()); }\
                in[x] = (char)rand();\
                if (in[x]== 0 )  in[x] = 'x';\
                else\
                if (in[x]=='a')  in[x] = 'z';\
                else\
                if (in[x]=='A')  in[x] = 'Z';\
                }\
                in[TEST_SIZE -1] = '\0';\
                in[TEST_SIZE>>1] = 'a';

#define TEST_EXIT()\
                        ts::cstr::free(out); ts::cstr::free(in);

//double(1000 / (1024*1024));

#define TEST(func) ts::cpu::tsc_start();\
        time = ts::time::time_ms();\
        ts::con::prints(#func"\n");\
        ts::con::prints("WORKING...\n");\
        func;\
        time = ts::time::time_ms() - time;\
        ts::con::prints("TIME=%lldms\n",time);\
        if (time!=0) speed = double(double(1000*TEST_SIZE)/double(1024*1024)) / double(time);\
                else speed = 0;\
        ts::con::prints("in=%lld, out=%d, %5.2lfMB/s\n",TEST_SIZE,r,double(speed));\
        ts::cpu::tsc_checkpoint();\
        ts::con::printr("#",(char)(speed*80)/1000);\
        ts::con::prints("\n");\
        ts::con::prints("%lld.CPU ticks\r\n\n",ts::cpu::tsc_elapsed());

#define TEST_RANDOM(func) TEST(for (t = 0; t < RANDOM_TIMES;  t++) { func } )

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
void atexit(void)
#else
void __cdecl ts::test::atexit(void)
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

int __stdcall ts::test::main(int argc, char *argv[])
{
::atexit(&ts::test::atexit);
system("COLOR A");
register int32_t r = 0;
ts::con::set_console_handlers(&test_ConsoleGetchHandler, &test_ConsolePrintHandler,NULL);
char *args = new char[4096];
args[0] = '\0';

ts::con::prints("ALLOCATING VARIABLES...\n");
TEST_INIT(1000000000,10000);
ts::con::prints("RAM buffer size %lldMB\n",TEST_SIZE/1024/1024);
ts::con::prints("Number of chunks in random mode t < %lld\n",RANDOM_TIMES);
ts::con::prints("RUNNING TESTS:\n");
TEST(ts::cpu::cpu_test();)
ts::con::prints("[  %d]\t",__LINE__);
if (ts::hash::crc32::test_CRC32(1)) ts::con::prints("CRC32 OK\n");
ts::con::prints("[  %d]\t",__LINE__);
TEST(ts::hash::crc32::calc_CRC32(in,TEST_SIZE,0);)
ts::con::prints("[  %d]\t",__LINE__);
TEST(ts::hash::crc32::calc_CRC32_bitwise(in,TEST_SIZE,0);)
ts::con::prints("[  %d]\t",__LINE__);
TEST(ts::hash::adler32::calc_ADLER32(in,TEST_SIZE);)

//ts::con::prints("[  %d]\t",__LINE__);
//TEST(::strlen(in);)
//TEST(ts::cstr::len(in);)
//ts::con::prints("[  %d]\t",__LINE__);

//TEST(::strchr(in,'\0');)
//TEST(::strrchr(in,'a');)
//TEST(ts::cstr::chr(in,'\0');)
//TEST(ts::cstr::chrr(in,'a');)
//TEST(ts::cstr::chr_sum(in,'a');)
//TEST(memchr(in,'\0',TEST_SIZE);)
//TEST_RANDOM(memchr(&in[(t*TEST_SIZE)/RANDOM_TIMES],'\0',TEST_SIZE/RANDOM_TIMES);)
//TEST(ts::mem32::chr(in,'\0',TEST_SIZE);)
//TEST_RANDOM(ts::mem32::chr(&in[(t*TEST_SIZE)/RANDOM_TIMES],'\0',TEST_SIZE/RANDOM_TIMES);)

//ts::con::prints("[  %d]\t",__LINE__);
//TEST(::strcpy(out,in);)
//TEST(ts::cstr::mov(out,in);)

//ts::con::prints("[  %d]\t",__LINE__);
//TEST(memset(out,'A',TEST_SIZE);)
//TEST_RANDOM(memset(&out[(t*TEST_SIZE)/RANDOM_TIMES],'A',TEST_SIZE/RANDOM_TIMES);)
//TEST(ts::mem32::set(out,'A',TEST_SIZE);)
//TEST_RANDOM(ts::mem32::set(&out[(t*TEST_SIZE)/RANDOM_TIMES],'A',TEST_SIZE/RANDOM_TIMES);)

//ts::con::prints("[  %d]\t",__LINE__);
//TEST(ts::mem32::setex(out,(const void*)&"AA",(int8_t)2,(uint32_t)TEST_SIZE/2);)
//TEST(ts::mem32::setex(out,(const void*)&"AAAAAAAA",(int8_t)8,(uint32_t)TEST_SIZE/8);)
//TEST(ts::mem32::setex(out,(const void*)&"AAAAAAAAAAAAAAAA",(int8_t)16,(uint32_t)TEST_SIZE/16);)
//TEST(ts::mem32::setex(out,(const void*)&"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",(int8_t)64,(uint32_t)TEST_SIZE/64);)

//ts::con::prints("[  %d]\t",__LINE__);
apex::autotune();
TEST(apex_memmove(out,in,TEST_SIZE);)
TEST(memmove(out,in,TEST_SIZE);)
TEST(ts::mem32::mov(out,in,TEST_SIZE);)
TEST_RANDOM(apex_memmove(&out[(t*TEST_SIZE)/RANDOM_TIMES],&in[((t*TEST_SIZE)/RANDOM_TIMES)],TEST_SIZE/RANDOM_TIMES);)
TEST_RANDOM(memmove(&out[(t*TEST_SIZE)/RANDOM_TIMES],&in[((t*TEST_SIZE)/RANDOM_TIMES)],TEST_SIZE/RANDOM_TIMES);)
TEST_RANDOM(ts::mem32::mov(&out[(t*TEST_SIZE)/RANDOM_TIMES],&in[(t*TEST_SIZE)/RANDOM_TIMES],TEST_SIZE/RANDOM_TIMES);)

//ts::con::prints("[  %d]\t",__LINE__);
//TEST(r = ts::compression::compress_LZS(out,in,TEST_SIZE,1000));
//TEST(ts::cipher::cript_MTF(in,TEST_SIZE););
//TEST(r = ts::compression::compress_HUF(out,in,TEST_SIZE,1000));

ts::con::prints("Serdecznie dziekuje za pomoc :)\n");
TEST_EXIT()
                char text[100], *texti = "betweeen(a,b,c,d) begin { between_be } end";
                if (ts::cstr::between_cc(text,texti,'(',')')>=0)
                ts::con::prints("\"%s\"\n",text);
                else ts::con::prints("not found between\n");
                if (ts::cstr::between_words(text,texti,"begin","end")>=0)
                ts::con::prints("\"%s\"\n",text);
                else ts::con::prints("not found between\n");
delete args;
return r;
}
//---------------------------------------------------------------------------




