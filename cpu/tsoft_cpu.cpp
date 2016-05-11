//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../threads/tsoft_threads.h"
#include "./../time/tsoft_time.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------
#include "tsoft_cpu.h"
//---------------------------------------------------------------------------
static uint64_t tsc_STARTED = 0, tsc_PAUSED = 0, tsc_LAST_MEASURED = 0;
static uint64_t tsc_ADJ = ts::cpu::tsc_overhead();
static uint64_t tsc_ELAPSED = 0;
//---------------------------------------------------------------------------
#if !defined(__BORLANDC__) && !defined(__WATCOMC__)
uint64_t __cdecl ts::cpu::rdtscp(__int32 *a_chip, __int32 *a_core)
{
unsigned __int32 HI, LO, CC;
#if defined(__GNUC__) || defined(__clang__)
asm volatile("rdtscp" : "=a" (LO), "=d" (HI), "=c" (CC));
#else
    __asm { rdtscp;
            mov [LO], eax;
            mov [HI], edx;
            mov [CC], ecx;
    }
#endif
if (a_chip!=NULL) *a_chip = (CC & 0x00FFF000)>>12;
if (a_core!=NULL) *a_core =  CC & 0x00000FFF;
    register unsigned __int64 r = HI;
    r = r << 32;
    r = r  | LO;
    return r; //( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}
#endif

uint64_t __cdecl ts::cpu::rdtsc(void)
{
unsigned __int32 HI, LO;
#if defined(__GNUC__) || defined(__clang__)
    asm volatile ("rdtsc" : "=a"(LO), "=d"(HI));
#else
    __asm { rdtsc;
            mov [LO], eax;
            mov [HI], edx;
    }
#endif
    register unsigned __int64 r = HI;
    r = r << 32;
    r = r  | LO;
    return r; //( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}

uint64_t __cdecl ts::cpu::rdtscex(void)
{
#if defined(__ARM__) && (defined (__GNUC__) || defined(__clang__))
unsigned __int32 r;
    asm volatile ("mcr p15,  0, %0, c15,  c9, 0\n" : : "r" (1));
    asm volatile ("mrc p15,  0, %0, c15, c12, 1" : "=r" (r));
return r;
#elif __BORLANDC__
uint32_t LO, HI;
    __asm {
    pushfd;
        push eax;
        push ebx;
        push ecx;
        push edx;
        push esi;
        mov eax,0x00000001;
        xor ecx,ecx;
        cpuid;
        mov ecx,0x00000001;
        shl ecx,27;
        and ecx,edx;
        xor eax,eax;
        xor edx,edx;

       test ecx,ecx;
         jz tsc_exit;
        mov eax,1;
        cpuid;
        jmp tsc_intel_measure;
        tsc_amd_measure:
        sfence;
        rdtsc;

        tsc_intel_measure:
        sfence;
        rdtsc;

        tsc_exit:
        mov [LO],eax;
        mov [HI],edx;
        pop esi;
        pop edx;
        pop ecx;
        pop ebx;
        pop eax;
        popfd;
    }
    uint64_t r = HI;
    r = r << 32;
    r = r  | LO;
#elif defined(__GNUC__) || defined(__clang__)
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t LO, HI;
    __stasm(eax,ebx,ecx,edx,esi,edi,
    code,
        pushfd;
        push eax;
        push ebx;
        push ecx;
        push edx;
        push esi;

        mov eax,0x00000001;
        xor ecx,ecx;
        cpuid;
        mov ecx,0x00000001;
        shl ecx,27;
        and ecx,edx;
        xor eax,eax;
        xor edx,edx;

       test ecx,ecx;
         jz tsc_exit;
        mov eax,1;
        cpuid;
        jmp tsc_intel_measure;
        tsc_amd_measure:\n
        sfence;
        rdtsc;

        tsc_intel_measure:\n
        sfence;
        rdtsc;

        tsc_exit:\n
        mov edi,s_x86;
        mov [edi+0],eax;
        mov [edi+4],edx;

        pop esi;
        pop edx;
        pop ecx;
        pop ebx;
        pop eax;
        popfd;
    )
    uint64_t r = (uint64_t)s_x86[1];
    r = r << 32;
    r = r  | (uint64_t)s_x86[0];
    ATOMIC_UNLOCK(1)
    return r;
#else
        // Microsoft Visual Studio, OpenWatcom, Peles C
#endif
return 0;
}
//---------------------------------------------------------------------------

uint64_t __cdecl ts::cpu::tsc_start(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t r = ts::cpu::rdtsc();
    tsc_STARTED = r;
ATOMIC_UNLOCK(1)
    return r;
}
//---------------------------------------------------------------------------

uint64_t __cdecl ts::cpu::tsc_checkpoint(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t r = ts::cpu::rdtsc();
    register uint64_t x = tsc_STARTED - tsc_ADJ;
    register uint64_t e;
    if (r > x) e = r - x;
    else {
    e = 0;
    }
    tsc_LAST_MEASURED = r;
    tsc_ELAPSED = e;
ATOMIC_UNLOCK(1)
    return e;
}
//---------------------------------------------------------------------------

uint64_t __cdecl ts::cpu::tsc_elapsed(void)
{
    return tsc_ELAPSED;
}
//---------------------------------------------------------------------------

uint64_t __cdecl ts::cpu::tsc_pause(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t n = ts::cpu::rdtsc();
    tsc_PAUSED = n;
ATOMIC_UNLOCK(1)
    return n;
}
//---------------------------------------------------------------------------

uint64_t __cdecl ts::cpu::tsc_start_paused(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t s = tsc_STARTED;
    register uint64_t n = ts::cpu::rdtsc();
    register uint64_t x = (tsc_PAUSED - s);
    if  (n > x)
        {s = n - x;
        }
    register uint64_t e = n - s;
    tsc_LAST_MEASURED = n;
    tsc_STARTED = s;
    tsc_ELAPSED = e;
ATOMIC_UNLOCK(1)
    return e;
}
//---------------------------------------------------------------------------

uint64_t __cdecl ts::cpu::tsc_overhead(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t m0, m1;
    tsc_ADJ = 0; // static variable is initialized with this function so it MUST be set to 0 there, especially before first run ;)
    m0 = tsc_start();
    m1 = tsc_checkpoint();
    if (m1 > m0)
    tsc_ADJ = m1 - m0;
register uint64_t r = tsc_ADJ;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpuid(uint32_t *a_eax, uint32_t *a_ebx, uint32_t *a_ecx, uint32_t* a_edx,uint32_t a_feature,uint32_t a_feature_ecx)
{
#if defined(__GNUC__) || defined(__clang__)
    __asm__ __volatile__ (
    "movl %0, %%eax\n"
    "movl %1, %%ecx\n"
    "cpuid\n"
    "mov %%eax, %0\n"
    "mov %%eax, %1\n"
    "mov %%eax, %2\n"
    "mov %%eax, %3\n"
     : "=m"(a_eax), "=m"(a_ebx), "=m"(a_ecx), "=m"(a_edx) : "m" (a_feature), "m" (a_feature_ecx) : "eax", "ebx", "ecx", "edx", "memory");
#else
asm {   mov eax,a_feature;
        mov ecx,a_feature_ecx;
        and eax,0x80000000;
        cpuid;
        mov ESI,a_eax
        mov [ESI],eax
        mov ESI,a_ebx
        mov [ESI],ebx
        mov ESI,a_ecx
        mov [ESI],ecx
        mov ESI,a_edx
        mov [ESI],edx
    }
#endif
register uint32_t r = a_eax[0];
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpuidex(uint32_t *a_eax, uint32_t *a_ebx, uint32_t *a_ecx, uint32_t *a_edx,uint32_t a_feature,uint32_t a_feature_ecx)
{
static uint32_t cached_eax asm("cached_eax") = 0;
static uint32_t cached_ebx asm("cached_ebx") = 0;
static uint32_t cached_ecx asm("cached_ecx") = 0;
static uint32_t cached_edx asm("cached_edx") = 0;
static uint32_t previous_feature = 0xFFFFFFFFL;
static uint32_t previous_feature_ecx = 0xFFFFFFFFL;
ATOMIC(1)
ATOMIC_LOCK(1)
if (a_feature==previous_feature && a_feature_ecx==previous_feature_ecx) {
    *a_eax = cached_eax;
    *a_ebx = cached_ebx;
    *a_ecx = cached_ecx;
    *a_edx = cached_edx;
    register uint32_t r = cached_eax;
    ATOMIC_UNLOCK(1)
    return   r;
}
else {
previous_feature = a_feature;
previous_feature_ecx = a_feature_ecx;
}
//-----------------------------
#ifdef __BORLANDC__
__asm
  {
        pushfd
        push eax;
        push ebx;
        push ecx;
        push edx;
        push esi;
        push edi;
    mov edi,a_feature;
    mov eax,edi;
    and eax,0x80000000;
cpuid;
     mov        esi,eax;
     xor        eax,eax;
     xor        ebx,ebx;
     xor        ecx,ecx;
     xor        edx,edx;
     cmp        esi,edi;
     jb  cpuid_save_result;
     mov        eax,edi;
     mov        edi,a_feature_ecx;
     mov        ecx,edi;
cpuid;
     cpuid_save_result:
     mov cached_eax,eax;
     mov cached_ebx,ebx;
     mov cached_ecx,ecx;
     mov cached_edx,edx;
        pop edi;
        pop esi;
        pop edx;
        pop ecx;
        pop ebx;
        pop eax;
        popfd
  }
*a_eax = cached_eax;
*a_ebx = cached_ebx;
*a_ecx = cached_ecx;
*a_edx = cached_edx;
#elif defined(__GNUC__) || defined(__clang__)
s_x86[0]        = a_feature;
s_x86[5]        = a_feature_ecx;
__stasm(eax,ebx,ecx,edx,esi,edi,var_o,"=m",cached_eax,code,
    pushfd\n
        push eax\n
        push ebx\n
        push ecx\n
        push edx\n
        push esi\n
        push edi\n
    mov edi,s_x86[0]\n
    mov eax,dword ptr[edi+0*4]\n
    and eax,0x80000000\n
cpuid\n
    mov esi,eax\n
    xor eax,eax\n
    xor ebx,ebx\n
    xor ecx,ecx\n
    xor edx,edx\n
    cmp esi,dword ptr[edi+0*4]\n
    jb cpuid_save_result%=\n
    mov eax,dword ptr[edi+0*4]\n
    mov ecx,dword ptr[edi+5*4]\n
cpuid\n
    cpuid_save_result%=:\n
    mov dword ptr[edi+1*4],eax\n
    mov dword ptr[edi+2*4],ebx\n
    mov dword ptr[edi+3*4],ecx\n
    mov dword ptr[edi+4*4],edx\n
        pop edi\n
        pop esi\n
        pop edx\n
        pop ecx\n
        pop ebx\n
        pop eax\n
    popfd\n
    )
cached_eax = s_x86[1];
    *a_eax = cached_eax;
cached_ebx = s_x86[2];
    *a_ebx = cached_ebx;
cached_ecx = s_x86[3];
    *a_ecx = cached_ecx;
cached_edx = s_x86[4];
    *a_edx = cached_edx;

#else
//MS Visual Studio, OpenWatcom, PelesC
#endif
//-----------------------------
register uint32_t r = a_eax[0];
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

char *__cdecl ts::cpu::cpu_vendor(void)
{
static uint32_t v[4] = { 0,0,0,0 };
ATOMIC(1)
ATOMIC_LOCK(1)
cpuidex(&v[3],&v[0],&v[2],&v[1],0,0);
if (v[0]!=0)
    v[3] =0;
//-----------------------------
ATOMIC_UNLOCK(1)
return (char*)&v;
}
//---------------------------------------------------------------------------

char *__cdecl ts::cpu::cpu_name(void)
{
static uint32_t n[13] = { 0,0,0,0,0,0,0,0,0,0,0,0 };
if (n[0]!=0)
    return (char*)&n;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000000,0)<0x80000004) {
    ATOMIC_UNLOCK(1)
    return (char*)ts::mem32::mov(&n,"Unsupported\0",12);
}
for (register uint32_t f = (0x80000002), i = 0; i < 12; f++, i+=4)
    {
    cpuidex(&n[i+0],&n[i+1],&n[i+2],&n[i+3],f,0);
    }
ts::cstr::trim((char*)&n);
ATOMIC_UNLOCK(1)
return  (char*)&n;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_num_threads()
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = ((f_ebx >> 16) & 0x000000FFL) + 1; // ebx[23:16]
register uint32_t r = s_answer;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_num_cores()
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (ts::mem32::cmp(cpu_vendor(),"GenuineIntel",12)==0) {
    // Get DCP cache info
       cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000004L,0);
       s_answer = ((f_eax >> 26) & 0x3FL) + 1;
    // eax[31:26] + 1
}
else
if (ts::mem32::cmp(cpu_vendor(),"AuthenticAMD",12)==0) {
    // Get NC: Number of CPU cores - 1
       cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
       s_answer = ((f_ecx & 0x000000FFL)) + 1;
    // ecx[7:0] + 1
}
else   s_answer = cpu_num_threads();
register uint32_t r = s_answer;
ATOMIC_UNLOCK(1)
return r;
//-----------------------------
}
uint32_t __cdecl ts::cpu::cpu_cache_size(uint8_t a_level)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (ts::mem32::cmp(cpu_vendor(),"GenuineIntel",12)==0) {
    if (a_level==2) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000002L,0);
    if ((f_edx && 0xFFL) == 0x40L)
       s_answer = 0;
    else
    if ((f_edx && 0xFFL) == 0x41L)
       s_answer = 128;
    else
    if ((f_edx && 0xFFL) == 0x42L)
       s_answer = 256;
    else
    if ((f_edx && 0xFFL) == 0x43L)
       s_answer = 512;
    else
    if ((f_edx && 0xFFL) == 0x44L)
       s_answer = 1024;
    else
    if ((f_edx && 0xFFL) == 0x45L)
       s_answer = 2048;
    else {
//    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000004L,a_level);
//    s_answer = (f_ebx & 0x001FFFFFL) + 1;
    s_answer = 0;
    }
    }
    else s_answer = 0;
}
else
if (ts::mem32::cmp(cpu_vendor(),"AuthenticAMD",12)==0) {
    if (a_level==0) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000005L,0);
    s_answer = (f_edx>>24) & 0x000000FFL; //L1i, uops etc, dla mnie 0 ;)
    }
    else
    if (a_level==1) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000005L,0);
    s_answer = (f_ecx>>24) & 0x000000FFL; //data L1
    }
    else
    if (a_level==2) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000006L,0);
    s_answer = (f_ecx>>16) & 0x0000FFFFL;
    }
    else
    if (a_level==3) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000006L,0);
    s_answer =((f_edx>>18) & 0x00003FFFL) * 512;
    }
}
register uint32_t r = s_answer;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_cache_line_size(uint8_t a_level)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (ts::mem32::cmp(cpu_vendor(),"GenuineIntel",12)==0) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000004L,0);
    s_answer = (f_ebx & 0x00000FFFL) + 1;
}
else
if (ts::mem32::cmp(cpu_vendor(),"AuthenticAMD",12)==0) {
if (a_level==0) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000005L,0);
    s_answer = (f_edx & 0x000000FFL);
    }
if (a_level==1) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000005L,0);
    s_answer = (f_ecx & 0x000000FFL);
    }
if (a_level==2) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000006L,0);
    s_answer = (f_ecx & 0x000000FFL);
    }
if (a_level==3) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000006L,0);
    s_answer = f_edx & 0x000000FFL;
    }
}
register uint32_t r = s_answer;
ATOMIC_UNLOCK(1)
return r;
//-----------------------------
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_num_mhz(bool a_constant_update)
{
static uint32_t s_answer = 0;
if (s_answer!=0 && a_constant_update==false)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
//-----------------------------
#define INTERVAL_TIME (uint32_t)(1 + 20 * (1000/CLOCKS_PER_SEC))
#define TIMES (uint32_t)5
//minimum 3, min,max measurments(2) will be ignored in result
    uint64_t xmax,xmin;
    uint64_t x[TIMES];
    uint32_t imax,imin;
    register uint32_t i;

        uint64_t t,t1,t2,t3,t4;
        register uint64_t r;
    register uint64_t rcor;
    for (i = 0; i < TIMES;i++) {
        ts::cpu::tsc_overhead(); //heat up CPU?
        ts::cpu::tsc_start(); t1 = ts::time::clock_ms(); ts::cpu::tsc_checkpoint();
        rcor = (uint64_t)ts::cpu::tsc_elapsed();
        do {t2 = ts::time::clock_ms();  // SYNC to clock-tick interval
        } while (t2<=t1);
        ts::cpu::tsc_start();
        for (register uint32_t trash1 = INTERVAL_TIME; trash1 > 0; trash1--) //conajmniej raz
        for (register uint32_t trash2 = 0; trash2 < 1000*1000; trash2++) //conajmniej 1000000 mln instrukcji
                    {}
                //measure time: ~INTERVAL * 1MHz
        t3 = ts::time::clock_ms();
        do {t4 = ts::time::clock_ms();  // SYNC to clock-tick interval
        } while (t4<=t3);
        ts::cpu::tsc_checkpoint();
        r = (uint64_t)ts::cpu::tsc_elapsed();
        t = t4 - t2;
        r = r - rcor;
        r = r * 1000;
        if (t!=0) r = r / t;
           else r =0;
        x[i]  =r;
    }
    for (xmax = x[0], xmin = x[0], imin=0, imax=0, i = 0; i < TIMES; i++) {
         if (x[i] > xmax) {xmax = x[i];imax=i;}
         if (x[i] < xmin) {xmin = x[i];imin=i;}
    }
    for (r = 0, i = 0; i < TIMES;i++) { if (i!=imin && i!=imax) r = r + x[i];
    }
r = (r / (TIMES-2)) / 1000000;
s_answer = uint32_t(r);
//-----------------------------
ATOMIC_UNLOCK(1)
return (uint32_t)r;
}
//---------------------------------------------------------------------------

#if defined(__i386__) || defined(_MSC_VER) || defined(__BORLANDC__)

bool __cdecl ts::cpu::cpu_has_x87(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
if (f_edx & (1<<0)) {
    s_answer = 1;
    ATOMIC_UNLOCK(1)
    return 1;
}
// second check for AMD ~K5 and other older processors
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
if (f_edx & (1<<0)) {
    s_answer = 1;
    ATOMIC_UNLOCK(1)
    return 1;
}
s_answer = 0;
ATOMIC_UNLOCK(1)
return 0;

}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_mmx(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<23);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_mmxext(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_edx & (1<<22); //AMD bez SSE
if (s_answer!=0)
return 1;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<25); //Intel z SSE == MMX-ext
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_amd64(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_edx & (1<<29);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_ht(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<28);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_has_sse(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
if (f_ecx & (1<<20))
s_answer = 42;
else
if (f_ecx & (1<<19))
s_answer = 41;
else
if (f_ecx & (1<<9))
s_answer = 31;
else
if (f_ecx & (1<<0))
s_answer = 30;
else
if (f_edx & (1<<26))
s_answer = 20;
else
if (f_edx & (1<<25))
s_answer = 10;
else
s_answer = 0;
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_sse4a(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<6);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_has_avx(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
if (f_ecx & (1<<28)) {
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
if (f_ebx & (1<< 5))
s_answer = 2;
else
s_answer = 1;
}
else {
s_answer = 0;
}
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_popcnt(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<23);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_f16c(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<29);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_has_cmpxchg(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
if (f_ecx & (1<<13)) {
s_answer = 16;
ATOMIC_UNLOCK(1)
return 16;
}
if (f_edx & (1<< 8)) {
s_answer = 8;
ATOMIC_UNLOCK(1)
return 8;
}
//AMD second time check for older processors.
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
if (f_edx & (1<< 8)) {
s_answer = 8;
ATOMIC_UNLOCK(1)
return 8;
}
s_answer = 1;
ATOMIC_UNLOCK(1)
return 1;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_vmx(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<5);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_smx(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<6);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_cmov(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<15);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_movbe(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<22);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_has_bmi(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
if (f_ebx & (1<<8))
s_answer = 2;
else
if (f_ebx & (1<<3))
s_answer = 1;
else
s_answer = 0;
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_erms(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<9);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_has_3dnow(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
if (f_edx & (1<<30))
s_answer = 2;
else
if (f_edx & (1<<31))
s_answer = 1;
else
s_answer = 0;
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_3dnowprefetch(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<8);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_perftsc(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_edx & (1<<27);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_sha(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<29);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_xop(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<11);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512f(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<16);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512bw(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<30);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512er(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<27);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512cd(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<28);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512pf(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<26);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512dq(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<17);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512vl(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<31);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512ifma(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<21);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_avx512vbmi(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ecx & (1<<1);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_adx(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<19);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_lzcnt(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<5);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_tbm(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<21);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_clfsh(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<19);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_pclmulqdq(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<5);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_fxsr(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<24);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_ss(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<27);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_mtrr(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<12);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_msr(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<12);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_tsc(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<4);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_psn(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<18);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_xsave(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = ((f_ecx & (1<<26))>>26) & ((f_ecx & (1<<27))>>27);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_clmul(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<2);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

uint32_t *__cdecl ts::cpu::cpu_psn(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
static uint32_t sn[3] = { 0,0,0 };
if (s_answer!=0xFFFFFFFFL)
    return sn;
ATOMIC(1)
ATOMIC_LOCK(1)
//-----------------------------
sn[0] = 0;
sn[1] = 0;
sn[2] = 0;
if (!cpu_has_psn()) {
ATOMIC_UNLOCK(1)
return sn;
}
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000003,0);
//-----------------------------
sn[2] = f_eax;
sn[1] = f_edx;
sn[0] = f_ecx;
ATOMIC_UNLOCK(1)
return sn;
}
//---------------------------------------------------------------------------

uint32_t __cdecl ts::cpu::cpu_has_fma(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
if (f_ecx & (1<<12)) {
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
if (f_ecx & (1<<16))
s_answer = 4;
else
s_answer = 3;
}
else {
s_answer = 0;
}
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_aes(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<25);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_viaaes(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0xC0000001,0);
//-----------------------------
s_answer = f_edx & (1<<7);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_viarng(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0xC0000001,0);
//-----------------------------
s_answer = f_edx & (1<<3);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_viahash(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0xC0000001,0);
//-----------------------------
s_answer = f_edx & (1<<11);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_rdseed(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<18);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
//---------------------------------------------------------------------------

bool __cdecl ts::cpu::cpu_has_rdrand(void)
{
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<30);
register bool r = s_answer!=0;
ATOMIC_UNLOCK(1)
return r;
}
#endif
//---------------------------------------------------------------------------

#define PRINT_CPUVENDOR(val) ts::con::prints("Vendor \"%s\"\n",val);
#define PRINT_CPUNAME(val) ts::con::prints("Processor name \"%s\"\n",val);
#define PRINT_CPUCURRENTMHZ(val) ts::con::prints("CPU Core Clock is %dMhz\n",val);
#define PRINT_CPUID(val) r = val; if (r!=0) ts::con::prints("[SUPPORTED=%02d]%-10s%s\n",r," ",#val); else ts::con::prints("NOT%21s%s\n"," ",#val);

void __cdecl ts::cpu::cpu_print_info()
{
    int r;
    PRINT_CPUVENDOR(ts::cpu::cpu_vendor());
    PRINT_CPUNAME(ts::cpu::cpu_name());
    PRINT_CPUCURRENTMHZ(ts::cpu::cpu_num_mhz(true));
    PRINT_CPUID(ts::cpu::cpu_cache_size(0));
    PRINT_CPUID(ts::cpu::cpu_cache_line_size(0));
    ts::con::prints("Cache L1i, uOPS cache etc. = cache L0 :)\n");
    PRINT_CPUID(ts::cpu::cpu_cache_size(1));
    PRINT_CPUID(ts::cpu::cpu_cache_line_size(1));
    PRINT_CPUID(ts::cpu::cpu_cache_size(2));
    PRINT_CPUID(ts::cpu::cpu_cache_line_size(2));
    PRINT_CPUID(ts::cpu::cpu_cache_size(3));
    PRINT_CPUID(ts::cpu::cpu_cache_line_size(3));
    PRINT_CPUID(ts::cpu::cpu_num_cores());
    PRINT_CPUID(ts::cpu::cpu_num_threads());
#if defined(__i386__) || defined(_MSC_VER) || defined(__BORLANDC__)
    PRINT_CPUID(ts::cpu::cpu_has_amd64());
    PRINT_CPUID(ts::cpu::cpu_has_ht());
    PRINT_CPUID(ts::cpu::cpu_has_mmx());
    PRINT_CPUID(ts::cpu::cpu_has_mmxext());
    PRINT_CPUID(ts::cpu::cpu_has_3dnow());
    PRINT_CPUID(ts::cpu::cpu_has_3dnowprefetch());
    PRINT_CPUID(ts::cpu::cpu_has_fxsr());
    PRINT_CPUID(ts::cpu::cpu_has_sse());
    PRINT_CPUID(ts::cpu::cpu_has_xsave());
    PRINT_CPUID(ts::cpu::cpu_has_pclmulqdq());
    PRINT_CPUID(ts::cpu::cpu_has_movbe());
    PRINT_CPUID(ts::cpu::cpu_has_fma());
    PRINT_CPUID(ts::cpu::cpu_has_popcnt());
    PRINT_CPUID(ts::cpu::cpu_has_xop());
    PRINT_CPUID(ts::cpu::cpu_has_lzcnt());
    PRINT_CPUID(ts::cpu::cpu_has_f16c());
    PRINT_CPUID(ts::cpu::cpu_has_avx());
    PRINT_CPUID(ts::cpu::cpu_has_avx512f());
    PRINT_CPUID(ts::cpu::cpu_has_avx512bw());
    PRINT_CPUID(ts::cpu::cpu_has_avx512cd());
    PRINT_CPUID(ts::cpu::cpu_has_avx512dq());
    PRINT_CPUID(ts::cpu::cpu_has_avx512er());
    PRINT_CPUID(ts::cpu::cpu_has_avx512pf());
    PRINT_CPUID(ts::cpu::cpu_has_avx512vl());
    PRINT_CPUID(ts::cpu::cpu_has_avx512ifma());
    PRINT_CPUID(ts::cpu::cpu_has_bmi());
    PRINT_CPUID(ts::cpu::cpu_has_avx512vbmi());
    PRINT_CPUID(ts::cpu::cpu_has_cmov());
    PRINT_CPUID(ts::cpu::cpu_has_cmpxchg());
    PRINT_CPUID(ts::cpu::cpu_has_clmul());
    PRINT_CPUID(ts::cpu::cpu_has_aes());
    PRINT_CPUID(ts::cpu::cpu_has_sha());
    PRINT_CPUID(ts::cpu::cpu_has_rdrand());
    PRINT_CPUID(ts::cpu::cpu_has_rdseed());
    PRINT_CPUID(ts::cpu::cpu_has_tsc());
    PRINT_CPUID(ts::cpu::cpu_has_perftsc());
    PRINT_CPUID(ts::cpu::cpu_has_erms());
    PRINT_CPUID(ts::cpu::cpu_has_msr());
    PRINT_CPUID(ts::cpu::cpu_has_mtrr());
    PRINT_CPUID(ts::cpu::cpu_has_vmx());
#endif
}
void __cdecl ts::cpu::cpu_test()
{
cpu_print_info();
}

//---------------------------------------------------------------------------

