//---------------------------------------------------------------------------
#ifndef __stk_kop32_list_H
#define __stk_kop32_list_H
//---------------------------------------------------------------------------
#include "./../database/stk_database.h"
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
class  __kop32_class_list {
//---------------------------------------------------------------------------
		public:
				__stdcall  __kop32_class_list() {
						src_main_list = new __database();
						dst_main_list = new __database();
						output_formated_list = new __database();
						sync_op_list  = new __database();
						reset();
						}
				__stdcall ~__kop32_class_list() {
						delete src_main_list;
						delete dst_main_list;
						delete output_formated_list;
						delete sync_op_list;
				}
				void __stdcall reset() {
						src_main_list->clear();
						dst_main_list->clear();
						output_formated_list->clear();
						sync_op_list->clear();
						start_i = 0; cur_i = 0; inc_i = +1;

				}
                int32_t start_i, cur_i, inc_i;
				__database *src_main_list, *dst_main_list;
				__database *output_formated_list;
				__database *sync_op_list;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

