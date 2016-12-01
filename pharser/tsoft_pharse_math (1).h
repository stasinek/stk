//---------------------------------------------------------------------------
#ifndef __tsoft_math_pharser_HDR__
#define __tsoft_math_pharser_HDR__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
class __math_pharser {
private:
		char	*f_expression;
		char	*f_splited_expression[10];
		int32_t  f_splited_expression_count;
		int32_t __stdcall f_decode_subexpression(const int32_t a_index);
public:
		__stdcall  __math_pharser(void);
		__stdcall ~__math_pharser(void);
		int32_t __stdcall decode(const char *a_expression);
		int32_t result;
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
