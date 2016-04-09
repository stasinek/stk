//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_options_H__
#define __tsoft_kop32_options_H__
//---------------------------------------------------------------------------
#include "./../database/tsoft_database.h"
#include "./../hash/tsoft_hash_password.h"
#include "./../io/tsoft_file_lzss_header.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
#define ASK_USER			(__int8)0x00L
#define ASK_NO				(__int8)0x01L
#define ASK_ALL				(__int8)0x02L
//---------------------------------------------------------------------------
class  __kop32_class_options {
//---------------------------------------------------------------------------
		public:
				//------------------------------------
				__int32 operation;
#define OPERATION_NULL		(__int32)0x00000000L
#define OPERATION_COPY		(__int32)0x00000001L
#define OPERATION_ENCODE	(__int32)0x00000002L
#define OPERATION_DECODE	(__int32)0x00000004L
#define OPERATION_MOVE		(__int32)0x00000008L
#define OPERATION_REMOVE	(__int32)0x00000010L
#define OPERATION_LIST		(__int32)0x00000020L
#define OPERATION_CHECKSUM	(__int32)0x00000080L
#define OPERATION_COMPARE	(__int32)0x00000021L
#define OPERATION_SELECT	(__int32)0x00000040L
#define OPERATION_SEEK 		(__int32)0x00080000L
				//------------------------------------
				__int32 ask_at_break, ask_at_error;
				//------------------------------------
				// block size kB 1-65536(64MB)
				__int32 block_size;
				//flush buffer or not
				__int16 block_is_cached;
				// coder type
				__int16 coder;
				// dict size 256B-16MB(0x100-0x01000000)
				__int32 coder_LZS_dup_size;
				// checksum
				__int32 checksum;
#define CHECKSUM_SSC1024 	(__int32)0x00001000L
				// interval for checksum
				__int32 checksum_interval;
				//------------------------------------
				//file mask, arguments for listing
				__database *mask_list;
				//initial directiories for xbar processing
				__database *src_init_list, *dst_init_list;
				//output list for listing
				__database *output_arguments_list;
				//password for file cripter
				__password *password;
				//------------------------------------
				__stdcall  __kop32_class_options()
				{
						mask_list = new __database();
						src_init_list = new __database();
						dst_init_list = new __database();
						output_arguments_list = new __database();
						password = new __password();

						reset();
				}
				__stdcall ~__kop32_class_options() {
						delete mask_list;
						delete src_init_list;
						delete dst_init_list;
						delete output_arguments_list;
						delete password;
				}
				//------------------------------------
				void __stdcall reset() {
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
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
