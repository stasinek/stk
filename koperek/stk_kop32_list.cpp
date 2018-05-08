#include <koperek/stk_kop32_list.h>

//---------------------------------------------------------------------------

__stdcall  stk::__kop32_class_list::__kop32_class_list() {
        src_main_list = new __database();
        dst_main_list = new __database();
        output_formated_list = new __database();
        sync_op_list  = new __database();
        reset();
        }
//---------------------------------------------------------------------------

__stdcall stk::__kop32_class_list::~__kop32_class_list() {
        delete src_main_list;
        delete dst_main_list;
        delete output_formated_list;
        delete sync_op_list;
}
//---------------------------------------------------------------------------

void __stdcall stk::__kop32_class_list::reset() {
        src_main_list->clear();
        dst_main_list->clear();
        output_formated_list->clear();
        sync_op_list->clear();
        start_i = 0; cur_i = 0; inc_i = +1;

}
//---------------------------------------------------------------------------
