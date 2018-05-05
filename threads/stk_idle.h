//---------------------------------------------------------------------------
#ifndef __stk_idle_h
#define __stk_idle_h
#include "../time/stk_time.h"
//---------------------------------------------------------------------------
namespace stk { namespace idle {
//---------------------------------------------------------------------------
struct __idle_t {
time_t prev;
time_t current;
};
extern STK_IMPEXP void __stdcall wait_init(struct __idle_t *a_idle);
extern STK_IMPEXP void __stdcall wait_auto(struct __idle_t *a_idle, double a_percent);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
