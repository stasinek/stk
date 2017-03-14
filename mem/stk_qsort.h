#include "../stk_main.h"

namespace stk {
void* __cdecl qsort(void *base, size_t number_of_elements, size_t size_of_element,
			   int (*compare)(const void *k1, const void *k2));
void* __cdecl isort(void *a, size_t number_of_elements, size_t size_of_element,
			   int (*compare)(const void *k1, const void *k2));
void* __cdecl ssort(void *a, size_t number_of_elements, size_t size_of_element,
			   int (*compare)(const void *k1, const void *k2));
}
