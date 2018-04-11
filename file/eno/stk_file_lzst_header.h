//---------------------------------------------------------------------------
#ifndef __stk_file_lzst_header_H
#define __stk_file_lzst_header_H
//---------------------------------------------------------------------------
#include "./../../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace file_header {
//---------------------------------------------------------------------------

#define LZSSv4_HEAD // define used HDR (less compilation time)

#define LZSS_HEADER_MAGIC_NUMBER (uint64_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ
#define LZSS_HEADER_SIG (uint32_t)(('H'<<0) | ('E'<<8) | ('A'<<16) | ('D'<<24))
typedef struct {
		uint64_t magic_number;
		uint32_t signature;
		uint32_t signature_version;
		uint32_t offset;
		uint32_t offset_h;
		uint32_t size;
		uint32_t size_h;
		uint32_t attribute;
		uint32_t attribute_h;
		uint32_t time_t;
		uint32_t time_t_h;
        uint32_t crc;
        uint32_t crc_ex;
		uint32_t reserved_code_15;
        uint32_t reserved_code_16;
        uint32_t reserved_code_17;
        uint32_t reserved_code_18;
        uint32_t reserved_code_19;
        uint32_t reserved_code_20;
} __eno_header_struct;

#define LZSS_BLOCK_MAGIC_NUMBER (uint64_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ
#define LZSS_BLOCK_HEADER_SIG   (uint32_t)(('B'<<0) | ('O'<<8) | ('D'<<16) | ('Y'<<24))

#define LZSS_CODER_LZS	 (uint32_t)0x00000001L
#define LZSS_CODER_HUF	 (uint32_t)0x00000002L
#define LZSS_CODER_ARI	 (uint32_t)0x00000004L
#define LZSS_CODER_BWT	 (uint32_t)0x00000010L
#define LZSS_CODER_MTF	 (uint32_t)0x00000020L
#define LZSS_CODER_ROT	 (uint32_t)0x00000040L
#define LZSS_CODER_XOR	 (uint32_t)0x00000080L

#define LZSS_CODER_CRC	 (uint32_t)0x00010000L
#define LZSS_CODER_SSC	 (uint32_t)0x00020000L

#define LZSS_CODER_DEFAULT (uint32_t)LZSS_CODER_CRC | LZSS_CODER_LZS

typedef struct {
		uint64_t magic_number;
		uint32_t signature;
		uint32_t signature_version;
		uint32_t data_coder;
		uint32_t data_coder_ex;
        uint32_t crc;
        uint32_t crc_ex;
		uint32_t data_range_offset;
		uint32_t data_range_offset_h;
		uint32_t data_range;
		uint32_t data_range_h;
		uint32_t size_count;
		uint32_t size[8];
		uint32_t reserved_code_15;
		uint32_t reserved_code_16;
		uint32_t reserved_code_17;
} __eno_block_header_struct;

#define LZSS_AID_MAGIC_NUMBER (uint64_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ
#define LZSS_AID_HEADER_SIG (int16_t)(('S'<<8) | 'C')
typedef struct {
		uint64_t magic_number;
        uint32_t signature;
        uint32_t signature_version;
        uint32_t aid_data_coder;
        uint32_t aid_data_coder_ex;
        uint32_t reserved_1;
		uint32_t data_range;
		uint32_t data_protection_code;
        uint32_t reserved_2;
        uint32_t ssc_bits_count;
		uint32_t ssc1024[32];
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

#define PLAIN_LEN_MIN		(uint32_t)(0x00000001L)
#define PLAIN_LEN_N			(uint32_t)(0x0000000FL)
#define PLAIN_LEN_E			(uint32_t)(0x000003FFL)
#define PLAIN_LEN_MAX		PLAIN_LEN_E

#define PATTERN_LEN_MIN		(uint32_t)(0x00000002L)
#define PATTERN_LEN_N		(uint32_t)(0x0000000FL)
#define PATTERN_LEN_E		(uint32_t)(0x000003FFL)
#define PATTERN_LEN_MAX		PATTERN_LEN_E

#define DUP_LEN_MIN			(uint32_t)(0x00000004L)
#define DUP_LEN_N			(uint32_t)(0x0000000FL)
#define DUP_LEN_E			(uint32_t)(0x000003FFL)
#define DUP_LEN_MAX			DUP_LEN_E

#define DUP_OFFSET_MIN		(uint32_t)(0x00000004L)
#define DUP_OFFSET_1  		(uint32_t)(0x000000FFL)
#define DUP_OFFSET_2		(uint32_t)(0x0000FFFFL)
#define DUP_OFFSET_3		(uint32_t)(0x00FFFFFFL)
#define DUP_OFFSET_MAX		DUP_OFFSET_3

class __lzstv4_header_coder {
public:
	__stdcall  __lzstv4_header_coder() {};
	static int8_t __stdcall plain_encode(void *a_code_ptr,const uint32_t axdata_uncoded_len);
	static int8_t __stdcall plain_decode(uint32_t *a_data_uncoded_len, const void *a_code_ptr);
	static int8_t __stdcall plain_price(const uint32_t axdata_uncoded_len);

	static int8_t __stdcall pattern_encode(void *a_code_ptr,const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsize);
	static int8_t __stdcall pattern_decode(uint32_t *a_data_uncoded_counte,uint32_t *a_data_uncoded_elsize, const void *a_code_ptr);
	static int8_t __stdcall pattern_price(const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsizes);

	static int8_t __stdcall dup_encode(void *a_code_ptr,const uint32_t axdata_uncoded_len,const uint32_t axdata_uncoded_offset);
	static int8_t __stdcall dup_decode(uint32_t *a_data_uncoded_len,uint32_t *a_data_uncoded_offset, const void *a_code_ptr);
	static int8_t __stdcall dup_price(const uint32_t axdata_uncoded_len, const uint32_t axdata_uncoded_offset);

	static int32_t __stdcall check_dup_match_cost(const uint32_t aplain_len, const uint32_t adup_len, const uint32_t adup_offset);
	static int32_t __stdcall check_pattern_match_cost(const uint32_t aplain_len, const uint32_t apattern_counte, const uint32_t apattern_elsize);
	__stdcall ~__lzstv4_header_coder() {};
};
#endif
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

