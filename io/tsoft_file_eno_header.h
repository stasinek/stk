//---------------------------------------------------------------------------
#ifndef __tsoft_file_eno_hdr_H__
#define __tsoft_file_eno_hdr_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace file_header {
//---------------------------------------------------------------------------

#define LZSSv4_HDR // define used HDR (less compilation time)

#define ENO_HEADER_SIG (__int32)(('.'<<24) | ('E'<<16) | ('N'<<8) | 'O')
typedef struct {
		__int32 signature;
		__int32 signature_version;
		__int32 reserved_1;
		__int32 o;
		__int32 o_h;
		__int32 size;
		__int32 size_h;
		__int32 attribute;
		__int32 attribute_ex;
		__int32 time_t;
		__int32 time_t_h;
		__int32 reserved_2;
} __eno_header_struct;

#define ENO_BLOCK_HEADER_SIG (__int16)(('B'<<8) | 'H')

#define ENO_CODER_LZS	 (__int16)0x0001L
#define ENO_CODER_HUF	 (__int16)0x0002L
#define ENO_CODER_ARI	 (__int16)0x0004L
#define ENO_CODER_BWT	 (__int16)0x0010L
#define ENO_CODER_MTF	 (__int16)0x0020L
#define ENO_CODER_ROT	 (__int16)0x0040L
#define ENO_CODER_XOR	 (__int16)0x0080L

#define ENO_CODER_CRC	 (__int16)0x0100L
#define ENO_CODER_SSC	 (__int16)0x0200L

#define ENO_CODER_DEFAULT (__int16)ENO_CODER_CRC | ENO_CODER_LZS

typedef struct {
		__int16 signature;
		__int16 signature_version;
		__int16 data_compression_coder;
		__int16 reserved_1;
		__int32 data_range_offset;
		__int32 data_range;
		uint32_t data_protection_code;
		__int16 reserved_2;
		__int16 size_count;
		__int32 size[8];
} __eno_block_header_struct;

#define ENO_AID_HEADER_SIG (__int16)(('S'<<8) | 'C')
typedef struct {
		__int16 signature;
		__int16 signature_version;
		__int16 aid_data_coder;
		__int16 reserved_1;
		__int32 data_range;
		uint32_t data_protection_code;
		__int16 reserved_2;
		__int16 ssc_bits_count;
		__int32 ssc1024[32];
} __eno_aid_header_struct;

//---------------------------------------------------------------------------
#ifdef  LZSSv4_HDR

#define X_CODE_MASK			 0x03L
//@pmask
#define X_PASS_CODE			 0x00L
#define X_BRUN_CODE			 0x01L
#define X_DICT_CODE			 0x02L
#define X_CODE				 X_CODE_MASK
//@ecode -->>
#define E_CODE_MASK			 0x0FL
#define E_PASS_CODE			(0x00L | X_CODE)
#define E_BRUN_CODE			(0x04L | X_CODE)
#define E_DICT_CODE			(0x08L | X_CODE)
#define R_CODE				 E_CODE_MASK
//@reserved codes ->>
#define R_CODE_MASK			 0x3FL
#define R_0_CODE			(0x00L | R_CODE)
#define R_1_CODE			(0x10L | R_CODE)
#define R_2_CODE			(0x20L | R_CODE)
//@unknown, extended(8bits=whole B) & reserved for future use
#define R_MOST_RESERVED_CODE R_CODE_MASK

#define PASS_LEN_MIN		(__int32)(0x00000001L)
#define PASS_LEN_1			(__int32)(0x0000000FL)
#define PASS_LEN_2			(__int32)(0x000003FFL)
#define PASS_LEN_MAX		PASS_LEN_2

#define BRUN_LEN_MIN		(__int32)(0x00000002L)
#define BRUN_LEN_1			(__int32)(0x0000000FL)
#define BRUN_LEN_2			(__int32)(0x000003FFL)
#define BRUN_LEN_MAX		BRUN_LEN_2

#define DICT_LEN_MIN		(__int32)(0x00000004L)
#define DICT_LEN_1			(__int32)(0x0000000FL)
#define DICT_LEN_2			(__int32)(0x000003FFL)
#define DICT_LEN_MAX		DICT_LEN_2
#define DICT_OFFSET_MIN		(__int32)(0x00000004L)
#define DICT_OFFSET_1  		(__int32)(0x000000FFL)
#define DICT_OFFSET_2		(__int32)(0x0000FFFFL)
#define DICT_OFFSET_3		(__int32)(0x00FFFFFFL)
#define DICT_OFFSET_MAX		DICT_OFFSET_3

class __lzssv4_header_coder {
public:
		static uint8_t __stdcall pass_encode(void *a_code_ptr,__int32 axdata_uncoded_len);
		static uint8_t __stdcall pass_decode(__int32 *a_data_uncoded_len,void *a_code_ptr);
		static uint8_t __stdcall pass_Price(__int32 axdata_uncoded_len);

		static uint8_t __stdcall brun_encode(void *a_code_ptr,__int32 axdata_uncoded_counte, __int32 axdata_uncoded_elsize);
		static uint8_t __stdcall brun_decode(__int32 *a_data_uncoded_counte,__int32 *a_data_uncoded_elsize,void *a_code_ptr);
		static uint8_t __stdcall brun_Price(__int32 axdata_uncoded_counte,__int32 axdata_uncoded_elsizes);

		static uint8_t __stdcall dict_encode(void *a_code_ptr,__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset);
		static uint8_t __stdcall dict_decode(__int32 *a_data_uncoded_len,__int32 *a_data_uncoded_offset,void *a_code_ptr);
		static uint8_t __stdcall dict_Price(__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset);

		static __int32 __stdcall  check_dict_Match_Cost(__int32 apass_len,__int32 adict_len,__int32 adict_offset);
		static __int32 __stdcall  check_brun_Match_Cost(__int32 apass_len,__int32 abrun_counte,__int32 abrun_elsize);

};
#endif
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

