//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "koperek32_main.h"
#include "./tsoft_MAIN.h"
//---------------------------------------------------------------------------
#include <stdio.h>
#include <io.h>
#ifndef _USE_OLD_IOSTREAMS
using namespace std;
#endif

#define TESTUJ_INIT(tsize,rtimes)\
int t;\
__int32 TESTUJ_SIZE = tsize;\
__int32 RANDOM_TIMES = rtimes;\
char *in  = ts::cstr::alloc(TESTUJ_SIZE);\
char *out = ts::cstr::alloc(TESTUJ_SIZE);\
double speed,f;\
double old_time;\
	for (__int32 x = 0; x < TESTUJ_SIZE; x++) {\
		if (x%10000==0) { srand(::clock()); }\
		in[x] = (char)rand();\
		if (in[x]== 0 )  in[x] = 'x';\
		else\
		if (in[x]=='a')  in[x] = 'z';\
		else\
		if (in[x]=='A')  in[x] = 'Z';\
		}\
		in[TESTUJ_SIZE-1] = '\0';\
		in[0] = 'a';

#define TESTUJ_EXIT()\
			ts::cstr::free(out); ts::cstr::free(in);

#define TESTUJ(func) ts::cpu::tsc_start();\
	old_time = ::timeGetTime();\
	func;\
	printf(#func);\
	old_time = ::timeGetTime() - old_time;\
	printf("\nczas=%fms\n",old_time);\
	if (old_time!=0) speed = double((TESTUJ_SIZE /1000000) * 1000) / double(old_time);\
		else speed = 0;\
	printf("in=%u, out=%u, %fMB/s\n",TESTUJ_SIZE,r,speed);\
	ts::cpu::tsc_checkpoint();\
	for (f = 0; f < speed;f+=50) printf("#");\
	printf("\n");\
	printf("%llu.cpu ticks\r\n\n",ts::cpu::tsc_elapsed());
#define TESTUJ_RANDOM(func) TESTUJ(for (t = 0; t < 1000000;  t++) { func } )


/*void main_CreateConsole()
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

void __stdcall main_ConsolePrintHandler(const char *a_text)
{
fputs(a_text,stdout);
}
//---------------------------------------------------------------------------

char __stdcall main_ConsoleGetchHandler(void)
{
return (char)getchar();
}
//---------------------------------------------------------------------------

void __cdecl main_before_exit(void)
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

int main(int argc, char *argv[])
{
atexit(&main_before_exit);
register int r = 0;
	i = 0;
	std::cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
	std::cout << "i=" << i << endl;
	asm(".intel_syntax noprefix\n mov eax,13\n mov [i],eax\n");
	asm(".att_syntax");
	std::cout << "i=" << i << endl;

	i = 0;
	std::cout << "i=" << i << endl;
	asm(".intel_syntax noprefix\n mov eax,14\n mov %[named_var],eax\n" : [named_var] "=g" (i));
	asm(".att_syntax");
	std::cout << "i=" << i << endl;
//	return 0;

#ifdef QT_GUI
	return Qt_app_main(argc,argv);
#else
	ts::__kop32::set_console_handlers(&main_ConsoleGetchHandler, &main_ConsolePrintHandler,NULL);
	char *args = new char[4096];
	args[0] = '\0';

	ts::cpu::cpu_print_info();
if (ts::hash::crc32::test_CRC32(1)) printf("CRC32 OK\n");

TESTUJ_INIT(100000000,1000000)
printf("Rozmiar buforow %dMB\n",TESTUJ_SIZE/1024/1024);
printf("Ilosc wykonan w trybie \"random\" t < %d\n",RANDOM_TIMES);
TESTUJ(ts::hash::crc32::calc_CRC32(in,TESTUJ_SIZE,0);)
TESTUJ(ts::hash::crc32::calc_CRC32_bitwise(in,TESTUJ_SIZE,0);)
TESTUJ(ts::hash::adler32::calc_ADLER32(in,TESTUJ_SIZE);)
printf("wbudowane libc.str------------------------------\n");
TESTUJ(::strlen(in);)
TESTUJ(::strchr(in,'\0');)
TESTUJ(::strrchr(in,'a');)
TESTUJ(::strcpy(out,in);)
printf("cstr---------------------------------------------------------------\n");
TESTUJ(ts::cstr::len(in);)
TESTUJ(ts::cstr::chr(in,'\0');)
TESTUJ(ts::cstr::chrr(in,'a');)
TESTUJ(ts::cstr::chr_sum(in,'a');)
TESTUJ(ts::cstr::mov(out,in);)
printf("wbudowane libc.mem-------------------------------------------------\n");
TESTUJ(memchr(in,'\0',TESTUJ_SIZE);)
TESTUJ_RANDOM(memchr(in+t*(TESTUJ_SIZE/RANDOM_TIMES),'\0',TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(memset(out,'A',TESTUJ_SIZE);)
TESTUJ_RANDOM(memset(out+t*(TESTUJ_SIZE/RANDOM_TIMES),'A',TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(memcpy(out,in,TESTUJ_SIZE);)
TESTUJ_RANDOM(memcpy(out+t*(TESTUJ_SIZE/RANDOM_TIMES),in,TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(memmove(out,in,TESTUJ_SIZE);)
TESTUJ_RANDOM(memmove(out+t*(TESTUJ_SIZE/RANDOM_TIMES),in+t*(TESTUJ_SIZE/RANDOM_TIMES),TESTUJ_SIZE/RANDOM_TIMES);)
printf("mem32--------------------------------------------------------------\n");
TESTUJ(ts::mem32::chr(in,'\0',TESTUJ_SIZE);)
TESTUJ_RANDOM(ts::mem32::chr(in+t*(TESTUJ_SIZE/RANDOM_TIMES),'\0',TESTUJ_SIZE/RANDOM_TIMES);)
//TESTUJ(ts::mem32::chrr(in,'a',TESTUJ_SIZE);)
//TESTUJ_RANDOM(ts::mem32::chrr(in+t*(TESTUJ_SIZE/RANDOM_TIMES),'a',TESTUJ_SIZE/RANDOM_TIMES);)
TESTUJ(ts::mem32::mov(out,in,TESTUJ_SIZE);)
TESTUJ_RANDOM(ts::mem32::mov(out+t*(TESTUJ_SIZE/RANDOM_TIMES),in+t*(TESTUJ_SIZE/RANDOM_TIMES),TESTUJ_SIZE/RANDOM_TIMES);)
//TESTUJ(ts::mem32::set(out,'A',TESTUJ_SIZE);)
//TESTUJ_RANDOM(ts::mem32::set(out+t*(TESTUJ_SIZE/RANDOM_TIMES),'A',TESTUJ_SIZE/RANDOM_TIMES);)

TESTUJ(ts::mem32::setex(out,&"AA",2,TESTUJ_SIZE/2);)
TESTUJ(ts::mem32::setex(out,&"AAAAAAAA",8,TESTUJ_SIZE/8);)
TESTUJ(ts::mem32::setex(out,&"AAAAAAAAAAAAAAAA",16,TESTUJ_SIZE/16);)
TESTUJ(ts::mem32::setex(out,&"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",64,TESTUJ_SIZE/64);)
printf("Serdecznie dziekuje za pomoc :)\nkliknij prawym myszy,\"zaznacz wszystko\" i wciœnij ENTER,wklej w odpowiedzi na forum\n");
TESTUJ_EXIT()

//TESTUJ(r = ts::compression::compress_LZS(out,in,TESTUJ_SIZE,1000));
//TESTUJ(ts::cipher::cript_MTF(in,TESTUJ_SIZE););
//TESTUJ(r = ts::compression::compress_HUF(out,in,TESTUJ_SIZE,1000));
		/*
		ts::__fixed_queue_class <int> c(5);
		__int32 ch;
		for (int x = 0; x< 10;x++) {
		c.push_back(x);
		printf("count %u",c.count());
		}
		for (x = 0; x< 10;x++) {
		c.pop_front();
		printf("count %u",c.count());
		}
		 */
#endif
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


#ifdef QT_GUI

#include <ui_tmain_mini_form.h>
#include <ui_treplace_form.h>
#include <ui_twizard_form.h>
#include <ui_treplace_rename_form.h>
#include <ui_tmain_form.h>
#include <ui_tabout_form.h>
#include <ui_tfinished_form.h>
#include <ui_tjournal_form.h>
#include <ui_tpassword_form.h>
#include <ui_tlister_form.h>
#include <ui_tselect_form.h>
#include <ui_twizard_form.h>
#include <ui_tconsole_form.h>

#include <QMessagebox>
//---------------------------------------------------------------------------

extern void __stdcall Qt_app_main(const int argc, const char *argv[])
{
	Application = new TApplication(argc, argv);
	//-----------------------------------------------
	for (int t = 0; t < 8; t++) Thread[t] = new QThread(Application);
	Application->ConsoleWorker->moveToThread(Thread[0]);
//	QThread::connect(Thread[0],SIGNAL(started()),Application->ConsoleWorker,SLOT(exec()));
//	QObject::connect(Application->ConsoleWorker, SIGNAL(executed()), Application->Wizard_form, SLOT(hide()));
//	QObject::connect(Application->ConsoleWorker, SIGNAL(executed()), Application->Main_form, SLOT(exec()));
	r = Application->start();
	for (int t = 0; t < 8; t++) delete Thread[t];
	delete Application;

}
//---------------------------------------------------------------------------

char __stdcall Qt_console_getch_event_handler(void)
{
	return	'\r';
}
//---------------------------------------------------------------------------

void __stdcall Qt_console_print_event_handler(const char *atext)
{
QString old_item("");

 if (Application->Console_form->ui->listWidget->count()>0) old_item = Application->Console_form->ui->listWidget->item(Application->Console_form->ui->listWidget->count()-1)->text();
else Application->Console_form->ui->listWidget->addItem("");
register  int ol = old_item.length(), in = 0, nl = ts::cstr::len(atext);
  bool old_item_must_be_synced = true;

for (in = 0;in < nl;in++) {
	   old_item_must_be_synced = true;
   if (atext[in]=='\n' || ol>80) {
	   Application->Console_form->ui->listWidget->item(Application->Console_form->ui->listWidget->count()-1)->setText(old_item);
	   Application->Console_form->ui->listWidget->addItem("");
	   old_item = ""; ol = 0;
	   old_item_must_be_synced = 0;
	   continue; }
   if (atext[in]=='\t') old_item += "		";
   if (atext[in]=='\r') old_item  = "";
   old_item += atext[in];
   ol++;
	}
 if (old_item_must_be_synced) Application->Console_form->ui->listWidget->item(Application->Console_form->ui->listWidget->count()-1)->setText(old_item);
}
//---------------------------------------------------------------------------

void __stdcall Qt_console_error_event_handler(const char *atext)
{
// todo redirect errors to file
}
//---------------------------------------------------------------------------

const char*__stdcall Qt_kop32_event_handler(ts::__kop32_class *akop, const char *a_event, const char *a_code, const char *a_code_ex)
{
register char *ret = "OK";

 if (ts::cstr::cmpex(a_event,"PREPARED_EVENT")==0)
	{
		Application->Main_form->show();
		ret = "OK";
	}
	else
 if (ts::cstr::cmpex(a_event,"PROGRESS_EVENT")==0)
	{
		Application->Main_form->ui->progressBar_1->setValue((akop->progress->src->one->percent() + akop->progress->src->one->percent())/2);
		Application->Main_mini_form->ui->progressBar_1->setValue(Application->Main_form->ui->progressBar_1->value());
		Application->Main_form->ui->progressBar_2->setValue((akop->progress->dst->all->percent() + akop->progress->dst->all->percent())/2);
		Application->Main_mini_form->ui->progressBar_2->setValue(Application->Main_form->ui->progressBar_2->value());
	}
	else
 if (ts::cstr::cmpex(a_event,"ASK_USER_EVENT")==0)
	{
		//Application->Replace_form->exec();
		ret = "YES";
	}
	else
 if (ts::cstr::cmpex(a_event,"SHOW_LICENSE_EVENT")==0)
	{
		Application->About_form->exec();
	}
	else
 if (ts::cstr::cmpex(a_event,"SHOW_COMMAND_ARGS_EVENT")==0)
	{
		Application->help_me();
	}
	else
 if (ts::cstr::cmpex(a_event,"ASK_USER_REPLACE_EVENT")==0)
	{
		int userret = Application->Replace_form->exec();

		if (userret==QMessageBox::Yes) ret = "YES";
		else
		if (userret==QMessageBox::YesToAll) ret = "YESTOALL";
		else
		if (userret==QMessageBox::No)  ret = "NO";
		else
		if (userret==QMessageBox::NoToAll) ret = "NOTOALL";
		else
			ret = "CANCEL";

	}
	else
 if (ts::cstr::cmpex(a_event,"FINISHED_EVENT")==0)
	{
		ret = "OK";
		Application->Finished = true;
		emit Application->before_quit();
	}
	else
 if (ts::cstr::cmpex(a_event,"CANCELED_EVENT")==0)
	{
		ret = "OK";
		Application->Finished = true;
		emit Application->before_quit();
	}
	else
 if (ts::cstr::cmpex(a_event,"ERROR_EVENT")==0)
	{
		ret = "OK";
	}
	else
	{
		ret = "OK";
	}
if (Application->Console_form->isVisible())
ts::__kop32::console_event_handler(akop,a_event,a_code,a_code_ex);
return  ret;
}
//---------------------------------------------------------------------------
#endif


//		#pragma omp parallel for
//		for (int i = 0; i < argc; i++)  {
//				 ts::cstr::cat(args," \""); ts::cstr::cat(args,argv[i]);
//				 ts::cstr::cat(args,"\" ");
//		}
//		printf("Argts:\n");
//		ts::console::print_formated("%s\n",args);
//		ts::__kop32::start((char*)args,&ts::__kop32::console_event_handler);
//		ts::console::print_formated("\r\n");
//		char s[100],d[100];
//		ts::cstr::mov(s,"To jest test movmmx o d³ugoœci kilkudziesiêciu znaków aby zobaczyæ czy dzia³a poprawnie czy nie....");
//		ts::mem32::mmxmov(d,s,100);
//		ts::console::print_formated("d=%s\n", d);
//	uint64_t end =ts::cpu::tsc_end();
//	printf("MMX=%d\r\n",ts::cpu::cpuid_have_mmx());
//	printf("%I64d.end, %I64d.elapsed\r\n",end, ts::cpu::tsc_was());
//  printf("helloasm2=%d",helloasm2());
//  helloasm(0);
/*
__stasmex(eax,text,
		mov eax,%[num];
		)
__stasmex_end
*/
		/*		for (int i = 0; i <= __STASM_MAX_PARARELL;i++)
				{
					printf("\n");
					for (int c = 0; c < 4; c++)
						{mx86[i][c] = 10*i + c;
						printf("mx86[%d][%d]=%d\t",i,c,mx86[i][c]);
						}
					printf("\n");
					//sx86 = mx86[i];
					for (int c = 0; c < 4; c++)
						{
						printf("sx86[%d]=%d\t\t",c,sx86[c]);
						}
					printf("\n");
				}
		*/
/*#ifndef __BORLANDC__
__TINIT(x86,esi,end);
	printf("\nsx86=%d, sx86[0]=%d\n",(int)sx86,(int)sx86[0]);
	printf("\nsx86=%d, sx86[0]=%d\n",(int)sx86,(int)sx86[0]);
	printf("\ntrash=%d\n",(int)trash);
		__stasm(eax,
code,
		mov eax,_trash\n
		add eax, 777\n
		mov _trash,eax\n
		mov esi, mesi\n
		mov esi, mesi[3]\n
		mov esi, mesi[2]\n
		mov esi, mesi[1]\n
		mov esi, mesi[0]\n
		mov esi, sesi\n
		mov esi, sesi[3]\n
		mov esi, sesi[2]\n
		mov esi, sesi[1]\n
		mov esi, sesi[0]\n
		mov esi, sx86\n
		mov esi, sx86[3]\n
		mov esi, sx86[2]\n
		mov esi, sx86[1]\n
		mov esi, sx86[0]\n
		)
	printf("\ntrash=%d\n\n",(int)trash);

sesi[0] = 1;
	__stasm(eax,ebx,ecx,edx,esi,code,
			lea eax,sesi;
			push eax

		)
		PRINT_UI(sesi[4]);
#endif

	ts::cpu::tsc_overhead();
	ts::cpu::tsc_start();
	int num = 0;
	int podzielnik = 7;
	int maxi = 20000;
	int tmp = 0;
	for (int i = 0; i<= maxi; i++)
	{ tmp = i;
		while (tmp>0) { tmp-=podzielnik; if (tmp==0) num++;}
	}
	setlocale(LC_ALL,"");
	printf("w zakresie do %d jest %d liczb podzielnych na %d\n",maxi,num,podzielnik);
	printf("czas=%dms\n",(int)(::timeGetTime() - time));
	ts::cpu::tsc_checkpoint();
	printf("%'lld.cpu ticks elapsed\r\n",ts::cpu::tsc_was());
//ts::compression::test();
//TESTUJ(cop = ts::compression::compress_ARI(out,in,TESTUJ_SIZE,1000));
*/

