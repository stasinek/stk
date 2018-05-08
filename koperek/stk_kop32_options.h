//---------------------------------------------------------------------------
#ifndef __stk_kop32_options_h
#define __stk_kop32_options_h
//---------------------------------------------------------------------------
#include "./../database/stk_database.h"
#include "./../hash/stk_hash_password.h"
#include "./../file/eno/stk_file_lzst_header.h"
//---------------------------------------------------------------------------
namespace stk {
//---------------------------------------------------------------------------
#define ASK_USER			(int8_t)0x00L
#define ASK_NO				(int8_t)0x01L
#define ASK_ALL				(int8_t)0x02L
//---------------------------------------------------------------------------
class  __kop32_class_options {
//---------------------------------------------------------------------------
        public:
        //------------------------------------
        STK_IMPEXP  __stdcall  __kop32_class_options();
        STK_IMPEXP  __stdcall ~__kop32_class_options();
        void STK_IMPEXP  __stdcall reset();
        //------------------------------------
        uint32_t operation;
        #define  OPERATION_NULL		(uint32_t)0x00000000L
        #define  OPERATION_COPY		(uint32_t)0x00000001L
        #define  OPERATION_ENCODE	(uint32_t)0x00000002L
        #define  OPERATION_DECODE	(uint32_t)0x00000004L
        #define  OPERATION_MOVE		(uint32_t)0x00000008L
        #define  OPERATION_REMOVE	(uint32_t)0x00000010L
        #define  OPERATION_LIST		(uint32_t)0x00000020L
        #define  OPERATION_CHECKSUM	(uint32_t)0x00000080L
        #define  OPERATION_COMPARE	(uint32_t)0x00000021L
        #define  OPERATION_SELECT	(uint32_t)0x00000040L
        #define  OPERATION_SEEK 	(uint32_t)0x00080000L
        //------------------------------------
        uint32_t ask_at_break, ask_at_error;
        //------------------------------------
        // block size kB 1-65536(64MB)
        uint32_t block_size;
        //flush buffer or not
        uint16_t block_is_cached;
        // coder type
        uint16_t coder;
        // dict size 256B-16MB(0x100-0x01000000)
        uint32_t coder_LZS_dup_size;
        // checksum
        uint32_t checksum;
        #define  CHECKSUM_SSC1024 	(uint32_t)0x00001000L
        // interval for checksum
        uint32_t checksum_interval;
        //------------------------------------
        //file mask, arguments for listing
        __database *mask_list;
        //initial directiories for xbar processing
        __database *src_init_list, *dst_init_list;
        //output list for listing
        __database *output_arguments_list;
        //password for file cripter
        __password *password;
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
