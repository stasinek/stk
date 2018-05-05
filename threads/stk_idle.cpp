//---------------------------------------------------------------------------
#include "stk_idle.h"
//#pragma hdrstop
//#pragma package(smart_init)
//---------------------------------------------------------------------------
void __stdcall stk::idle::wait_init(struct __idle_t *a_idle)
{
::time(&a_idle->prev);
}
//---------------------------------------------------------------------------

void __stdcall stk::idle::wait_auto(struct __idle_t *a_idle, double a_percent)
{
::time(&a_idle->current);
stk::time::wait_ms((a_percent * difftime(a_idle->prev,a_idle->current)) / 100);
a_idle->prev = a_idle->current;
}
//---------------------------------------------------------------------------
