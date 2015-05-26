#include "tsoft_bsearch.h"


void* __cdecl ts::bsearch(const void *key, const void *base, size_t num, size_t size,
			   int (*cmp)(const void *key, const void *elt))
 {
		 __int32 start = 0, end = num;
		 int result;

		 while (start < end) {
				 size_t mid = start + (end - start) / 2;

				 result = cmp(key, &(((__int8*)base)[mid * size]));
				 if (result < 0)
						 end = mid;
				 else if (result > 0)
						 start = mid + 1;
				 else
						 return (void*)&(((__int8*)base)[mid * size]);
		 }

		 return NULL;
}
 
