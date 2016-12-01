//---------------------------------------------------------------------------
#ifndef __tsoft_file_lzss_hdr_H__
#define __tsoft_file_lzss_hdr_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace file_header {
//---------------------------------------------------------------------------

#define LZSSv4_HEAD // define used HDR (less compilation time)

#define LZSS_HEADER_SIG (int32_t)(('H'<<0) | ('E'<<8) | ('A'<<16) | ('D'<<24))
typedef struct {
		int32_t signature;
		int32_t signature_version;
		int32_t o;
		int32_t o_h;
		int32_t size;
		int32_t size_h;
		int32_t attribute;
		int32_t attribute_ex;
		int32_t time_t;
		int32_t time_t_h;
		int32_t reserved_code_11;
                int32_t reserved_code_12;
                int32_t reserved_code_13;
                int32_t reserved_code_14;
                int32_t reserved_code_15;
                int32_t reserved_code_16;
} __eno_header_struct;

#define LZSS_BLOCK_HEADER_SIG (int32_t)(('B'<<0) | ('O'<<8) | ('D'<<16) | ('Y'<<24))

#define LZSS_CODER_LZS	 (int32_t)0x0001L
#define LZSS_CODER_HUF	 (int32_t)0x0002L
#define LZSS_CODER_ARI	 (int32_t)0x0004L
#define LZSS_CODER_BWT	 (int32_t)0x0010L
#define LZSS_CODER_MTF	 (int32_t)0x0020L
#define LZSS_CODER_ROT	 (int32_t)0x0040L
#define LZSS_CODER_XOR	 (int32_t)0x0080L

#define LZSS_CODER_CRC	 (int32_t)0x0100L
#define LZSS_CODER_SSC	 (int32_t)0x0200L

#define LZSS_CODER_DEFAULT (int32_t)LZSS_CODER_CRC | LZSS_CODER_LZS

typedef struct {
		int32_t signature;
		int32_t signature_version;
		int32_t data_coder;
		int32_t data_range;
		int32_t data_range_offset;
		int32_t data_range_offset_h;
                uint32_t data_protection_code;
		int32_t size_count;
		int32_t size[8];
} __eno_block_header_struct;

#define LZSS_AID_HEADER_SIG (int16_t)(('S'<<8) | 'C')
typedef struct {
		int16_t signature;
		int16_t signature_version;
		int16_t aid_data_coder;
		int16_t reserved_1;
		int32_t data_range;
		uint32_t data_protection_code;
		int16_t reserved_2;
		int16_t ssc_bits_count;
		int32_t ssc1024[32];
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

#define PLAIN_LEN_MIN		(int32_t)(0x00000001L)
#define PLAIN_LEN_N			(int32_t)(0x0000000FL)
#define PLAIN_LEN_E			(int32_t)(0x000003FFL)
#define PLAIN_LEN_MAX		PLAIN_LEN_E

#define PATTERN_LEN_MIN		(int32_t)(0x00000002L)
#define PATTERN_LEN_N		(int32_t)(0x0000000FL)
#define PATTERN_LEN_E		(int32_t)(0x000003FFL)
#define PATTERN_LEN_MAX		PATTERN_LEN_E

#define DUP_LEN_MIN			(int32_t)(0x00000004L)
#define DUP_LEN_N			(int32_t)(0x0000000FL)
#define DUP_LEN_E			(int32_t)(0x000003FFL)
#define DUP_LEN_MAX			DUP_LEN_E

#define DUP_OFFSET_MIN		(int32_t)(0x00000004L)
#define DUP_OFFSET_1  		(int32_t)(0x000000FFL)
#define DUP_OFFSET_2		(int32_t)(0x0000FFFFL)
#define DUP_OFFSET_3		(int32_t)(0x00FFFFFFL)
#define DUP_OFFSET_MAX		DUP_OFFSET_3

class __lzssv4_header_coder {
public:
		static uint8_t __stdcall plain_encode(void *a_code_ptr,int32_t axdata_uncoded_len);
		static uint8_t __stdcall plain_decode(int32_t *a_data_uncoded_len,void *a_code_ptr);
		static uint8_t __stdcall plain_price(int32_t axdata_uncoded_len);

		static uint8_t __stdcall pattern_encode(void *a_code_ptr,int32_t axdata_uncoded_counte, int32_t axdata_uncoded_elsize);
		static uint8_t __stdcall pattern_decode(int32_t *a_data_uncoded_counte,int32_t *a_data_uncoded_elsize,void *a_code_ptr);
		static uint8_t __stdcall pattern_price(int32_t axdata_uncoded_counte,int32_t axdata_uncoded_elsizes);

		static uint8_t __stdcall dup_encode(void *a_code_ptr,int32_t axdata_uncoded_len,int32_t axdata_uncoded_offset);
		static uint8_t __stdcall dup_decode(int32_t *a_data_uncoded_len,int32_t *a_data_uncoded_offset,void *a_code_ptr);
		static uint8_t __stdcall dup_price(int32_t axdata_uncoded_len,int32_t axdata_uncoded_offset);

		static int32_t __stdcall check_dup_Match_Cost(int32_t aplain_len,int32_t adup_len,int32_t adup_offset);
		static int32_t __stdcall check_pattern_Match_Cost(int32_t aplain_len,int32_t apattern_counte,int32_t apattern_elsize);
};
#endif
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

