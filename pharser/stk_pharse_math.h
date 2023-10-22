//---------------------------------------------------------------------------
#ifndef __stk_math_pharser_h__
#define __stk_math_pharser_h__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __math_pharser {
private:
        char	*f_expression;
        char	*f_splited_expression[10];
        int32_t  f_splited_expression_count;
        int32_t            __stdcall f_decode_subexpression(const uint32_t a_index);
public:
                           __stdcall  __math_pharser(void);
                           __stdcall ~__math_pharser(void);
        int32_t            __stdcall decode(const char *a_expression);
        int32_t result;
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
} //namespace stk
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
