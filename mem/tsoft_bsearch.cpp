#include "tsoft_bsearch.h"

void* __cdecl ts::bsearch(const void *k, const void *base, size_t number_of_elements, size_t size_of_element,
			   int (*compare)(const void *k1, const void *k2))
 {
		 size_t istart = 0;
		 size_t imid, imid_times_size, icount = number_of_elements;
		 size_t size = size_of_element;
		 int compare_result;

		 while (istart < icount) {
				 imid = istart + ((icount - istart) >> 1); // >>1 faster than /2	
				 imid_times_size = imid * size;
				 compare_result = compare(k, &(((int8_t*)base)[imid_times_size]));
				 
				 if (compare_result < 0) icount = imid;
				 else 
				 if (compare_result > 0) istart = imid + 1;
				 else
					 return (void*)&(((int8_t*)base)[imid_times_size]);
		 }

		 return NULL;
}
 
