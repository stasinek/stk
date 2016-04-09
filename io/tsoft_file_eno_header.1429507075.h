//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_hdr_HDR__
#define __tsoft_hdr_HDR__
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

#define ENO_CODER_LZS	 (__int16)0x0001
#define ENO_CODER_HUF	 (__int16)0x0002
#define ENO_CODER_ARI	 (__int16)0x0004
#define ENO_CODER_BWT	 (__int16)0x0010
#define ENO_CODER_MTF	 (__int16)0x0020
#define ENO_CODER_ROT	 (__int16)0x0040
#define ENO_CODER_XOR	 (__int16)0x0080

#define ENO_CODER_CRC	 (__int16)0x0100
#define ENO_CODER_SSC	 (__int16)0x0200

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
		uint32_t ssc1024[32];
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
//@unknown, mostly extended(8bits=whole byte) & reserved for future use
#define R_MOST_RESERVED_CODE		 R_CODE_MASK

#define PASS_LEN_MIN		(__int32)(0x00000001)
#define PASS_LEN_1		(__int32)(0x0000000F)
#define PASS_LEN_2		(__int32)(0x000003FF)
#define PASS_LEN_MAX		PASS_LEN_2

#define BRUN_LEN_MIN		(__int32)(0x00000002)
#define BRUN_LEN_1		(__int32)(0x0000000F)
#define BRUN_LEN_2		(__int32)(0x000003FF)
#define BRUN_LEN_MAX		BRUN_LEN_2

#define DICT_LEN_MIN		(__int32)(0x00000004)
#define DICT_LEN_1		(__int32)(0x0000000F)
#define DICT_LEN_2		(__int32)(0x000003FF)
#define DICT_LEN_MAX		DICT_LEN_2
#define DICT_OFFSET_MIN		(__int32)(0x00000004)
#define DICT_OFFSET_1  		(__int32)(0x000000FF)
#define DICT_OFFSET_2		(__int32)(0x0000FFFF)
#define DICT_OFFSET_3		(__int32)(0x00FFFFFF)
#define DICT_OFFSET_MAX		DICT_OFFSET_3

class __lzssv4_header_coder {
public:
		static unsigned __int8 __stdcall pass_encode(void *a_code_ptr,__int32 axdata_uncoded_len);
		static unsigned __int8 __stdcall pass_decode(__int32 *a_data_uncoded_len,void *a_code_ptr);
		static unsigned __int8 __stdcall pass_Price(__int32 axdata_uncoded_len);

		static unsigned __int8 __stdcall brun_encode(void *a_code_ptr,__int32 axdata_uncoded_counte, __int32 axdata_uncoded_elsize);
		static unsigned __int8 __stdcall brun_decode(__int32 *a_data_uncoded_counte,__int32 *a_data_uncoded_elsize,void *a_code_ptr);
		static unsigned __int8 __stdcall brun_Price(__int32 axdata_uncoded_counte,__int32 axdata_uncoded_elsizes);

		static unsigned __int8 __stdcall dict_encode(void *a_code_ptr,__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset);
		static unsigned __int8 __stdcall dict_decode(__int32 *a_data_uncoded_len,__int32 *a_data_uncoded_offset,void *a_code_ptr);
		static unsigned __int8 __stdcall dict_Price(__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset);

		static __int32 __stdcall  check_dict_Match_Cost(__int32 apass_len,__int32 adict_len,__int32 adict_offset);
		static __int32 __stdcall  check_brun_Match_Cost(__int32 apass_len,__int32 abrun_counte,__int32 abrun_elsize);

};
#endif
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

