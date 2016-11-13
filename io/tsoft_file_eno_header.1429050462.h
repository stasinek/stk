//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_hdr_HDR__
#define __tsoft_hdr_HDR__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include <inttypes.h>
//---------------------------------------------------------------------------
namespace ts { namespace file_header {
//---------------------------------------------------------------------------

#define LZSSv4_HDR // define used HDR (less compilation time)

#define ENO_HEADER_SIG (int32_t)(('.'<<24) | ('E'<<16) | ('N'<<8) | 'O')
typedef struct {
	int32_t signature;
	int32_t signature_version;
	int32_t reserved_1;
		int32_t o;
		int32_t o_h;
		int32_t size;
		int32_t size_h;
	int32_t attribute;
	int32_t attribute_ex;
	int32_t time_t;
	int32_t time_t_h;
	int32_t reserved_2;
} __eno_header_struct;

#define ENO_BLOCK_HEADER_SIG (int16_t)(('B'<<8) | 'H')

#define ENO_CODER_LZS	 (int16_t)0x0001
#define ENO_CODER_HUF	 (int16_t)0x0002
#define ENO_CODER_ARI	 (int16_t)0x0004
#define ENO_CODER_BWT	 (int16_t)0x0010
#define ENO_CODER_MTF	 (int16_t)0x0020
#define ENO_CODER_ROT	 (int16_t)0x0040
#define ENO_CODER_XOR	 (int16_t)0x0080

#define ENO_CODER_CRC	 (int16_t)0x0100
#define ENO_CODER_SSC	 (int16_t)0x0200

#define ENO_CODER_DEFAULT (int16_t)ENO_CODER_CRC | ENO_CODER_LZS

typedef struct {
	int16_t signature;
	int16_t signature_version;
	int16_t data_compression_coder;
	int16_t reserved_1;
		int32_t data_range_offset;
		int32_t data_range;
		uint32_t data_protection_code;
	int16_t reserved_2;
	int16_t s_count;
		int32_t size[8];
} __eno_block_header_struct;

#define ENO_AID_HEADER_SIG (int16_t)(('S'<<8) | 'C')
typedef struct {
	int16_t signature;
	int16_t signature_version;
	int16_t aid_data_coder;
	int16_t reserved_1;
		int32_t data_range;
		uint32_t data_protection_code;
	int16_t reserved_2;
	int16_t ssc_bits_count;
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

#define PASS_LEN_MIN		(int32_t)(0x00000001)
#define PASS_LEN_1		(int32_t)(0x0000000F)
#define PASS_LEN_2		(int32_t)(0x000003FF)
#define PASS_LEN_MAX		PASS_LEN_2

#define BRUN_LEN_MIN		(int32_t)(0x00000002)
#define BRUN_LEN_1		(int32_t)(0x0000000F)
#define BRUN_LEN_2		(int32_t)(0x000003FF)
#define BRUN_LEN_MAX		BRUN_LEN_2

#define DICT_LEN_MIN		(int32_t)(0x00000004)
#define DICT_LEN_1		(int32_t)(0x0000000F)
#define DICT_LEN_2		(int32_t)(0x000003FF)
#define DICT_LEN_MAX		DICT_LEN_2
#define DICT_OFFSET_MIN		(int32_t)(0x00000004)
#define DICT_OFFSET_1  		(int32_t)(0x000000FF)
#define DICT_OFFSET_2		(int32_t)(0x0000FFFF)
#define DICT_OFFSET_3		(int32_t)(0x00FFFFFF)
#define DICT_OFFSET_MAX		DICT_OFFSET_3

class __lzssv4_header_coder {
public:
		static unsigned int8_t __stdcall pass_encode(void *a_code_ptr,int32_t axdata_uncoded_len);
		static unsigned int8_t __stdcall pass_decode(int32_t *a_data_uncoded_len,void *a_code_ptr);
		static unsigned int8_t __stdcall pass_Price(int32_t axdata_uncoded_len);

		static unsigned int8_t __stdcall brun_encode(void *a_code_ptr,int32_t axdata_uncoded_counte, int32_t axdata_uncoded_elsize);
		static unsigned int8_t __stdcall brun_decode(int32_t *a_data_uncoded_counte,int32_t *a_data_uncoded_elsize,void *a_code_ptr);
		static unsigned int8_t __stdcall brun_Price(int32_t axdata_uncoded_counte,int32_t axdata_uncoded_elsizes);

		static unsigned int8_t __stdcall dict_encode(void *a_code_ptr,int32_t axdata_uncoded_len,int32_t axdata_uncoded_offset);
		static unsigned int8_t __stdcall dict_decode(int32_t *a_data_uncoded_len,int32_t *a_data_uncoded_offset,void *a_code_ptr);
		static unsigned int8_t __stdcall dict_Price(int32_t axdata_uncoded_len,int32_t axdata_uncoded_offset);

		static int32_t __stdcall  check_dict_Match_Cost(int32_t apass_len,int32_t adict_len,int32_t adict_offset);
		static int32_t __stdcall  check_brun_Match_Cost(int32_t apass_len,int32_t abrun_counte,int32_t abrun_elsize);

};
#endif
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

