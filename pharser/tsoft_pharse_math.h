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
		__int32  f_splited_expression_count;
		__int32 __stdcall f_decode_subexpression(const __int32 a_index);
public:
		__stdcall  __math_pharser(void);
		__stdcall ~__math_pharser(void);
		__int32 __stdcall decode(const char *a_expression);
		__int32 result;
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
