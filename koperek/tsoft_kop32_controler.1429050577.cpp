//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_kop32_controler.h"
//---------------------------------------------------------------------------
static uint32_t rdtsc_b;
uint32_t __stdcall rtdsc_start()
{
#ifdef BCC
		__asm {rdtsc		 }
#else
		return 0;
#endif
}
uint32_t __stdcall rtdsc_end(uint32_t b)
{
#ifdef BCC
		__asm {rdtsc		 }
		__asm { mov EBX,b}
		__asm { sub EAX,EBX  }
		__asm { sub EAX,0x0E }
#else
		return 1;
#endif
}
//---------------------------------------------------------------------------

 __stdcall ts::__kop32_class_progress_controler_group::__kop32_class_progress_controler_group()
{
				reset();
}
//---------------------------------------------------------------------------

__stdcall ts::__kop32_class_progress_controler_group::~__kop32_class_progress_controler_group()
{

}
//---------------------------------------------------------------------------

__int8 __stdcall ts::__kop32_class_progress_controler_group::percent(void)
{
		if (size!=0) return (__int8)((100* readed) / size);
		else return 0;
}
//---------------------------------------------------------------------------

void   __stdcall ts::__kop32_class_progress_controler_group::reset(void)
{
		readed = 0; size = 0;
}
//---------------------------------------------------------------------------

__stdcall  ts::__kop32_class_progress_controler:: __kop32_class_progress_controler()
{
		dst_one = new __kop32_class_progress_controler_group();
		dst_all = new __kop32_class_progress_controler_group();
		src_one = new __kop32_class_progress_controler_group();
		src_all = new __kop32_class_progress_controler_group();
	
	reset();
}
//---------------------------------------------------------------------------

__stdcall  ts::__kop32_class_progress_controler::~__kop32_class_progress_controler()
{
	delete src_one;
	delete src_all;
	delete dst_one;
	delete dst_all;
}
//---------------------------------------------------------------------------

void  __stdcall ts::__kop32_class_progress_controler::reset()
{
	f_t1 = 0;
	f_t2 = 0;
	f_timer_freezed = true;
		cancel = false;
	dst_one->reset();
	dst_all->reset();
	src_one->reset();
	src_all->reset();
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class_progress_controler::initialize_timer(void)
{
	f_timer_freezed = false;
	f_t1 = time(&f_t);
	f_t2 = f_t1;
	return f_t1;
}
//---------------------------------------------------------------------------

void	__stdcall ts::__kop32_class_progress_controler::freeze_timer(void)
{
	f_timer_freezed = true;
}
//---------------------------------------------------------------------------

void	__stdcall ts::__kop32_class_progress_controler::resume_timer(void)
{
	__int32 d = f_t2-f_t1;
	f_t2 = time(&f_t);
	f_t1 = f_t2-d;
	f_timer_freezed = false;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class_progress_controler::elapsed(void)
{
	if (f_timer_freezed==false) f_t2 = time(&f_t);
	return f_t2 - f_t1;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class_progress_controler::actual_time(void)
{
	f_timer_freezed = false;
	f_t2 = time(&f_t);
	return f_t2;
}
//---------------------------------------------------------------------------
