//---------------------------------------------------------------------------
#ifndef __stk_cpu_h
#define __stk_cpu_h
#pragma once
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace cpu {
//---------------------------------------------------------------------------
extern STK_IMPEXP uint32_t  __cdecl    cpuid(uint32_t *a_eax,uint32_t *a_ebx,uint32_t *a_ecx,uint32_t* a_edx,uint32_t a_feature,uint32_t a_feature_ecx);
extern STK_IMPEXP uint32_t	 __cdecl	cpuidex(uint32_t *a_eax,uint32_t *a_ebx,uint32_t *a_ecx,uint32_t *a_adx,uint32_t a_feature,uint32_t a_feature_ecx);
extern STK_IMPEXP void		 __cdecl	cpu_print_info(void);
extern STK_IMPEXP void		 __cdecl	cpu_test(void);
//---------------------------------------------------------------------------
extern STK_IMPEXP char		*__cdecl    	cpu_vendor(void);
extern STK_IMPEXP char		*__cdecl    cpu_name(void);
extern STK_IMPEXP uint32_t  __cdecl	cpu_num_cores(void);
extern STK_IMPEXP uint32_t  __cdecl	cpu_num_threads(void);
extern STK_IMPEXP uint32_t  __cdecl	cpu_num_mhz(bool a_constant_update);
extern STK_IMPEXP uint32_t *__cdecl    cpu_psn(void);
extern STK_IMPEXP uint32_t  __cdecl	cpu_cache_size(uint8_t a_level);
extern STK_IMPEXP uint32_t  __cdecl	cpu_cache_line_size(uint8_t a_level);
//---------------------------------------------------------------------------
#if defined(__i386__) | defined(__x86_64__)
extern STK_IMPEXP bool 	 __cdecl	cpu_has_x87(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_cmov(void);
extern STK_IMPEXP uint32_t	 __cdecl	cpu_has_cmpxchg(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_mmx(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_mmxext(void);
extern STK_IMPEXP uint32_t	 __cdecl	cpu_has_3dnow(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_3dnowprefetch(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_amd64(void);
extern STK_IMPEXP uint32_t	 __cdecl	cpu_has_sse(void);
extern STK_IMPEXP bool		 __cdecl	cpu_has_sse4a(void);
extern STK_IMPEXP uint32_t	 __cdecl	cpu_has_avx(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512f(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512vbmi(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512bw(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512cd(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512er(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512pf(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512dq(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512vl(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_avx512ifma(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_adx(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_mtrr(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_tsc(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_msr(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_pclmulqdq(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_fxsr(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_ss(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_xsave(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_f16c(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_clmul(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_lzcnt(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_clfsh(void);
extern STK_IMPEXP uint32_t	 __cdecl	cpu_has_fma(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_xop(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_movbe(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_vmx(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_smx(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_popcnt(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_perftsc(void);
extern STK_IMPEXP uint32_t	 __cdecl	cpu_has_bmi(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_tbm(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_erms(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_rdrand(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_rdseed(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_aes(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_sha(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_viaaes(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_viarng(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_viahash(void);
extern STK_IMPEXP bool 	 __cdecl	cpu_has_ht(void);
extern STK_IMPEXP bool		 __cdecl	cpu_has_psn(void);
#endif
//---------------------------------------------------------------------------
/*EAX 1, ->EAX 0-3	Stepping number
4-7	Model number
8-11	Family number
12-13	Processor Type
16-19	Extended Model Number
20-27	Extended Family Number*/
//---------------------------------------------------------------------------
#if !(__BORLANDC__ > 0x551) && !defined(__WATCOMC__)
extern STK_IMPEXP uint64_t  __cdecl    rdtscp(uint32_t *a_chip, uint32_t *a_core);
#endif
extern STK_IMPEXP uint64_t  __cdecl    rdtsc(void);
extern STK_IMPEXP uint64_t	 __cdecl	rdtscex(void);
//---------------------------------------------------------------------------
extern STK_IMPEXP uint64_t  __cdecl	tsc_init(void);
extern STK_IMPEXP uint64_t	 __cdecl	tsc_start(void);
extern STK_IMPEXP uint64_t  __cdecl	tsc_pause(void);
extern STK_IMPEXP uint64_t  __cdecl	tsc_start_paused(void);
extern STK_IMPEXP uint64_t  __cdecl	tsc_resume(void);
extern STK_IMPEXP uint64_t  __cdecl	tsc_checkpoint(void);
extern STK_IMPEXP uint64_t  __cdecl	tsc_elapsed(void);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
