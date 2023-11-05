//---------------------------------------------------------------------------
#ifndef __stk_cpu_h__
#define __stk_cpu_h__
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#if defined(__WATCOMC__) // usupported, RDTSC is surprisingly supported, but not RDTSCPrecise
    #define __CANT_COMPILE_RDTSCP__
    #define __CANT_COMPILE_SFENCE__
#elif (__BORLANDC__) // since version 6 >551
    #if (__BORLANDC__ <= 0x551)
        #define __CANT_COMPILE_RDTSCP__  // this one is optional wont be defined at all
        #define __CANT_COMPILE_SFENCE__
    #endif
#endif
//---------------------------------------------------------------------------
namespace stk { namespace cpu {
//---------------------------------------------------------------------------
/*EAX 1, ->EAX 0-3	Stepping number
4-7	Model number
8-11	Family number
12-13	Processor Type
16-19	Extended Model Number
20-27	Extended Family Number*/
extern uint32_t  __cdecl    cpuid(uint32_t *a_eax,uint32_t *a_ebx,uint32_t *a_ecx,uint32_t* a_edx,uint32_t a_feature,uint32_t a_feature_ecx);
extern uint32_t	 __cdecl	cpuidex(uint32_t *a_eax,uint32_t *a_ebx,uint32_t *a_ecx,uint32_t *a_adx,uint32_t a_feature,uint32_t a_feature_ecx);
extern void	 	 __cdecl	cpu_print_info(void);
extern void	 	 __cdecl	cpu_test(void);
//---------------------------------------------------------------------------
extern char		*__cdecl    cpu_vendor(void);
extern char		*__cdecl    cpu_name(void);
extern uint32_t  __cdecl	cpu_num_cores(void);
extern uint32_t  __cdecl	cpu_num_threads(void);
extern uint32_t  __cdecl	cpu_num_mhz(bool a_constant_update);
extern uint32_t *__cdecl    cpu_psn(void);
extern uint32_t  __cdecl	cpu_cache_size(uint8_t a_level);
extern uint32_t  __cdecl	cpu_cache_line_size(uint8_t a_level);
//---------------------------------------------------------------------------
#if defined(__i386__) | defined(__x86_64__)
extern bool 	 __cdecl	cpu_has_x87(void);
extern bool 	 __cdecl	cpu_has_cmov(void);
extern uint32_t	 __cdecl	cpu_has_cmpxchg(void);
extern bool 	 __cdecl	cpu_has_mmx(void);
extern bool 	 __cdecl	cpu_has_mmxext(void);
extern uint32_t	 __cdecl	cpu_has_3dnow(void);
extern bool 	 __cdecl	cpu_has_3dnowprefetch(void);
extern bool 	 __cdecl	cpu_has_amd64(void);
extern uint32_t	 __cdecl	cpu_has_sse(void);
extern bool	 	 __cdecl	cpu_has_sse4a(void);
extern uint32_t	 __cdecl	cpu_has_avx(void);
extern bool 	 __cdecl	cpu_has_avx512f(void);
extern bool 	 __cdecl	cpu_has_avx512vbmi(void);
extern bool 	 __cdecl	cpu_has_avx512bw(void);
extern bool 	 __cdecl	cpu_has_avx512cd(void);
extern bool 	 __cdecl	cpu_has_avx512er(void);
extern bool 	 __cdecl	cpu_has_avx512pf(void);
extern bool 	 __cdecl	cpu_has_avx512dq(void);
extern bool 	 __cdecl	cpu_has_avx512vl(void);
extern bool 	 __cdecl	cpu_has_avx512ifma(void);
extern bool 	 __cdecl	cpu_has_adx(void);
extern bool 	 __cdecl	cpu_has_mtrr(void);
extern bool 	 __cdecl	cpu_has_tsc(void);
extern bool 	 __cdecl	cpu_has_msr(void);
extern bool 	 __cdecl	cpu_has_pclmulqdq(void);
extern bool 	 __cdecl	cpu_has_fxsr(void);
extern bool 	 __cdecl	cpu_has_ss(void);
extern bool 	 __cdecl	cpu_has_xsave(void);
extern bool 	 __cdecl	cpu_has_f16c(void);
extern bool 	 __cdecl	cpu_has_clmul(void);
extern bool 	 __cdecl	cpu_has_lzcnt(void);
extern bool 	 __cdecl	cpu_has_clfsh(void);
extern uint32_t	 __cdecl	cpu_has_fma(void);
extern bool 	 __cdecl	cpu_has_xop(void);
extern bool 	 __cdecl	cpu_has_movbe(void);
extern bool 	 __cdecl	cpu_has_vmx(void);
extern bool 	 __cdecl	cpu_has_smx(void);
extern bool 	 __cdecl	cpu_has_popcnt(void);
extern bool 	 __cdecl	cpu_has_perftsc(void);
extern uint32_t	 __cdecl	cpu_has_bmi(void);
extern bool 	 __cdecl	cpu_has_tbm(void);
extern bool 	 __cdecl	cpu_has_erms(void);
extern bool 	 __cdecl	cpu_has_rdrand(void);
extern bool 	 __cdecl	cpu_has_rdseed(void);
extern bool 	 __cdecl	cpu_has_aes(void);
extern bool 	 __cdecl	cpu_has_sha(void);
extern bool 	 __cdecl	cpu_has_viaaes(void);
extern bool 	 __cdecl	cpu_has_viarng(void);
extern bool 	 __cdecl	cpu_has_viahash(void);
extern bool 	 __cdecl	cpu_has_ht(void);
extern bool	 	 __cdecl	cpu_has_psn(void);
#endif
//---------------------------------------------------------------------------
extern uint64_t  __cdecl    rdtsc(void);
extern uint64_t	 __cdecl	rdtscex(void);
#if !defined(__CANT_COMPILE_RDTSCP__)
extern uint64_t  __cdecl    rdtscp(uint32_t *a_chip, uint32_t *a_core);
#endif
//---------------------------------------------------------------------------
extern uint64_t  __cdecl	tsc_init(void);
extern uint64_t	 __cdecl	tsc_start(void);
extern uint64_t  __cdecl	tsc_start_paused(void);
extern uint64_t  __cdecl	tsc_pause(void);
extern uint64_t  __cdecl	tsc_resume(void);
extern uint64_t  __cdecl	tsc_checkpoint(void);
extern uint64_t  __cdecl	tsc_elapsed(void);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif



