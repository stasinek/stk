//---------------------------------------------------------------------------
#ifndef __stk_math_pharser_HDR__
#define __stk_math_pharser_HDR__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
class __math_pharser {
private:
		char	*f_expression;
		char	*f_splited_expression[10];
        int32_t  f_splited_expression_count;
        int32_t __stdcall f_decode_subexpression(const uint32_t a_index);
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
