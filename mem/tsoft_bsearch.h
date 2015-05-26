#include "../tsoft_main.h"

namespace ts {
extern void* __cdecl bsearch(const void *key, const void *base, size_t num, size_t size,
			   int (*cmp)(const void *key, const void *elt));
}
