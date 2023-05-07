//---------------------------------------------------------------------------
#ifndef __stk_file_lzst_header_h__
#define __stk_file_lzst_header_h__
//---------------------------------------------------------------------------
#include "./../../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace file_header {
#endif
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
        uint32_t reserved_code_13;
        uint32_t reserved_code_14;
        uint32_t reserved_code_15;
        uint32_t reserved_code_16;
} __eno_aid_header_struct;

//---------------------------------------------------------------------------
#define Bx0000 0x00
#define Bx0001 0x01
#define Bx0010 0x02
#define Bx0011 0x03
#define Bx0100 0x04
#define Bx0101 0x05
#define Bx0110 0x06
#define Bx0111 0x07
#define Bx1000 0x08
#define Bx1001 0x09
#define Bx1010 0x0A
#define Bx1011 0x0B
#define Bx1100 0x0C
#define Bx1101 0x0D
#define Bx1110 0x0E
#define Bx1111 0x0F

#ifdef  LZSSv4_HEAD

//@normal codes 	-->>
#define N_CODE_MASK				0x03L //00000011
#define N_CODE_BITS				2
//
#define N_PLAIN_CODE			0x00L //00000000
#define N_PLAIN_CODE_BITS		N_CODE_BITS
#define N_PLAIN_ENCODING_MASK	0x0CL //000011cc
#define N_PLAIN_ENCODING_BITS	2
#define N_PLAIN_LEN_MASK		0xF0L //1111eecc
#define N_PLAIN_LEN_BITS		4
//
#define N_PATTERN_CODE			0x01L //00000001
#define N_PATTERN_CODE_BITS		N_CODE_BITS
#define N_PATTERN_DIAMETER_MASK	0x0CL //000011cc
#define N_PATTERN_DIAMETER_BITS	2
#define N_PATTERN_LEN_MASK		0xF0L //1111sscc
#define N_PATTERN_LEN_BITS		4
//
#define N_DUP_CODE				0x02L //00000010
#define N_DUP_CODE_BITS			N_CODE_BITS
#define N_DUP_OFFSET_MASK		0x0CL //000011cc
#define N_DUP_OFFSET_BITS		2
#define N_DUP_OFFSET_0			0x00L //000000cc
#define N_DUP_OFFSET_1			0x04L //000001cc
#define N_DUP_OFFSET_2			0x08L //000010cc
#define N_DUP_OFFSET_3			0x0CL //000011cc
#define N_DUP_LEN_MASK			0xF0L //1111oocc
#define N_DUP_LEN_BITS			4
//
#define N_NEXT_CODE				N_CODE_MASK //00000011

//@extended codes	-->>
#define E_CODE_MASK			 	0x0FL
#define E_CODE_BITS				(2 + N_CODE_BITS)
//
#define E_PLAIN_CODE			0x03L
#define E_PLAIN_BITS			4
//
#define E_PATTERN_CODE			(0x04L | N_NEXT_CODE)
#define E_PATTERN_BITS			4
//
#define E_DUP_CODE				(0x08L | N_NEXT_CODE)
#define E_PATTERN_BITS			4
#define E_DUP_OFFSET_MASK	 	0x30L
#define E_DUP_OFFSET_0		 	0x00L
#define E_DUP_OFFSET_1		 	0x10L
#define E_DUP_OFFSET_2		 	0x20L
#define E_DUP_OFFSET_BITS	 	2
#define E_DUP_LEN_MASK		 	0xC0L
#define E_DUP_LEN_BITS		 	2
//
#define E_NEXT_CODE		 	 	0x0FL //00001111

//@reserved codes -->>
#define R_BITS					(2 + E_CODE_BITS)
#define R_CODE_MASK			 	0x3FL
//
#define R_0_CODE				(0x00L | E_NEXT_CODE)
#define R_1_CODE				(0x10L | E_NEXT_CODE)
#define R_2_CODE				(0x20L | E_NEXT_CODE)
#define R_3_CODE				(0x30L | E_NEXT_CODE)

//@super & reserved for future use
#define S_BITS				    (R_BITS+2)
#define S_CODE_MASK			    0xFFL
//
#define S_0_CODE			    (0x00L | R_NEXT_CODE)
#define S_1_CODE			    (0x40L | R_NEXT_CODE)
#define S_2_CODE			    (0x80L | R_NEXT_CODE)
#define S_3_CODE			    (0xC0L | R_NEXT_CODE)

//@and so on codes super duper ->>
#define I_EXTENDED_CODE 	   	S_3_CODE
//

#define PLAIN_LEN_MIN		(uint32_t)(0x00000001L)
#define PLAIN_LEN_N			(uint32_t)(0x0000000FL) // 0000 xxxx + 0 BYTES = 16
#define PLAIN_LEN_E			(uint32_t)(0x000003FFL) // 00xx xxxx + 1 BYTES = 1024
#define PLAIN_LEN_R			(uint32_t)(0x0000FFFFL) // xxxx xxxx + 2 BYTES = 65536
#define PLAIN_LEN_S			(uint32_t)(0x003FFFFFL) // xxxx xxxx + 0000 00xx + 2 BYTES = 4 194 304
#define PLAIN_LEN_MAX		PLAIN_LEN_E

#define PATTERN_LEN_MIN		(uint32_t)(0x00000002L)
#define PATTERN_LEN_N		(uint32_t)(0x0000000FL) // 0000 xxxx + 0 BYTES = 16
#define PATTERN_LEN_E		(uint32_t)(0x000003FFL) // 00xx xxxx + 1 BYTES = 1024
#define PATTERN_LEN_R		(uint32_t)(0x0000FFFFL) // xxxx xxxx + 2 BYTES = 65536
#define PATTERN_LEN_S		(uint32_t)(0x003FFFFFL) // xxxx xxxx + 0000 00xx + 2 BYTES = 4 194 304
#define PATTERN_LEN_MAX		PATTERN_LEN_E

#define DUP_LEN_MIN			(uint32_t)(0x00000004L)
#define DUP_LEN_N			(uint32_t)(0x0000000FL) // 0000 xxxx = 16
#define DUP_LEN_E			(uint32_t)(0x000003FFL) // 00xx xxxx + 1 BYTES = 1024
#define DUP_LEN_R			(uint32_t)(0x0000FFFFL) // xxxx xxxx + 2 BYTES = 65536
#define DUP_LEN_S			(uint32_t)(0x003FFFFFL) // xxxx xxxx + 0000 00xx + 2 BYTES = 4 194 304
#define DUP_LEN_MAX			DUP_LEN_E

#define DUP_OFFSET_MIN		(uint32_t)(0x00000004L)
#define DUP_OFFSET_0  		(uint32_t)(0x000000FFL)
#define DUP_OFFSET_1		(uint32_t)(0x0000FFFFL)
#define DUP_OFFSET_2		(uint32_t)(0x00FFFFFFL)
#define DUP_OFFSET_3		(uint32_t)(0xFFFFFFFFL)
#define DUP_OFFSET_MAX		DUP_OFFSET_3

class STK_IMPEXP __lzstv4_header_coder {
public:
                               __stdcall  __lzstv4_header_coder();
    virtual                    __stdcall ~__lzstv4_header_coder();
    static int8_t              __stdcall plain_price(const uint32_t axdata_uncoded_len);
    static int8_t              __stdcall plain_encode(void *a_code_ptr,const uint32_t axdata_uncoded_len);
    static int8_t              __stdcall plain_decode(uint32_t *a_data_uncoded_len, const void *a_code_ptr);

    static int8_t              __stdcall pattern_price(const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsizes);
    static int8_t              __stdcall pattern_encode(void *a_code_ptr,const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsize);
    static int8_t              __stdcall pattern_decode(uint32_t *a_data_uncoded_counte,uint32_t *a_data_uncoded_elsize, const void *a_code_ptr);

    static int8_t              __stdcall dup_price(const uint32_t axdata_uncoded_len, const uint32_t axdata_uncoded_offset);
    static int8_t              __stdcall dup_encode(void *a_code_ptr,const uint32_t axdata_uncoded_len,const uint32_t axdata_uncoded_offset);
    static int8_t              __stdcall dup_decode(uint32_t *a_data_uncoded_len,uint32_t *a_data_uncoded_offset, const void *a_code_ptr);

    static int32_t             __stdcall check_plain_cost(const uint32_t aplain_len);
    static int32_t             __stdcall check_pattern_match_cost(const uint32_t aplain_len, const uint32_t apattern_counte, const uint32_t apattern_elsize);
    static int32_t             __stdcall check_dup_match_cost(const uint32_t aplain_len, const uint32_t adup_len, const uint32_t adup_offset);
};
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace stk,file_header
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

