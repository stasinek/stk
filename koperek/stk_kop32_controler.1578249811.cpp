//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_kop32_controler.h"
#include "stk_kop32_class.h"
#include "./../time/stk_time.h"
//---------------------------------------------------------------------------

__stdcall  stk::__kop32_class_progress_controler::__stat_group::__stat_group(void)
{
one = new __stat();
all = new __stat();
}
//---------------------------------------------------------------------------

__stdcall stk::__kop32_class_progress_controler::__stat_group::~__stat_group(void)
{
delete one;
delete all;
}
//---------------------------------------------------------------------------

void __stdcall stk::__kop32_class_progress_controler::__stat_group::reset(void)
{
one->reset();
all->reset();
}
//---------------------------------------------------------------------------

void __stdcall stk::__kop32_class_progress_controler::__stat_group::add_readed(uint32_t a_readed)
{
one->readed+=a_readed;
all->readed+=a_readed;
}
//---------------------------------------------------------------------------

 __stdcall stk::__kop32_class_progress_controler::__stat::__stat()
: readed(0), size(0)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
    reset();
}
//---------------------------------------------------------------------------

__stdcall stk::__kop32_class_progress_controler::__stat::~__stat()
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif

}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__kop32_class_progress_controler::__stat::percent(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        if (size!=0) return (int32_t)((100* readed) / size);
        else return 0;
}
//---------------------------------------------------------------------------

void   __stdcall stk::__kop32_class_progress_controler::__stat::reset(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        readed = size = 0;
}
//---------------------------------------------------------------------------

__stdcall  stk::__kop32_class_progress_controler::__kop32_class_progress_controler(stk::__kop32_class *aowner)
:	f_owner(aowner),
    f_timer_freezed(true),
    f_t1(0),f_t2(0),
    f_t (0),
    cancel(false), pause(false)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif

        src = new __stat_group();
        dst = new __stat_group();
        reset();
}
//---------------------------------------------------------------------------

__stdcall  stk::__kop32_class_progress_controler::~__kop32_class_progress_controler()
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        delete src;
        delete dst;
}
//---------------------------------------------------------------------------

void  __stdcall stk::__kop32_class_progress_controler::reset()
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        f_t1 = 0;
        f_t2 = 0;
        f_timer_freezed = true;
        cancel = false;
        src->reset(); dst->reset();
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__kop32_class_progress_controler::initialize_timer(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        f_timer_freezed = false;
        f_t1 = stk::time::time_ms();
        f_t2 = f_t1;
        return f_t1;
}
//---------------------------------------------------------------------------

void	__stdcall stk::__kop32_class_progress_controler::freeze_timer(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        f_timer_freezed = true;
}
//---------------------------------------------------------------------------

void	__stdcall stk::__kop32_class_progress_controler::resume_timer(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        int32_t d = f_t2-f_t1;
        f_t2 = stk::time::time_ms();
        f_t1 = f_t2-d;
        f_timer_freezed = false;
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__kop32_class_progress_controler::elapsed(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        if (f_timer_freezed==false) f_t2 = stk::time::time_ms();
        return f_t2 - f_t1;
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__kop32_class_progress_controler::actual_time(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        f_timer_freezed = false;
        f_t2 = stk::time::time_ms();
        return f_t2;
}
//---------------------------------------------------------------------------

void __stdcall stk::__kop32_class_progress_controler::set_owner(stk::__kop32_class *aowner)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        f_owner = aowner;
}
//---------------------------------------------------------------------------

stk::__kop32_class* __stdcall stk::__kop32_class_progress_controler::owner(void)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
        return f_owner;
}
//---------------------------------------------------------------------------

const char* __stdcall stk::__kop32_class_progress_controler::do_event(const char *a_event, const char *a_code, const char *a_code_ex)
{
#ifdef __DEBUG_KOP32_PROGRESS_CONTROLER__
__DEBUG_CALLED("")
#endif
if (!callback_event_handler) return default_callback_event_handler(this->owner(), a_event,a_code, a_code_ex);
else return callback_event_handler(this->owner(), a_event,a_code,a_code_ex);
}
//---------------------------------------------------------------------------
const char* __stdcall stk::__kop32_class_progress_controler::default_callback_event_handler(stk::__kop32_class*, const char*, const char*, const char*) {
return "OK";
}
//---------------------------------------------------------------------------

