//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
    #pragma hdrstop
#endif
#include "./../mem/stk_mem.h"
#include "./../text/stk_cstr_utils.h"
#include "./../threads/stk_threads.h"
#include "./../stasm/stk_stasm.h"
#include "./../time/stk_time.h"
#include "./../io/stk_console.h"
//---------------------------------------------------------------------------
#include "stk_cpu.h"
//---------------------------------------------------------------------------
static uint64_t tsc_STARTED = 0, tsc_PAUSED = 0, tsc_LAST_MEASURED = 0;
static uint64_t tsc_ADJ = stk::cpu::tsc_init();
static uint64_t tsc_ELAPSED = 0;
//---------------------------------------------------------------------------
#if !defined(__CANT_COMPILE_RDTSCP__)
uint64_t __cdecl stk::cpu::rdtscp(uint32_t *a_chip, uint32_t *a_core)
{
uint64_t ret;
uint32_t ret_hi, ret_lo, ret_cc;
// 32 bit parts of return value
// TODO: return ret 64bit as 32 bit parts union
#if defined(__GNUC__) || defined(__CLANG__)
    asm volatile("rdtscp" : "=a" (ret_lo), "=d" (ret_hi), "=c" (ret_cc));
#elif (__BORLANDC__ > 0x551) || defined(_MSC_VER)

        #if (__BORLANDC__ > 0x551)
                asm rdtscp; 
        #else
                __emit__( 0x0F ); // embeds ''rdtscp''
                __emit__( 0x01 );
                __emit__( 0xF9 );
        #endif
        __asm {
                mov [ret_lo], eax;
                mov [ret_hi], edx;
                mov [ret_cc], ecx;
        }
#else
    #pragma message "RDTSCP: Your compiler is not supported"
    // TODO: Watcom, Peles C, Borland C++ Builder 3
    return 0;
#endif
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
if (a_chip!=NULL)
   *a_chip = (ret_cc & 0x00FFF000)>>12;
if (a_core!=NULL)
   *a_core =  ret_cc & 0x00000FFF;
 ret = ret_hi;
 ret = ret << 32;
 ret = ret  | ret_lo;
return ret; //( (unsigned long long)ret_lo)|( ((unsigned long long)ret_hi)<<32 );
}
#endif // endif !Borland 5, WATCOM entire function is unsupported
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::rdtsc(void)
{
uint64_t ret;
uint32_t ret_lo, ret_hi;
// 32 bit parts of return value
// TODO: return ret 64bit as 32 bit parts union
#if defined(__GNUC__) || defined(__CLANG__)

    #if defined(__x86_64__) || defined(_WIN64) || defined(__i386)
    /*
     * cpuid -> ret_lo=EAX, ret_hu=EDX either on 64 and 32 bit CPU
     */
        asm volatile ("rdtsc" : "=a"(ret_lo), "=d"(ret_hi));
    #elif defined(__ARM__)
    /*
     * According to ARM DDI 0487F.c, from Armv8.0 to Armv8.5 inclusive, the
     * system counter is at least 56 bits wide; from Armv8.6, the counter
     * must be 64 bits wide.  So the system counter could be less than 64
     * bits wide and it is attributed with the flag 'cap_user_time_short'
     * is true.
     */
        asm volatile("mrs %0, cntvct_el0" : "=r" (ret));
        return ret;
    #else
        #error "Processor other than x86,x64 or ARM is not supporter YET"
        return 0;
    #endif

#elif (__BORLANDC__ > 0x551) || defined(_MSC_VER)

        #if (__BORLANDC__ > 0x551)
                asm rdtsc;
        #else
                __emit__( 0x0f ); // embeds ''rdtsc''
                __emit__( 0x31 );
        #endif
        __asm {
                mov [ret_lo], eax;
                mov [ret_hi], edx;
        }
#else
    // TODO: OPEN Watcom, Peles C
    #pragma message "RDTSC: Your compiler is not supported due to the lack of RDTSC serializing instruction"
#endif
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
 ret = ret_hi;
 ret = ret << 32;
 ret = ret  | ret_lo;
return ret; //( (unsigned long long)ret_lo)|( ((unsigned long long)ret_hi)<<32 );
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::rdtscex(void)
{
uint64_t ret;
uint32_t ret_lo, ret_hi;
// 32 bit parts of return value
// TODO: return ret 64bit as 32 bit parts union
#if defined(__GNUC__) || defined(__CLANG__)

    #if defined(__x86_64__) || defined(_WIN64)
    ATOMIC(1)
    ATOMIC_LOCK(1)
    __stasm(rax,rbx,rcx,rdx,rsi,rdi,
    code,
        pushfq;
        push rax;
        push rbx;
        push rcx;
        push rdx;
        push rsi;

        mov rax,0x00000001;
        xor rcx,rcx;
        cpuid;
        mov rcx,0x00000001;
        shl rcx,27;
        and rcx,rdx;
        xor rax,rax;
        xor rdx,rdx;

       test rcx,rcx;
         jz tsc_exit;
        mov rax,1;
        cpuid;
        jmp tsc_intel_measure;

// AMD & other specific version
        sfence;
        rdtsc;
// Intel specific version
        tsc_intel_measure:\n
        sfence;
        rdtsc;

        tsc_exit:\n
        mov rdi,__stasm_x86;
        mov [rdi+0],rax;
        mov [rdi+4],rdx;

        pop rsi;
        pop rdx;
        pop rcx;
        pop rbx;
        pop rax;
        popfq;
    )
     ret = (uint64_t)__stasm_x86[1];
     ret = ret << 32;
     ret = ret  | (uint64_t)__stasm_x86[0];
    ATOMIC_UNLOCK(1)
    return ret;
    #elif defined(__i386__)
    ATOMIC(1)
    ATOMIC_LOCK(1)
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

// AMD & other specific version
        sfence;
        rdtsc;
// Intel specific version
        tsc_intel_measure:\n
        sfence;
        rdtsc;

        tsc_exit:\n
        mov edi,__stasm_x86;
        mov [edi+0],eax;
        mov [edi+4],edx;

        pop esi;
        pop edx;
        pop ecx;
        pop ebx;
        pop eax;
        popfd;
    )
    ret = (uint64_t)__stasm_x86[1];
    ret = ret << 32;
    ret = ret  | (uint64_t)__stasm_x86[0];
    ATOMIC_UNLOCK(1)
    return ret;
    #elif defined(__ARM__)
        ATOMIC(1)
        ATOMIC_LOCK(1)
        uint32_t ret;
        asm volatile ("mcr p15, 0, %0, c15,  c9, 0\n" : : "r" (1));
        asm volatile ("mrc p15, 0, %0, c15, c12, 1" : "=r" (ret));
        ATOMIC_UNLOCK(1)
        return ret;
    #else
        #error "Processor is defined ARM but compilers other than GNU/CLANG are not supported"
    #endif

#elif (__BORLANDC__ > 0x551) || defined(_MSC_VER)

    ATOMIC(1)
    ATOMIC_LOCK(1)
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
        jmp tsc_intel_serialize_measure;

// AMD & other specific version
#ifndef __CANT_COMPILE_SFENCE__
        sfence;
#endif
#if (__BORLANDC__ > 0x551)
        rdtsc;
#else
        __emit__( 0x0f ); // embeds ''rdtsc''
        __emit__( 0x31 );
#endif

// Intel specific version
        tsc_intel_serialize_measure:
#ifndef __CANT_COMPILE_SFENCE__
        sfence;
#endif
#if (__BORLANDC__ > 0x551)
        rdtsc;
#else
        __emit__( 0x0f ); // embeds ''rdtsc''
        __emit__( 0x31 );
#endif

        tsc_exit:
        mov [ret_lo],eax;
        mov [ret_hi],edx;
        pop esi;
        pop edx;
        pop ecx;
        pop ebx;
        pop eax;
        popfd;
    }
    ret = ret_hi;
    ret = ret << 32;
    ret = ret  | ret_lo;
    ATOMIC_UNLOCK(1)
    return ret;

#else
    // TODO: Open Watcom, Peles C
    #pragma message "RDTSCEX: Your compiler is not supported due to the lack of RDTSC instruction"
#endif
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
return 0;
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::tsc_init(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t m0, m1;
    tsc_ADJ = 0; // static variable is initialized with this function so it MUST be set to 0 there, especially before first run ;)
    m0 = tsc_start();
    m1 = tsc_checkpoint();
    if (m1 > m0)
    tsc_ADJ = m1 - m0;
register uint64_t ret = tsc_ADJ;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::tsc_start(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t ret = stk::cpu::rdtsc();
    tsc_STARTED = ret;
    tsc_LAST_MEASURED = ret;
    tsc_PAUSED = 0; tsc_ELAPSED = 0;
ATOMIC_UNLOCK(1)
    return ret;
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::tsc_checkpoint(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
        register uint64_t n = tsc_PAUSED;
        register uint64_t x;
        register uint64_t e;
    if (n==0) {
        n = stk::cpu::rdtsc();
    }
    x = tsc_STARTED - tsc_ADJ;
    if (n > x) e = n - x;
    else {
          e = 0;
    }
    tsc_LAST_MEASURED = n;
    tsc_ELAPSED = e;
ATOMIC_UNLOCK(1)
    return n;
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::tsc_elapsed(void)
{
    return tsc_ELAPSED;
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::tsc_pause(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t n = stk::cpu::rdtsc();
    tsc_PAUSED = n;
ATOMIC_UNLOCK(1)
    return n;
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::tsc_resume(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t s = tsc_STARTED;
    register uint64_t p = tsc_PAUSED;
    register uint64_t n = stk::cpu::rdtsc();
    register uint64_t x = n - p + s;
    tsc_STARTED = x; tsc_PAUSED = 0;
ATOMIC_UNLOCK(1)
    return n;
}
//---------------------------------------------------------------------------

uint64_t __cdecl stk::cpu::tsc_start_paused(void)
{
ATOMIC(1)
ATOMIC_LOCK(1)
    register uint64_t n = stk::cpu::rdtsc();
    tsc_LAST_MEASURED = n;
    tsc_STARTED = n;
    tsc_ELAPSED = 0; tsc_PAUSED = n;
ATOMIC_UNLOCK(1)
    return n;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpuid(uint32_t *a_eax, uint32_t *a_ebx, uint32_t *a_ecx, uint32_t* a_edx,uint32_t a_feature,uint32_t a_feature_ecx)
{
#if defined(__GNUC__) || defined(__CLANG__)

    #if defined(__x86_64__) || defined(_WIN64) ||  defined(__i386__)
    __asm__ __volatile__ (
    "movl %0, %%eax\n"
    "movl %1, %%ecx\n"
    "cpuid\n"
    "mov %%eax, %0\n"
    "mov %%eax, %1\n"
    "mov %%eax, %2\n"
    "mov %%eax, %3\n"
     : "=m"(a_eax), "=m"(a_ebx), "=m"(a_ecx), "=m"(a_edx) : "m" (a_feature), "m" (a_feature_ecx) : "eax", "ebx", "ecx", "edx", "memory");
    #elif defined(__ARM__)
        uint32_t ret;
        asm("mrs %0, " s : "=r" (ret));
        return ret;
    #else
        #error "Processor is defined ARM but compilers other than GNU/CLANG are not supported"
        return 0;
    #endif
// end of GNU compiler section
#elif (__BORLANDC__ > 0x551) || defined(_MSC_VER)

   __asm {
        mov eax,a_feature;
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
    register uint32_t ret = a_eax[0];
    return ret;

#else
    #pragma message "CPUID: Your compiler is not supported"
    // TODO: Watcom, Peles C
    return 0;

#endif
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpuidex(uint32_t *a_eax, uint32_t *a_ebx, uint32_t *a_ecx, uint32_t *a_edx,uint32_t a_feature,uint32_t a_feature_ecx)
{
// TODO: 64 bit section is unfinished! changed only popfd pushfd but not return values
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
    register uint32_t ret = cached_eax;
    ATOMIC_UNLOCK(1)
    return   ret;
}
else {
previous_feature = a_feature;
previous_feature_ecx = a_feature_ecx;
}
//-----------------------------
#if defined(__GNUC__) || defined(__CLANG__)

    #if defined(__x86_64__)
    __stasm_x86[0]        = a_feature;
    __stasm_x86[5]        = a_feature_ecx;
    __stasm(rax,rbx,rcx,rdx,rsi,rdi,var_o,"=m",cached_eax,code,
        pushfq\n
        push rax\n
        push rbx\n
        push rcx\n
        push rdx\n
        push rsi\n
        push rdi\n
        mov rdi,__stasm_x86[0]\n
        mov eax,dword ptr[rdi+0*4]\n
        and eax,0x80000000\n
        cpuid\n
        mov rsi,rax\n
        xor rax,rax\n
        xor rbx,rbx\n
        xor rcx,rcx\n
        xor rdx,rdx\n
        cmp esi,dword ptr[rdi+0*4]\n
        jb cpuid_save_result\n
        mov eax,dword ptr[rdi+0*4]\n
        mov ecx,dword ptr[rdi+5*4]\n
        cpuid\n
        cpuid_save_result:\n
        mov dword ptr[rdi+1*4],eax\n
        mov dword ptr[rdi+2*4],ebx\n
        mov dword ptr[rdi+3*4],ecx\n
        mov dword ptr[rdi+4*4],edx\n
        pop rdi\n
        pop rsi\n
        pop rdx\n
        pop rcx\n
        pop rbx\n
        pop rax\n
        popfq\n
    )
    // return gathered values section GNU 64 bit version
    cached_eax = __stasm_x86[1];
        *a_eax = cached_eax;
    cached_ebx = __stasm_x86[2];
        *a_ebx = cached_ebx;
    cached_ecx = __stasm_x86[3];
        *a_ecx = cached_ecx;
    cached_edx = __stasm_x86[4];
        *a_edx = cached_edx;
    #elif defined(__i386__)
    __stasm_x86[0]        = a_feature;
    __stasm_x86[5]        = a_feature_ecx;
    __stasm(eax,ebx,ecx,edx,esi,edi,var_o,"=m",cached_eax,code,
        pushfd\n
        push eax\n
        push ebx\n
        push ecx\n
        push edx\n
        push esi\n
        push edi\n
        mov edi,__stasm_x86[0]\n
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
        // return gathered values section GNU 32 bit version
        cached_eax = __stasm_x86[1];
        *a_eax = cached_eax;
        cached_ebx = __stasm_x86[2];
        *a_ebx = cached_ebx;
        cached_ecx = __stasm_x86[3];
        *a_ecx = cached_ecx;
        cached_edx = __stasm_x86[4];
        *a_edx = cached_edx;
    #else
        #error "Your processor is not x86, nor ARM and its not YET supported"
    #endif

#elif (__BORLANDC__ > 0x551) || defined(_MSC_VER)

    #if defined(__x86_64__)
    __asm {
        pushfq
        push rax;
        push rbx;
        push rcx;
        push rdx;
        push rsi;
        push rdi;
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
        pop rdi;
        pop rsi;
        pop rdx;
        pop rcx;
        pop rbx;
        pop rax;
        popfq
    }
    #elif defined(__i386__)
    __asm {
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
    #else
        #error "Your processor is not x86, nor ARM and its not YET supported by Borland compiler"
    #endif
    // return gathered values section Borland, Microsoft version
    *a_eax = cached_eax;
    *a_ebx = cached_ebx;
    *a_ecx = cached_ecx;
    *a_edx = cached_edx;
    // end of Borland, Visual Studio compiler section
#else
    #if defined(__x86_64__)
        // 64 bit Intel, AMD CPUs
        #pragma message "CPUIDEX: Your architecture is X86 64bit, but Your compiler is not supported"
    #elif defined(__i386__)
        // 32 bit x86
        #pragma message "CPUIDEX: Your architecture is X86 32bit, but Your compiler is not supported"
    #else
        // ARM, MIPS and other processors
        #error "Your processor is not x86, nor ARM and nothing is YET supported"
    #endif
#endif
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
register uint32_t ret = a_eax[0];
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

char *__cdecl stk::cpu::cpu_vendor(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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

char *__cdecl stk::cpu::cpu_name(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t n[13] = { 0,0,0,0,0,0,0,0,0,0,0,0 };
if (n[0]!=0)
    return (char*)&n;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000000,0)<0x80000004) {
    ATOMIC_UNLOCK(1)
    return (char*)stk::mem::mov(&n,"Unsupported\0",12);
}
for (register uint32_t f = (0x80000002), i = 0; i < 12; f++, i+=4)
    {
    cpuidex(&n[i+0],&n[i+1],&n[i+2],&n[i+3],f,0);
    }
stk::cstr::trim((char*)&n,' ');
ATOMIC_UNLOCK(1)
return  (char*)&n;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_num_threads()
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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
register uint32_t ret = s_answer;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_num_cores()
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (stk::mem::cmp(cpu_vendor(),"GenuineIntel",12)==0) {
    // Get DCP cache info
       cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000004L,0);
       s_answer = ((f_eax >> 26) & 0x3FL) + 1;
    // eax[31:26] + 1
}
else
if (stk::mem::cmp(cpu_vendor(),"AuthenticAMD",12)==0) {
    // Get NC: Number of CPU cores - 1
       cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
       s_answer = ((f_ecx & 0x000000FFL)) + 1;
    // ecx[7:0] + 1
}
else   s_answer = cpu_num_threads();
register uint32_t ret = s_answer;
ATOMIC_UNLOCK(1)
return ret;
//-----------------------------
}
uint32_t __cdecl stk::cpu::cpu_cache_size(uint8_t a_level)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (stk::mem::cmp(cpu_vendor(),"GenuineIntel",12)==0) {
    if (a_level==2) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000002L,0);
    if ((f_edx & 0xFFL) == 0x40L)
       s_answer = 0;
    else
    if ((f_edx & 0xFFL) == 0x41L)
       s_answer = 128;
    else
    if ((f_edx & 0xFFL) == 0x42L)
       s_answer = 256;
    else
    if ((f_edx & 0xFFL) == 0x43L)
       s_answer = 512;
    else
    if ((f_edx & 0xFFL) == 0x44L)
       s_answer = 1024;
    else
    if ((f_edx & 0xFFL) == 0x45L)
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
if (stk::mem::cmp(cpu_vendor(),"AuthenticAMD",12)==0) {
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
register uint32_t ret = s_answer;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_cache_line_size(uint8_t a_level)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
if (stk::mem::cmp(cpu_vendor(),"GenuineIntel",12)==0) {
    cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000004L,0);
    s_answer = (f_ebx & 0x00000FFFL) + 1;
}
else
if (stk::mem::cmp(cpu_vendor(),"AuthenticAMD",12)==0) {
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
register uint32_t ret = s_answer;
ATOMIC_UNLOCK(1)
return ret;
//-----------------------------
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_num_mhz(bool a_constant_update)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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
        register uint64_t ret;
    register uint64_t rcor;
    for (i = 0; i < TIMES;i++) {
        stk::cpu::tsc_init(); //heat up CPU?
        stk::cpu::tsc_start(); t1 = stk::time::time_ms(); stk::cpu::tsc_checkpoint();
        rcor = (uint64_t)stk::cpu::tsc_elapsed();
        do {t2 = stk::time::time_ms();  // SYNC to clock-tick interval
        } while (t2<=t1);
        stk::cpu::tsc_start();
        for (register uint32_t trash1 = INTERVAL_TIME; trash1 > 0; trash1--) //conajmniej raz
        for (register uint32_t trash2 = 0; trash2 < 1000*1000; trash2++) //conajmniej 1000000 mln instrukcji
                    {}
                //measure time: ~INTERVAL * 1MHz
        t3 = stk::time::time_ms();
        do {t4 = stk::time::time_ms();  // SYNC to clock-tick interval
        } while (t4<=t3);
        stk::cpu::tsc_checkpoint();
        ret = (uint64_t)stk::cpu::tsc_elapsed();
        t = t4 - t2;
        ret = ret - rcor;
        ret = ret * 1000;
        if (t!=0) ret = ret / t;
           else ret =0;
        x[i]  =ret;
    }
    for (xmax = x[0], xmin = x[0], imin=0, imax=0, i = 0; i < TIMES; i++) {
         if (x[i] > xmax) {xmax = x[i];imax=i;}
         if (x[i] < xmin) {xmin = x[i];imin=i;}
    }
    for (ret = 0, i = 0; i < TIMES;i++) { if (i!=imin && i!=imax) ret = ret + x[i];
    }
ret = (ret / (TIMES-2)) / 1000000;
s_answer = (uint32_t)ret;
//-----------------------------
ATOMIC_UNLOCK(1)
return (uint32_t)ret;
}
//---------------------------------------------------------------------------

#if defined(__i386__) || defined(_MSC_VER) || (__BORLANDC__ > 0x551)

bool __cdecl stk::cpu::cpu_has_x87(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
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

bool __cdecl stk::cpu::cpu_has_mmx(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<23);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_mmxext(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
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
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_amd64(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_edx & (1<<29);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_ht(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<28);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_has_sse(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_sse4a(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<6);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_has_avx(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_popcnt(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<23);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_f16c(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<29);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_has_cmpxchg(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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

bool __cdecl stk::cpu::cpu_has_vmx(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<5);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_smx(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<6);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_cmov(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<15);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_movbe(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<22);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_has_bmi(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_erms(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<9);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t __cdecl stk::cpu::cpu_has_3dnow(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_3dnowprefetch(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<8);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_perftsc(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_edx & (1<<27);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_sha(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<29);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_xop(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<11);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512f(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<16);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512bw(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<30);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512er(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<27);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512cd(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<28);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512pf(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<26);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512dq(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<17);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512vl(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<31);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512ifma(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<21);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_avx512vbmi(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ecx & (1<<1);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_adx(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<19);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_lzcnt(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<5);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_tbm(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x80000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<21);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_clfsh(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<19);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_pclmulqdq(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<5);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_fxsr(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<24);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_ss(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<27);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_mtrr(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<12);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_msr(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<12);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_tsc(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<4);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_psn(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_edx & (1<<18);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_xsave(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = ((f_ecx & (1<<26))>>26) & ((f_ecx & (1<<27))>>27);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_clmul(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<2);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

uint32_t *__cdecl stk::cpu::cpu_psn(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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

uint32_t __cdecl stk::cpu::cpu_has_fma(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
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
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_aes(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<25);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_viaaes(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0xC0000001,0);
//-----------------------------
s_answer = f_edx & (1<<7);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_viarng(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0xC0000001,0);
//-----------------------------
s_answer = f_edx & (1<<3);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_viahash(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0xC0000001,0);
//-----------------------------
s_answer = f_edx & (1<<11);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_rdseed(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000007L,0);
//-----------------------------
s_answer = f_ebx & (1<<18);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
//---------------------------------------------------------------------------

bool __cdecl stk::cpu::cpu_has_rdrand(void)
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
static uint32_t s_answer = 0xFFFFFFFFL;
if (s_answer!=0xFFFFFFFFL)
    return s_answer!=0;
ATOMIC(1)
ATOMIC_LOCK(1)
uint32_t f_edx, f_ecx, f_ebx, f_eax;
//-----------------------------
cpuidex(&f_eax,&f_ebx,&f_ecx,&f_edx,0x00000001L,0);
//-----------------------------
s_answer = f_ecx & (1<<30);
register bool ret = s_answer!=0;
ATOMIC_UNLOCK(1)
return ret;
}
#endif
//---------------------------------------------------------------------------

#define PRINT_CPUVENDOR(val) stk::con::prints("Vendor \"%s\"\n",val);
#define PRINT_CPUNAME(val) stk::con::prints("Processor name \"%s\"\n",val);
#define PRINT_CPUCURRENTMHZ(val) stk::con::prints("CPU Core Clock is %dMhz\n",val);
#define PRINT_CPUID(val) ret = val; if (ret!=0) stk::con::prints("[SUPPORTED=%02d]%-10s%s\n",ret," ",#val); else stk::con::prints("NOT%21s%s\n"," ",#val);

void __cdecl stk::cpu::cpu_print_info()
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
    uint32_t ret;
    PRINT_CPUVENDOR(stk::cpu::cpu_vendor());
    PRINT_CPUNAME(stk::cpu::cpu_name());
    PRINT_CPUCURRENTMHZ(stk::cpu::cpu_num_mhz(true));
    PRINT_CPUID(stk::cpu::cpu_cache_size(0));
    PRINT_CPUID(stk::cpu::cpu_cache_line_size(0));
    stk::con::prints("Cache L1i, uOPS cache etc. = cache L0 :)\n");
    PRINT_CPUID(stk::cpu::cpu_cache_size(1));
    PRINT_CPUID(stk::cpu::cpu_cache_line_size(1));
    PRINT_CPUID(stk::cpu::cpu_cache_size(2));
    PRINT_CPUID(stk::cpu::cpu_cache_line_size(2));
    PRINT_CPUID(stk::cpu::cpu_cache_size(3));
    PRINT_CPUID(stk::cpu::cpu_cache_line_size(3));
    PRINT_CPUID(stk::cpu::cpu_num_cores());
    PRINT_CPUID(stk::cpu::cpu_num_threads());
#if defined(__i386__) || defined(_MSC_VER) || (__BORLANDC__ > 0x551)
    PRINT_CPUID(stk::cpu::cpu_has_amd64());
    PRINT_CPUID(stk::cpu::cpu_has_ht());
    PRINT_CPUID(stk::cpu::cpu_has_mmx());
    PRINT_CPUID(stk::cpu::cpu_has_mmxext());
    PRINT_CPUID(stk::cpu::cpu_has_3dnow());
    PRINT_CPUID(stk::cpu::cpu_has_3dnowprefetch());
    PRINT_CPUID(stk::cpu::cpu_has_fxsr());
    PRINT_CPUID(stk::cpu::cpu_has_sse());
    PRINT_CPUID(stk::cpu::cpu_has_xsave());
    PRINT_CPUID(stk::cpu::cpu_has_pclmulqdq());
    PRINT_CPUID(stk::cpu::cpu_has_movbe());
    PRINT_CPUID(stk::cpu::cpu_has_fma());
    PRINT_CPUID(stk::cpu::cpu_has_popcnt());
    PRINT_CPUID(stk::cpu::cpu_has_xop());
    PRINT_CPUID(stk::cpu::cpu_has_lzcnt());
    PRINT_CPUID(stk::cpu::cpu_has_f16c());
    PRINT_CPUID(stk::cpu::cpu_has_avx());
    PRINT_CPUID(stk::cpu::cpu_has_avx512f());
    PRINT_CPUID(stk::cpu::cpu_has_avx512bw());
    PRINT_CPUID(stk::cpu::cpu_has_avx512cd());
    PRINT_CPUID(stk::cpu::cpu_has_avx512dq());
    PRINT_CPUID(stk::cpu::cpu_has_avx512er());
    PRINT_CPUID(stk::cpu::cpu_has_avx512pf());
    PRINT_CPUID(stk::cpu::cpu_has_avx512vl());
    PRINT_CPUID(stk::cpu::cpu_has_avx512ifma());
    PRINT_CPUID(stk::cpu::cpu_has_bmi());
    PRINT_CPUID(stk::cpu::cpu_has_avx512vbmi());
    PRINT_CPUID(stk::cpu::cpu_has_cmov());
    PRINT_CPUID(stk::cpu::cpu_has_cmpxchg());
    PRINT_CPUID(stk::cpu::cpu_has_clmul());
    PRINT_CPUID(stk::cpu::cpu_has_aes());
    PRINT_CPUID(stk::cpu::cpu_has_sha());
    PRINT_CPUID(stk::cpu::cpu_has_rdrand());
    PRINT_CPUID(stk::cpu::cpu_has_rdseed());
    PRINT_CPUID(stk::cpu::cpu_has_tsc());
    PRINT_CPUID(stk::cpu::cpu_has_perftsc());
    PRINT_CPUID(stk::cpu::cpu_has_erms());
    PRINT_CPUID(stk::cpu::cpu_has_msr());
    PRINT_CPUID(stk::cpu::cpu_has_mtrr());
    PRINT_CPUID(stk::cpu::cpu_has_vmx());
#endif
}
//---------------------------------------------------------------------------

void __cdecl stk::cpu::cpu_test()
{
//-----------------------------
// common to all compilers and architectures section
//-----------------------------
cpu_print_info();
}

//---------------------------------------------------------------------------

