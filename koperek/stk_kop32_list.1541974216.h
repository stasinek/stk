//---------------------------------------------------------------------------
#ifndef __stk_kop32_list_H__
#define __stk_kop32_list_H__
//---------------------------------------------------------------------------
#include "./../database/stk_database.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __kop32_class_list {
//---------------------------------------------------------------------------
        public:
                            __stdcall  __kop32_class_list();
        virtual             __stdcall ~__kop32_class_list();
        void                __stdcall reset();
        int32_t start_i, cur_i, inc_i;
        __database *src_main_list, *dst_main_list;
        __database *output_formated_list;
        __database *sync_op_list;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
} //namespace stk
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

