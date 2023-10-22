//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include <iostream>
#include <stdio.h>
#include <stdio.h>
#ifdef _WIN32
    #include <conio.h>
    #include <io.h>
#else
    #include <ncurses.h>
    #include <sys/io.h>
    #include <string.h>
#endif
#pragma hdrstop
//---------------------------------------------------------------------------
#include "stk_test.h"
//---------------------------------------------------------------------------
//#ifndef _USE_OLD_IOSTREAMS
//using namespace std;
//#endif
//---------------------------------------------------------------------------
#define TEST_INIT(t_size,r_times)\
stk::cpu::tsc_init();\
uint64_t TEST_SIZE = t_size;\
uint64_t RANDOM_TIME = 0;\
uint64_t RANDOM_TIMES = r_times;\
uint64_t test_time;\
uint64_t test_ticks;\
char *test_in  = stk::cstr::alloc(TEST_SIZE);\
char *test_out = stk::cstr::alloc(TEST_SIZE);\
double test_mspeed, test_cspeed;\
        for (uint64_t x = 0; x < TEST_SIZE; x++) {\
                if ((x % 65536)==0) { srand(::clock()); }\
                test_in[x] = (char)rand();\
                if (test_in[x]== 0 )  test_in[x] = 'Z';\
                else\
                if (test_in[x]=='A')  test_in[x] = 'Z';\
                }\
                test_in[TEST_SIZE -1] =  0;\
                test_in[TEST_SIZE>>1] = 'Z';
//---------------------------------------------------------------------------
#define TEST_EXIT()\
                        stk::cstr::free(test_out); stk::cstr::free(test_in);
//---------------------------------------------------------------------------
//double(1000 / (1024*1024));
//---------------------------------------------------------------------------
#define TEST(test_func)\
        stk::con::prints(#test_func"\n");\
        stk::con::prints("WORKING...\n");\
        test_time = stk::time::time_ms();\
        stk::cpu::tsc_start();\
        test_func;\
        stk::cpu::tsc_checkpoint();\
        test_time = stk::time::time_ms() - test_time;\
        stk::con::prints("TIME=%ldms\n",test_time);\
        if (test_time!=0) test_mspeed = double(double(1000*TEST_SIZE)/double(1024*1024)) / double(test_time);\
                else test_mspeed = 0;\
        stk::con::prints("reed=%ld mem speed %5.2lfMB/s\n",TEST_SIZE,double(test_mspeed));\
        stk::con::printr("#",(char)(test_mspeed*80)/1000);\
        stk::con::prints("\n");\
        test_ticks = stk::cpu::tsc_elapsed();\
        if (test_time!=0) test_cspeed = test_ticks / double(test_time);\
                else test_cspeed = 0;\
        stk::con::prints("%ld CPU ticks, %lld cpu ticks per milisecond\r\n\n",test_ticks,test_cspeed);
//---------------------------------------------------------------------------
#define TEST_RANDOM(func) TEST(for (RANDOM_TIME = 0; RANDOM_TIME < RANDOM_TIMES;  RANDOM_TIME++) { func } )
//---------------------------------------------------------------------------
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
    void stk::test::stk_atexit(void)
    {
    }
#else
    void __cdecl stk::test::stk_atexit(void)
    {
    #ifdef __BORLANDC__
    system("pause");
    #endif
    }
#endif
//---------------------------------------------------------------------------
//int stk::test::i asm("i");
//---------------------------------------------------------------------------

int __stdcall stk::test::start_test(int argc, char *argv[])
{
    int32_t argi, argl = 0;
    for (argi = 0; argi < argc; argi++) argl += stk::cstr::len(argv[argi]);
    char *args = new char[argl+1];
    for (argi = 0; argi < argc; argi++) stk::cstr::cat(args,argv[argi]);
    args[0] = '\0';

    ::atexit(&stk::test::stk_atexit);
    system("COLOR A");
    register int32_t r = 0;
    stk::con::set_console_handlers(&test_ConsoleGetchHandler, &test_ConsolePrintHandler,NULL);

    stk::con::prints("ALLOCATING VARIABLES...\n");
    TEST_INIT(200000000,10000);
    stk::con::prints("RAM buffer size %lldMB\n",TEST_SIZE/1024/1024);
    stk::con::prints("Number of chunks in random mode RANDOM_TIME < %lld\n",RANDOM_TIMES);
    stk::con::prints("RUNNING TESTS:\n");
    TEST(stk::cpu::cpu_test();)
    stk::con::prints("[  %d]\t",__LINE__);
    if (stk::hash::crc32::test_CRC32(1)) stk::con::prints("CRC32 OK\n");
    stk::con::prints("[  %d]\t",__LINE__);
    TEST(stk::hash::crc32::calc_CRC32_next(test_in,TEST_SIZE,0);)
    //stk::con::prints("[  %d]\t",__LINE__);
    //TEST(stk::hash::crc32::calc_CRC32_bitwise(test_in,TEST_SIZE,0);)
    stk::con::prints("[  %d]\t",__LINE__);
    TEST(stk::hash::adler32::calc_ADLER32(test_in,TEST_SIZE);)

    //stk::con::prints("[  %d]\t",__LINE__);
    //TEST(::strlen(test_in);)
    //TEST(stk::cstr::len(test_in);)
    //stk::con::prints("[  %d]\t",__LINE__);

    //TEST(::strchr(test_in,'\0');)
    //TEST(::strrchr(test_in,'A');)
    //TEST(stk::cstr::chr(test_in,'\0');)
    //TEST(stk::cstr::chrr(test_in,'A');)
    //TEST(stk::cstr::chr_sum(test_in,'A');)
    //TEST(memchr(test_in,'\0',TEST_SIZE);)
    //TEST_RANDOM(memchr(&test_in[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],'\0',TEST_SIZE/RANDOM_TIMES);)
    //TEST(stk::mem::chr(test_in,'\0',TEST_SIZE);)
    //TEST_RANDOM(stk::mem::chr(&test_in[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],'\0',TEST_SIZE/RANDOM_TIMES);)

    //stk::con::prints("[  %d]\t",__LINE__);
    //TEST(::strcpy(test_out,test_in);)
    //TEST(stk::cstr::mov(test_out,test_in);)

    //stk::con::prints("[  %d]\t",__LINE__);
    //TEST(stk::mem::set(test_out,'A',TEST_SIZE);)
    //TEST_RANDOM(stk::mem::set(&test_out[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],'A',TEST_SIZE/RANDOM_TIMES);)
    //TEST(stk::mem::set(test_out,'A',TEST_SIZE);)
    //TEST_RANDOM(stk::mem::set(&test_out[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],'A',TEST_SIZE/RANDOM_TIMES);)

    //stk::con::prints("[  %d]\t",__LINE__);
    //TEST(stk::mem::setex(test_out,(const void*)&"AA",(int8_t)2,(uint32_t)TEST_SIZE/2);)
    //TEST(stk::mem::setex(test_out,(const void*)&"AAAAAAAA",(int8_t)8,(uint32_t)TEST_SIZE/8);)
    //TEST(stk::mem::setex(test_out,(const void*)&"AAAAAAAAAAAAAAAA",(int8_t)16,(uint32_t)TEST_SIZE/16);)
    //TEST(stk::mem::setex(test_out,(const void*)&"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",(int8_t)64,(uint32_t)TEST_SIZE/64);)

    //stk::con::prints("[  %d]\t",__LINE__);
    TEST(memmove(test_out,test_in,TEST_SIZE);)
    TEST(stk::mem::mov(test_out,test_in,TEST_SIZE);)
    TEST_RANDOM(memmove(&test_out[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],&test_in[((RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES)],TEST_SIZE/RANDOM_TIMES);)
    TEST_RANDOM(stk::mem::mov(&test_out[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],&test_in[(RANDOM_TIME*TEST_SIZE)/RANDOM_TIMES],TEST_SIZE/RANDOM_TIMES);)

    //stk::con::prints("[  %d]\t",__LINE__);
    //TEST(r = stk::compression::compress_LZS(test_out,test_in,TEST_SIZE,1000));
    //TEST(stk::cipher::cript_MTF(test_in,TEST_SIZE););
    //TEST(r = stk::compression::compress_HUF(test_out,test_in,TEST_SIZE,1000));

    stk::con::prints("Thank's for help :)\n");
    TEST_EXIT()
    char text[100]; char *texti = "betweeen(a,b,c,d) begin { between_be } end";

    if (stk::cstr::between_cc(text,texti,'(',')')>=0)
        stk::con::prints("\"%s\"\n",text);
    else
        stk::con::prints("not found between\n");

    if (stk::cstr::between_words(text,texti,"begin","end")>=0)
        stk::con::prints("\"%s\"\n",text);
    else
        stk::con::prints("not found between\n");

delete args; return r;

}
//---------------------------------------------------------------------------




