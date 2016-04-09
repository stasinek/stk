//---------------------------------------------------------------------------
#ifndef __tsoft_file_lzss_hdr_H__
#define __tsoft_file_lzss_hdr_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace file_header {
//---------------------------------------------------------------------------

#define LZSSv4_HEAD // define used HDR (less compilation time)

#define LZSS_HEADER_SIG (__int32)(('H'<<0) | ('E'<<8) | ('A'<<16) | ('D'<<24))
typedef struct {
		__int32 signature;
		__int32 signature_version;
		__int32 o;
		__int32 o_h;
		__int32 size;
		__int32 size_h;
		__int32 attribute;
		__int32 attribute_ex;
		__int32 time_t;
		__int32 time_t_h;
		__int32 reserved_code_11;
                __int32 reserved_code_12;
                __int32 reserved_code_13;
                __int32 reserved_code_14;
                __int32 reserved_code_15;
                __int32 reserved_code_16;
} __eno_header_struct;

#define LZSS_BLOCK_HEADER_SIG (__int32)(('B'<<0) | ('O'<<8) | ('D'<<16) | ('Y'<<24))

#define LZSS_CODER_LZS	 (__int32)0x0001L
#define LZSS_CODER_HUF	 (__int32)0x0002L
#define LZSS_CODER_ARI	 (__int32)0x0004L
#define LZSS_CODER_BWT	 (__int32)0x0010L
#define LZSS_CODER_MTF	 (__int32)0x0020L
#define LZSS_CODER_ROT	 (__int32)0x0040L
#define LZSS_CODER_XOR	 (__int32)0x0080L

#define LZSS_CODER_CRC	 (__int32)0x0100L
#define LZSS_CODER_SSC	 (__int32)0x0200L

#define LZSS_CODER_DEFAULT (__int32)LZSS_CODER_CRC | LZSS_CODER_LZS

typedef struct {
		__int32 signature;
		__int32 signature_version;
		__int32 data_coder;
		__int32 data_range;
		__int32 data_range_offset;
		__int32 data_range_offset_h;
                uint32_t data_protection_code;
		__int32 size_count;
		__int32 size[8];
} __eno_block_header_struct;

#define LZSS_AID_HEADER_SIG (__int16)(('S'<<8) | 'C')
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
#ifdef  LZSSv4_HEAD

//@normal codes 	-->>
#define N_BITS				2
#define N_CODE_MASK			0x03L
//
#define N_PLAIN_CODE		0x00L
#define N_PATTERN_CODE		0x01L
#define N_DUP_CODE			0x02L
#define N_DUP_OFFSET_MASK	0x0CL
#define N_DUP_OFFSET_0		0x00L
#define N_DUP_OFFSET_1		0x04L
#define N_DUP_OFFSET_2		0x08L
#define N_DUP_OFFSET_BITS	2
#define N_DUP_LEN_MASK		0xF0L
#define N_DUP_LEN_BITS		4
//@extended codes	-->>
#define E_BITS				(N_BITS+2)
#define E_CODE			 	N_CODE_MASK
#define E_CODE_MASK			0x0FL
//
#define E_PLAIN_CODE		(0x00L | E_CODE)
#define E_PATTERN_CODE		(0x04L | E_CODE)
#define E_DUP_CODE			(0x08L | E_CODE)
#define E_DUP_OFFSET_MASK	0x30L
#define E_DUP_OFFSET_0		0x00L
#define E_DUP_OFFSET_1		0x10L
#define E_DUP_OFFSET_2		0x20L
#define E_DUP_OFFSET_BITS	2
#define E_DUP_LEN_MASK		0xC0L
#define E_DUP_LEN_BITS		2
//@reserved codes -->>
#define R_BITS				(E_BITS+2)
#define R_CODE				 E_CODE_MASK
#define R_CODE_MASK			 0x3FL
//
#define R_0_CODE			(0x00L | R_CODE)
#define R_1_CODE			(0x10L | R_CODE)
#define R_2_CODE			(0x20L | R_CODE)
//@unknown, most extended & reserved for future use
#define S_BITS				(R_BITS+2)
#define S_CODE 				 R_CODE_MASK
#define S_CODE_MASK			 0xFFL
//
#define S_0_CODE			(0x00L | S_CODE)
#define S_1_CODE			(0x40L | S_CODE)
#define S_2_CODE			(0x80L | S_CODE)
//@and so on codes ->>
#define INFINITY_CODE 	 	 S_CODE_MASK
//

#define PLAIN_LEN_MIN		(__int32)(0x00000001L)
#define PLAIN_LEN_N			(__int32)(0x0000000FL)
#define PLAIN_LEN_E			(__int32)(0x000003FFL)
#define PLAIN_LEN_MAX		PLAIN_LEN_E

#define PATTERN_LEN_MIN		(__int32)(0x00000002L)
#define PATTERN_LEN_N		(__int32)(0x0000000FL)
#define PATTERN_LEN_E		(__int32)(0x000003FFL)
#define PATTERN_LEN_MAX		PATTERN_LEN_E

#define DUP_LEN_MIN			(__int32)(0x00000004L)
#define DUP_LEN_N			(__int32)(0x0000000FL)
#define DUP_LEN_E			(__int32)(0x000003FFL)
#define DUP_LEN_MAX			DUP_LEN_E

#define DUP_OFFSET_MIN		(__int32)(0x00000004L)
#define DUP_OFFSET_1  		(__int32)(0x000000FFL)
#define DUP_OFFSET_2		(__int32)(0x0000FFFFL)
#define DUP_OFFSET_3		(__int32)(0x00FFFFFFL)
#define DUP_OFFSET_MAX		DUP_OFFSET_3

class __lzssv4_header_coder {
public:
		static uint8_t __stdcall plain_encode(void *a_code_ptr,__int32 axdata_uncoded_len);
		static uint8_t __stdcall plain_decode(__int32 *a_data_uncoded_len,void *a_code_ptr);
		static uint8_t __stdcall plain_price(__int32 axdata_uncoded_len);

		static uint8_t __stdcall pattern_encode(void *a_code_ptr,__int32 axdata_uncoded_counte, __int32 axdata_uncoded_elsize);
		static uint8_t __stdcall pattern_decode(__int32 *a_data_uncoded_counte,__int32 *a_data_uncoded_elsize,void *a_code_ptr);
		static uint8_t __stdcall pattern_price(__int32 axdata_uncoded_counte,__int32 axdata_uncoded_elsizes);

		static uint8_t __stdcall dup_encode(void *a_code_ptr,__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset);
		static uint8_t __stdcall dup_decode(__int32 *a_data_uncoded_len,__int32 *a_data_uncoded_offset,void *a_code_ptr);
		static uint8_t __stdcall dup_price(__int32 axdata_uncoded_len,__int32 axdata_uncoded_offset);

		static __int32 __stdcall check_dup_Match_Cost(__int32 aplain_len,__int32 adup_len,__int32 adup_offset);
		static __int32 __stdcall check_pattern_Match_Cost(__int32 aplain_len,__int32 apattern_counte,__int32 apattern_elsize);

};
#endif
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

