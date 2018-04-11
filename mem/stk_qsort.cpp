//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_mem.h"
#include "./../io/stk_console.h"
#include "stk_qsort.h"
//---------------------------------------------------------------------------

void* __cdecl stk::qsort(void *base, size_t number_of_elements, size_t size_of_element,
			   int (*compare)(const void *k1, const void *k2))
 {
	stk::con::prints("This function doesn't work for now, it is just a prototype");
	assert(0); return NULL;

		 size_t istart = 0;
		 size_t imid, imid_times_size, icount = number_of_elements;
		 size_t size = size_of_element;

		 int64_t compare_result;

		 while (istart < icount) {
				 imid = istart + ((icount - istart) >> 1); // >>1 faster than /2
				 imid_times_size = imid * size;
				 compare_result = compare(&(((int8_t*)base)[0]), &(((int8_t*)base)[imid_times_size]));

				 if (compare_result < 0) icount = imid;
				 else
				 if (compare_result > 0) istart = imid + 1;
				 else
					 return (void*)&(((int8_t*)base)[imid_times_size]);
		 }

		 return NULL;
}
//---------------------------------------------------------------------------

void* __cdecl stk::isort(void *a, size_t number_of_elements, size_t size_of_element,int (*compare)(const void *k1, const void *k2))
{
	stk::con::prints("This function doesn't work for now, it is just a prototype");
	assert(0); return NULL;

    int64_t i, j, count = number_of_elements, size = size_of_element;
    void *value = stk::mem::alloc(size);

	for (i = 1; i < count; ++i) {
        stk::mem::mov((void*)value,(void*)((size_t)a+i),size);
        for (j = i - 1; j >= 0 && compare((void*)((size_t)a+j),value); --j)
            stk::mem::mov((void*)((size_t)a+j + 1),(void*)((size_t)a+j),size);
	stk::mem::mov((void*)((size_t)a+ j + 1),value,size);
    }

    free(value);    return NULL;
}
#define swap(k1,k2,size) do { stk::mem::mov(k2,k1,size); stk::mem::mov(k1,k2,size); } while(0);

void* __cdecl stk::ssort(void *a, size_t number_of_elements, size_t size_of_element,int (*compare)(const void *k1, const void *k2))
{
   int i, j, k, count = number_of_elements, size = size_of_element;
   for(i=0; i< count; i++) {
      k=i;
      for(j=i+1; j<count; j++) if(compare((void*)((size_t)a+j),(void*)((size_t)a+k)) < 0) k=j;
      swap((void*)((size_t)a+k), (void*)((size_t)a+i),1);
   }
return a;
}
