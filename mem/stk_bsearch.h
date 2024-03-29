//---------------------------------------------------------------------------
#ifndef __stk_bsearch_h__
#define __stk_bsearch_h__
//---------------------------------------------------------------------------
#include "../stk_main.h"
//---------------------------------------------------------------------------
namespace stk {
void* __cdecl bsearch(const void *k, const void *base, size_t number_of_elements, size_t size_of_element,
			   int (*compare)(const void *k1, const void *k2));
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

