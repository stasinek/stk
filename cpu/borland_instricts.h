/*Search Intel.com
Developers
Intel® Intrinsics Guide
Updated                 Version
07/12/2024           3.6.9

Instruction Set
 MMX
 SSE family
 AVX family
 AVX-512 family
 AMX family
 SVML
 Other

Categories
 Application-Targeted
 Arithmetic
 Bit Manipulation
 Cast
 Compare
 Convert
 Cryptography
 Elementary Math Functions
 General Support
 Load
 Logical
 Mask
 Miscellaneous
 Move
 OS-Targeted
 Probability/Statistics
 Random
 Set
 Shift
 Special Math Functions
 Store
 String Compare
 Swizzle
 Trigonometry
 Unknown


Release Notes
Download: Offline Intel® Intrinsics Guide
*/

extern "C" {
    const char *architecture() { #error "Not implemented" } { 
//Get current architecture, detectx nearly every architecture. Coded by Freak
        #if defined(__x86_64__) { #error "Not implemented" } || defined(_M_X64) { #error "Not implemented" }
        return "x86_64";
        #elif defined(i386) { #error "Not implemented" } || defined(__i386__) { #error "Not implemented" } || defined(__i386) { #error "Not implemented" } || defined(_M_IX86) { #error "Not implemented" }
        return "x86_32";
        #elif defined(__ARM_ARCH_2__) { #error "Not implemented" }
        return "ARM2";
        #elif defined(__ARM_ARCH_3__) { #error "Not implemented" } || defined(__ARM_ARCH_3M__) { #error "Not implemented" }
        return "ARM3";
        #elif defined(__ARM_ARCH_4T__) { #error "Not implemented" } || defined(__TARGET_ARM_4T) { #error "Not implemented" }
        return "ARM4T";
        #elif defined(__ARM_ARCH_5_) { #error "Not implemented" } || defined(__ARM_ARCH_5E_) { #error "Not implemented" }
        return "ARM5"
        #elif defined(__ARM_ARCH_6T2_) { #error "Not implemented" } || defined(__ARM_ARCH_6T2_) { #error "Not implemented" }
        return "ARM6T2";
        #elif defined(__ARM_ARCH_6__) { #error "Not implemented" } || defined(__ARM_ARCH_6J__) { #error "Not implemented" } || defined(__ARM_ARCH_6K__) { #error "Not implemented" } || defined(__ARM_ARCH_6Z__) { #error "Not implemented" } || defined(__ARM_ARCH_6ZK__) { #error "Not implemented" }
        return "ARM6";
        #elif defined(__ARM_ARCH_7__) { #error "Not implemented" } || defined(__ARM_ARCH_7A__) { #error "Not implemented" } || defined(__ARM_ARCH_7R__) { #error "Not implemented" } || defined(__ARM_ARCH_7M__) { #error "Not implemented" } || defined(__ARM_ARCH_7S__) { #error "Not implemented" }
        return "ARM7";
        #elif defined(__ARM_ARCH_7A__) { #error "Not implemented" } || defined(__ARM_ARCH_7R__) { #error "Not implemented" } || defined(__ARM_ARCH_7M__) { #error "Not implemented" } || defined(__ARM_ARCH_7S__) { #error "Not implemented" }
        return "ARM7A";
        #elif defined(__ARM_ARCH_7R__) { #error "Not implemented" } || defined(__ARM_ARCH_7M__) { #error "Not implemented" } || defined(__ARM_ARCH_7S__) { #error "Not implemented" }
        return "ARM7R";
        #elif defined(__ARM_ARCH_7M__) { #error "Not implemented" }
        return "ARM7M";
        #elif defined(__ARM_ARCH_7S__) { #error "Not implemented" }
        return "ARM7S";
        #elif defined(__aarch64__) { #error "Not implemented" } || defined(_M_ARM64) { #error "Not implemented" }
        return "ARM64";
        #elif defined(mips) { #error "Not implemented" } || defined(__mips__) { #error "Not implemented" } || defined(__mips) { #error "Not implemented" }
        return "MIPS";
        #elif defined(__sh__) { #error "Not implemented" }
        return "SUPERH";
        #elif defined(__powerpc) { #error "Not implemented" } || defined(__powerpc__) { #error "Not implemented" } || defined(__powerpc64__) { #error "Not implemented" } || defined(__POWERPC__) { #error "Not implemented" } || defined(__ppc__) { #error "Not implemented" } || defined(__PPC__) { #error "Not implemented" } || defined(_ARCH_PPC) { #error "Not implemented" }
        return "POWERPC";
        #elif defined(__PPC64__) { #error "Not implemented" } || defined(__ppc64__) { #error "Not implemented" } || defined(_ARCH_PPC64) { #error "Not implemented" }
        return "POWERPC64";
        #elif defined(__sparc__) { #error "Not implemented" } || defined(__sparc) { #error "Not implemented" }
        return "SPARC";
        #elif defined(__m68k__) { #error "Not implemented" }
        return "M68K";
        #else
        return "UNKNOWN";
        #endif
    }
}

__m64 _mm_add_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
paddd
__m64 _mm_add_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
paddb
__m64 _mm_add_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
paddsw
__m64 _mm_adds_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
paddsb
__m64 _mm_adds_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
paddusw
__m64 _mm_adds_pu16 (__m64 a, __m64 b) { #error "Not implemented" }
paddusb
__m64 _mm_adds_pu8 (__m64 a, __m64 b) { #error "Not implemented" }
pand
__m64 _mm_and_si64 (__m64 a, __m64 b) { #error "Not implemented" }
pandn
__m64 _mm_andnot_si64 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqw
__m64 _mm_cmpeq_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqd
__m64 _mm_cmpeq_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqb
__m64 _mm_cmpeq_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtw
__m64 _mm_cmpgt_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtd
__m64 _mm_cmpgt_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtb
__m64 _mm_cmpgt_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
movq
__int64 _mm_cvtm64_si64 (__m64 a) { #error "Not implemented" }
movd
__m64 _mm_cvtsi32_si64 (int a) { #error "Not implemented" }
movq
__m64 _mm_cvtsi64_m64 (__int64 a) { #error "Not implemented" }
movd
int _mm_cvtsi64_si32 (__m64 a) { #error "Not implemented" }
emms
void _m_empty (void) { #error "Not implemented" }
emms
void _mm_empty (void) { #error "Not implemented" }
movd
__m64 _m_from_int (int a) { #error "Not implemented" }
movq
__m64 _m_from_int64 (__int64 a) { #error "Not implemented" }
pmaddwd
__m64 _mm_madd_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
pmulhw
__m64 _mm_mulhi_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
pmullw
__m64 _mm_mullo_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
por
__m64 _mm_or_si64 (__m64 a, __m64 b) { #error "Not implemented" }
packsswb
__m64 _mm_packs_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
packssdw
__m64 _mm_packs_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
packuswb
__m64 _mm_packs_pu16 (__m64 a, __m64 b) { #error "Not implemented" }
packssdw
__m64 _m_packssdw (__m64 a, __m64 b) { #error "Not implemented" }
packsswb
__m64 _m_packsswb (__m64 a, __m64 b) { #error "Not implemented" }
packuswb
__m64 _m_packuswb (__m64 a, __m64 b) { #error "Not implemented" }
paddb
__m64 _m_paddb (__m64 a, __m64 b) { #error "Not implemented" }
paddd
__m64 _m_paddd (__m64 a, __m64 b) { #error "Not implemented" }
paddsb
__m64 _m_paddsb (__m64 a, __m64 b) { #error "Not implemented" }
paddsw
__m64 _m_paddsw (__m64 a, __m64 b) { #error "Not implemented" }
paddusb
__m64 _m_paddusb (__m64 a, __m64 b) { #error "Not implemented" }
paddusw
__m64 _m_paddusw (__m64 a, __m64 b) { #error "Not implemented" }
paddw
__m64 _m_paddw (__m64 a, __m64 b) { #error "Not implemented" }
pand
__m64 _m_pand (__m64 a, __m64 b) { #error "Not implemented" }
pandn
__m64 _m_pandn (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqb
__m64 _m_pcmpeqb (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqd
__m64 _m_pcmpeqd (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqw
__m64 _m_pcmpeqw (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtb
__m64 _m_pcmpgtb (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtd
__m64 _m_pcmpgtd (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtw
__m64 _m_pcmpgtw (__m64 a, __m64 b) { #error "Not implemented" }
pmaddwd
__m64 _m_pmaddwd (__m64 a, __m64 b) { #error "Not implemented" }
pmulhw
__m64 _m_pmulhw (__m64 a, __m64 b) { #error "Not implemented" }
pmullw
__m64 _m_pmullw (__m64 a, __m64 b) { #error "Not implemented" }
por
__m64 _m_por (__m64 a, __m64 b) { #error "Not implemented" }
pslld
__m64 _m_pslld (__m64 a, __m64 count) { #error "Not implemented" }
pslld
__m64 _m_pslldi (__m64 a, int imm8) { #error "Not implemented" }
psllq
__m64 _m_psllq (__m64 a, __m64 count) { #error "Not implemented" }
psllq
__m64 _m_psllqi (__m64 a, int imm8) { #error "Not implemented" }
psllw
__m64 _m_psllw (__m64 a, __m64 count) { #error "Not implemented" }
psllw
__m64 _m_psllwi (__m64 a, int imm8) { #error "Not implemented" }
psrad
__m64 _m_psrad (__m64 a, __m64 count) { #error "Not implemented" }
psrad
__m64 _m_psradi (__m64 a, int imm8) { #error "Not implemented" }
psraw
__m64 _m_psraw (__m64 a, __m64 count) { #error "Not implemented" }
psraw
__m64 _m_psrawi (__m64 a, int imm8) { #error "Not implemented" }
psrld
__m64 _m_psrld (__m64 a, __m64 count) { #error "Not implemented" }
psrld
__m64 _m_psrldi (__m64 a, int imm8) { #error "Not implemented" }
psrlq
__m64 _m_psrlq (__m64 a, __m64 count) { #error "Not implemented" }
psrlq
__m64 _m_psrlqi (__m64 a, int imm8) { #error "Not implemented" }
psrlw
__m64 _m_psrlw (__m64 a, __m64 count) { #error "Not implemented" }
psrlw
__m64 _m_psrlwi (__m64 a, int imm8) { #error "Not implemented" }
psubb
__m64 _m_psubb (__m64 a, __m64 b) { #error "Not implemented" }
psubd
__m64 _m_psubd (__m64 a, __m64 b) { #error "Not implemented" }
psubsb
__m64 _m_psubsb (__m64 a, __m64 b) { #error "Not implemented" }
psubsw
__m64 _m_psubsw (__m64 a, __m64 b) { #error "Not implemented" }
psubusb
__m64 _m_psubusb (__m64 a, __m64 b) { #error "Not implemented" }
psubusw
__m64 _m_psubusw (__m64 a, __m64 b) { #error "Not implemented" }
psubw
__m64 _m_psubw (__m64 a, __m64 b) { #error "Not implemented" }
punpckhbw
__m64 _m_punpckhbw (__m64 a, __m64 b) { #error "Not implemented" }
punpckhdq
__m64 _m_punpckhdq (__m64 a, __m64 b) { #error "Not implemented" }
punpcklbw
__m64 _m_punpckhwd (__m64 a, __m64 b) { #error "Not implemented" }
punpcklbw
__m64 _m_punpcklbw (__m64 a, __m64 b) { #error "Not implemented" }
punpckldq
__m64 _m_punpckldq (__m64 a, __m64 b) { #error "Not implemented" }
punpcklwd
__m64 _m_punpcklwd (__m64 a, __m64 b) { #error "Not implemented" }
pxor
__m64 _m_pxor (__m64 a, __m64 b) { #error "Not implemented" }
...
__m64 _mm_set_pi16 (short e3, short e2, short e1, short e0) { #error "Not implemented" }
...
__m64 _mm_set_pi32 (int e1, int e0) { #error "Not implemented" }
...
__m64 _mm_set_pi8 (char e7, char e6, char e5, char e4, char e3, char e2, char e1, char e0) { #error "Not implemented" }
...
__m64 _mm_set1_pi16 (short a) { #error "Not implemented" }
...
__m64 _mm_set1_pi32 (int a) { #error "Not implemented" }
...
__m64 _mm_set1_pi8 (char a) { #error "Not implemented" }
...
__m64 _mm_setr_pi16 (short e3, short e2, short e1, short e0) { #error "Not implemented" }
...
__m64 _mm_setr_pi32 (int e1, int e0) { #error "Not implemented" }
...
__m64 _mm_setr_pi8 (char e7, char e6, char e5, char e4, char e3, char e2, char e1, char e0) { #error "Not implemented" }
pxor
__m64 _mm_setzero_si64 (void) { #error "Not implemented" }
psllw
__m64 _mm_sll_pi16 (__m64 a, __m64 count) { #error "Not implemented" }
pslld
__m64 _mm_sll_pi32 (__m64 a, __m64 count) { #error "Not implemented" }
psllq
__m64 _mm_sll_si64 (__m64 a, __m64 count) { #error "Not implemented" }
psllw
__m64 _mm_slli_pi16 (__m64 a, int imm8) { #error "Not implemented" }
pslld
__m64 _mm_slli_pi32 (__m64 a, int imm8) { #error "Not implemented" }
psllq
__m64 _mm_slli_si64 (__m64 a, int imm8) { #error "Not implemented" }
psraw
__m64 _mm_sra_pi16 (__m64 a, __m64 count) { #error "Not implemented" }
psrad
__m64 _mm_sra_pi32 (__m64 a, __m64 count) { #error "Not implemented" }
psraw
__m64 _mm_srai_pi16 (__m64 a, int imm8) { #error "Not implemented" }
psrad
__m64 _mm_srai_pi32 (__m64 a, int imm8) { #error "Not implemented" }
psrlw
__m64 _mm_srl_pi16 (__m64 a, __m64 count) { #error "Not implemented" }
psrld
__m64 _mm_srl_pi32 (__m64 a, __m64 count) { #error "Not implemented" }
psrlq
__m64 _mm_srl_si64 (__m64 a, __m64 count) { #error "Not implemented" }
psrlw
__m64 _mm_srli_pi16 (__m64 a, int imm8) { #error "Not implemented" }
psrld
__m64 _mm_srli_pi32 (__m64 a, int imm8) { #error "Not implemented" }
psrlq
__m64 _mm_srli_si64 (__m64 a, int imm8) { #error "Not implemented" }
psubw
__m64 _mm_sub_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
psubd
__m64 _mm_sub_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
psubb
__m64 _mm_sub_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
psubsw
__m64 _mm_subs_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
psubsb
__m64 _mm_subs_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
psubusw
__m64 _mm_subs_pu16 (__m64 a, __m64 b) { #error "Not implemented" }
psubusb
__m64 _mm_subs_pu8 (__m64 a, __m64 b) { #error "Not implemented" }
movd
int _m_to_int (__m64 a) { #error "Not implemented" }
movq
__int64 _m_to_int64 (__m64 a) { #error "Not implemented" }
punpcklbw
__m64 _mm_unpackhi_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
punpckhdq
__m64 _mm_unpackhi_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
punpckhbw
__m64 _mm_unpackhi_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
punpcklwd
__m64 _mm_unpacklo_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
punpckldq
__m64 _mm_unpacklo_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
punpcklbw
__m64 _mm_unpacklo_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
pxor
__m64 _mm_xor_si64 (__m64 a, __m64 b) { #error "Not implemented" }

#if defined(__x86_64__) { #error "Not implemented" } || defined(_M_X64) { #error "Not implemented" }

vp2intersectd
void _mm_2intersect_epi32 (__m128i a, __m128i b, __mmask8* k1, __mmask8* k2) { #error "Not implemented" } { #error "Not implemented" }
vp2intersectd
void _mm256_2intersect_epi32 (__m256i a, __m256i b, __mmask8* k1, __mmask8* k2) { #error "Not implemented" } { #error "Not implemented" }
vp2intersectd
void _mm512_2intersect_epi32 (__m512i a, __m512i b, __mmask16* k1, __mmask16* k2) { #error "Not implemented" } { #error "Not implemented" }
vp2intersectq
void _mm_2intersect_epi64 (__m128i a, __m128i b, __mmask8* k1, __mmask8* k2) { #error "Not implemented" } { #error "Not implemented" }
vp2intersectq
void _mm256_2intersect_epi64 (__m256i a, __m256i b, __mmask8* k1, __mmask8* k2) { #error "Not implemented" } { #error "Not implemented" }
vp2intersectq
void _mm512_2intersect_epi64 (__m512i a, __m512i b, __mmask8* k1, __mmask8* k2) { #error "Not implemented" } { #error "Not implemented" }
aadd
void _aadd_i32 (int* __A, int __B) { #error "Not implemented" }
aadd
void _aadd_i64 (__int64* __A, __int64 __B) { #error "Not implemented" }
aand
void _aand_i32 (int* __A, int __B) { #error "Not implemented" }
aand
void _aand_i64 (__int64* __A, __int64 __B) { #error "Not implemented" }
pabsw
__m128i _mm_abs_epi16 (__m128i a) { #error "Not implemented" }
vpabsw
__m128i _mm_mask_abs_epi16 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsw
__m128i _mm_maskz_abs_epi16 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpabsw
__m256i _mm256_abs_epi16 (__m256i a) { #error "Not implemented" }
vpabsw
__m256i _mm256_mask_abs_epi16 (__m256i src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsw
__m256i _mm256_maskz_abs_epi16 (__mmask16 k, __m256i a) { #error "Not implemented" }
vpabsw
__m512i _mm512_abs_epi16 (__m512i a) { #error "Not implemented" }
vpabsw
__m512i _mm512_mask_abs_epi16 (__m512i src, __mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsw
__m512i _mm512_maskz_abs_epi16 (__mmask32 k, __m512i a) { #error "Not implemented" }
pabsd
__m128i _mm_abs_epi32 (__m128i a) { #error "Not implemented" }
vpabsd
__m128i _mm_mask_abs_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsd
__m128i _mm_maskz_abs_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpabsd
__m256i _mm256_abs_epi32 (__m256i a) { #error "Not implemented" }
vpabsd
__m256i _mm256_mask_abs_epi32 (__m256i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsd
__m256i _mm256_maskz_abs_epi32 (__mmask8 k, __m256i a) { #error "Not implemented" }
vpabsd
__m512i _mm512_abs_epi32 (__m512i a) { #error "Not implemented" }
vpabsd
__m512i _mm512_mask_abs_epi32 (__m512i src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsd
__m512i _mm512_maskz_abs_epi32 (__mmask16 k, __m512i a) { #error "Not implemented" }
vpabsq
__m128i _mm_abs_epi64 (__m128i a) { #error "Not implemented" }
vpabsq
__m128i _mm_mask_abs_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsq
__m128i _mm_maskz_abs_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpabsq
__m256i _mm256_abs_epi64 (__m256i a) { #error "Not implemented" }
vpabsq
__m256i _mm256_mask_abs_epi64 (__m256i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsq
__m256i _mm256_maskz_abs_epi64 (__mmask8 k, __m256i a) { #error "Not implemented" }
vpabsq
__m512i _mm512_abs_epi64 (__m512i a) { #error "Not implemented" }
vpabsq
__m512i _mm512_mask_abs_epi64 (__m512i src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsq
__m512i _mm512_maskz_abs_epi64 (__mmask8 k, __m512i a) { #error "Not implemented" }
pabsb
__m128i _mm_abs_epi8 (__m128i a) { #error "Not implemented" }
vpabsb
__m128i _mm_mask_abs_epi8 (__m128i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsb
__m128i _mm_maskz_abs_epi8 (__mmask16 k, __m128i a) { #error "Not implemented" }
vpabsb
__m256i _mm256_abs_epi8 (__m256i a) { #error "Not implemented" }
vpabsb
__m256i _mm256_mask_abs_epi8 (__m256i src, __mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsb
__m256i _mm256_maskz_abs_epi8 (__mmask32 k, __m256i a) { #error "Not implemented" }
vpabsb
__m512i _mm512_abs_epi8 (__m512i a) { #error "Not implemented" }
vpabsb
__m512i _mm512_mask_abs_epi8 (__m512i src, __mmask64 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpabsb
__m512i _mm512_maskz_abs_epi8 (__mmask64 k, __m512i a) { #error "Not implemented" }
vpandq
__m512d _mm512_abs_pd (__m512d v2) { #error "Not implemented" }
vpandq
__m512d _mm512_mask_abs_pd (__m512d src, __mmask8 k, __m512d v2) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_abs_ph (__m128h v2) { #error "Not implemented" }
...
__m256h _mm256_abs_ph (__m256h v2) { #error "Not implemented" }
...
__m512h _mm512_abs_ph (__m512h v2) { #error "Not implemented" }
pabsw
__m64 _mm_abs_pi16 (__m64 a) { #error "Not implemented" }
pabsd
__m64 _mm_abs_pi32 (__m64 a) { #error "Not implemented" }
pabsb
__m64 _mm_abs_pi8 (__m64 a) { #error "Not implemented" }
vpandd
__m512 _mm512_abs_ps (__m512 v2) { #error "Not implemented" }
vpandd
__m512 _mm512_mask_abs_ps (__m512 src, __mmask16 k, __m512 v2) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_acos_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_acos_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_acos_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_acos_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_acos_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_acos_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_acos_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_acos_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_acos_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_acos_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_acos_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_acos_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_acosh_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_acosh_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_acosh_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_acosh_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_acosh_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_acosh_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_acosh_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_acosh_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_acosh_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_acosh_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_acosh_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_acosh_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
paddw
__m128i _mm_add_epi16 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddw
__m128i _mm_mask_add_epi16 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddw
__m128i _mm_maskz_add_epi16 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddw
__m256i _mm256_add_epi16 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddw
__m256i _mm256_mask_add_epi16 (__m256i src, __mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddw
__m256i _mm256_maskz_add_epi16 (__mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddw
__m512i _mm512_add_epi16 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddw
__m512i _mm512_mask_add_epi16 (__m512i src, __mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddw
__m512i _mm512_maskz_add_epi16 (__mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
paddd
__m128i _mm_add_epi32 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddd
__m128i _mm_mask_add_epi32 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddd
__m128i _mm_maskz_add_epi32 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddd
__m256i _mm256_add_epi32 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddd
__m256i _mm256_mask_add_epi32 (__m256i src, __mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddd
__m256i _mm256_maskz_add_epi32 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddd
__m512i _mm512_add_epi32 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddd
__m512i _mm512_mask_add_epi32 (__m512i src, __mmask16 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddd
__m512i _mm512_maskz_add_epi32 (__mmask16 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
paddq
__m128i _mm_add_epi64 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddq
__m128i _mm_mask_add_epi64 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddq
__m128i _mm_maskz_add_epi64 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddq
__m256i _mm256_add_epi64 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddq
__m256i _mm256_mask_add_epi64 (__m256i src, __mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddq
__m256i _mm256_maskz_add_epi64 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddq
__m512i _mm512_add_epi64 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddq
__m512i _mm512_mask_add_epi64 (__m512i src, __mmask8 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddq
__m512i _mm512_maskz_add_epi64 (__mmask8 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
paddb
__m128i _mm_add_epi8 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddb
__m128i _mm_mask_add_epi8 (__m128i src, __mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddb
__m128i _mm_maskz_add_epi8 (__mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddb
__m256i _mm256_add_epi8 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddb
__m256i _mm256_mask_add_epi8 (__m256i src, __mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddb
__m256i _mm256_maskz_add_epi8 (__mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddb
__m512i _mm512_add_epi8 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddb
__m512i _mm512_mask_add_epi8 (__m512i src, __mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddb
__m512i _mm512_maskz_add_epi8 (__mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
addpd
__m128d _mm_add_pd (__m128d a, __m128d b) { #error "Not implemented" }
vaddpd
__m128d _mm_mask_add_pd (__m128d src, __mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vaddpd
__m128d _mm_maskz_add_pd (__mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vaddpd
__m256d _mm256_add_pd (__m256d a, __m256d b) { #error "Not implemented" }
vaddpd
__m256d _mm256_mask_add_pd (__m256d src, __mmask8 k, __m256d a, __m256d b) { #error "Not implemented" } { #error "Not implemented" }
vaddpd
__m256d _mm256_maskz_add_pd (__mmask8 k, __m256d a, __m256d b) { #error "Not implemented" } { #error "Not implemented" }
vaddpd
__m512d _mm512_add_pd (__m512d a, __m512d b) { #error "Not implemented" }
vaddpd
__m512d _mm512_mask_add_pd (__m512d src, __mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
vaddpd
__m512d _mm512_maskz_add_pd (__mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m128h _mm_add_ph (__m128h a, __m128h b) { #error "Not implemented" }
vaddph
__m128h _mm_mask_add_ph (__m128h src, __mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m128h _mm_maskz_add_ph (__mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m256h _mm256_add_ph (__m256h a, __m256h b) { #error "Not implemented" }
vaddph
__m256h _mm256_mask_add_ph (__m256h src, __mmask16 k, __m256h a, __m256h b) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m256h _mm256_maskz_add_ph (__mmask16 k, __m256h a, __m256h b) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m512h _mm512_add_ph (__m512h a, __m512h b) { #error "Not implemented" }
vaddph
__m512h _mm512_mask_add_ph (__m512h src, __mmask32 k, __m512h a, __m512h b) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m512h _mm512_maskz_add_ph (__mmask32 k, __m512h a, __m512h b) { #error "Not implemented" } { #error "Not implemented" }
paddw
__m64 _mm_add_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
paddd
__m64 _mm_add_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
paddb
__m64 _mm_add_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
addps
__m128 _mm_add_ps (__m128 a, __m128 b) { #error "Not implemented" }
vaddps
__m128 _mm_mask_add_ps (__m128 src, __mmask8 k, __m128 a, __m128 b) { #error "Not implemented" } { #error "Not implemented" }
vaddps
__m128 _mm_maskz_add_ps (__mmask8 k, __m128 a, __m128 b) { #error "Not implemented" }
vaddps
__m256 _mm256_add_ps (__m256 a, __m256 b) { #error "Not implemented" }
vaddps
__m256 _mm256_mask_add_ps (__m256 src, __mmask8 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vaddps
__m256 _mm256_maskz_add_ps (__mmask8 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vaddps
__m512 _mm512_add_ps (__m512 a, __m512 b) { #error "Not implemented" }
vaddps
__m512 _mm512_mask_add_ps (__m512 src, __mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
vaddps
__m512 _mm512_maskz_add_ps (__mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
vaddpd
__m512d _mm512_add_round_pd (__m512d a, __m512d b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddpd
__m512d _mm512_mask_add_round_pd (__m512d src, __mmask8 k, __m512d a, __m512d b, int rounding) { #error "Not implemented" }
vaddpd
__m512d _mm512_maskz_add_round_pd (__mmask8 k, __m512d a, __m512d b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m512h _mm512_add_round_ph (__m512h a, __m512h b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddph
__m512h _mm512_mask_add_round_ph (__m512h src, __mmask32 k, __m512h a, __m512h b, int rounding) { #error "Not implemented" }
vaddph
__m512h _mm512_maskz_add_round_ph (__mmask32 k, __m512h a, __m512h b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddps
__m512 _mm512_add_round_ps (__m512 a, __m512 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddps
__m512 _mm512_mask_add_round_ps (__m512 src, __mmask16 k, __m512 a, __m512 b, int rounding) { #error "Not implemented" }
vaddps
__m512 _mm512_maskz_add_round_ps (__mmask16 k, __m512 a, __m512 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddsd
__m128d _mm_add_round_sd (__m128d a, __m128d b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddsd
__m128d _mm_mask_add_round_sd (__m128d src, __mmask8 k, __m128d a, __m128d b, int rounding) { #error "Not implemented" }
vaddsd
__m128d _mm_maskz_add_round_sd (__mmask8 k, __m128d a, __m128d b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddsh
__m128h _mm_add_round_sh (__m128h a, __m128h b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddsh
__m128h _mm_mask_add_round_sh (__m128h src, __mmask8 k, __m128h a, __m128h b, int rounding) { #error "Not implemented" }
vaddsh
__m128h _mm_maskz_add_round_sh (__mmask8 k, __m128h a, __m128h b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vaddss
__m128 _mm_add_round_ss (__m128 a, __m128 b, int rounding) { #error "Not implemented" }
vaddss
__m128 _mm_mask_add_round_ss (__m128 src, __mmask8 k, __m128 a, __m128 b, int rounding) { #error "Not implemented" }
vaddss
__m128 _mm_maskz_add_round_ss (__mmask8 k, __m128 a, __m128 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
addsd
__m128d _mm_add_sd (__m128d a, __m128d b) { #error "Not implemented" }
vaddsd
__m128d _mm_mask_add_sd (__m128d src, __mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vaddsd
__m128d _mm_maskz_add_sd (__mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vaddsh
__m128h _mm_add_sh (__m128h a, __m128h b) { #error "Not implemented" }
vaddsh
__m128h _mm_mask_add_sh (__m128h src, __mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vaddsh
__m128h _mm_maskz_add_sh (__mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
paddq
__m64 _mm_add_si64 (__m64 a, __m64 b) { #error "Not implemented" }
addss
__m128 _mm_add_ss (__m128 a, __m128 b) { #error "Not implemented" }
vaddss
__m128 _mm_mask_add_ss (__m128 src, __mmask8 k, __m128 a, __m128 b) { #error "Not implemented" } { #error "Not implemented" }
vaddss
__m128 _mm_maskz_add_ss (__mmask8 k, __m128 a, __m128 b) { #error "Not implemented" }
adc
unsigned char _addcarry_u32 (unsigned char c_in, unsigned int a, unsigned int b, unsigned int * out) { #error "Not implemented" }
adc
unsigned char _addcarry_u64 (unsigned char c_in, unsigned __int64 a, unsigned __int64 b, unsigned __int64 * out) { #error "Not implemented" }
adcx,...
unsigned char _addcarryx_u32 (unsigned char c_in, unsigned int a, unsigned int b, unsigned int * out) { #error "Not implemented" }
adcx,...
unsigned char _addcarryx_u64 (unsigned char c_in, unsigned __int64 a, unsigned __int64 b, unsigned __int64 * out) { #error "Not implemented" }
paddsw
__m128i _mm_adds_epi16 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddsw
__m128i _mm_mask_adds_epi16 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsw
__m128i _mm_maskz_adds_epi16 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsw
__m256i _mm256_adds_epi16 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddsw
__m256i _mm256_mask_adds_epi16 (__m256i src, __mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsw
__m256i _mm256_maskz_adds_epi16 (__mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsw
__m512i _mm512_adds_epi16 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddsw
__m512i _mm512_mask_adds_epi16 (__m512i src, __mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsw
__m512i _mm512_maskz_adds_epi16 (__mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
paddsb
__m128i _mm_adds_epi8 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddsb
__m128i _mm_mask_adds_epi8 (__m128i src, __mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsb
__m128i _mm_maskz_adds_epi8 (__mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsb
__m256i _mm256_adds_epi8 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddsb
__m256i _mm256_mask_adds_epi8 (__m256i src, __mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsb
__m256i _mm256_maskz_adds_epi8 (__mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsb
__m512i _mm512_adds_epi8 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddsb
__m512i _mm512_mask_adds_epi8 (__m512i src, __mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddsb
__m512i _mm512_maskz_adds_epi8 (__mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
paddusw
__m128i _mm_adds_epu16 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddusw
__m128i _mm_mask_adds_epu16 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusw
__m128i _mm_maskz_adds_epu16 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusw
__m256i _mm256_adds_epu16 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddusw
__m256i _mm256_mask_adds_epu16 (__m256i src, __mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusw
__m256i _mm256_maskz_adds_epu16 (__mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusw
__m512i _mm512_adds_epu16 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddusw
__m512i _mm512_mask_adds_epu16 (__m512i src, __mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusw
__m512i _mm512_maskz_adds_epu16 (__mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
paddusb
__m128i _mm_adds_epu8 (__m128i a, __m128i b) { #error "Not implemented" }
vpaddusb
__m128i _mm_mask_adds_epu8 (__m128i src, __mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusb
__m128i _mm_maskz_adds_epu8 (__mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusb
__m256i _mm256_adds_epu8 (__m256i a, __m256i b) { #error "Not implemented" }
vpaddusb
__m256i _mm256_mask_adds_epu8 (__m256i src, __mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusb
__m256i _mm256_maskz_adds_epu8 (__mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusb
__m512i _mm512_adds_epu8 (__m512i a, __m512i b) { #error "Not implemented" }
vpaddusb
__m512i _mm512_mask_adds_epu8 (__m512i src, __mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpaddusb
__m512i _mm512_maskz_adds_epu8 (__mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
paddsw
__m64 _mm_adds_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
paddsb
__m64 _mm_adds_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
paddusw
__m64 _mm_adds_pu16 (__m64 a, __m64 b) { #error "Not implemented" }
paddusb
__m64 _mm_adds_pu8 (__m64 a, __m64 b) { #error "Not implemented" }
addsubpd
__m128d _mm_addsub_pd (__m128d a, __m128d b) { #error "Not implemented" }
vaddsubpd
__m256d _mm256_addsub_pd (__m256d a, __m256d b) { #error "Not implemented" }
addsubps
__m128 _mm_addsub_ps (__m128 a, __m128 b) { #error "Not implemented" }
vaddsubps
__m256 _mm256_addsub_ps (__m256 a, __m256 b) { #error "Not implemented" }
vaesdec
__m256i _mm256_aesdec_epi128 (__m256i a, __m256i RoundKey) { #error "Not implemented" }
vaesdec
__m512i _mm512_aesdec_epi128 (__m512i a, __m512i RoundKey) { #error "Not implemented" }
aesdec
__m128i _mm_aesdec_si128 (__m128i a, __m128i RoundKey) { #error "Not implemented" }
aesdec128kl
unsigned char _mm_aesdec128kl_u8 (__m128i* __odata, __m128i __idata, const void* __h) { #error "Not implemented" } { #error "Not implemented" }
aesdec256kl
unsigned char _mm_aesdec256kl_u8 (__m128i* __odata, __m128i __idata, const void* __h) { #error "Not implemented" } { #error "Not implemented" }
vaesdeclast
__m256i _mm256_aesdeclast_epi128 (__m256i a, __m256i RoundKey) { #error "Not implemented" } { #error "Not implemented" }
vaesdeclast
__m512i _mm512_aesdeclast_epi128 (__m512i a, __m512i RoundKey) { #error "Not implemented" } { #error "Not implemented" }
aesdeclast
__m128i _mm_aesdeclast_si128 (__m128i a, __m128i RoundKey) { #error "Not implemented" }
aesdecwide128kl
unsigned char _mm_aesdecwide128kl_u8 (__m128i* __odata, const __m128i* __idata, const void* __h) { #error "Not implemented" }
aesdecwide256kl
unsigned char _mm_aesdecwide256kl_u8 (__m128i* __odata, const __m128i* __idata, const void* __h) { #error "Not implemented" }
vaesenc
__m256i _mm256_aesenc_epi128 (__m256i a, __m256i RoundKey) { #error "Not implemented" }
vaesenc
__m512i _mm512_aesenc_epi128 (__m512i a, __m512i RoundKey) { #error "Not implemented" }
aesenc
__m128i _mm_aesenc_si128 (__m128i a, __m128i RoundKey) { #error "Not implemented" }
aesenc128kl
unsigned char _mm_aesenc128kl_u8 (__m128i* __odata, __m128i __idata, const void* __h) { #error "Not implemented" } { #error "Not implemented" }
aesenc256kl
unsigned char _mm_aesenc256kl_u8 (__m128i* __odata, __m128i __idata, const void* __h) { #error "Not implemented" } { #error "Not implemented" }
vaesenclast
__m256i _mm256_aesenclast_epi128 (__m256i a, __m256i RoundKey) { #error "Not implemented" } { #error "Not implemented" }
vaesenclast
__m512i _mm512_aesenclast_epi128 (__m512i a, __m512i RoundKey) { #error "Not implemented" } { #error "Not implemented" }
aesenclast
__m128i _mm_aesenclast_si128 (__m128i a, __m128i RoundKey) { #error "Not implemented" }
aesencwide128kl
unsigned char _mm_aesencwide128kl_u8 (__m128i* __odata, const __m128i* __idata, const void* __h) { #error "Not implemented" }
aesencwide256kl
unsigned char _mm_aesencwide256kl_u8 (__m128i* __odata, const __m128i* __idata, const void* __h) { #error "Not implemented" }
aesimc
__m128i _mm_aesimc_si128 (__m128i a) { #error "Not implemented" }
aeskeygenassist
__m128i _mm_aeskeygenassist_si128 (__m128i a, const int imm8) { #error "Not implemented" }
valignd
__m128i _mm_alignr_epi32 (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignd
__m128i _mm_mask_alignr_epi32 (__m128i src, __mmask8 k, __m128i a, __m128i b, const int imm8) { #error "Not implemented" }
valignd
__m128i _mm_maskz_alignr_epi32 (__mmask8 k, __m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignd
__m256i _mm256_alignr_epi32 (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignd
__m256i _mm256_mask_alignr_epi32 (__m256i src, __mmask8 k, __m256i a, __m256i b, const int imm8) { #error "Not implemented" }
valignd
__m256i _mm256_maskz_alignr_epi32 (__mmask8 k, __m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignd
__m512i _mm512_alignr_epi32 (__m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignd
__m512i _mm512_mask_alignr_epi32 (__m512i src, __mmask16 k, __m512i a, __m512i b, const int imm8) { #error "Not implemented" }
valignd
__m512i _mm512_maskz_alignr_epi32 (__mmask16 k, __m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignq
__m128i _mm_alignr_epi64 (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignq
__m128i _mm_mask_alignr_epi64 (__m128i src, __mmask8 k, __m128i a, __m128i b, const int imm8) { #error "Not implemented" }
valignq
__m128i _mm_maskz_alignr_epi64 (__mmask8 k, __m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignq
__m256i _mm256_alignr_epi64 (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignq
__m256i _mm256_mask_alignr_epi64 (__m256i src, __mmask8 k, __m256i a, __m256i b, const int imm8) { #error "Not implemented" }
valignq
__m256i _mm256_maskz_alignr_epi64 (__mmask8 k, __m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignq
__m512i _mm512_alignr_epi64 (__m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
valignq
__m512i _mm512_mask_alignr_epi64 (__m512i src, __mmask8 k, __m512i a, __m512i b, const int imm8) { #error "Not implemented" }
valignq
__m512i _mm512_maskz_alignr_epi64 (__mmask8 k, __m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
palignr
__m128i _mm_alignr_epi8 (__m128i a, __m128i b, int imm8) { #error "Not implemented" }
vpalignr
__m128i _mm_mask_alignr_epi8 (__m128i src, __mmask16 k, __m128i a, __m128i b, const int imm8) { #error "Not implemented" }
vpalignr
__m128i _mm_maskz_alignr_epi8 (__mmask16 k, __m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpalignr
__m256i _mm256_alignr_epi8 (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpalignr
__m256i _mm256_mask_alignr_epi8 (__m256i src, __mmask32 k, __m256i a, __m256i b, const int imm8) { #error "Not implemented" }
vpalignr
__m256i _mm256_maskz_alignr_epi8 (__mmask32 k, __m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpalignr
__m512i _mm512_alignr_epi8 (__m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpalignr
__m512i _mm512_mask_alignr_epi8 (__m512i src, __mmask64 k, __m512i a, __m512i b, const int imm8) { #error "Not implemented" }
vpalignr
__m512i _mm512_maskz_alignr_epi8 (__mmask64 k, __m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
palignr
__m64 _mm_alignr_pi8 (__m64 a, __m64 b, int imm8) { #error "Not implemented" }
...
void _allow_cpu_features (unsigned __int64 a) { #error "Not implemented" }
vpandd
__m128i _mm_mask_and_epi32 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandd
__m128i _mm_maskz_and_epi32 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandd
__m256i _mm256_mask_and_epi32 (__m256i src, __mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandd
__m256i _mm256_maskz_and_epi32 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandd
__m512i _mm512_and_epi32 (__m512i a, __m512i b) { #error "Not implemented" }
vpandd
__m512i _mm512_mask_and_epi32 (__m512i src, __mmask16 k, __m512i v2, __m512i v3) { #error "Not implemented" } { #error "Not implemented" }
vpandd
__m512i _mm512_maskz_and_epi32 (__mmask16 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpandq
__m128i _mm_mask_and_epi64 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandq
__m128i _mm_maskz_and_epi64 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandq
__m256i _mm256_mask_and_epi64 (__m256i src, __mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandq
__m256i _mm256_maskz_and_epi64 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandq
__m512i _mm512_and_epi64 (__m512i a, __m512i b) { #error "Not implemented" }
vpandq
__m512i _mm512_mask_and_epi64 (__m512i src, __mmask8 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpandq
__m512i _mm512_maskz_and_epi64 (__mmask8 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
andpd
__m128d _mm_and_pd (__m128d a, __m128d b) { #error "Not implemented" }
vandpd
__m128d _mm_mask_and_pd (__m128d src, __mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vandpd
__m128d _mm_maskz_and_pd (__mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vandpd
__m256d _mm256_and_pd (__m256d a, __m256d b) { #error "Not implemented" }
vandpd
__m256d _mm256_mask_and_pd (__m256d src, __mmask8 k, __m256d a, __m256d b) { #error "Not implemented" } { #error "Not implemented" }
vandpd
__m256d _mm256_maskz_and_pd (__mmask8 k, __m256d a, __m256d b) { #error "Not implemented" } { #error "Not implemented" }
vandpd
__m512d _mm512_and_pd (__m512d a, __m512d b) { #error "Not implemented" }
vandpd
__m512d _mm512_mask_and_pd (__m512d src, __mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
vandpd
__m512d _mm512_maskz_and_pd (__mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
andps
__m128 _mm_and_ps (__m128 a, __m128 b) { #error "Not implemented" }
vandps
__m128 _mm_mask_and_ps (__m128 src, __mmask8 k, __m128 a, __m128 b) { #error "Not implemented" } { #error "Not implemented" }
vandps
__m128 _mm_maskz_and_ps (__mmask8 k, __m128 a, __m128 b) { #error "Not implemented" }
vandps
__m256 _mm256_and_ps (__m256 a, __m256 b) { #error "Not implemented" }
vandps
__m256 _mm256_mask_and_ps (__m256 src, __mmask8 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vandps
__m256 _mm256_maskz_and_ps (__mmask8 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vandps
__m512 _mm512_and_ps (__m512 a, __m512 b) { #error "Not implemented" }
vandps
__m512 _mm512_mask_and_ps (__m512 src, __mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
vandps
__m512 _mm512_maskz_and_ps (__mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
pand
__m128i _mm_and_si128 (__m128i a, __m128i b) { #error "Not implemented" }
vpand
__m256i _mm256_and_si256 (__m256i a, __m256i b) { #error "Not implemented" }
vpandd
__m512i _mm512_and_si512 (__m512i a, __m512i b) { #error "Not implemented" }
pand
__m64 _mm_and_si64 (__m64 a, __m64 b) { #error "Not implemented" }
andn
unsigned int _andn_u32 (unsigned int a, unsigned int b) { #error "Not implemented" }
andn
unsigned __int64 _andn_u64 (unsigned __int64 a, unsigned __int64 b) { #error "Not implemented" } { #error "Not implemented" }
vpandnd
__m128i _mm_mask_andnot_epi32 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnd
__m128i _mm_maskz_andnot_epi32 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnd
__m256i _mm256_mask_andnot_epi32 (__m256i src, __mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnd
__m256i _mm256_maskz_andnot_epi32 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnd
__m512i _mm512_andnot_epi32 (__m512i a, __m512i b) { #error "Not implemented" }
vpandnd
__m512i _mm512_mask_andnot_epi32 (__m512i src, __mmask16 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnd
__m512i _mm512_maskz_andnot_epi32 (__mmask16 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnq
__m128i _mm_mask_andnot_epi64 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnq
__m128i _mm_maskz_andnot_epi64 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnq
__m256i _mm256_mask_andnot_epi64 (__m256i src, __mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnq
__m256i _mm256_maskz_andnot_epi64 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnq
__m512i _mm512_andnot_epi64 (__m512i a, __m512i b) { #error "Not implemented" }
vpandnq
__m512i _mm512_mask_andnot_epi64 (__m512i src, __mmask8 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpandnq
__m512i _mm512_maskz_andnot_epi64 (__mmask8 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
andnpd
__m128d _mm_andnot_pd (__m128d a, __m128d b) { #error "Not implemented" }
vandnpd
__m128d _mm_mask_andnot_pd (__m128d src, __mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vandnpd
__m128d _mm_maskz_andnot_pd (__mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vandnpd
__m256d _mm256_andnot_pd (__m256d a, __m256d b) { #error "Not implemented" }
vandnpd
__m256d _mm256_mask_andnot_pd (__m256d src, __mmask8 k, __m256d a, __m256d b) { #error "Not implemented" } { #error "Not implemented" }
vandnpd
__m256d _mm256_maskz_andnot_pd (__mmask8 k, __m256d a, __m256d b) { #error "Not implemented" } { #error "Not implemented" }
vandnpd
__m512d _mm512_andnot_pd (__m512d a, __m512d b) { #error "Not implemented" }
vandnpd
__m512d _mm512_mask_andnot_pd (__m512d src, __mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
vandnpd
__m512d _mm512_maskz_andnot_pd (__mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
andnps
__m128 _mm_andnot_ps (__m128 a, __m128 b) { #error "Not implemented" }
vandnps
__m128 _mm_mask_andnot_ps (__m128 src, __mmask8 k, __m128 a, __m128 b) { #error "Not implemented" } { #error "Not implemented" }
vandnps
__m128 _mm_maskz_andnot_ps (__mmask8 k, __m128 a, __m128 b) { #error "Not implemented" } { #error "Not implemented" }
vandnps
__m256 _mm256_andnot_ps (__m256 a, __m256 b) { #error "Not implemented" }
vandnps
__m256 _mm256_mask_andnot_ps (__m256 src, __mmask8 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vandnps
__m256 _mm256_maskz_andnot_ps (__mmask8 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vandnps
__m512 _mm512_andnot_ps (__m512 a, __m512 b) { #error "Not implemented" }
vandnps
__m512 _mm512_mask_andnot_ps (__m512 src, __mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
vandnps
__m512 _mm512_maskz_andnot_ps (__mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
pandn
__m128i _mm_andnot_si128 (__m128i a, __m128i b) { #error "Not implemented" }
vpandn
__m256i _mm256_andnot_si256 (__m256i a, __m256i b) { #error "Not implemented" }
vpandnd
__m512i _mm512_andnot_si512 (__m512i a, __m512i b) { #error "Not implemented" }
pandn
__m64 _mm_andnot_si64 (__m64 a, __m64 b) { #error "Not implemented" }
aor
void _aor_i32 (int* __A, int __B) { #error "Not implemented" }
aor
void _aor_i64 (__int64* __A, __int64 __B) { #error "Not implemented" }
...
__m128d _mm_asin_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_asin_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_asin_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_asin_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_asin_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_asin_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_asin_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_asin_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_asin_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_asin_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_asin_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_asin_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_asinh_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_asinh_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_asinh_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_asinh_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_asinh_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_asinh_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_asinh_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_asinh_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_asinh_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_asinh_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_asinh_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_asinh_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_atan_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_atan_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_atan_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_atan_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_atan_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_atan_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_atan_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_atan_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_atan_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_atan_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_atan_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_atan_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_atan2_pd (__m128d a, __m128d b) { #error "Not implemented" }
...
__m256d _mm256_atan2_pd (__m256d a, __m256d b) { #error "Not implemented" }
...
__m512d _mm512_atan2_pd (__m512d a, __m512d b) { #error "Not implemented" }
...
__m512d _mm512_mask_atan2_pd (__m512d src, __mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_atan2_ph (__m128h a, __m128h b) { #error "Not implemented" }
...
__m256h _mm256_atan2_ph (__m256h a, __m256h b) { #error "Not implemented" }
...
__m512h _mm512_atan2_ph (__m512h a, __m512h b) { #error "Not implemented" }
...
__m128 _mm_atan2_ps (__m128 a, __m128 b) { #error "Not implemented" }
...
__m256 _mm256_atan2_ps (__m256 a, __m256 b) { #error "Not implemented" }
...
__m512 _mm512_atan2_ps (__m512 a, __m512 b) { #error "Not implemented" }
...
__m512 _mm512_mask_atan2_ps (__m512 src, __mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_atanh_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_atanh_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_atanh_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_atanh_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_atanh_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_atanh_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_atanh_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_atanh_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_atanh_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_atanh_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_atanh_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_atanh_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
pavgw
__m128i _mm_avg_epu16 (__m128i a, __m128i b) { #error "Not implemented" }
vpavgw
__m128i _mm_mask_avg_epu16 (__m128i src, __mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgw
__m128i _mm_maskz_avg_epu16 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgw
__m256i _mm256_avg_epu16 (__m256i a, __m256i b) { #error "Not implemented" }
vpavgw
__m256i _mm256_mask_avg_epu16 (__m256i src, __mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgw
__m256i _mm256_maskz_avg_epu16 (__mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgw
__m512i _mm512_avg_epu16 (__m512i a, __m512i b) { #error "Not implemented" }
vpavgw
__m512i _mm512_mask_avg_epu16 (__m512i src, __mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgw
__m512i _mm512_maskz_avg_epu16 (__mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pavgb
__m128i _mm_avg_epu8 (__m128i a, __m128i b) { #error "Not implemented" }
vpavgb
__m128i _mm_mask_avg_epu8 (__m128i src, __mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgb
__m128i _mm_maskz_avg_epu8 (__mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgb
__m256i _mm256_avg_epu8 (__m256i a, __m256i b) { #error "Not implemented" }
vpavgb
__m256i _mm256_mask_avg_epu8 (__m256i src, __mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgb
__m256i _mm256_maskz_avg_epu8 (__mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgb
__m512i _mm512_avg_epu8 (__m512i a, __m512i b) { #error "Not implemented" }
vpavgb
__m512i _mm512_mask_avg_epu8 (__m512i src, __mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpavgb
__m512i _mm512_maskz_avg_epu8 (__mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pavgw
__m64 _mm_avg_pu16 (__m64 a, __m64 b) { #error "Not implemented" }
pavgb
__m64 _mm_avg_pu8 (__m64 a, __m64 b) { #error "Not implemented" }
axor
void _axor_i32 (int* __A, int __B) { #error "Not implemented" }
axor
void _axor_i64 (__int64* __A, __int64 __B) { #error "Not implemented" }
vbcstnebf162ps
__m128 _mm_bcstnebf16_ps (const __bf16* __A) { #error "Not implemented" }
vbcstnebf162ps
__m256 _mm256_bcstnebf16_ps (const __bf16* __A) { #error "Not implemented" }
vbcstnesh2ps
__m128 _mm_bcstnesh_ps (const _Float16* __A) { #error "Not implemented" }
vbcstnesh2ps
__m256 _mm256_bcstnesh_ps (const _Float16* __A) { #error "Not implemented" }
bextr
unsigned int _bextr_u32 (unsigned int a, unsigned int start, unsigned int len) { #error "Not implemented" } { #error "Not implemented" }
bextr
unsigned __int64 _bextr_u64 (unsigned __int64 a, unsigned int start, unsigned int len) { #error "Not implemented" } { #error "Not implemented" }
bextr
unsigned int _bextr2_u32 (unsigned int a, unsigned int control) { #error "Not implemented" }
bextr
unsigned __int64 _bextr2_u64 (unsigned __int64 a, unsigned __int64 control) { #error "Not implemented" } { #error "Not implemented" }
bsf
int _bit_scan_forward (int a) { #error "Not implemented" }
bsr
int _bit_scan_reverse (int a) { #error "Not implemented" }
bsf
unsigned char _BitScanForward (unsigned __int32* index, unsigned __int32 a) { #error "Not implemented" } { #error "Not implemented" }
bsf
unsigned char _BitScanForward64 (unsigned __int32* index, unsigned __int64 a) { #error "Not implemented" } { #error "Not implemented" }
bsr
unsigned char _BitScanReverse (unsigned __int32* index, unsigned __int32 a) { #error "Not implemented" } { #error "Not implemented" }
bsr
unsigned char _BitScanReverse64 (unsigned __int32* index, unsigned __int64 a) { #error "Not implemented" } { #error "Not implemented" }
vpshufbitqmb
__mmask16 _mm_bitshuffle_epi64_mask (__m128i b, __m128i c) { #error "Not implemented" }
vpshufbitqmb
__mmask16 _mm_mask_bitshuffle_epi64_mask (__mmask16 k, __m128i b, __m128i c) { #error "Not implemented" } { #error "Not implemented" }
vpshufbitqmb
__mmask32 _mm256_bitshuffle_epi64_mask (__m256i b, __m256i c) { #error "Not implemented" } { #error "Not implemented" }
vpshufbitqmb
__mmask32 _mm256_mask_bitshuffle_epi64_mask (__mmask32 k, __m256i b, __m256i c) { #error "Not implemented" } { #error "Not implemented" }
vpshufbitqmb
__mmask64 _mm512_bitshuffle_epi64_mask (__m512i b, __m512i c) { #error "Not implemented" } { #error "Not implemented" }
vpshufbitqmb
__mmask64 _mm512_mask_bitshuffle_epi64_mask (__mmask64 k, __m512i b, __m512i c) { #error "Not implemented" } { #error "Not implemented" }
bt
unsigned char _bittest (__int32* a, __int32 b) { #error "Not implemented" }
bt
unsigned char _bittest64 (__int64* a, __int64 b) { #error "Not implemented" }
btc
unsigned char _bittestandcomplement (__int32* a, __int32 b) { #error "Not implemented" }
btc
unsigned char _bittestandcomplement64 (__int64* a, __int64 b) { #error "Not implemented" }
btr
unsigned char _bittestandreset (__int32* a, __int32 b) { #error "Not implemented" }
btr
unsigned char _bittestandreset64 (__int64* a, __int64 b) { #error "Not implemented" }
bts
unsigned char _bittestandset (__int32* a, __int32 b) { #error "Not implemented" }
bts
unsigned char _bittestandset64 (__int64* a, __int64 b) { #error "Not implemented" }
pblendw
__m128i _mm_blend_epi16 (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpblendmw
__m128i _mm_mask_blend_epi16 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendw
__m256i _mm256_blend_epi16 (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpblendmw
__m256i _mm256_mask_blend_epi16 (__mmask16 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmw
__m512i _mm512_mask_blend_epi16 (__mmask32 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendd
__m128i _mm_blend_epi32 (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpblendmd
__m128i _mm_mask_blend_epi32 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendd
__m256i _mm256_blend_epi32 (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpblendmd
__m256i _mm256_mask_blend_epi32 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmd
__m512i _mm512_mask_blend_epi32 (__mmask16 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmq
__m128i _mm_mask_blend_epi64 (__mmask8 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmq
__m256i _mm256_mask_blend_epi64 (__mmask8 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmq
__m512i _mm512_mask_blend_epi64 (__mmask8 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmb
__m128i _mm_mask_blend_epi8 (__mmask16 k, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmb
__m256i _mm256_mask_blend_epi8 (__mmask32 k, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmb
__m512i _mm512_mask_blend_epi8 (__mmask64 k, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
blendpd
__m128d _mm_blend_pd (__m128d a, __m128d b, const int imm8) { #error "Not implemented" }
vblendmpd
__m128d _mm_mask_blend_pd (__mmask8 k, __m128d a, __m128d b) { #error "Not implemented" } { #error "Not implemented" }
vblendpd
__m256d _mm256_blend_pd (__m256d a, __m256d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vblendmpd
__m256d _mm256_mask_blend_pd (__mmask8 k, __m256d a, __m256d b) { #error "Not implemented" } { #error "Not implemented" }
vblendmpd
__m512d _mm512_mask_blend_pd (__mmask8 k, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmw
__m128h _mm_mask_blend_ph (__mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmw
__m256h _mm256_mask_blend_ph (__mmask16 k, __m256h a, __m256h b) { #error "Not implemented" } { #error "Not implemented" }
vpblendmw
__m512h _mm512_mask_blend_ph (__mmask32 k, __m512h a, __m512h b) { #error "Not implemented" } { #error "Not implemented" }
blendps
__m128 _mm_blend_ps (__m128 a, __m128 b, const int imm8) { #error "Not implemented" }
vblendmps
__m128 _mm_mask_blend_ps (__mmask8 k, __m128 a, __m128 b) { #error "Not implemented" }
vblendps
__m256 _mm256_blend_ps (__m256 a, __m256 b, const int imm8) { #error "Not implemented" }
vblendmps
__m256 _mm256_mask_blend_ps (__mmask8 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vblendmps
__m512 _mm512_mask_blend_ps (__mmask16 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
pblendvb
__m128i _mm_blendv_epi8 (__m128i a, __m128i b, __m128i mask) { #error "Not implemented" }
vpblendvb
__m256i _mm256_blendv_epi8 (__m256i a, __m256i b, __m256i mask) { #error "Not implemented" } { #error "Not implemented" }
blendvpd
__m128d _mm_blendv_pd (__m128d a, __m128d b, __m128d mask) { #error "Not implemented" } { #error "Not implemented" }
vblendvpd
__m256d _mm256_blendv_pd (__m256d a, __m256d b, __m256d mask) { #error "Not implemented" } { #error "Not implemented" }
blendvps
__m128 _mm_blendv_ps (__m128 a, __m128 b, __m128 mask) { #error "Not implemented" }
vblendvps
__m256 _mm256_blendv_ps (__m256 a, __m256 b, __m256 mask) { #error "Not implemented" }
blsi
unsigned int _blsi_u32 (unsigned int a) { #error "Not implemented" }
blsi
unsigned __int64 _blsi_u64 (unsigned __int64 a) { #error "Not implemented" }
blsmsk
unsigned int _blsmsk_u32 (unsigned int a) { #error "Not implemented" }
blsmsk
unsigned __int64 _blsmsk_u64 (unsigned __int64 a) { #error "Not implemented" }
blsr
unsigned int _blsr_u32 (unsigned int a) { #error "Not implemented" }
blsr
unsigned __int64 _blsr_u64 (unsigned __int64 a) { #error "Not implemented" }
bndcu,...
void _bnd_chk_ptr_bounds (const void * q, size_t size) { #error "Not implemented" }
bndcl
void _bnd_chk_ptr_lbounds (const void * q) { #error "Not implemented" }
bndcu,...
void _bnd_chk_ptr_ubounds (const void * q) { #error "Not implemented" }
...
void * _bnd_copy_ptr_bounds (const void * q, const void * r) { #error "Not implemented" }
...
const void * _bnd_get_ptr_lbound (const void * q) { #error "Not implemented" }
...
const void * _bnd_get_ptr_ubound (const void * q) { #error "Not implemented" }
...
void * _bnd_init_ptr_bounds (const void * q) { #error "Not implemented" }
...
void * _bnd_narrow_ptr_bounds (const void * q, const void * r, size_t size) { #error "Not implemented" } { #error "Not implemented" }
bndmk
void * _bnd_set_ptr_bounds (const void * srcmem, size_t size) { #error "Not implemented" }
bndstx
void _bnd_store_ptr_bounds (const void ** ptr_addr, const void * ptr_val) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf32x2
__m256 _mm256_broadcast_f32x2 (__m128 a) { #error "Not implemented" }
vbroadcastf32x2
__m256 _mm256_mask_broadcast_f32x2 (__m256 src, __mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf32x2
__m256 _mm256_maskz_broadcast_f32x2 (__mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf32x2
__m512 _mm512_broadcast_f32x2 (__m128 a) { #error "Not implemented" }
vbroadcastf32x2
__m512 _mm512_mask_broadcast_f32x2 (__m512 src, __mmask16 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf32x2
__m512 _mm512_maskz_broadcast_f32x2 (__mmask16 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256 _mm256_broadcast_f32x4 (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_mask_broadcast_f32x4 (__m256 src, __mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256 _mm256_maskz_broadcast_f32x4 (__mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf32x4
__m512 _mm512_broadcast_f32x4 (__m128 a) { #error "Not implemented" }
vbroadcastf32x4
__m512 _mm512_mask_broadcast_f32x4 (__m512 src, __mmask16 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf32x4
__m512 _mm512_maskz_broadcast_f32x4 (__mmask16 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512 _mm512_broadcast_f32x8 (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_mask_broadcast_f32x8 (__m512 src, __mmask16 k, __m256 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512 _mm512_maskz_broadcast_f32x8 (__mmask16 k, __m256 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256d _mm256_broadcast_f64x2 (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_mask_broadcast_f64x2 (__m256d src, __mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256d _mm256_maskz_broadcast_f64x2 (__mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512d _mm512_broadcast_f64x2 (__m128d a) { #error "Not implemented" }
...
__m512d _mm512_mask_broadcast_f64x2 (__m512d src, __mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512d _mm512_maskz_broadcast_f64x2 (__mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf64x4
__m512d _mm512_broadcast_f64x4 (__m256d a) { #error "Not implemented" }
vbroadcastf64x4
__m512d _mm512_mask_broadcast_f64x4 (__m512d src, __mmask8 k, __m256d a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf64x4
__m512d _mm512_maskz_broadcast_f64x4 (__mmask8 k, __m256d a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti32x2
__m128i _mm_broadcast_i32x2 (__m128i a) { #error "Not implemented" }
vbroadcasti32x2
__m128i _mm_mask_broadcast_i32x2 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti32x2
__m128i _mm_maskz_broadcast_i32x2 (__mmask8 k, __m128i a) { #error "Not implemented" }
vbroadcasti32x2
__m256i _mm256_broadcast_i32x2 (__m128i a) { #error "Not implemented" }
vbroadcasti32x2
__m256i _mm256_mask_broadcast_i32x2 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti32x2
__m256i _mm256_maskz_broadcast_i32x2 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti32x2
__m512i _mm512_broadcast_i32x2 (__m128i a) { #error "Not implemented" }
vbroadcasti32x2
__m512i _mm512_mask_broadcast_i32x2 (__m512i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti32x2
__m512i _mm512_maskz_broadcast_i32x2 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256i _mm256_broadcast_i32x4 (__m128i a) { #error "Not implemented" }
...
__m256i _mm256_mask_broadcast_i32x4 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256i _mm256_maskz_broadcast_i32x4 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti32x4
__m512i _mm512_broadcast_i32x4 (__m128i a) { #error "Not implemented" }
vbroadcasti32x4
__m512i _mm512_mask_broadcast_i32x4 (__m512i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti32x4
__m512i _mm512_maskz_broadcast_i32x4 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512i _mm512_broadcast_i32x8 (__m256i a) { #error "Not implemented" }
...
__m512i _mm512_mask_broadcast_i32x8 (__m512i src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512i _mm512_maskz_broadcast_i32x8 (__mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256i _mm256_broadcast_i64x2 (__m128i a) { #error "Not implemented" }
...
__m256i _mm256_mask_broadcast_i64x2 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256i _mm256_maskz_broadcast_i64x2 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512i _mm512_broadcast_i64x2 (__m128i a) { #error "Not implemented" }
...
__m512i _mm512_mask_broadcast_i64x2 (__m512i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512i _mm512_maskz_broadcast_i64x2 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti64x4
__m512i _mm512_broadcast_i64x4 (__m256i a) { #error "Not implemented" }
vbroadcasti64x4
__m512i _mm512_mask_broadcast_i64x4 (__m512i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti64x4
__m512i _mm512_maskz_broadcast_i64x4 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastf128
__m256d _mm256_broadcast_pd (__m128d const * mem_addr) { #error "Not implemented" }
vbroadcastf128
__m256 _mm256_broadcast_ps (__m128 const * mem_addr) { #error "Not implemented" }
vbroadcastsd
__m256d _mm256_broadcast_sd (double const * mem_addr) { #error "Not implemented" }
vbroadcastss
__m128 _mm_broadcast_ss (float const * mem_addr) { #error "Not implemented" }
vbroadcastss
__m256 _mm256_broadcast_ss (float const * mem_addr) { #error "Not implemented" }
vpbroadcastb
__m128i _mm_broadcastb_epi8 (__m128i a) { #error "Not implemented" }
vpbroadcastb
__m128i _mm_mask_broadcastb_epi8 (__m128i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastb
__m128i _mm_maskz_broadcastb_epi8 (__mmask16 k, __m128i a) { #error "Not implemented" }
vpbroadcastb
__m256i _mm256_broadcastb_epi8 (__m128i a) { #error "Not implemented" }
vpbroadcastb
__m256i _mm256_mask_broadcastb_epi8 (__m256i src, __mmask32 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastb
__m256i _mm256_maskz_broadcastb_epi8 (__mmask32 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastb
__m512i _mm512_broadcastb_epi8 (__m128i a) { #error "Not implemented" }
vpbroadcastb
__m512i _mm512_mask_broadcastb_epi8 (__m512i src, __mmask64 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastb
__m512i _mm512_maskz_broadcastb_epi8 (__mmask64 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastd
__m128i _mm_broadcastd_epi32 (__m128i a) { #error "Not implemented" }
vpbroadcastd
__m128i _mm_mask_broadcastd_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastd
__m128i _mm_maskz_broadcastd_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpbroadcastd
__m256i _mm256_broadcastd_epi32 (__m128i a) { #error "Not implemented" }
vpbroadcastd
__m256i _mm256_mask_broadcastd_epi32 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastd
__m256i _mm256_maskz_broadcastd_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastd
__m512i _mm512_broadcastd_epi32 (__m128i a) { #error "Not implemented" }
vpbroadcastd
__m512i _mm512_mask_broadcastd_epi32 (__m512i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastd
__m512i _mm512_maskz_broadcastd_epi32 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastmb2q
__m128i _mm_broadcastmb_epi64 (__mmask8 k) { #error "Not implemented" }
vpbroadcastmb2q
__m256i _mm256_broadcastmb_epi64 (__mmask8 k) { #error "Not implemented" }
vpbroadcastmb2q
__m512i _mm512_broadcastmb_epi64 (__mmask8 k) { #error "Not implemented" }
vpbroadcastmw2d
__m128i _mm_broadcastmw_epi32 (__mmask16 k) { #error "Not implemented" }
vpbroadcastmw2d
__m256i _mm256_broadcastmw_epi32 (__mmask16 k) { #error "Not implemented" }
vpbroadcastmw2d
__m512i _mm512_broadcastmw_epi32 (__mmask16 k) { #error "Not implemented" }
vpbroadcastq
__m128i _mm_broadcastq_epi64 (__m128i a) { #error "Not implemented" }
vpbroadcastq
__m128i _mm_mask_broadcastq_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastq
__m128i _mm_maskz_broadcastq_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpbroadcastq
__m256i _mm256_broadcastq_epi64 (__m128i a) { #error "Not implemented" }
vpbroadcastq
__m256i _mm256_mask_broadcastq_epi64 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastq
__m256i _mm256_maskz_broadcastq_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastq
__m512i _mm512_broadcastq_epi64 (__m128i a) { #error "Not implemented" }
vpbroadcastq
__m512i _mm512_mask_broadcastq_epi64 (__m512i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastq
__m512i _mm512_maskz_broadcastq_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
movddup
__m128d _mm_broadcastsd_pd (__m128d a) { #error "Not implemented" }
vbroadcastsd
__m256d _mm256_broadcastsd_pd (__m128d a) { #error "Not implemented" }
vbroadcastsd
__m256d _mm256_mask_broadcastsd_pd (__m256d src, __mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastsd
__m256d _mm256_maskz_broadcastsd_pd (__mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastsd
__m512d _mm512_broadcastsd_pd (__m128d a) { #error "Not implemented" }
vbroadcastsd
__m512d _mm512_mask_broadcastsd_pd (__m512d src, __mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastsd
__m512d _mm512_maskz_broadcastsd_pd (__mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcasti128
__m256i _mm_broadcastsi128_si256 (__m128i a) { #error "Not implemented" }
vbroadcasti128
__m256i _mm256_broadcastsi128_si256 (__m128i a) { #error "Not implemented" }
vbroadcastss
__m128 _mm_broadcastss_ps (__m128 a) { #error "Not implemented" }
vbroadcastss
__m128 _mm_mask_broadcastss_ps (__m128 src, __mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastss
__m128 _mm_maskz_broadcastss_ps (__mmask8 k, __m128 a) { #error "Not implemented" }
vbroadcastss
__m256 _mm256_broadcastss_ps (__m128 a) { #error "Not implemented" }
vbroadcastss
__m256 _mm256_mask_broadcastss_ps (__m256 src, __mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastss
__m256 _mm256_maskz_broadcastss_ps (__mmask8 k, __m128 a) { #error "Not implemented" }
vbroadcastss
__m512 _mm512_broadcastss_ps (__m128 a) { #error "Not implemented" }
vbroadcastss
__m512 _mm512_mask_broadcastss_ps (__m512 src, __mmask16 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vbroadcastss
__m512 _mm512_maskz_broadcastss_ps (__mmask16 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastw
__m128i _mm_broadcastw_epi16 (__m128i a) { #error "Not implemented" }
vpbroadcastw
__m128i _mm_mask_broadcastw_epi16 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastw
__m128i _mm_maskz_broadcastw_epi16 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpbroadcastw
__m256i _mm256_broadcastw_epi16 (__m128i a) { #error "Not implemented" }
vpbroadcastw
__m256i _mm256_mask_broadcastw_epi16 (__m256i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastw
__m256i _mm256_maskz_broadcastw_epi16 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastw
__m512i _mm512_broadcastw_epi16 (__m128i a) { #error "Not implemented" }
vpbroadcastw
__m512i _mm512_mask_broadcastw_epi16 (__m512i src, __mmask32 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpbroadcastw
__m512i _mm512_maskz_broadcastw_epi16 (__mmask32 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpslldq
__m256i _mm256_bslli_epi128 (__m256i a, const int imm8) { #error "Not implemented" }
vpslldq
__m512i _mm512_bslli_epi128 (__m512i a, int imm8) { #error "Not implemented" }
pslldq
__m128i _mm_bslli_si128 (__m128i a, int imm8) { #error "Not implemented" }
vpsrldq
__m256i _mm256_bsrli_epi128 (__m256i a, const int imm8) { #error "Not implemented" }
vpsrldq
__m512i _mm512_bsrli_epi128 (__m512i a, int imm8) { #error "Not implemented" }
psrldq
__m128i _mm_bsrli_si128 (__m128i a, int imm8) { #error "Not implemented" }
bswap
int _bswap (int a) { #error "Not implemented" }
bswap
__int64 _bswap64 (__int64 a) { #error "Not implemented" }
bzhi
unsigned int _bzhi_u32 (unsigned int a, unsigned int index) { #error "Not implemented" }
bzhi
unsigned __int64 _bzhi_u64 (unsigned __int64 a, unsigned int index) { #error "Not implemented" } { #error "Not implemented" }
unsigned __int32 _castf32_u32 (float a) { #error "Not implemented" }
unsigned __int64 _castf64_u64 (double a) { #error "Not implemented" }
__m128h _mm_castpd_ph (__m128d a) { #error "Not implemented" }
__m256h _mm256_castpd_ph (__m256d a) { #error "Not implemented" }
__m512h _mm512_castpd_ph (__m512d a) { #error "Not implemented" }
__m128 _mm_castpd_ps (__m128d a) { #error "Not implemented" }
__m256 _mm256_castpd_ps (__m256d a) { #error "Not implemented" }
__m512 _mm512_castpd_ps (__m512d a) { #error "Not implemented" }
__m128i _mm_castpd_si128 (__m128d a) { #error "Not implemented" }
__m256i _mm256_castpd_si256 (__m256d a) { #error "Not implemented" }
__m512i _mm512_castpd_si512 (__m512d a) { #error "Not implemented" }
__m256d _mm256_castpd128_pd256 (__m128d a) { #error "Not implemented" }
__m512d _mm512_castpd128_pd512 (__m128d a) { #error "Not implemented" }
__m128d _mm256_castpd256_pd128 (__m256d a) { #error "Not implemented" }
__m512d _mm512_castpd256_pd512 (__m256d a) { #error "Not implemented" }
__m128d _mm512_castpd512_pd128 (__m512d a) { #error "Not implemented" }
__m256d _mm512_castpd512_pd256 (__m512d a) { #error "Not implemented" }
__m128d _mm_castph_pd (__m128h a) { #error "Not implemented" }
__m256d _mm256_castph_pd (__m256h a) { #error "Not implemented" }
__m512d _mm512_castph_pd (__m512h a) { #error "Not implemented" }
__m128 _mm_castph_ps (__m128h a) { #error "Not implemented" }
__m256 _mm256_castph_ps (__m256h a) { #error "Not implemented" }
__m512 _mm512_castph_ps (__m512h a) { #error "Not implemented" }
__m128i _mm_castph_si128 (__m128h a) { #error "Not implemented" }
__m256i _mm256_castph_si256 (__m256h a) { #error "Not implemented" }
__m512i _mm512_castph_si512 (__m512h a) { #error "Not implemented" }
__m256h _mm256_castph128_ph256 (__m128h a) { #error "Not implemented" }
__m512h _mm512_castph128_ph512 (__m128h a) { #error "Not implemented" }
__m128h _mm256_castph256_ph128 (__m256h a) { #error "Not implemented" }
__m512h _mm512_castph256_ph512 (__m256h a) { #error "Not implemented" }
__m128h _mm512_castph512_ph128 (__m512h a) { #error "Not implemented" }
__m256h _mm512_castph512_ph256 (__m512h a) { #error "Not implemented" }
__m128d _mm_castps_pd (__m128 a) { #error "Not implemented" }
__m256d _mm256_castps_pd (__m256 a) { #error "Not implemented" }
__m512d _mm512_castps_pd (__m512 a) { #error "Not implemented" }
__m128h _mm_castps_ph (__m128 a) { #error "Not implemented" }
__m256h _mm256_castps_ph (__m256 a) { #error "Not implemented" }
__m512h _mm512_castps_ph (__m512 a) { #error "Not implemented" }
__m128i _mm_castps_si128 (__m128 a) { #error "Not implemented" }
__m256i _mm256_castps_si256 (__m256 a) { #error "Not implemented" }
__m512i _mm512_castps_si512 (__m512 a) { #error "Not implemented" }
__m256 _mm256_castps128_ps256 (__m128 a) { #error "Not implemented" }
__m512 _mm512_castps128_ps512 (__m128 a) { #error "Not implemented" }
__m128 _mm256_castps256_ps128 (__m256 a) { #error "Not implemented" }
__m512 _mm512_castps256_ps512 (__m256 a) { #error "Not implemented" }
__m128 _mm512_castps512_ps128 (__m512 a) { #error "Not implemented" }
__m256 _mm512_castps512_ps256 (__m512 a) { #error "Not implemented" }
__m128d _mm_castsi128_pd (__m128i a) { #error "Not implemented" }
__m128h _mm_castsi128_ph (__m128i a) { #error "Not implemented" }
__m128 _mm_castsi128_ps (__m128i a) { #error "Not implemented" }
__m256i _mm256_castsi128_si256 (__m128i a) { #error "Not implemented" }
__m512i _mm512_castsi128_si512 (__m128i a) { #error "Not implemented" }
__m256d _mm256_castsi256_pd (__m256i a) { #error "Not implemented" }
__m256h _mm256_castsi256_ph (__m256i a) { #error "Not implemented" }
__m256 _mm256_castsi256_ps (__m256i a) { #error "Not implemented" }
__m128i _mm256_castsi256_si128 (__m256i a) { #error "Not implemented" }
__m512i _mm512_castsi256_si512 (__m256i a) { #error "Not implemented" }
__m512d _mm512_castsi512_pd (__m512i a) { #error "Not implemented" }
__m512h _mm512_castsi512_ph (__m512i a) { #error "Not implemented" }
__m512 _mm512_castsi512_ps (__m512i a) { #error "Not implemented" }
__m128i _mm512_castsi512_si128 (__m512i a) { #error "Not implemented" }
__m256i _mm512_castsi512_si256 (__m512i a) { #error "Not implemented" }
float _castu32_f32 (unsigned __int32 a) { #error "Not implemented" }
double _castu64_f64 (unsigned __int64 a) { #error "Not implemented" }
...
__m128d _mm_cbrt_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_cbrt_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_cbrt_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_cbrt_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_cbrt_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_cbrt_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_cbrt_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_cbrt_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_cbrt_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_cbrt_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_cbrt_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_cbrt_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_cdfnorm_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_cdfnorm_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_cdfnorm_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_cdfnorm_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_cdfnorm_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_cdfnorm_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_cdfnorm_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_cdfnorm_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_cdfnorm_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_cdfnorm_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_cdfnorm_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_cdfnorm_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_cdfnorminv_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_cdfnorminv_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_cdfnorminv_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_cdfnorminv_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_cdfnorminv_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_cdfnorminv_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_cdfnorminv_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_cdfnorminv_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_cdfnorminv_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_cdfnorminv_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_cdfnorminv_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_cdfnorminv_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
roundpd
__m128d _mm_ceil_pd (__m128d a) { #error "Not implemented" }
vroundpd
__m256d _mm256_ceil_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_ceil_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_ceil_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512h _mm512_ceil_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_ceil_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
roundps
__m128 _mm_ceil_ps (__m128 a) { #error "Not implemented" }
vroundps
__m256 _mm256_ceil_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_ceil_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_ceil_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
roundsd
__m128d _mm_ceil_sd (__m128d a, __m128d b) { #error "Not implemented" }
roundss
__m128 _mm_ceil_ss (__m128 a, __m128 b) { #error "Not implemented" }
...
__m128 _mm_cexp_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_cexp_ps (__m256 a) { #error "Not implemented" }
cldemote
void _mm_cldemote (void const * p) { #error "Not implemented" }
clflush
void _mm_clflush (void const* p) { #error "Not implemented" }
clflushopt
void _mm_clflushopt (void const * p) { #error "Not implemented" }
vpclmulqdq
__m256i _mm256_clmulepi64_epi128 (__m256i b, __m256i c, const int Imm8) { #error "Not implemented" } { #error "Not implemented" }
vpclmulqdq
__m512i _mm512_clmulepi64_epi128 (__m512i b, __m512i c, const int Imm8) { #error "Not implemented" } { #error "Not implemented" }
pclmulqdq
__m128i _mm_clmulepi64_si128 (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_clog_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_clog_ps (__m256 a) { #error "Not implemented" }
clrssbsy
void _clrssbsy (void * p) { #error "Not implemented" }
clui
void _clui (void) { #error "Not implemented" }
clwb
void _mm_clwb (void const * p) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_cmp_epi16_mask (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask8 _mm_mask_cmp_epi16_mask (__mmask8 k1, __m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_cmp_epi16_mask (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_mask_cmp_epi16_mask (__mmask16 k1, __m256i a, __m256i b, const int imm8) { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_cmp_epi16_mask (__m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_mask_cmp_epi16_mask (__mmask32 k1, __m512i a, __m512i b, const int imm8) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_cmp_epi32_mask (__m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm_mask_cmp_epi32_mask (__mmask8 k1, __m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_cmp_epi32_mask (__m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_mask_cmp_epi32_mask (__mmask8 k1, __m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_cmp_epi32_mask (__m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_mask_cmp_epi32_mask (__mmask16 k1, __m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_cmp_epi64_mask (__m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm_mask_cmp_epi64_mask (__mmask8 k1, __m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_cmp_epi64_mask (__m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_mask_cmp_epi64_mask (__mmask8 k1, __m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_cmp_epi64_mask (__m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_mask_cmp_epi64_mask (__mmask8 k1, __m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_cmp_epi8_mask (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask16 _mm_mask_cmp_epi8_mask (__mmask16 k1, __m128i a, __m128i b, const int imm8) { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_cmp_epi8_mask (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_mask_cmp_epi8_mask (__mmask32 k1, __m256i a, __m256i b, const int imm8) { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_cmp_epi8_mask (__m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_mask_cmp_epi8_mask (__mmask64 k1, __m512i a, __m512i b, const int imm8) { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_cmp_epu16_mask (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_mask_cmp_epu16_mask (__mmask8 k1, __m128i a, __m128i b, const int imm8) { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_cmp_epu16_mask (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_mask_cmp_epu16_mask (__mmask16 k1, __m256i a, __m256i b, const int imm8) { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_cmp_epu16_mask (__m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_mask_cmp_epu16_mask (__mmask32 k1, __m512i a, __m512i b, const int imm8) { #error "Not implemented" }
vpcmpud
__mmask8 _mm_cmp_epu32_mask (__m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm_mask_cmp_epu32_mask (__mmask8 k1, __m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_cmp_epu32_mask (__m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_mask_cmp_epu32_mask (__mmask8 k1, __m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_cmp_epu32_mask (__m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_mask_cmp_epu32_mask (__mmask16 k1, __m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_cmp_epu64_mask (__m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_mask_cmp_epu64_mask (__mmask8 k1, __m128i a, __m128i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_cmp_epu64_mask (__m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_mask_cmp_epu64_mask (__mmask8 k1, __m256i a, __m256i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_cmp_epu64_mask (__m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_mask_cmp_epu64_mask (__mmask8 k1, __m512i a, __m512i b, _MM_CMPINT_ENUM imm8) { #error "Not implemented" }
vpcmpub
__mmask16 _mm_cmp_epu8_mask (__m128i a, __m128i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask16 _mm_mask_cmp_epu8_mask (__mmask16 k1, __m128i a, __m128i b, const int imm8) { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_cmp_epu8_mask (__m256i a, __m256i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_mask_cmp_epu8_mask (__mmask32 k1, __m256i a, __m256i b, const int imm8) { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_cmp_epu8_mask (__m512i a, __m512i b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_mask_cmp_epu8_mask (__mmask64 k1, __m512i a, __m512i b, const int imm8) { #error "Not implemented" }
vcmppd
__m128d _mm_cmp_pd (__m128d a, __m128d b, const int imm8) { #error "Not implemented" }
vcmppd
__m256d _mm256_cmp_pd (__m256d a, __m256d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmppd
__mmask8 _mm_cmp_pd_mask (__m128d a, __m128d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmppd
__mmask8 _mm_mask_cmp_pd_mask (__mmask8 k1, __m128d a, __m128d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmppd
__mmask8 _mm256_cmp_pd_mask (__m256d a, __m256d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmppd
__mmask8 _mm256_mask_cmp_pd_mask (__mmask8 k1, __m256d a, __m256d b, const int imm8) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmp_pd_mask (__m512d a, __m512d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmp_pd_mask (__mmask8 k1, __m512d a, __m512d b, const int imm8) { #error "Not implemented" }
vcmpph
__mmask8 _mm_cmp_ph_mask (__m128h a, __m128h b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpph
__mmask8 _mm_mask_cmp_ph_mask (__mmask8 k1, __m128h a, __m128h b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpph
__mmask16 _mm256_cmp_ph_mask (__m256h a, __m256h b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpph
__mmask16 _mm256_mask_cmp_ph_mask (__mmask16 k1, __m256h a, __m256h b, const int imm8) { #error "Not implemented" }
vcmpph
__mmask32 _mm512_cmp_ph_mask (__m512h a, __m512h b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpph
__mmask32 _mm512_mask_cmp_ph_mask (__mmask32 k1, __m512h a, __m512h b, const int imm8) { #error "Not implemented" }
vcmpps
__m128 _mm_cmp_ps (__m128 a, __m128 b, const int imm8) { #error "Not implemented" }
vcmpps
__m256 _mm256_cmp_ps (__m256 a, __m256 b, const int imm8) { #error "Not implemented" }
vcmpps
__mmask8 _mm_cmp_ps_mask (__m128 a, __m128 b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpps
__mmask8 _mm_mask_cmp_ps_mask (__mmask8 k1, __m128 a, __m128 b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpps
__mmask8 _mm256_cmp_ps_mask (__m256 a, __m256 b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpps
__mmask8 _mm256_mask_cmp_ps_mask (__mmask8 k1, __m256 a, __m256 b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmp_ps_mask (__m512 a, __m512 b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmp_ps_mask (__mmask16 k1, __m512 a, __m512 b, const int imm8) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmp_round_pd_mask (__m512d a, __m512d b, const int imm8, const int sae) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmp_round_pd_mask (__mmask8 k1, __m512d a, __m512d b, const int imm8, const int sae) { #error "Not implemented" }
vcmpph
__mmask32 _mm512_cmp_round_ph_mask (__m512h a, __m512h b, const int imm8, const int sae) { #error "Not implemented" }
vcmpph
__mmask32 _mm512_mask_cmp_round_ph_mask (__mmask32 k1, __m512h a, __m512h b, const int imm8, const int sae) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmp_round_ps_mask (__m512 a, __m512 b, const int imm8, const int sae) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmp_round_ps_mask (__mmask16 k1, __m512 a, __m512 b, const int imm8, const int sae) { #error "Not implemented" }
vcmpsd
__mmask8 _mm_cmp_round_sd_mask (__m128d a, __m128d b, const int imm8, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcmpsd
__mmask8 _mm_mask_cmp_round_sd_mask (__mmask8 k1, __m128d a, __m128d b, const int imm8, const int sae) { #error "Not implemented" }
vcmpsh
__mmask8 _mm_cmp_round_sh_mask (__m128h a, __m128h b, const int imm8, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcmpsh
__mmask8 _mm_mask_cmp_round_sh_mask (__mmask8 k1, __m128h a, __m128h b, const int imm8, const int sae) { #error "Not implemented" }
vcmpss
__mmask8 _mm_cmp_round_ss_mask (__m128 a, __m128 b, const int imm8, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcmpss
__mmask8 _mm_mask_cmp_round_ss_mask (__mmask8 k1, __m128 a, __m128 b, const int imm8, const int sae) { #error "Not implemented" }
vcmpsd
__m128d _mm_cmp_sd (__m128d a, __m128d b, const int imm8) { #error "Not implemented" }
vcmpsd
__mmask8 _mm_cmp_sd_mask (__m128d a, __m128d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpsd
__mmask8 _mm_mask_cmp_sd_mask (__mmask8 k1, __m128d a, __m128d b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpsh
__mmask8 _mm_cmp_sh_mask (__m128h a, __m128h b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpsh
__mmask8 _mm_mask_cmp_sh_mask (__mmask8 k1, __m128h a, __m128h b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpss
__m128 _mm_cmp_ss (__m128 a, __m128 b, const int imm8) { #error "Not implemented" }
vcmpss
__mmask8 _mm_cmp_ss_mask (__m128 a, __m128 b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcmpss
__mmask8 _mm_mask_cmp_ss_mask (__mmask8 k1, __m128 a, __m128 b, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
cmpoxadd,...
int _cmpccxadd_epi32 (void* __A, int __B, int __C, const int __D) { #error "Not implemented" }
cmpoxadd,...
__int64 _cmpccxadd_epi64 (void* __A, __int64 __B, __int64 __C, const int __D) { #error "Not implemented" } { #error "Not implemented" }
pcmpeqw
__m128i _mm_cmpeq_epi16 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpeqw
__m256i _mm256_cmpeq_epi16 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_cmpeq_epi16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_mask_cmpeq_epi16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_cmpeq_epi16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_mask_cmpeq_epi16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_cmpeq_epi16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_mask_cmpeq_epi16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpeqd
__m128i _mm_cmpeq_epi32 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpeqd
__m256i _mm256_cmpeq_epi32 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_cmpeq_epi32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_mask_cmpeq_epi32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_cmpeq_epi32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_mask_cmpeq_epi32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpeqd
__mmask16 _mm512_cmpeq_epi32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpeqd
__mmask16 _mm512_mask_cmpeq_epi32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpeqq
__m128i _mm_cmpeq_epi64 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpeqq
__m256i _mm256_cmpeq_epi64 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_cmpeq_epi64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_mask_cmpeq_epi64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_cmpeq_epi64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_mask_cmpeq_epi64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpeqq
__mmask8 _mm512_cmpeq_epi64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpeqq
__mmask8 _mm512_mask_cmpeq_epi64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpeqb
__m128i _mm_cmpeq_epi8 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpeqb
__m256i _mm256_cmpeq_epi8 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_cmpeq_epi8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_mask_cmpeq_epi8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_cmpeq_epi8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_mask_cmpeq_epi8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_cmpeq_epi8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_mask_cmpeq_epi8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_cmpeq_epu16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_mask_cmpeq_epu16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_cmpeq_epu16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_mask_cmpeq_epu16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_cmpeq_epu16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_mask_cmpeq_epu16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm_cmpeq_epu32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm_mask_cmpeq_epu32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_cmpeq_epu32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_mask_cmpeq_epu32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_cmpeq_epu32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_mask_cmpeq_epu32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_cmpeq_epu64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_mask_cmpeq_epu64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_cmpeq_epu64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_mask_cmpeq_epu64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_cmpeq_epu64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_mask_cmpeq_epu64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask16 _mm_cmpeq_epu8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpub
__mmask16 _mm_mask_cmpeq_epu8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_cmpeq_epu8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_mask_cmpeq_epu8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_cmpeq_epu8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_mask_cmpeq_epu8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
cmppd
__m128d _mm_cmpeq_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmpeq_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmpeq_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
pcmpeqw
__m64 _mm_cmpeq_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqd
__m64 _mm_cmpeq_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpeqb
__m64 _mm_cmpeq_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
cmpps
__m128 _mm_cmpeq_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmpeq_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmpeq_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmpeq_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpeq_ss (__m128 a, __m128 b) { #error "Not implemented" }
pcmpestri
int _mm_cmpestra (__m128i a, int la, __m128i b, int lb, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
pcmpestri
int _mm_cmpestrc (__m128i a, int la, __m128i b, int lb, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
pcmpestri
int _mm_cmpestri (__m128i a, int la, __m128i b, int lb, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
pcmpestrm
__m128i _mm_cmpestrm (__m128i a, int la, __m128i b, int lb, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
pcmpestri
int _mm_cmpestro (__m128i a, int la, __m128i b, int lb, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
pcmpestri
int _mm_cmpestrs (__m128i a, int la, __m128i b, int lb, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
pcmpestri
int _mm_cmpestrz (__m128i a, int la, __m128i b, int lb, const int imm8) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask8 _mm_cmpge_epi16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_mask_cmpge_epi16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_cmpge_epi16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_mask_cmpge_epi16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_cmpge_epi16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_mask_cmpge_epi16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm_cmpge_epi32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_mask_cmpge_epi32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_cmpge_epi32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_mask_cmpge_epi32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_cmpge_epi32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_mask_cmpge_epi32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm_cmpge_epi64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_mask_cmpge_epi64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_cmpge_epi64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_mask_cmpge_epi64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_cmpge_epi64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_mask_cmpge_epi64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask16 _mm_cmpge_epi8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_mask_cmpge_epi8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_cmpge_epi8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_mask_cmpge_epi8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_cmpge_epi8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_mask_cmpge_epi8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_cmpge_epu16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_mask_cmpge_epu16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_cmpge_epu16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_mask_cmpge_epu16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_cmpge_epu16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_mask_cmpge_epu16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm_cmpge_epu32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm_mask_cmpge_epu32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_cmpge_epu32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_mask_cmpge_epu32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_cmpge_epu32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_mask_cmpge_epu32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_cmpge_epu64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_mask_cmpge_epu64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_cmpge_epu64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_mask_cmpge_epu64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_cmpge_epu64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_mask_cmpge_epu64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask16 _mm_cmpge_epu8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpub
__mmask16 _mm_mask_cmpge_epu8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_cmpge_epu8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_mask_cmpge_epu8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_cmpge_epu8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_mask_cmpge_epu8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
cmppd
__m128d _mm_cmpge_pd (__m128d a, __m128d b) { #error "Not implemented" }
cmpps
__m128 _mm_cmpge_ps (__m128 a, __m128 b) { #error "Not implemented" }
cmpsd
__m128d _mm_cmpge_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpge_ss (__m128 a, __m128 b) { #error "Not implemented" }
pcmpgtw
__m128i _mm_cmpgt_epi16 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpgtw
__m256i _mm256_cmpgt_epi16 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_cmpgt_epi16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_mask_cmpgt_epi16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_cmpgt_epi16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_mask_cmpgt_epi16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_cmpgt_epi16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_mask_cmpgt_epi16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpgtd
__m128i _mm_cmpgt_epi32 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpgtd
__m256i _mm256_cmpgt_epi32 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_cmpgt_epi32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_mask_cmpgt_epi32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_cmpgt_epi32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_mask_cmpgt_epi32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpgtd
__mmask16 _mm512_cmpgt_epi32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpgtd
__mmask16 _mm512_mask_cmpgt_epi32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpgtq
__m128i _mm_cmpgt_epi64 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpgtq
__m256i _mm256_cmpgt_epi64 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_cmpgt_epi64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_mask_cmpgt_epi64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_cmpgt_epi64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_mask_cmpgt_epi64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpgtq
__mmask8 _mm512_cmpgt_epi64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpgtq
__mmask8 _mm512_mask_cmpgt_epi64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpgtb
__m128i _mm_cmpgt_epi8 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpgtb
__m256i _mm256_cmpgt_epi8 (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_cmpgt_epi8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_mask_cmpgt_epi8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_cmpgt_epi8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_mask_cmpgt_epi8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_cmpgt_epi8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_mask_cmpgt_epi8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_cmpgt_epu16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_mask_cmpgt_epu16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_cmpgt_epu16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_mask_cmpgt_epu16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_cmpgt_epu16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_mask_cmpgt_epu16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm_cmpgt_epu32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm_mask_cmpgt_epu32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_cmpgt_epu32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_mask_cmpgt_epu32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_cmpgt_epu32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_mask_cmpgt_epu32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_cmpgt_epu64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_mask_cmpgt_epu64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_cmpgt_epu64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_mask_cmpgt_epu64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_cmpgt_epu64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_mask_cmpgt_epu64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask16 _mm_cmpgt_epu8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpub
__mmask16 _mm_mask_cmpgt_epu8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_cmpgt_epu8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_mask_cmpgt_epu8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_cmpgt_epu8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_mask_cmpgt_epu8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
cmppd
__m128d _mm_cmpgt_pd (__m128d a, __m128d b) { #error "Not implemented" }
pcmpgtw
__m64 _mm_cmpgt_pi16 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtd
__m64 _mm_cmpgt_pi32 (__m64 a, __m64 b) { #error "Not implemented" }
pcmpgtb
__m64 _mm_cmpgt_pi8 (__m64 a, __m64 b) { #error "Not implemented" }
cmpps
__m128 _mm_cmpgt_ps (__m128 a, __m128 b) { #error "Not implemented" }
cmpsd
__m128d _mm_cmpgt_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpgt_ss (__m128 a, __m128 b) { #error "Not implemented" }
pcmpistri
int _mm_cmpistra (__m128i a, __m128i b, const int imm8) { #error "Not implemented" }
pcmpistri
int _mm_cmpistrc (__m128i a, __m128i b, const int imm8) { #error "Not implemented" }
pcmpistri
int _mm_cmpistri (__m128i a, __m128i b, const int imm8) { #error "Not implemented" }
pcmpistrm
__m128i _mm_cmpistrm (__m128i a, __m128i b, const int imm8) { #error "Not implemented" }
pcmpistri
int _mm_cmpistro (__m128i a, __m128i b, const int imm8) { #error "Not implemented" }
pcmpistri
int _mm_cmpistrs (__m128i a, __m128i b, const int imm8) { #error "Not implemented" }
pcmpistri
int _mm_cmpistrz (__m128i a, __m128i b, const int imm8) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_cmple_epi16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_mask_cmple_epi16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_cmple_epi16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_mask_cmple_epi16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_cmple_epi16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_mask_cmple_epi16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm_cmple_epi32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_mask_cmple_epi32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_cmple_epi32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_mask_cmple_epi32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_cmple_epi32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_mask_cmple_epi32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm_cmple_epi64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_mask_cmple_epi64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_cmple_epi64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_mask_cmple_epi64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_cmple_epi64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_mask_cmple_epi64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask16 _mm_cmple_epi8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_mask_cmple_epi8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_cmple_epi8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_mask_cmple_epi8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_cmple_epi8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_mask_cmple_epi8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_cmple_epu16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_mask_cmple_epu16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_cmple_epu16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_mask_cmple_epu16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_cmple_epu16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_mask_cmple_epu16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm_cmple_epu32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm_mask_cmple_epu32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_cmple_epu32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_mask_cmple_epu32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_cmple_epu32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_mask_cmple_epu32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_cmple_epu64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_mask_cmple_epu64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_cmple_epu64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_mask_cmple_epu64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_cmple_epu64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_mask_cmple_epu64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask16 _mm_cmple_epu8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpub
__mmask16 _mm_mask_cmple_epu8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_cmple_epu8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_mask_cmple_epu8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_cmple_epu8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_mask_cmple_epu8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
cmppd
__m128d _mm_cmple_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmple_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmple_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
cmpps
__m128 _mm_cmple_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmple_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmple_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmple_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmple_ss (__m128 a, __m128 b) { #error "Not implemented" }
pcmpgtw
__m128i _mm_cmplt_epi16 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_cmplt_epi16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_mask_cmplt_epi16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_cmplt_epi16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_mask_cmplt_epi16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_cmplt_epi16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_mask_cmplt_epi16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpgtd
__m128i _mm_cmplt_epi32 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_cmplt_epi32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_mask_cmplt_epi32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_cmplt_epi32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_mask_cmplt_epi32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_cmplt_epi32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_mask_cmplt_epi32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm_cmplt_epi64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_mask_cmplt_epi64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_cmplt_epi64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_mask_cmplt_epi64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_cmplt_epi64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_mask_cmplt_epi64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
pcmpgtb
__m128i _mm_cmplt_epi8 (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_cmplt_epi8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_mask_cmplt_epi8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_cmplt_epi8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_mask_cmplt_epi8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_cmplt_epi8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_mask_cmplt_epi8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_cmplt_epu16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_mask_cmplt_epu16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_cmplt_epu16_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_mask_cmplt_epu16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_cmplt_epu16_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_mask_cmplt_epu16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm_cmplt_epu32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm_mask_cmplt_epu32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_cmplt_epu32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_mask_cmplt_epu32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_cmplt_epu32_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_mask_cmplt_epu32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_cmplt_epu64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_mask_cmplt_epu64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_cmplt_epu64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_mask_cmplt_epu64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_cmplt_epu64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_mask_cmplt_epu64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask16 _mm_cmplt_epu8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpub
__mmask16 _mm_mask_cmplt_epu8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_cmplt_epu8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_mask_cmplt_epu8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_cmplt_epu8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_mask_cmplt_epu8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
cmppd
__m128d _mm_cmplt_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmplt_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmplt_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
cmpps
__m128 _mm_cmplt_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmplt_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmplt_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmplt_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmplt_ss (__m128 a, __m128 b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_cmpneq_epi16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpw
__mmask8 _mm_mask_cmpneq_epi16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_cmpneq_epi16_mask (__m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask16 _mm256_mask_cmpneq_epi16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_cmpneq_epi16_mask (__m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpw
__mmask32 _mm512_mask_cmpneq_epi16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm_cmpneq_epi32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm_mask_cmpneq_epi32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_cmpneq_epi32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpd
__mmask8 _mm256_mask_cmpneq_epi32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_cmpneq_epi32_mask (__m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpd
__mmask16 _mm512_mask_cmpneq_epi32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm_cmpneq_epi64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm_mask_cmpneq_epi64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_cmpneq_epi64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm256_mask_cmpneq_epi64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_cmpneq_epi64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpq
__mmask8 _mm512_mask_cmpneq_epi64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask16 _mm_cmpneq_epi8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpb
__mmask16 _mm_mask_cmpneq_epi8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_cmpneq_epi8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpb
__mmask32 _mm256_mask_cmpneq_epi8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_cmpneq_epi8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpb
__mmask64 _mm512_mask_cmpneq_epi8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_cmpneq_epu16_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuw
__mmask8 _mm_mask_cmpneq_epu16_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_cmpneq_epu16_mask (__m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask16 _mm256_mask_cmpneq_epu16_mask (__mmask16 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_cmpneq_epu16_mask (__m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuw
__mmask32 _mm512_mask_cmpneq_epu16_mask (__mmask32 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm_cmpneq_epu32_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm_mask_cmpneq_epu32_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_cmpneq_epu32_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpud
__mmask8 _mm256_mask_cmpneq_epu32_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_cmpneq_epu32_mask (__m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpud
__mmask16 _mm512_mask_cmpneq_epu32_mask (__mmask16 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_cmpneq_epu64_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm_mask_cmpneq_epu64_mask (__mmask8 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_cmpneq_epu64_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm256_mask_cmpneq_epu64_mask (__mmask8 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_cmpneq_epu64_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpuq
__mmask8 _mm512_mask_cmpneq_epu64_mask (__mmask8 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask16 _mm_cmpneq_epu8_mask (__m128i a, __m128i b) { #error "Not implemented" }
vpcmpub
__mmask16 _mm_mask_cmpneq_epu8_mask (__mmask16 k1, __m128i a, __m128i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_cmpneq_epu8_mask (__m256i a, __m256i b) { #error "Not implemented" }
vpcmpub
__mmask32 _mm256_mask_cmpneq_epu8_mask (__mmask32 k1, __m256i a, __m256i b) { #error "Not implemented" } { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_cmpneq_epu8_mask (__m512i a, __m512i b) { #error "Not implemented" }
vpcmpub
__mmask64 _mm512_mask_cmpneq_epu8_mask (__mmask64 k1, __m512i a, __m512i b) { #error "Not implemented" } { #error "Not implemented" }
cmppd
__m128d _mm_cmpneq_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmpneq_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmpneq_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
cmpps
__m128 _mm_cmpneq_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmpneq_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmpneq_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmpneq_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpneq_ss (__m128 a, __m128 b) { #error "Not implemented" }
cmppd
__m128d _mm_cmpnge_pd (__m128d a, __m128d b) { #error "Not implemented" }
cmpps
__m128 _mm_cmpnge_ps (__m128 a, __m128 b) { #error "Not implemented" }
cmpsd
__m128d _mm_cmpnge_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpnge_ss (__m128 a, __m128 b) { #error "Not implemented" }
cmppd
__m128d _mm_cmpngt_pd (__m128d a, __m128d b) { #error "Not implemented" }
cmpps
__m128 _mm_cmpngt_ps (__m128 a, __m128 b) { #error "Not implemented" }
cmpsd
__m128d _mm_cmpngt_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpngt_ss (__m128 a, __m128 b) { #error "Not implemented" }
cmppd
__m128d _mm_cmpnle_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmpnle_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmpnle_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
cmpps
__m128 _mm_cmpnle_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmpnle_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmpnle_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmpnle_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpnle_ss (__m128 a, __m128 b) { #error "Not implemented" }
cmppd
__m128d _mm_cmpnlt_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmpnlt_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmpnlt_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
cmpps
__m128 _mm_cmpnlt_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmpnlt_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmpnlt_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmpnlt_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpnlt_ss (__m128 a, __m128 b) { #error "Not implemented" }
cmppd
__m128d _mm_cmpord_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmpord_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmpord_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
cmpps
__m128 _mm_cmpord_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmpord_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmpord_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmpord_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpord_ss (__m128 a, __m128 b) { #error "Not implemented" }
cmppd
__m128d _mm_cmpunord_pd (__m128d a, __m128d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_cmpunord_pd_mask (__m512d a, __m512d b) { #error "Not implemented" }
vcmppd
__mmask8 _mm512_mask_cmpunord_pd_mask (__mmask8 k1, __m512d a, __m512d b) { #error "Not implemented" } { #error "Not implemented" }
cmpps
__m128 _mm_cmpunord_ps (__m128 a, __m128 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_cmpunord_ps_mask (__m512 a, __m512 b) { #error "Not implemented" }
vcmpps
__mmask16 _mm512_mask_cmpunord_ps_mask (__mmask16 k1, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
cmpsd
__m128d _mm_cmpunord_sd (__m128d a, __m128d b) { #error "Not implemented" }
cmpss
__m128 _mm_cmpunord_ss (__m128 a, __m128 b) { #error "Not implemented" }
vfcmulcph
__m128h _mm_cmul_pch (__m128h a, __m128h b) { #error "Not implemented" }
vfcmulcph
__m128h _mm_mask_cmul_pch (__m128h src, __mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcph
__m128h _mm_maskz_cmul_pch (__mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcph
__m256h _mm256_cmul_pch (__m256h a, __m256h b) { #error "Not implemented" }
vfcmulcph
__m256h _mm256_mask_cmul_pch (__m256h src, __mmask8 k, __m256h a, __m256h b) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcph
__m256h _mm256_maskz_cmul_pch (__mmask8 k, __m256h a, __m256h b) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcph
__m512h _mm512_cmul_pch (__m512h a, __m512h b) { #error "Not implemented" }
vfcmulcph
__m512h _mm512_mask_cmul_pch (__m512h src, __mmask16 k, __m512h a, __m512h b) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcph
__m512h _mm512_maskz_cmul_pch (__mmask16 k, __m512h a, __m512h b) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcph
__m512h _mm512_cmul_round_pch (__m512h a, __m512h b, const int rounding) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcph
__m512h _mm512_mask_cmul_round_pch (__m512h src, __mmask16 k, __m512h a, __m512h b, const int rounding) { #error "Not implemented" }
vfcmulcph
__m512h _mm512_maskz_cmul_round_pch (__mmask16 k, __m512h a, __m512h b, const int rounding) { #error "Not implemented" }
vfcmulcsh
__m128h _mm_cmul_round_sch (__m128h a, __m128h b, const int rounding) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcsh
__m128h _mm_mask_cmul_round_sch (__m128h src, __mmask8 k, __m128h a, __m128h b, const int rounding) { #error "Not implemented" }
vfcmulcsh
__m128h _mm_maskz_cmul_round_sch (__mmask8 k, __m128h a, __m128h b, const int rounding) { #error "Not implemented" }
vfcmulcsh
__m128h _mm_cmul_sch (__m128h a, __m128h b) { #error "Not implemented" }
vfcmulcsh
__m128h _mm_mask_cmul_sch (__m128h src, __mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vfcmulcsh
__m128h _mm_maskz_cmul_sch (__mmask8 k, __m128h a, __m128h b) { #error "Not implemented" } { #error "Not implemented" }
vcomisd
int _mm_comi_round_sd (__m128d a, __m128d b, const int imm8, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcomish
int _mm_comi_round_sh (__m128h a, __m128h b, const int imm8, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcomiss,...
int _mm_comi_round_ss (__m128 a, __m128 b, const int imm8, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcomish
int _mm_comi_sh (__m128h a, __m128h b, const int imm8) { #error "Not implemented" }
comisd
int _mm_comieq_sd (__m128d a, __m128d b) { #error "Not implemented" }
vcomish
int _mm_comieq_sh (__m128h a, __m128h b) { #error "Not implemented" }
comiss
int _mm_comieq_ss (__m128 a, __m128 b) { #error "Not implemented" }
comisd
int _mm_comige_sd (__m128d a, __m128d b) { #error "Not implemented" }
vcomish
int _mm_comige_sh (__m128h a, __m128h b) { #error "Not implemented" }
comiss
int _mm_comige_ss (__m128 a, __m128 b) { #error "Not implemented" }
comisd
int _mm_comigt_sd (__m128d a, __m128d b) { #error "Not implemented" }
vcomish
int _mm_comigt_sh (__m128h a, __m128h b) { #error "Not implemented" }
comiss
int _mm_comigt_ss (__m128 a, __m128 b) { #error "Not implemented" }
comisd
int _mm_comile_sd (__m128d a, __m128d b) { #error "Not implemented" }
vcomish
int _mm_comile_sh (__m128h a, __m128h b) { #error "Not implemented" }
comiss
int _mm_comile_ss (__m128 a, __m128 b) { #error "Not implemented" }
comisd
int _mm_comilt_sd (__m128d a, __m128d b) { #error "Not implemented" }
vcomish
int _mm_comilt_sh (__m128h a, __m128h b) { #error "Not implemented" }
comiss
int _mm_comilt_ss (__m128 a, __m128 b) { #error "Not implemented" }
comisd
int _mm_comineq_sd (__m128d a, __m128d b) { #error "Not implemented" }
vcomish
int _mm_comineq_sh (__m128h a, __m128h b) { #error "Not implemented" }
comiss
int _mm_comineq_ss (__m128 a, __m128 b) { #error "Not implemented" }
vpcompressw
__m128i _mm_mask_compress_epi16 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressw
__m128i _mm_maskz_compress_epi16 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpcompressw
__m256i _mm256_mask_compress_epi16 (__m256i src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressw
__m256i _mm256_maskz_compress_epi16 (__mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressw
__m512i _mm512_mask_compress_epi16 (__m512i src, __mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressw
__m512i _mm512_maskz_compress_epi16 (__mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
__m128i _mm_mask_compress_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
__m128i _mm_maskz_compress_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpcompressd
__m256i _mm256_mask_compress_epi32 (__m256i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
__m256i _mm256_maskz_compress_epi32 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
__m512i _mm512_mask_compress_epi32 (__m512i src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
__m512i _mm512_maskz_compress_epi32 (__mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
__m128i _mm_mask_compress_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
__m128i _mm_maskz_compress_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpcompressq
__m256i _mm256_mask_compress_epi64 (__m256i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
__m256i _mm256_maskz_compress_epi64 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
__m512i _mm512_mask_compress_epi64 (__m512i src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
__m512i _mm512_maskz_compress_epi64 (__mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
__m128i _mm_mask_compress_epi8 (__m128i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
__m128i _mm_maskz_compress_epi8 (__mmask16 k, __m128i a) { #error "Not implemented" }
vpcompressb
__m256i _mm256_mask_compress_epi8 (__m256i src, __mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
__m256i _mm256_maskz_compress_epi8 (__mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
__m512i _mm512_mask_compress_epi8 (__m512i src, __mmask64 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
__m512i _mm512_maskz_compress_epi8 (__mmask64 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcompresspd
__m128d _mm_mask_compress_pd (__m128d src, __mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
vcompresspd
__m128d _mm_maskz_compress_pd (__mmask8 k, __m128d a) { #error "Not implemented" }
vcompresspd
__m256d _mm256_mask_compress_pd (__m256d src, __mmask8 k, __m256d a) { #error "Not implemented" } { #error "Not implemented" }
vcompresspd
__m256d _mm256_maskz_compress_pd (__mmask8 k, __m256d a) { #error "Not implemented" }
vcompresspd
__m512d _mm512_mask_compress_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
vcompresspd
__m512d _mm512_maskz_compress_pd (__mmask8 k, __m512d a) { #error "Not implemented" }
vcompressps
__m128 _mm_mask_compress_ps (__m128 src, __mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vcompressps
__m128 _mm_maskz_compress_ps (__mmask8 k, __m128 a) { #error "Not implemented" }
vcompressps
__m256 _mm256_mask_compress_ps (__m256 src, __mmask8 k, __m256 a) { #error "Not implemented" } { #error "Not implemented" }
vcompressps
__m256 _mm256_maskz_compress_ps (__mmask8 k, __m256 a) { #error "Not implemented" }
vcompressps
__m512 _mm512_mask_compress_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
vcompressps
__m512 _mm512_maskz_compress_ps (__mmask16 k, __m512 a) { #error "Not implemented" }
vpcompressw
void _mm_mask_compressstoreu_epi16 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressw
void _mm256_mask_compressstoreu_epi16 (void* base_addr, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressw
void _mm512_mask_compressstoreu_epi16 (void* base_addr, __mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
void _mm_mask_compressstoreu_epi32 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
void _mm256_mask_compressstoreu_epi32 (void* base_addr, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressd
void _mm512_mask_compressstoreu_epi32 (void* base_addr, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
void _mm_mask_compressstoreu_epi64 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
void _mm256_mask_compressstoreu_epi64 (void* base_addr, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressq
void _mm512_mask_compressstoreu_epi64 (void* base_addr, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
void _mm_mask_compressstoreu_epi8 (void* base_addr, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
void _mm256_mask_compressstoreu_epi8 (void* base_addr, __mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpcompressb
void _mm512_mask_compressstoreu_epi8 (void* base_addr, __mmask64 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcompresspd
void _mm_mask_compressstoreu_pd (void* base_addr, __mmask8 k, __m128d a) { #error "Not implemented" } { #error "Not implemented" }
vcompresspd
void _mm256_mask_compressstoreu_pd (void* base_addr, __mmask8 k, __m256d a) { #error "Not implemented" } { #error "Not implemented" }
vcompresspd
void _mm512_mask_compressstoreu_pd (void* base_addr, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
vcompressps
void _mm_mask_compressstoreu_ps (void* base_addr, __mmask8 k, __m128 a) { #error "Not implemented" } { #error "Not implemented" }
vcompressps
void _mm256_mask_compressstoreu_ps (void* base_addr, __mmask8 k, __m256 a) { #error "Not implemented" } { #error "Not implemented" }
vcompressps
void _mm512_mask_compressstoreu_ps (void* base_addr, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictd
__m128i _mm_conflict_epi32 (__m128i a) { #error "Not implemented" }
vpconflictd
__m128i _mm_mask_conflict_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictd
__m128i _mm_maskz_conflict_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpconflictd
__m256i _mm256_conflict_epi32 (__m256i a) { #error "Not implemented" }
vpconflictd
__m256i _mm256_mask_conflict_epi32 (__m256i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictd
__m256i _mm256_maskz_conflict_epi32 (__mmask8 k, __m256i a) { #error "Not implemented" }
vpconflictd
__m512i _mm512_conflict_epi32 (__m512i a) { #error "Not implemented" }
vpconflictd
__m512i _mm512_mask_conflict_epi32 (__m512i src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictd
__m512i _mm512_maskz_conflict_epi32 (__mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictq
__m128i _mm_conflict_epi64 (__m128i a) { #error "Not implemented" }
vpconflictq
__m128i _mm_mask_conflict_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictq
__m128i _mm_maskz_conflict_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpconflictq
__m256i _mm256_conflict_epi64 (__m256i a) { #error "Not implemented" }
vpconflictq
__m256i _mm256_mask_conflict_epi64 (__m256i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictq
__m256i _mm256_maskz_conflict_epi64 (__mmask8 k, __m256i a) { #error "Not implemented" }
vpconflictq
__m512i _mm512_conflict_epi64 (__m512i a) { #error "Not implemented" }
vpconflictq
__m512i _mm512_mask_conflict_epi64 (__m512i src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpconflictq
__m512i _mm512_maskz_conflict_epi64 (__mmask8 k, __m512i a) { #error "Not implemented" }
...
__m128h _mm_conj_pch (__m128h a) { #error "Not implemented" }
...
__m128h _mm_mask_conj_pch (__m128h src, __mmask8 k, __m128h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_maskz_conj_pch (__mmask8 k, __m128h a) { #error "Not implemented" }
...
__m256h _mm256_conj_pch (__m256h a) { #error "Not implemented" }
...
__m256h _mm256_mask_conj_pch (__m256h src, __mmask8 k, __m256h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m256h _mm256_maskz_conj_pch (__mmask8 k, __m256h a) { #error "Not implemented" }
...
__m512h _mm512_conj_pch (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_conj_pch (__m512h src, __mmask16 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m512h _mm512_maskz_conj_pch (__mmask16 k, __m512h a) { #error "Not implemented" }
...
__m128d _mm_cos_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_cos_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_cos_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_cos_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_cos_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_cos_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_cos_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_cos_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_cos_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_cos_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_cos_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_cos_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_cosd_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_cosd_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_cosd_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_cosd_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_cosd_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_cosd_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_cosd_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_cosd_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_cosd_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_cosd_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_cosd_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_cosd_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128d _mm_cosh_pd (__m128d a) { #error "Not implemented" }
...
__m256d _mm256_cosh_pd (__m256d a) { #error "Not implemented" }
...
__m512d _mm512_cosh_pd (__m512d a) { #error "Not implemented" }
...
__m512d _mm512_mask_cosh_pd (__m512d src, __mmask8 k, __m512d a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128h _mm_cosh_ph (__m128h a) { #error "Not implemented" }
...
__m256h _mm256_cosh_ph (__m256h a) { #error "Not implemented" }
...
__m512h _mm512_cosh_ph (__m512h a) { #error "Not implemented" }
...
__m512h _mm512_mask_cosh_ph (__m512h src, __mmask32 k, __m512h a) { #error "Not implemented" } { #error "Not implemented" }
...
__m128 _mm_cosh_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_cosh_ps (__m256 a) { #error "Not implemented" }
...
__m512 _mm512_cosh_ps (__m512 a) { #error "Not implemented" }
...
__m512 _mm512_mask_cosh_ps (__m512 src, __mmask16 k, __m512 a) { #error "Not implemented" } { #error "Not implemented" }
crc32
unsigned int _mm_crc32_u16 (unsigned int crc, unsigned short v) { #error "Not implemented" }
crc32
unsigned int _mm_crc32_u16 (unsigned int crc, unsigned short v) { #error "Not implemented" }
crc32
unsigned int _mm_crc32_u32 (unsigned int crc, unsigned int v) { #error "Not implemented" }
crc32
unsigned int _mm_crc32_u32 (unsigned int crc, unsigned int v) { #error "Not implemented" }
crc32
unsigned __int64 _mm_crc32_u64 (unsigned __int64 crc, unsigned __int64 v) { #error "Not implemented" } { #error "Not implemented" }
crc32
unsigned __int64 _mm_crc32_u64 (unsigned __int64 crc, unsigned __int64 v) { #error "Not implemented" } { #error "Not implemented" }
crc32
unsigned int _mm_crc32_u8 (unsigned int crc, unsigned char v) { #error "Not implemented" }
crc32
unsigned int _mm_crc32_u8 (unsigned int crc, unsigned char v) { #error "Not implemented" }
...
__m128 _mm_csqrt_ps (__m128 a) { #error "Not implemented" }
...
__m256 _mm256_csqrt_ps (__m256 a) { #error "Not implemented" }
cvtpi2ps
__m128 _mm_cvt_pi2ps (__m128 a, __m64 b) { #error "Not implemented" }
cvtps2pi
__m64 _mm_cvt_ps2pi (__m128 a) { #error "Not implemented" }
vcvtw2ph
__m512h _mm512_cvt_roundepi16_ph (__m512i a, int rounding) { #error "Not implemented" }
vcvtw2ph
__m512h _mm512_mask_cvt_roundepi16_ph (__m512h src, __mmask32 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtw2ph
__m512h _mm512_maskz_cvt_roundepi16_ph (__mmask32 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ph
__m256h _mm512_cvt_roundepi32_ph (__m512i a, int rounding) { #error "Not implemented" }
vcvtdq2ph
__m256h _mm512_mask_cvt_roundepi32_ph (__m256h src, __mmask16 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtdq2ph
__m256h _mm512_maskz_cvt_roundepi32_ph (__mmask16 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ps
__m512 _mm512_cvt_roundepi32_ps (__m512i a, int rounding) { #error "Not implemented" }
vcvtdq2ps
__m512 _mm512_mask_cvt_roundepi32_ps (__m512 src, __mmask16 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtdq2ps
__m512 _mm512_maskz_cvt_roundepi32_ps (__mmask16 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2pd
__m512d _mm512_cvt_roundepi64_pd (__m512i a, int rounding) { #error "Not implemented" }
vcvtqq2pd
__m512d _mm512_mask_cvt_roundepi64_pd (__m512d src, __mmask8 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtqq2pd
__m512d _mm512_maskz_cvt_roundepi64_pd (__mmask8 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ph
__m128h _mm512_cvt_roundepi64_ph (__m512i a, int rounding) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm512_mask_cvt_roundepi64_ph (__m128h src, __mmask8 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm512_maskz_cvt_roundepi64_ph (__mmask8 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ps
__m256 _mm512_cvt_roundepi64_ps (__m512i a, int rounding) { #error "Not implemented" }
vcvtqq2ps
__m256 _mm512_mask_cvt_roundepi64_ps (__m256 src, __mmask8 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ps
__m256 _mm512_maskz_cvt_roundepi64_ps (__mmask8 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtuw2ph
__m512h _mm512_cvt_roundepu16_ph (__m512i a, int rounding) { #error "Not implemented" }
vcvtuw2ph
__m512h _mm512_mask_cvt_roundepu16_ph (__m512h src, __mmask32 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtuw2ph
__m512h _mm512_maskz_cvt_roundepu16_ph (__mmask32 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2ph
__m256h _mm512_cvt_roundepu32_ph (__m512i a, int rounding) { #error "Not implemented" }
vcvtudq2ph
__m256h _mm512_mask_cvt_roundepu32_ph (__m256h src, __mmask16 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtudq2ph
__m256h _mm512_maskz_cvt_roundepu32_ph (__mmask16 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2ps
__m512 _mm512_cvt_roundepu32_ps (__m512i a, int rounding) { #error "Not implemented" }
vcvtudq2ps
__m512 _mm512_mask_cvt_roundepu32_ps (__m512 src, __mmask16 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtudq2ps
__m512 _mm512_maskz_cvt_roundepu32_ps (__mmask16 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2pd
__m512d _mm512_cvt_roundepu64_pd (__m512i a, int rounding) { #error "Not implemented" }
vcvtuqq2pd
__m512d _mm512_mask_cvt_roundepu64_pd (__m512d src, __mmask8 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtuqq2pd
__m512d _mm512_maskz_cvt_roundepu64_pd (__mmask8 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm512_cvt_roundepu64_ph (__m512i a, int rounding) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm512_mask_cvt_roundepu64_ph (__m128h src, __mmask8 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm512_maskz_cvt_roundepu64_ph (__mmask8 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ps
__m256 _mm512_cvt_roundepu64_ps (__m512i a, int rounding) { #error "Not implemented" }
vcvtuqq2ps
__m256 _mm512_mask_cvt_roundepu64_ps (__m256 src, __mmask8 k, __m512i a, int rounding) { #error "Not implemented" }
vcvtuqq2ps
__m256 _mm512_maskz_cvt_roundepu64_ps (__mmask8 k, __m512i a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsi2sh
__m128h _mm_cvt_roundi32_sh (__m128h a, int b, int rounding) { #error "Not implemented" }
vcvtsi2ss
__m128 _mm_cvt_roundi32_ss (__m128 a, int b, int rounding) { #error "Not implemented" }
vcvtsi2sd
__m128d _mm_cvt_roundi64_sd (__m128d a, __int64 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsi2sh
__m128h _mm_cvt_roundi64_sh (__m128h a, __int64 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsi2ss
__m128 _mm_cvt_roundi64_ss (__m128 a, __int64 b, int rounding) { #error "Not implemented" }
vcvtpd2dq
__m256i _mm512_cvt_roundpd_epi32 (__m512d a, int rounding) { #error "Not implemented" }
vcvtpd2dq
__m256i _mm512_mask_cvt_roundpd_epi32 (__m256i src, __mmask8 k, __m512d a, int rounding) { #error "Not implemented" }
vcvtpd2dq
__m256i _mm512_maskz_cvt_roundpd_epi32 (__mmask8 k, __m512d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtpd2qq
__m512i _mm512_cvt_roundpd_epi64 (__m512d a, int rounding) { #error "Not implemented" }
vcvtpd2qq
__m512i _mm512_mask_cvt_roundpd_epi64 (__m512i src, __mmask8 k, __m512d a, int rounding) { #error "Not implemented" }
vcvtpd2qq
__m512i _mm512_maskz_cvt_roundpd_epi64 (__mmask8 k, __m512d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtpd2udq
__m256i _mm512_cvt_roundpd_epu32 (__m512d a, int rounding) { #error "Not implemented" }
vcvtpd2udq
__m256i _mm512_mask_cvt_roundpd_epu32 (__m256i src, __mmask8 k, __m512d a, int rounding) { #error "Not implemented" }
vcvtpd2udq
__m256i _mm512_maskz_cvt_roundpd_epu32 (__mmask8 k, __m512d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtpd2uqq
__m512i _mm512_cvt_roundpd_epu64 (__m512d a, int rounding) { #error "Not implemented" }
vcvtpd2uqq
__m512i _mm512_mask_cvt_roundpd_epu64 (__m512i src, __mmask8 k, __m512d a, int rounding) { #error "Not implemented" }
vcvtpd2uqq
__m512i _mm512_maskz_cvt_roundpd_epu64 (__mmask8 k, __m512d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtpd2ph
__m128h _mm512_cvt_roundpd_ph (__m512d a, int rounding) { #error "Not implemented" }
vcvtpd2ph
__m128h _mm512_mask_cvt_roundpd_ph (__m128h src, __mmask8 k, __m512d a, int rounding) { #error "Not implemented" }
vcvtpd2ph
__m128h _mm512_maskz_cvt_roundpd_ph (__mmask8 k, __m512d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtpd2ps
__m256 _mm512_cvt_roundpd_ps (__m512d a, int rounding) { #error "Not implemented" }
vcvtpd2ps
__m256 _mm512_mask_cvt_roundpd_ps (__m256 src, __mmask8 k, __m512d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtpd2ps
__m256 _mm512_maskz_cvt_roundpd_ps (__mmask8 k, __m512d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2w
__m512i _mm512_cvt_roundph_epi16 (__m512h a, int rounding) { #error "Not implemented" }
vcvtph2w
__m512i _mm512_mask_cvt_roundph_epi16 (__m512i src, __mmask32 k, __m512h a, int rounding) { #error "Not implemented" }
vcvtph2w
__m512i _mm512_maskz_cvt_roundph_epi16 (__mmask32 k, __m512h a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2dq
__m512i _mm512_cvt_roundph_epi32 (__m256h a, int rounding) { #error "Not implemented" }
vcvtph2dq
__m512i _mm512_mask_cvt_roundph_epi32 (__m512i src, __mmask16 k, __m256h a, int rounding) { #error "Not implemented" }
vcvtph2dq
__m512i _mm512_maskz_cvt_roundph_epi32 (__mmask16 k, __m256h a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2qq
__m512i _mm512_cvt_roundph_epi64 (__m128h a, int rounding) { #error "Not implemented" }
vcvtph2qq
__m512i _mm512_mask_cvt_roundph_epi64 (__m512i src, __mmask8 k, __m128h a, int rounding) { #error "Not implemented" }
vcvtph2qq
__m512i _mm512_maskz_cvt_roundph_epi64 (__mmask8 k, __m128h a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2uw
__m512i _mm512_cvt_roundph_epu16 (__m512h a, int sae) { #error "Not implemented" }
vcvtph2uw
__m512i _mm512_mask_cvt_roundph_epu16 (__m512i src, __mmask32 k, __m512h a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2uw
__m512i _mm512_maskz_cvt_roundph_epu16 (__mmask32 k, __m512h a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2udq
__m512i _mm512_cvt_roundph_epu32 (__m256h a, int rounding) { #error "Not implemented" }
vcvtph2udq
__m512i _mm512_mask_cvt_roundph_epu32 (__m512i src, __mmask16 k, __m256h a, int rounding) { #error "Not implemented" }
vcvtph2udq
__m512i _mm512_maskz_cvt_roundph_epu32 (__mmask16 k, __m256h a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2uqq
__m512i _mm512_cvt_roundph_epu64 (__m128h a, int rounding) { #error "Not implemented" }
vcvtph2uqq
__m512i _mm512_mask_cvt_roundph_epu64 (__m512i src, __mmask8 k, __m128h a, int rounding) { #error "Not implemented" }
vcvtph2uqq
__m512i _mm512_maskz_cvt_roundph_epu64 (__mmask8 k, __m128h a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2pd
__m512d _mm512_cvt_roundph_pd (__m128h a, int sae) { #error "Not implemented" }
vcvtph2pd
__m512d _mm512_mask_cvt_roundph_pd (__m512d src, __mmask8 k, __m128h a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2pd
__m512d _mm512_maskz_cvt_roundph_pd (__mmask8 k, __m128h a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2ps
__m512 _mm512_cvt_roundph_ps (__m256i a, int sae) { #error "Not implemented" }
vcvtph2ps
__m512 _mm512_mask_cvt_roundph_ps (__m512 src, __mmask16 k, __m256i a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtph2ps
__m512 _mm512_maskz_cvt_roundph_ps (__mmask16 k, __m256i a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2dq
__m512i _mm512_cvt_roundps_epi32 (__m512 a, int rounding) { #error "Not implemented" }
vcvtps2dq
__m512i _mm512_mask_cvt_roundps_epi32 (__m512i src, __mmask16 k, __m512 a, int rounding) { #error "Not implemented" }
vcvtps2dq
__m512i _mm512_maskz_cvt_roundps_epi32 (__mmask16 k, __m512 a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2qq
__m512i _mm512_cvt_roundps_epi64 (__m256 a, int rounding) { #error "Not implemented" }
vcvtps2qq
__m512i _mm512_mask_cvt_roundps_epi64 (__m512i src, __mmask8 k, __m256 a, int rounding) { #error "Not implemented" }
vcvtps2qq
__m512i _mm512_maskz_cvt_roundps_epi64 (__mmask8 k, __m256 a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2udq
__m512i _mm512_cvt_roundps_epu32 (__m512 a, int rounding) { #error "Not implemented" }
vcvtps2udq
__m512i _mm512_mask_cvt_roundps_epu32 (__m512i src, __mmask16 k, __m512 a, int rounding) { #error "Not implemented" }
vcvtps2udq
__m512i _mm512_maskz_cvt_roundps_epu32 (__mmask16 k, __m512 a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2uqq
__m512i _mm512_cvt_roundps_epu64 (__m256 a, int rounding) { #error "Not implemented" }
vcvtps2uqq
__m512i _mm512_mask_cvt_roundps_epu64 (__m512i src, __mmask8 k, __m256 a, int rounding) { #error "Not implemented" }
vcvtps2uqq
__m512i _mm512_maskz_cvt_roundps_epu64 (__mmask8 k, __m256 a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2pd
__m512d _mm512_cvt_roundps_pd (__m256 a, int sae) { #error "Not implemented" }
vcvtps2pd
__m512d _mm512_mask_cvt_roundps_pd (__m512d src, __mmask8 k, __m256 a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2pd
__m512d _mm512_maskz_cvt_roundps_pd (__mmask8 k, __m256 a, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2ph
__m128i _mm_mask_cvt_roundps_ph (__m128i src, __mmask8 k, __m128 a, int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2ph
__m128i _mm_maskz_cvt_roundps_ph (__mmask8 k, __m128 a, int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2ph
__m128i _mm256_mask_cvt_roundps_ph (__m128i src, __mmask8 k, __m256 a, int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2ph
__m128i _mm256_maskz_cvt_roundps_ph (__mmask8 k, __m256 a, int imm8) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2ph
__m256i _mm512_cvt_roundps_ph (__m512 a, int rounding) { #error "Not implemented" }
vcvtps2ph
__m256i _mm512_mask_cvt_roundps_ph (__m256i src, __mmask16 k, __m512 a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtps2ph
__m256i _mm512_maskz_cvt_roundps_ph (__mmask16 k, __m512 a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsd2si
int _mm_cvt_roundsd_i32 (__m128d a, int rounding) { #error "Not implemented" }
vcvtsd2si
__int64 _mm_cvt_roundsd_i64 (__m128d a, int rounding) { #error "Not implemented" }
vcvtsd2sh
__m128h _mm_cvt_roundsd_sh (__m128h a, __m128d b, const int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsd2sh
__m128h _mm_mask_cvt_roundsd_sh (__m128h src, __mmask8 k, __m128h a, __m128d b, const int rounding) { #error "Not implemented" }
vcvtsd2sh
__m128h _mm_maskz_cvt_roundsd_sh (__mmask8 k, __m128h a, __m128d b, const int rounding) { #error "Not implemented" }
vcvtsd2si
int _mm_cvt_roundsd_si32 (__m128d a, int rounding) { #error "Not implemented" }
vcvtsd2si
__int64 _mm_cvt_roundsd_si64 (__m128d a, int rounding) { #error "Not implemented" }
vcvtsd2ss
__m128 _mm_cvt_roundsd_ss (__m128 a, __m128d b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsd2ss
__m128 _mm_mask_cvt_roundsd_ss (__m128 src, __mmask8 k, __m128 a, __m128d b, int rounding) { #error "Not implemented" }
vcvtsd2ss
__m128 _mm_maskz_cvt_roundsd_ss (__mmask8 k, __m128 a, __m128d b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsd2usi
unsigned int _mm_cvt_roundsd_u32 (__m128d a, int rounding) { #error "Not implemented" }
vcvtsd2usi
unsigned __int64 _mm_cvt_roundsd_u64 (__m128d a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsh2si
int _mm_cvt_roundsh_i32 (__m128h a, int rounding) { #error "Not implemented" }
vcvtsh2si
__int64 _mm_cvt_roundsh_i64 (__m128h a, int rounding) { #error "Not implemented" }
vcvtsh2sd
__m128d _mm_cvt_roundsh_sd (__m128d a, __m128h b, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtsh2sd
__m128d _mm_mask_cvt_roundsh_sd (__m128d src, __mmask8 k, __m128d a, __m128h b, const int sae) { #error "Not implemented" }
vcvtsh2sd
__m128d _mm_maskz_cvt_roundsh_sd (__mmask8 k, __m128d a, __m128h b, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtsh2ss
__m128 _mm_cvt_roundsh_ss (__m128 a, __m128h b, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtsh2ss
__m128 _mm_mask_cvt_roundsh_ss (__m128 src, __mmask8 k, __m128 a, __m128h b, const int sae) { #error "Not implemented" }
vcvtsh2ss
__m128 _mm_maskz_cvt_roundsh_ss (__mmask8 k, __m128 a, __m128h b, const int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtsh2usi
unsigned int _mm_cvt_roundsh_u32 (__m128h a, int sae) { #error "Not implemented" }
vcvtsh2usi
unsigned __int64 _mm_cvt_roundsh_u64 (__m128h a, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsi2ss
__m128 _mm_cvt_roundsi32_ss (__m128 a, int b, int rounding) { #error "Not implemented" }
vcvtsi2sd
__m128d _mm_cvt_roundsi64_sd (__m128d a, __int64 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtsi2ss
__m128 _mm_cvt_roundsi64_ss (__m128 a, __int64 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtss2si
int _mm_cvt_roundss_i32 (__m128 a, int rounding) { #error "Not implemented" }
vcvtss2si
__int64 _mm_cvt_roundss_i64 (__m128 a, int rounding) { #error "Not implemented" }
vcvtss2sd
__m128d _mm_cvt_roundss_sd (__m128d a, __m128 b, int sae) { #error "Not implemented" }
vcvtss2sd
__m128d _mm_mask_cvt_roundss_sd (__m128d src, __mmask8 k, __m128d a, __m128 b, int sae) { #error "Not implemented" }
vcvtss2sd
__m128d _mm_maskz_cvt_roundss_sd (__mmask8 k, __m128d a, __m128 b, int sae) { #error "Not implemented" } { #error "Not implemented" }
vcvtss2sh
__m128h _mm_cvt_roundss_sh (__m128h a, __m128 b, const int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtss2sh
__m128h _mm_mask_cvt_roundss_sh (__m128h src, __mmask8 k, __m128h a, __m128 b, const int rounding) { #error "Not implemented" }
vcvtss2sh
__m128h _mm_maskz_cvt_roundss_sh (__mmask8 k, __m128h a, __m128 b, const int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtss2si
int _mm_cvt_roundss_si32 (__m128 a, int rounding) { #error "Not implemented" }
vcvtss2si
__int64 _mm_cvt_roundss_si64 (__m128 a, int rounding) { #error "Not implemented" }
vcvtss2usi
unsigned int _mm_cvt_roundss_u32 (__m128 a, int rounding) { #error "Not implemented" }
vcvtss2usi
unsigned __int64 _mm_cvt_roundss_u64 (__m128 a, int rounding) { #error "Not implemented" }
vcvtusi2sh
__m128h _mm_cvt_roundu32_sh (__m128h a, unsigned int b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtusi2ss
__m128 _mm_cvt_roundu32_ss (__m128 a, unsigned int b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtusi2sd
__m128d _mm_cvt_roundu64_sd (__m128d a, unsigned __int64 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtusi2sh
__m128h _mm_cvt_roundu64_sh (__m128h a, unsigned __int64 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
vcvtusi2ss
__m128 _mm_cvt_roundu64_ss (__m128 a, unsigned __int64 b, int rounding) { #error "Not implemented" } { #error "Not implemented" }
cvtsi2ss
__m128 _mm_cvt_si2ss (__m128 a, int b) { #error "Not implemented" }
cvtss2si
int _mm_cvt_ss2si (__m128 a) { #error "Not implemented" }
pmovsxwd
__m128i _mm_cvtepi16_epi32 (__m128i a) { #error "Not implemented" }
vpmovsxwd
__m128i _mm_mask_cvtepi16_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwd
__m128i _mm_maskz_cvtepi16_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxwd
__m256i _mm256_cvtepi16_epi32 (__m128i a) { #error "Not implemented" }
vpmovsxwd
__m256i _mm256_mask_cvtepi16_epi32 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwd
__m256i _mm256_maskz_cvtepi16_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwd
__m512i _mm512_cvtepi16_epi32 (__m256i a) { #error "Not implemented" }
vpmovsxwd
__m512i _mm512_mask_cvtepi16_epi32 (__m512i src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwd
__m512i _mm512_maskz_cvtepi16_epi32 (__mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
pmovsxwq
__m128i _mm_cvtepi16_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxwq
__m128i _mm_mask_cvtepi16_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwq
__m128i _mm_maskz_cvtepi16_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxwq
__m256i _mm256_cvtepi16_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxwq
__m256i _mm256_mask_cvtepi16_epi64 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwq
__m256i _mm256_maskz_cvtepi16_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwq
__m512i _mm512_cvtepi16_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxwq
__m512i _mm512_mask_cvtepi16_epi64 (__m512i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxwq
__m512i _mm512_maskz_cvtepi16_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovwb
__m128i _mm_cvtepi16_epi8 (__m128i a) { #error "Not implemented" }
vpmovwb
__m128i _mm_mask_cvtepi16_epi8 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovwb
__m128i _mm_maskz_cvtepi16_epi8 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovwb
__m128i _mm256_cvtepi16_epi8 (__m256i a) { #error "Not implemented" }
vpmovwb
__m128i _mm256_mask_cvtepi16_epi8 (__m128i src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovwb
__m128i _mm256_maskz_cvtepi16_epi8 (__mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovwb
__m256i _mm512_cvtepi16_epi8 (__m512i a) { #error "Not implemented" }
vpmovwb
__m256i _mm512_mask_cvtepi16_epi8 (__m256i src, __mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovwb
__m256i _mm512_maskz_cvtepi16_epi8 (__mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtw2ph
__m128h _mm_cvtepi16_ph (__m128i a) { #error "Not implemented" }
vcvtw2ph
__m128h _mm_mask_cvtepi16_ph (__m128h src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtw2ph
__m128h _mm_maskz_cvtepi16_ph (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtw2ph
__m256h _mm256_cvtepi16_ph (__m256i a) { #error "Not implemented" }
vcvtw2ph
__m256h _mm256_mask_cvtepi16_ph (__m256h src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtw2ph
__m256h _mm256_maskz_cvtepi16_ph (__mmask16 k, __m256i a) { #error "Not implemented" }
vcvtw2ph
__m512h _mm512_cvtepi16_ph (__m512i a) { #error "Not implemented" }
vcvtw2ph
__m512h _mm512_mask_cvtepi16_ph (__m512h src, __mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtw2ph
__m512h _mm512_maskz_cvtepi16_ph (__mmask32 k, __m512i a) { #error "Not implemented" }
vpmovwb
void _mm_mask_cvtepi16_storeu_epi8 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovwb
void _mm256_mask_cvtepi16_storeu_epi8 (void* base_addr, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovwb
void _mm512_mask_cvtepi16_storeu_epi8 (void* base_addr, __mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdw
__m128i _mm_cvtepi32_epi16 (__m128i a) { #error "Not implemented" }
vpmovdw
__m128i _mm_mask_cvtepi32_epi16 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdw
__m128i _mm_maskz_cvtepi32_epi16 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovdw
__m128i _mm256_cvtepi32_epi16 (__m256i a) { #error "Not implemented" }
vpmovdw
__m128i _mm256_mask_cvtepi32_epi16 (__m128i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdw
__m128i _mm256_maskz_cvtepi32_epi16 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdw
__m256i _mm512_cvtepi32_epi16 (__m512i a) { #error "Not implemented" }
vpmovdw
__m256i _mm512_mask_cvtepi32_epi16 (__m256i src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdw
__m256i _mm512_maskz_cvtepi32_epi16 (__mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
pmovsxdq
__m128i _mm_cvtepi32_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxdq
__m128i _mm_mask_cvtepi32_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxdq
__m128i _mm_maskz_cvtepi32_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxdq
__m256i _mm256_cvtepi32_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxdq
__m256i _mm256_mask_cvtepi32_epi64 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxdq
__m256i _mm256_maskz_cvtepi32_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxdq
__m512i _mm512_cvtepi32_epi64 (__m256i a) { #error "Not implemented" }
vpmovsxdq
__m512i _mm512_mask_cvtepi32_epi64 (__m512i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxdq
__m512i _mm512_maskz_cvtepi32_epi64 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdb
__m128i _mm_cvtepi32_epi8 (__m128i a) { #error "Not implemented" }
vpmovdb
__m128i _mm_mask_cvtepi32_epi8 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdb
__m128i _mm_maskz_cvtepi32_epi8 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovdb
__m128i _mm256_cvtepi32_epi8 (__m256i a) { #error "Not implemented" }
vpmovdb
__m128i _mm256_mask_cvtepi32_epi8 (__m128i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdb
__m128i _mm256_maskz_cvtepi32_epi8 (__mmask8 k, __m256i a) { #error "Not implemented" }
vpmovdb
__m128i _mm512_cvtepi32_epi8 (__m512i a) { #error "Not implemented" }
vpmovdb
__m128i _mm512_mask_cvtepi32_epi8 (__m128i src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdb
__m128i _mm512_maskz_cvtepi32_epi8 (__mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
cvtdq2pd
__m128d _mm_cvtepi32_pd (__m128i a) { #error "Not implemented" }
vcvtdq2pd
__m128d _mm_mask_cvtepi32_pd (__m128d src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2pd
__m128d _mm_maskz_cvtepi32_pd (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtdq2pd
__m256d _mm256_cvtepi32_pd (__m128i a) { #error "Not implemented" }
vcvtdq2pd
__m256d _mm256_mask_cvtepi32_pd (__m256d src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2pd
__m256d _mm256_maskz_cvtepi32_pd (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtdq2pd
__m512d _mm512_cvtepi32_pd (__m256i a) { #error "Not implemented" }
vcvtdq2pd
__m512d _mm512_mask_cvtepi32_pd (__m512d src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2pd
__m512d _mm512_maskz_cvtepi32_pd (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtdq2ph
__m128h _mm_cvtepi32_ph (__m128i a) { #error "Not implemented" }
vcvtdq2ph
__m128h _mm_mask_cvtepi32_ph (__m128h src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ph
__m128h _mm_maskz_cvtepi32_ph (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtdq2ph
__m128h _mm256_cvtepi32_ph (__m256i a) { #error "Not implemented" }
vcvtdq2ph
__m128h _mm256_mask_cvtepi32_ph (__m128h src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ph
__m128h _mm256_maskz_cvtepi32_ph (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtdq2ph
__m256h _mm512_cvtepi32_ph (__m512i a) { #error "Not implemented" }
vcvtdq2ph
__m256h _mm512_mask_cvtepi32_ph (__m256h src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ph
__m256h _mm512_maskz_cvtepi32_ph (__mmask16 k, __m512i a) { #error "Not implemented" }
cvtdq2ps
__m128 _mm_cvtepi32_ps (__m128i a) { #error "Not implemented" }
vcvtdq2ps
__m128 _mm_mask_cvtepi32_ps (__m128 src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ps
__m128 _mm_maskz_cvtepi32_ps (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtdq2ps
__m256 _mm256_cvtepi32_ps (__m256i a) { #error "Not implemented" }
vcvtdq2ps
__m256 _mm256_mask_cvtepi32_ps (__m256 src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ps
__m256 _mm256_maskz_cvtepi32_ps (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtdq2ps
__m512 _mm512_cvtepi32_ps (__m512i a) { #error "Not implemented" }
vcvtdq2ps
__m512 _mm512_mask_cvtepi32_ps (__m512 src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2ps
__m512 _mm512_maskz_cvtepi32_ps (__mmask16 k, __m512i a) { #error "Not implemented" }
vpmovdw
void _mm_mask_cvtepi32_storeu_epi16 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdw
void _mm256_mask_cvtepi32_storeu_epi16 (void* base_addr, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdw
void _mm512_mask_cvtepi32_storeu_epi16 (void* base_addr, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdb
void _mm_mask_cvtepi32_storeu_epi8 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdb
void _mm256_mask_cvtepi32_storeu_epi8 (void* base_addr, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovdb
void _mm512_mask_cvtepi32_storeu_epi8 (void* base_addr, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtdq2pd
__m512d _mm512_cvtepi32lo_pd (__m512i v2) { #error "Not implemented" }
vcvtdq2pd
__m512d _mm512_mask_cvtepi32lo_pd (__m512d src, __mmask8 k, __m512i v2) { #error "Not implemented" } { #error "Not implemented" }
vpmovqw
__m128i _mm_cvtepi64_epi16 (__m128i a) { #error "Not implemented" }
vpmovqw
__m128i _mm_mask_cvtepi64_epi16 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqw
__m128i _mm_maskz_cvtepi64_epi16 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovqw
__m128i _mm256_cvtepi64_epi16 (__m256i a) { #error "Not implemented" }
vpmovqw
__m128i _mm256_mask_cvtepi64_epi16 (__m128i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqw
__m128i _mm256_maskz_cvtepi64_epi16 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqw
__m128i _mm512_cvtepi64_epi16 (__m512i a) { #error "Not implemented" }
vpmovqw
__m128i _mm512_mask_cvtepi64_epi16 (__m128i src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqw
__m128i _mm512_maskz_cvtepi64_epi16 (__mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
__m128i _mm_cvtepi64_epi32 (__m128i a) { #error "Not implemented" }
vpmovqd
__m128i _mm_mask_cvtepi64_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
__m128i _mm_maskz_cvtepi64_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovqd
__m128i _mm256_cvtepi64_epi32 (__m256i a) { #error "Not implemented" }
vpmovqd
__m128i _mm256_mask_cvtepi64_epi32 (__m128i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
__m128i _mm256_maskz_cvtepi64_epi32 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
__m256i _mm512_cvtepi64_epi32 (__m512i a) { #error "Not implemented" }
vpmovqd
__m256i _mm512_mask_cvtepi64_epi32 (__m256i src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
__m256i _mm512_maskz_cvtepi64_epi32 (__mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqb
__m128i _mm_cvtepi64_epi8 (__m128i a) { #error "Not implemented" }
vpmovqb
__m128i _mm_mask_cvtepi64_epi8 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqb
__m128i _mm_maskz_cvtepi64_epi8 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovqb
__m128i _mm256_cvtepi64_epi8 (__m256i a) { #error "Not implemented" }
vpmovqb
__m128i _mm256_mask_cvtepi64_epi8 (__m128i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqb
__m128i _mm256_maskz_cvtepi64_epi8 (__mmask8 k, __m256i a) { #error "Not implemented" }
vpmovqb
__m128i _mm512_cvtepi64_epi8 (__m512i a) { #error "Not implemented" }
vpmovqb
__m128i _mm512_mask_cvtepi64_epi8 (__m128i src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqb
__m128i _mm512_maskz_cvtepi64_epi8 (__mmask8 k, __m512i a) { #error "Not implemented" }
vcvtqq2pd
__m128d _mm_cvtepi64_pd (__m128i a) { #error "Not implemented" }
vcvtqq2pd
__m128d _mm_mask_cvtepi64_pd (__m128d src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2pd
__m128d _mm_maskz_cvtepi64_pd (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtqq2pd
__m256d _mm256_cvtepi64_pd (__m256i a) { #error "Not implemented" }
vcvtqq2pd
__m256d _mm256_mask_cvtepi64_pd (__m256d src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2pd
__m256d _mm256_maskz_cvtepi64_pd (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtqq2pd
__m512d _mm512_cvtepi64_pd (__m512i a) { #error "Not implemented" }
vcvtqq2pd
__m512d _mm512_mask_cvtepi64_pd (__m512d src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2pd
__m512d _mm512_maskz_cvtepi64_pd (__mmask8 k, __m512i a) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm_cvtepi64_ph (__m128i a) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm_mask_cvtepi64_ph (__m128h src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ph
__m128h _mm_maskz_cvtepi64_ph (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm256_cvtepi64_ph (__m256i a) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm256_mask_cvtepi64_ph (__m128h src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ph
__m128h _mm256_maskz_cvtepi64_ph (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm512_cvtepi64_ph (__m512i a) { #error "Not implemented" }
vcvtqq2ph
__m128h _mm512_mask_cvtepi64_ph (__m128h src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ph
__m128h _mm512_maskz_cvtepi64_ph (__mmask8 k, __m512i a) { #error "Not implemented" }
vcvtqq2ps
__m128 _mm_cvtepi64_ps (__m128i a) { #error "Not implemented" }
vcvtqq2ps
__m128 _mm_mask_cvtepi64_ps (__m128 src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ps
__m128 _mm_maskz_cvtepi64_ps (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtqq2ps
__m128 _mm256_cvtepi64_ps (__m256i a) { #error "Not implemented" }
vcvtqq2ps
__m128 _mm256_mask_cvtepi64_ps (__m128 src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ps
__m128 _mm256_maskz_cvtepi64_ps (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtqq2ps
__m256 _mm512_cvtepi64_ps (__m512i a) { #error "Not implemented" }
vcvtqq2ps
__m256 _mm512_mask_cvtepi64_ps (__m256 src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtqq2ps
__m256 _mm512_maskz_cvtepi64_ps (__mmask8 k, __m512i a) { #error "Not implemented" }
vpmovqw
void _mm_mask_cvtepi64_storeu_epi16 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqw
void _mm256_mask_cvtepi64_storeu_epi16 (void* base_addr, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqw
void _mm512_mask_cvtepi64_storeu_epi16 (void* base_addr, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
void _mm_mask_cvtepi64_storeu_epi32 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
void _mm256_mask_cvtepi64_storeu_epi32 (void* base_addr, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqd
void _mm512_mask_cvtepi64_storeu_epi32 (void* base_addr, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqb
void _mm_mask_cvtepi64_storeu_epi8 (void* base_addr, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqb
void _mm256_mask_cvtepi64_storeu_epi8 (void* base_addr, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovqb
void _mm512_mask_cvtepi64_storeu_epi8 (void* base_addr, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
pmovsxbw
__m128i _mm_cvtepi8_epi16 (__m128i a) { #error "Not implemented" }
vpmovsxbw
__m128i _mm_mask_cvtepi8_epi16 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbw
__m128i _mm_maskz_cvtepi8_epi16 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxbw
__m256i _mm256_cvtepi8_epi16 (__m128i a) { #error "Not implemented" }
vpmovsxbw
__m256i _mm256_mask_cvtepi8_epi16 (__m256i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbw
__m256i _mm256_maskz_cvtepi8_epi16 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbw
__m512i _mm512_cvtepi8_epi16 (__m256i a) { #error "Not implemented" }
vpmovsxbw
__m512i _mm512_mask_cvtepi8_epi16 (__m512i src, __mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbw
__m512i _mm512_maskz_cvtepi8_epi16 (__mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
pmovsxbd
__m128i _mm_cvtepi8_epi32 (__m128i a) { #error "Not implemented" }
vpmovsxbd
__m128i _mm_mask_cvtepi8_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbd
__m128i _mm_maskz_cvtepi8_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxbd
__m256i _mm256_cvtepi8_epi32 (__m128i a) { #error "Not implemented" }
vpmovsxbd
__m256i _mm256_mask_cvtepi8_epi32 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbd
__m256i _mm256_maskz_cvtepi8_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxbd
__m512i _mm512_cvtepi8_epi32 (__m128i a) { #error "Not implemented" }
vpmovsxbd
__m512i _mm512_mask_cvtepi8_epi32 (__m512i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbd
__m512i _mm512_maskz_cvtepi8_epi32 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
pmovsxbq
__m128i _mm_cvtepi8_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxbq
__m128i _mm_mask_cvtepi8_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbq
__m128i _mm_maskz_cvtepi8_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxbq
__m256i _mm256_cvtepi8_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxbq
__m256i _mm256_mask_cvtepi8_epi64 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbq
__m256i _mm256_maskz_cvtepi8_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovsxbq
__m512i _mm512_cvtepi8_epi64 (__m128i a) { #error "Not implemented" }
vpmovsxbq
__m512i _mm512_mask_cvtepi8_epi64 (__m512i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovsxbq
__m512i _mm512_maskz_cvtepi8_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
pmovzxwd
__m128i _mm_cvtepu16_epi32 (__m128i a) { #error "Not implemented" }
vpmovzxwd
__m128i _mm_mask_cvtepu16_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwd
__m128i _mm_maskz_cvtepu16_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxwd
__m256i _mm256_cvtepu16_epi32 (__m128i a) { #error "Not implemented" }
vpmovzxwd
__m256i _mm256_mask_cvtepu16_epi32 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwd
__m256i _mm256_maskz_cvtepu16_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwd
__m512i _mm512_cvtepu16_epi32 (__m256i a) { #error "Not implemented" }
vpmovzxwd
__m512i _mm512_mask_cvtepu16_epi32 (__m512i src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwd
__m512i _mm512_maskz_cvtepu16_epi32 (__mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
pmovzxwq
__m128i _mm_cvtepu16_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxwq
__m128i _mm_mask_cvtepu16_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwq
__m128i _mm_maskz_cvtepu16_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxwq
__m256i _mm256_cvtepu16_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxwq
__m256i _mm256_mask_cvtepu16_epi64 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwq
__m256i _mm256_maskz_cvtepu16_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwq
__m512i _mm512_cvtepu16_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxwq
__m512i _mm512_mask_cvtepu16_epi64 (__m512i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxwq
__m512i _mm512_maskz_cvtepu16_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuw2ph
__m128h _mm_cvtepu16_ph (__m128i a) { #error "Not implemented" }
vcvtuw2ph
__m128h _mm_mask_cvtepu16_ph (__m128h src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuw2ph
__m128h _mm_maskz_cvtepu16_ph (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtuw2ph
__m256h _mm256_cvtepu16_ph (__m256i a) { #error "Not implemented" }
vcvtuw2ph
__m256h _mm256_mask_cvtepu16_ph (__m256h src, __mmask16 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuw2ph
__m256h _mm256_maskz_cvtepu16_ph (__mmask16 k, __m256i a) { #error "Not implemented" }
vcvtuw2ph
__m512h _mm512_cvtepu16_ph (__m512i a) { #error "Not implemented" }
vcvtuw2ph
__m512h _mm512_mask_cvtepu16_ph (__m512h src, __mmask32 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuw2ph
__m512h _mm512_maskz_cvtepu16_ph (__mmask32 k, __m512i a) { #error "Not implemented" }
pmovzxdq
__m128i _mm_cvtepu32_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxdq
__m128i _mm_mask_cvtepu32_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxdq
__m128i _mm_maskz_cvtepu32_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxdq
__m256i _mm256_cvtepu32_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxdq
__m256i _mm256_mask_cvtepu32_epi64 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxdq
__m256i _mm256_maskz_cvtepu32_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxdq
__m512i _mm512_cvtepu32_epi64 (__m256i a) { #error "Not implemented" }
vpmovzxdq
__m512i _mm512_mask_cvtepu32_epi64 (__m512i src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxdq
__m512i _mm512_maskz_cvtepu32_epi64 (__mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2pd
__m128d _mm_cvtepu32_pd (__m128i a) { #error "Not implemented" }
vcvtudq2pd
__m128d _mm_mask_cvtepu32_pd (__m128d src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2pd
__m128d _mm_maskz_cvtepu32_pd (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtudq2pd
__m256d _mm256_cvtepu32_pd (__m128i a) { #error "Not implemented" }
vcvtudq2pd
__m256d _mm256_mask_cvtepu32_pd (__m256d src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2pd
__m256d _mm256_maskz_cvtepu32_pd (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtudq2pd
__m512d _mm512_cvtepu32_pd (__m256i a) { #error "Not implemented" }
vcvtudq2pd
__m512d _mm512_mask_cvtepu32_pd (__m512d src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2pd
__m512d _mm512_maskz_cvtepu32_pd (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtudq2ph
__m128h _mm_cvtepu32_ph (__m128i a) { #error "Not implemented" }
vcvtudq2ph
__m128h _mm_mask_cvtepu32_ph (__m128h src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2ph
__m128h _mm_maskz_cvtepu32_ph (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtudq2ph
__m128h _mm256_cvtepu32_ph (__m256i a) { #error "Not implemented" }
vcvtudq2ph
__m128h _mm256_mask_cvtepu32_ph (__m128h src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2ph
__m128h _mm256_maskz_cvtepu32_ph (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtudq2ph
__m256h _mm512_cvtepu32_ph (__m512i a) { #error "Not implemented" }
vcvtudq2ph
__m256h _mm512_mask_cvtepu32_ph (__m256h src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2ph
__m256h _mm512_maskz_cvtepu32_ph (__mmask16 k, __m512i a) { #error "Not implemented" }
vcvtudq2ps
__m512 _mm512_cvtepu32_ps (__m512i a) { #error "Not implemented" }
vcvtudq2ps
__m512 _mm512_mask_cvtepu32_ps (__m512 src, __mmask16 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtudq2ps
__m512 _mm512_maskz_cvtepu32_ps (__mmask16 k, __m512i a) { #error "Not implemented" }
vcvtudq2pd
__m512d _mm512_cvtepu32lo_pd (__m512i v2) { #error "Not implemented" }
vcvtudq2pd
__m512d _mm512_mask_cvtepu32lo_pd (__m512d src, __mmask8 k, __m512i v2) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2pd
__m128d _mm_cvtepu64_pd (__m128i a) { #error "Not implemented" }
vcvtuqq2pd
__m128d _mm_mask_cvtepu64_pd (__m128d src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2pd
__m128d _mm_maskz_cvtepu64_pd (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtuqq2pd
__m256d _mm256_cvtepu64_pd (__m256i a) { #error "Not implemented" }
vcvtuqq2pd
__m256d _mm256_mask_cvtepu64_pd (__m256d src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2pd
__m256d _mm256_maskz_cvtepu64_pd (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtuqq2pd
__m512d _mm512_cvtepu64_pd (__m512i a) { #error "Not implemented" }
vcvtuqq2pd
__m512d _mm512_mask_cvtepu64_pd (__m512d src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2pd
__m512d _mm512_maskz_cvtepu64_pd (__mmask8 k, __m512i a) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm_cvtepu64_ph (__m128i a) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm_mask_cvtepu64_ph (__m128h src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm_maskz_cvtepu64_ph (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm256_cvtepu64_ph (__m256i a) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm256_mask_cvtepu64_ph (__m128h src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm256_maskz_cvtepu64_ph (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm512_cvtepu64_ph (__m512i a) { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm512_mask_cvtepu64_ph (__m128h src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ph
__m128h _mm512_maskz_cvtepu64_ph (__mmask8 k, __m512i a) { #error "Not implemented" }
vcvtuqq2ps
__m128 _mm_cvtepu64_ps (__m128i a) { #error "Not implemented" }
vcvtuqq2ps
__m128 _mm_mask_cvtepu64_ps (__m128 src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ps
__m128 _mm_maskz_cvtepu64_ps (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtuqq2ps
__m128 _mm256_cvtepu64_ps (__m256i a) { #error "Not implemented" }
vcvtuqq2ps
__m128 _mm256_mask_cvtepu64_ps (__m128 src, __mmask8 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ps
__m128 _mm256_maskz_cvtepu64_ps (__mmask8 k, __m256i a) { #error "Not implemented" }
vcvtuqq2ps
__m256 _mm512_cvtepu64_ps (__m512i a) { #error "Not implemented" }
vcvtuqq2ps
__m256 _mm512_mask_cvtepu64_ps (__m256 src, __mmask8 k, __m512i a) { #error "Not implemented" } { #error "Not implemented" }
vcvtuqq2ps
__m256 _mm512_maskz_cvtepu64_ps (__mmask8 k, __m512i a) { #error "Not implemented" }
pmovzxbw
__m128i _mm_cvtepu8_epi16 (__m128i a) { #error "Not implemented" }
vpmovzxbw
__m128i _mm_mask_cvtepu8_epi16 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbw
__m128i _mm_maskz_cvtepu8_epi16 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxbw
__m256i _mm256_cvtepu8_epi16 (__m128i a) { #error "Not implemented" }
vpmovzxbw
__m256i _mm256_mask_cvtepu8_epi16 (__m256i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbw
__m256i _mm256_maskz_cvtepu8_epi16 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbw
__m512i _mm512_cvtepu8_epi16 (__m256i a) { #error "Not implemented" }
vpmovzxbw
__m512i _mm512_mask_cvtepu8_epi16 (__m512i src, __mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbw
__m512i _mm512_maskz_cvtepu8_epi16 (__mmask32 k, __m256i a) { #error "Not implemented" } { #error "Not implemented" }
pmovzxbd
__m128i _mm_cvtepu8_epi32 (__m128i a) { #error "Not implemented" }
vpmovzxbd
__m128i _mm_mask_cvtepu8_epi32 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbd
__m128i _mm_maskz_cvtepu8_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxbd
__m256i _mm256_cvtepu8_epi32 (__m128i a) { #error "Not implemented" }
vpmovzxbd
__m256i _mm256_mask_cvtepu8_epi32 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbd
__m256i _mm256_maskz_cvtepu8_epi32 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxbd
__m512i _mm512_cvtepu8_epi32 (__m128i a) { #error "Not implemented" }
vpmovzxbd
__m512i _mm512_mask_cvtepu8_epi32 (__m512i src, __mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbd
__m512i _mm512_maskz_cvtepu8_epi32 (__mmask16 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
pmovzxbq
__m128i _mm_cvtepu8_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxbq
__m128i _mm_mask_cvtepu8_epi64 (__m128i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbq
__m128i _mm_maskz_cvtepu8_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxbq
__m256i _mm256_cvtepu8_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxbq
__m256i _mm256_mask_cvtepu8_epi64 (__m256i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbq
__m256i _mm256_maskz_cvtepu8_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vpmovzxbq
__m512i _mm512_cvtepu8_epi64 (__m128i a) { #error "Not implemented" }
vpmovzxbq
__m512i _mm512_mask_cvtepu8_epi64 (__m512i src, __mmask8 k, __m128i a) { #error "Not implemented" } { #error "Not implemented" }
vpmovzxbq
__m512i _mm512_maskz_cvtepu8_epi64 (__mmask8 k, __m128i a) { #error "Not implemented" }
vcvtsi2sd
__m128d _mm_cvti32_sd (__m128d a, int b) { #error "Not implemented" }
vcvtsi2sh
__m128h _mm_cvti32_sh (__m128h a, int b) { #error "Not implemented" }
vcvtsi2ss
__m128 _mm_cvti32_ss (__m128 a, int b) { #error "Not implemented" }
vcvtsi2sd
__m128d _mm_cvti64_sd (__m128d a, __int64 b) { #error "Not implemented" }
vcvtsi2sh
__m128h _mm_cvti64_sh (__m128h a, __int64 b) { #error "Not implemented" }
vcvtsi2ss
__m128 _mm_cvti64_ss (__m128 a, __int64 b) { #error "Not implemented" }
movq
__int64 _mm_cvtm64_si64 (__m64 a) { #error "Not implemented" }
kmovw
unsigned int _cvtmask16_u32 (__mmask16 a) { #error "Not implemented" }
kmovd
unsigned int _cvtmask32_u32 (__mmask32 a) { #error "Not implemented" }
kmovq
unsigned __int64 _cvtmask64_u64 (__mmask64 a) { #error "Not implemented" }
kmovb
unsigned int _cvtmask8_u32 (__mmask8 a) { #error "Not implemented" }
vcvtne2ps2bf16
__m128bh _mm_cvtne2ps_pbh (__m128 a, __m128 b) { #error "Not implemented" }
vcvtne2ps2bf16
__m128bh _mm_mask_cvtne2ps_pbh (__m128bh src, __mmask8 k, __m128 a, __m128 b) { #error "Not implemented" } { #error "Not implemented" }
vcvtne2ps2bf16
__m128bh _mm_maskz_cvtne2ps_pbh (__mmask8 k, __m128 a, __m128 b) { #error "Not implemented" } { #error "Not implemented" }
vcvtne2ps2bf16
__m256bh _mm256_cvtne2ps_pbh (__m256 a, __m256 b) { #error "Not implemented" }
vcvtne2ps2bf16
__m256bh _mm256_mask_cvtne2ps_pbh (__m256bh src, __mmask16 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vcvtne2ps2bf16
__m256bh _mm256_maskz_cvtne2ps_pbh (__mmask16 k, __m256 a, __m256 b) { #error "Not implemented" } { #error "Not implemented" }
vcvtne2ps2bf16
__m512bh _mm512_cvtne2ps_pbh (__m512 a, __m512 b) { #error "Not implemented" }
vcvtne2ps2bf16
__m512bh _mm512_mask_cvtne2ps_pbh (__m512bh src, __mmask32 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
vcvtne2ps2bf16
__m512bh _mm512_maskz_cvtne2ps_pbh (__mmask32 k, __m512 a, __m512 b) { #error "Not implemented" } { #error "Not implemented" }
vcvtneebf162ps
__m128 _mm_cvtneebf16_ps (const __m128bh* __A) { #error "Not implemented" }
vcvtneebf162ps
__m256 _mm256_cvtneebf16_ps (const __m256bh* __A) { #error "Not implemented" }
vcvtneeph2ps
__m128 _mm_cvtneeph_ps (const __m128h* __A) { #error "Not implemented" }
vcvtneeph2ps
__m256 _mm256_cvtneeph_ps (const __m256h* __A) { #error "Not implemented" }
vcvtneobf162ps
__m128 _mm_cvtneobf16_ps (const __m128bh* __A) { #error "Not implemented" }
vcvtneobf162ps
__m256 _mm256_cvtneobf16_ps (const __m256bh* __A) { #error "Not implemented" }
vcvtneoph2ps
__m128 _mm_cvtneoph_ps (const __m128h* __A) { #error "Not implemented" }
vcvtneoph2ps
__m256 _mm256_cvtneoph_ps (const __m256h* __A) { #error "Not implemented" }
vcvtneps2bf16
__m128bh _mm_cvtneps_avx_pbh (__m128 __A) { #error "Not implemented" }
vcvtneps2bf16
__m128bh _mm256_cvtneps_avx_pbh (__m256 __A) { #error "Not implemented" }
vcvtneps2bf16
__m128bh _mm_cvtneps_pbh (__m128 a) { #error "Not implemented" }

#endif

/* © Intel Corporation */