//---------------------------------------------------------------------------
#pragma hdrstop
//---------------------------------------------------------------------------
#include "stk_kop32_options.h"
//---------------------------------------------------------------------------

__stdcall  stk::__kop32_class_options::__kop32_class_options()
{
        mask_list = new __database();
        src_init_list = new __database();
        dst_init_list = new __database();
        output_arguments_list = new __database();
        password = new __password();

        reset();
}
__stdcall stk::__kop32_class_options::~__kop32_class_options()
{
        delete mask_list;
        delete src_init_list;
        delete dst_init_list;
        delete output_arguments_list;
        delete password;
}
//---------------------------------------------------------------------------

void __stdcall stk::__kop32_class_options::reset()
{
        operation = OPERATION_NULL;
        ask_at_break = ASK_USER;
        ask_at_error = ASK_USER;
        block_is_cached = false;
        block_size =  64 * 1024;  // ONE RAM SEGMENT, KEEP IT! THAT JUST FOR..FUTURE ;)
        coder = LZSS_CODER_LZS;
        coder_LZS_dup_size = 8 * 1024;
        checksum = CHECKSUM_SSC1024;
        checksum_interval = 65536;
        mask_list->clear();
        mask_list->import_from("*.*","CVS");
        src_init_list->clear();
        dst_init_list->clear();
        output_arguments_list->clear();
        output_arguments_list->import_from("#file_name","CVS");
        password->text = "";
}
//---------------------------------------------------------------------------

