//---------------------------------------------------------------------------
#if defined(__SSE41__)
//---------------------------------------------------------------------------
#ifndef __stk_sse_3DVECTOR_h__
#define __stk_sse_3DVECTOR_h__
//---------------------------------------------------------------------------
#include <smmintrin.h>
//---------------------------------------------------------------------------
// Simple vector class
_MM_ALIGN16 class STK_IMPEXP __sse_3Dvector
{
 public:
  // constructors
  inline __sse_3Dvector() : mmvalue(_mm_setzero_ps()) {}
  inline __sse_3Dvector(float x, float y, float z) : mmvalue(_mm_set_ps(0, z, y, x)) {}
  inline __sse_3Dvector(__m128 m) : mmvalue(m) {}

  // arithmetic operators with __sse_3Dvector
  inline __sse_3Dvector operator+(const __sse_3Dvector& b) const { return _mm_add_ps(mmvalue, b.mmvalue); }
  inline __sse_3Dvector operator-(const __sse_3Dvector& b) const { return _mm_sub_ps(mmvalue, b.mmvalue); }
  inline __sse_3Dvector operator*(const __sse_3Dvector& b) const { return _mm_mul_ps(mmvalue, b.mmvalue); }
  inline __sse_3Dvector operator/(const __sse_3Dvector& b) const { return _mm_div_ps(mmvalue, b.mmvalue); }

  // op= operators
  inline __sse_3Dvector& operator+=(const __sse_3Dvector& b) { mmvalue = _mm_add_ps(mmvalue, b.mmvalue); return *this; }
  inline __sse_3Dvector& operator-=(const __sse_3Dvector& b) { mmvalue = _mm_sub_ps(mmvalue, b.mmvalue); return *this; }
  inline __sse_3Dvector& operator*=(const __sse_3Dvector& b) { mmvalue = _mm_mul_ps(mmvalue, b.mmvalue); return *this; }
  inline __sse_3Dvector& operator/=(const __sse_3Dvector& b) { mmvalue = _mm_div_ps(mmvalue, b.mmvalue); return *this; }

  // arithmetic operators with float
  inline __sse_3Dvector operator+(float b) const { return _mm_add_ps(mmvalue, _mm_set1_ps(b)); }
  inline __sse_3Dvector operator-(float b) const { return _mm_sub_ps(mmvalue, _mm_set1_ps(b)); }
  inline __sse_3Dvector operator*(float b) const { return _mm_mul_ps(mmvalue, _mm_set1_ps(b)); }
  inline __sse_3Dvector operator/(float b) const { return _mm_div_ps(mmvalue, _mm_set1_ps(b)); }

  // op= operators with float
  inline __sse_3Dvector& operator+=(float b) { mmvalue = _mm_add_ps(mmvalue, _mm_set1_ps(b)); return *this; }
  inline __sse_3Dvector& operator-=(float b) { mmvalue = _mm_sub_ps(mmvalue, _mm_set1_ps(b)); return *this; }
  inline __sse_3Dvector& operator*=(float b) { mmvalue = _mm_mul_ps(mmvalue, _mm_set1_ps(b)); return *this; }
  inline __sse_3Dvector& operator/=(float b) { mmvalue = _mm_div_ps(mmvalue, _mm_set1_ps(b)); return *this; }

  // cross product
  inline __sse_3Dvector cross(const __sse_3Dvector& b) const
  {
   return _mm_sub_ps(
    _mm_mul_ps(_mm_shuffle_ps(mmvalue, mmvalue, _MM_SHUFFLE(3, 0, 2, 1)), _mm_shuffle_ps(b.mmvalue, b.mmvalue, _MM_SHUFFLE(3, 1, 0, 2))),
    _mm_mul_ps(_mm_shuffle_ps(mmvalue, mmvalue, _MM_SHUFFLE(3, 1, 0, 2)), _mm_shuffle_ps(b.mmvalue, b.mmvalue, _MM_SHUFFLE(3, 0, 2, 1)))
   );
  }

  // dot product with another vector
  inline float dot(const __sse_3Dvector& b) const { return _mm_cvtss_f32(_mm_dp_ps(mmvalue, b.mmvalue, 0x71L)); }
  // length of the vector
  inline float length() const { return _mm_cvtss_f32(_mm_sqrt_ss(_mm_dp_ps(mmvalue, mmvalue, 0x71L))); }
  // 1/length() of the vector
  inline float rlength() const { return _mm_cvtss_f32(_mm_rsqrt_ss(_mm_dp_ps(mmvalue, mmvalue, 0x71L))); }
  // returns the vector scaled to unit length
  inline __sse_3Dvector normalize() const { return _mm_mul_ps(mmvalue, _mm_rsqrt_ps(_mm_dp_ps(mmvalue, mmvalue, 0x7FL))); }

  // overloaded operators that ensure alignment
  inline void* operator new[](size_t x) { return _aligned_stk::mem::alloc(x, 16); }
  inline void operator delete[](void* x) { if (x) _aligned_free(x); }

  // Member variables
  union
  {
   struct { float x, y, z; };
   __m128 mmvalue;
  };
};

inline __sse_3Dvector operator+(float a, const __sse_3Dvector& b) { return b + a; }
inline __sse_3Dvector operator-(float a, const __sse_3Dvector& b) { return __sse_3Dvector(_mm_set1_ps(a)) - b; }
inline __sse_3Dvector operator*(float a, const __sse_3Dvector& b) { return b * a; }
inline __sse_3Dvector operator/(float a, const __sse_3Dvector& b) { return __sse_3Dvector(_mm_set1_ps(a)) / b; }

//---------------------------------------------------------------------------
#endif // __sse_vector_h__
#endif // ifdef __SSE4__
//---------------------------------------------------------------------------
