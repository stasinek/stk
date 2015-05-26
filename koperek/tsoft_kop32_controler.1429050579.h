//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_controler_H__
#define __tsoft_kop32_controler_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include <time.h>
//---------------------------------------------------------------------------
namespace ts {

//---------------------------------------------------------------------------
class __kop32_class_progress_controler_group {
public:
						__stdcall  __kop32_class_progress_controler_group();
						__stdcall ~__kop32_class_progress_controler_group();
		void		__stdcall reset(void);
		__int64 readed, size;
		__int8  __stdcall percent(void);
};

class  __kop32_class_progress_controler {
private:
	__int32 f_t1, f_t2;
	time_t f_t;
	bool f_timer_freezed;
public:
	__stdcall  __kop32_class_progress_controler();
	__stdcall ~__kop32_class_progress_controler();
		__kop32_class_progress_controler_group *src_one, *src_all, *dst_one, *dst_all;
	void	__stdcall reset();
		__int32 __stdcall initialize_timer(void);
		void	__stdcall freeze_timer(void);
		void	__stdcall resume_timer(void);
		__int32 __stdcall elapsed(void);
		__int32 __stdcall actual_time(void);
		bool cancel; bool Pause;
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

