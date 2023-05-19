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
#define LZSSv4_HEAD // define used HDR
//---------------------------------------------------------------------------
#define LZSS_HEADER_MAGIC_NUMBER (uint32_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ
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

#define LZSS_BLOCK_MAGIC_NUMBER (uint32_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ
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
#define Bx0000 0x00L
#define Bx0001 0x01L
#define Bx0010 0x02L
#define Bx0011 0x03L
#define Bx0100 0x04L
#define Bx0101 0x05L
#define Bx0110 0x06L
#define Bx0111 0x07L
#define Bx1000 0x08L
#define Bx1001 0x09L
#define Bx1010 0x0AL
#define Bx1011 0x0BL
#define Bx1100 0x0CL
#define Bx1101 0x0DL
#define Bx1110 0x0EL
#define Bx1111 0x0FL
//---------------------------------------------------------------------------
#ifdef  LZSSv4_HEAD
/* LZSv4 one byte is minimum code size, 2,4,6,8 bits for determination of codes types and meaning
level1 2bits to determine data type xxxxxx00 literal, xxxxxx01 rle, xxxxxx10 dictionary LZ4 type 4 bytes lenght, offset 16,
for literal 1 to 16x lenght, , rle size up to 4 bytes pattern 1 to 16x lenght
in addition for literal encoding could be used so additional 2 bits are used of total 4 bits determine operation, 4 bits embedded information level1
level1 value 11 mean level2 codes should be decoded
level2 are 4 bits starting "xxxx0011" literal xxxx0011, rle xxxx0111, dictionary xxxx1011, level3 code is xxxx1111
so highest 4 bits are used to extend number of bytes used for code, lower 4 bits to determine what type of data
level3 are 6 bits starting "xxxx1111" literal xx001111, rle xx011111, dictionary xx101111, level 4 code (reserved) is "11111111" = 0xFF

4 bits minimal for literal lenght and rle, 1 is min, 16 max, for offset means can reach up to 20 characters back 4bytes pattern ending 16 bytes back
but its possible to use more bytes 1,2,3 additional up to 28bits total = 268MB basic dictionary

//16 max for dictionary

*/

//@normal codes 	-->>
#define L1_CODE_MASK				0x03L //xxxx xx11
#define L1_CODE_BITS				2
//@literals 2-bit code, 2-bit encoding selector, 4-bit lenght = 8-bit total
#define L1_LIT_CODE					0x00L //xxxx xx00
#define L1_LIT_CODE_BITS			2
#define L1_LIT_ENCODING_MASK		0x0CL //xxxx 11xx
#define L1_LIT_ENCODING_BITS		2
#define L1_LIT_LEN_MASK				0xF0L //1111 xxxx
#define L1_LIT_LEN_BITS				4
//
#define L1_RLE_CODE					0x01L //xxxx xx01
#define L1_RLE_CODE_BITS			2
#define L1_RLE_PATTERN_BYTES_MASK	0x0CL //xxxx 11xx
#define L1_RLE_PATTERN_BYTES_BITS	2
#define L1_RLE_LEN_MASK				0xF0L //1111 xxxx
#define L1_RLE_LEN_BITS				4
//
#define L1_RLE_SIZE_1				0x00L //xxxx 00xx
#define L1_RLE_SIZE_2				0x04L //xxxx 01xx
#define L1_RLE_SIZE_3				0x08L //xxxx 10xx
#define L1_RLE_SIZE_4				0x0CL //xxxx 11xx
//@found in sliding window, 2-bit code, 2-bit number of bytes for offset, 4-bit lenght
#define L1_DUP_CODE					0x02L //xxxx xx10
#define L1_DUP_CODE_BITS			2
#define L1_DUP_OFFSET_BYTES_MASK	0x0CL //xxxx 11xx
#define L1_DUP_OFFSET_BYTES_BITS	2
#define L1_DUP_LEN_MASK				0x00L //xxxx xxxx
#define L1_DUP_LEN_BITS				0
//
#define L1_DUP_OFFSET_0				0x00L //xxxx 00xx
#define L1_DUP_OFFSET_1				0x04L //xxxx 01xx
#define L1_DUP_OFFSET_2				0x08L //xxxx 10xx
#define L1_DUP_OFFSET_3				0x0CL //xxxx 11xx
//
#define L1_NEXT_CODE				L1_CODE_MASK //xxxx 1111
//@extended codes	-->>
#define L2_CODE_MASK			 	0x0FL //xxxx 1111
#define L2_CODE_BITS				4
//
#define L2_LIT_CODE					0x03L //xxxx 0011
#define L2_LIT_BITS					4
//
#define L2_RLE_CODE					0x07L //xxxx 0111
#define L2_RLE_BITS					4
#define L2_RLE_PATTERN_BYTES_MASK	0x30L //xxxx 11xx
#define L2_RLE_PATTERN_BYTES_BITS	2
#define L2_RLE_LEN_BYTES_MASK		0x30L //xxxx 11xx
#define L2_RLE_LEN_BYTES_BITS		2
//
#define L2_DUP_CODE					0x0BL //xxxx 1011
#define L2_DUP_BITS					4
#define L2_DUP_OFFSET_BYTES_MASK	0x30L //xx11 xxxx
#define L2_DUP_OFFSET_BYTES_BITS	2
#define L2_DUP_LEN_BYTES_MASK		0xC0L //11xx xxxx
#define L2_DUP_LEN_BYTES_BITS		2
//
#define L2_DUP_OFFSET_1		 		0x00L //xx00 xxxx
#define L2_DUP_OFFSET_2		 		0x10L //xx01 xxxx
#define L2_DUP_OFFSET_3		 		0x20L //xx10 xxxx
#define L2_DUP_OFFSET_4		 		0x30L //xx11 xxxx
#define L2_DUP_LEN_1		 		0x00L //00xx xxxx
#define L2_DUP_LEN_2		 		0x10L //01xx xxxx
#define L2_DUP_LEN_3		 		0x20L //10xx xxxx
#define L2_DUP_LEN_4		 		0x30L //11xx xxxx
//
#define L2_NEXT_CODE		 	 	0x0FL //xxxx 1111
//@reserved codes -->>
#define L3_BITS						6
#define L3_CODE_MASK			 	0x3FL //xx11 1111
#define L3_0_CODE					0x0FL //xx00 1111
#define L3_1_CODE					0x1FL //xx01 1111
#define L3_2_CODE					0x2FL //xx10 1111
#define L3_NEXT_CODE				0x3FL //xx11 1111
//@super & reserved for future use
#define L4_BITS				    	8
#define L4_CODE_MASK			    0xFFL //1111 1111
#define L4_0_CODE			    	0x3FL //0011 1111
#define L4_1_CODE			    	0x3FL //0111 1111
#define L4_2_CODE			    	0x3FL //1011 1111
#define L4_NEXT_CODE 	   			0xFFL //1111 1111
//
#define LIT_LEN_MIN		            (uint32_t)(0x00000001L)
#define LIT_LEN_L1 		            (uint32_t)(0x00000010L) // 0000 xxxx + 0 BYTES = 16
#define LIT_LEN_L2		            (uint32_t)(0x00000400L) // 00xx xxxx + 1 BYTES = 1024
#define LIT_LEN_L3 		            (uint32_t)(0x00010000L) // xxxx xxxx + 2 BYTES = 65536
#define LIT_LEN_L4 		            (uint32_t)(0x00400000L) // xxxx xxxx + 0000 00xx + 2 BYTES = 4 194 304
#define LIT_LEN_MAX		            LIT_LEN_L4

#define RLE_LEN_MIN		            (uint32_t)(0x00000001L)
#define RLE_LEN_L1		            (uint32_t)(0x00000010L) // 0000 xxxx + 0 BYTES = 16
#define RLE_LEN_L2		            (uint32_t)(0x00000400L) // 00xx xxxx + 1 BYTES = 1024
#define RLE_LEN_L3	                (uint32_t)(0x00010000L) // xxxx xxxx + 2 BYTES = 65536
#define RLE_LEN_L4		            (uint32_t)(0x00400000L) // xxxx xxxx + 0000 00xx + 2 BYTES = 4 194 304
#define RLE_LEN_MAX		            RLE_LEN_L3

#define DUP_LEN_MIN			        (uint32_t)(0x00000004L)
#define DUP_LEN_L1			        (uint32_t)(0x00000010L) // 0000 xxxx = 16
#define DUP_LEN_L2			        (uint32_t)(0x00000400L) // 00xx xxxx + 1 BYTES = 1024
#define DUP_LEN_L3			        (uint32_t)(0x00010000L) // xxxx xxxx + 2 BYTES = 65536
#define DUP_LEN_L4			        (uint32_t)(0x00400000L) // xxxx xxxx + 0000 00xx + 2 BYTES = 4 194 304
#define DUP_LEN_MAX			        DUP_LEN_L3

#define DUP_OFFSET_MIN		        (uint32_t)(0x00000004L)
#define DUP_OFFSET_L1  		        (uint32_t)(0x00000100L)
#define DUP_OFFSET_L2		        (uint32_t)(0x00010000L)
#define DUP_OFFSET_L3		        (uint32_t)(0x01000000L)
#define DUP_OFFSET_L4		        (uint32_t)(0x10000000L)
#define DUP_OFFSET_MAX		        DUP_OFFSET_L2

class STK_IMPEXP __lzstv4_header_coder {
public:
                               __stdcall  __lzstv4_header_coder();
    virtual                    __stdcall ~__lzstv4_header_coder();
    static int8_t              __stdcall lit_price(const uint32_t axdata_uncoded_len);
    static int8_t              __stdcall lit_encode(void *a_code_ptr,const uint32_t axdata_uncoded_len);
    static int8_t              __stdcall lit_decode(uint32_t *a_data_uncoded_len, const void *a_code_ptr);

    static int8_t              __stdcall rle_price(const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsizes);
    static int8_t              __stdcall rle_encode(void *a_code_ptr,const uint32_t axdata_uncoded_counte, const uint32_t axdata_uncoded_elsize);
    static int8_t              __stdcall rle_decode(uint32_t *a_data_uncoded_counte,uint32_t *a_data_uncoded_elsize, const void *a_code_ptr);

    static int8_t              __stdcall dup_price(const uint32_t axdata_uncoded_len, const uint32_t axdata_uncoded_offset);
    static int8_t              __stdcall dup_encode(void *a_code_ptr,const uint32_t axdata_uncoded_len,const uint32_t axdata_uncoded_offset);
    static int8_t              __stdcall dup_decode(uint32_t *a_data_uncoded_len,uint32_t *a_data_uncoded_offset, const void *a_code_ptr);

    static int32_t             __stdcall check_lit_cost(const uint32_t alit_len);
    static int32_t             __stdcall check_rle_match_cost(const uint32_t alit_len, const uint32_t arle_counte, const uint32_t arle_elsize);
    static int32_t             __stdcall check_dup_match_cost(const uint32_t alit_len, const uint32_t adup_len, const uint32_t adup_offset);
};
#endif
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace stk,file_header
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

