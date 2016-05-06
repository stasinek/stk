//---------------------------------------------------------------------------
#ifndef tsoft__property_H
#define tsoft__property_H
//---------------------------------------------------------------------------
#include "./tsoft_MAIN.h"
#include <iostream>
//---------------------------------------------------------------------------
namespace ts {
#if defined(__GNUC__) || defined(__clang__)
//---------------------------------------------------------------------------
template <typename T> class __property {
				T f_value;
		public:
				T & operator = (const T &i)
				{
#ifdef __DEBUG_PROPERTY__
__DEBUG_FUNC_CALLED__
::std::cout << i << ::std::endl;
#endif
				return f_value = i;
				}
				// This template class member function template serves the purpose to make
				// typing more strict. Assignment to this is only possible with exact identical
				// types.
				template <typename T2> T2 & operator = (const T2 &i)
				{
#ifdef __DEBUG_PROPERTY__
__DEBUG_FUNC_CALLED__
::std::cout << "T2: " << i << ::std::endl;
#endif
				T2 &guard = f_value;
				throw guard; // Never reached.
				}
				operator T const & () const
				{
#ifdef __DEBUG_PROPERTY__
__DEBUG_FUNC_CALLED__
#endif
					return f_value;
				}
};
#endif
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
