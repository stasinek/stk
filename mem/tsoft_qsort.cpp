#include "tsoft_mem32.h"
#include "./../io/tsoft_console.h"
#include "tsoft_qsort.h"


void* __cdecl ts::qsort(void *base, size_t number_of_elements, size_t size_of_element,
			   int (*compare)(const void *k1, const void *k2))
 {
	ts::con::prints("This function doesn't work for now, it is just a prototype");
	assert(0); return NULL;

		 size_t istart = 0;
		 size_t imid, imid_times_size, icount = number_of_elements;
		 size_t size = size_of_element;
		 size_t compare_result;

		 while (istart < icount) {
				 imid = istart + ((icount - istart) >> 1); // >>1 faster than /2
				 imid_times_size = imid * size;
				 compare_result = compare(&(((__int8*)base)[0]), &(((__int8*)base)[imid_times_size]));

				 if (compare_result < 0) icount = imid;
				 else
				 if (compare_result > 0) istart = imid + 1;
				 else
					 return (void*)&(((__int8*)base)[imid_times_size]);
		 }

		 return NULL;
}


void* __cdecl ts::isort(void *a, size_t number_of_elements, size_t size_of_element,int (*compare)(const void *k1, const void *k2))
{
	ts::con::prints("This function doesn't work for now, it is just a prototype");
	assert(0); return NULL;

    size_t i, j, count = number_of_elements, size = size_of_element;
    void *value = malloc(size);

    for (i = 1; i < count; ++i) {
        ts::mem32::mov((void*)value,(void*)((size_t)a+i),size);
        for (j = i - 1; j >= 0 && compare((void*)((size_t)a+j),value); --j)
            ts::mem32::mov((void*)((size_t)a+j + 1),(void*)((size_t)a+j),size);
	ts::mem32::mov((void*)((size_t)a+ j + 1),value,size);
    }

    free(value);    return NULL;
}
#define swap(k1,k2,size) do { ts::mem32::mov(k2,k1,size); ts::mem32::mov(k1,k2,size); } while(0);

void* __cdecl ts::ssort(void *a, size_t number_of_elements, size_t size_of_element,int (*compare)(const void *k1, const void *k2))
{
   int i, j, k, count = number_of_elements, size = size_of_element;
   for(i=0; i< count; i++) {
      k=i;
      for(j=i+1; j<count; j++) if(compare((void*)((size_t)a+j),(void*)((size_t)a+k)) < 0) k=j;
      swap((void*)((size_t)a+k), (void*)((size_t)a+i),1);
   }
}
