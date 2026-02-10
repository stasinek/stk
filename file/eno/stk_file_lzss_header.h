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
#define LZSS_HEAD 4 // define used HDR
//---------------------------------------------------------------------------
#define LZSS_HEADER_MAGIC_NUMBER (uint64_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ
#define LZSS_HEADER_SIG (uint32_t)(('H'<<0) | ('E'<<8) | ('A'<<16) | ('D'<<24))
#define LZSS_HEADER_VER (uint32_t)(('0'<<0) | ('0'<<8) | ('0'<<16) | ('4'<<24))
typedef struct __attribute__((__packed__))  {
        union { uint64_t magic_number;
        	    uint32_t magic_number_l, magic_number_h; };
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
} __eno_header_struct; //
#define LZSS_HEADER_SIZE sizeof(__eno_header_struct)

#define LZSS_BLOCK_MAGIC_NUMBER (uint64_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ TODO: Should be something else than header magic!?
#define LZSS_BLOCK_HEADER_SIG   (uint32_t)(('B'<<0) | ('O'<<8) | ('D'<<16) | ('Y'<<24))
#define LZSS_BLOCK_HEADER_VER   (uint32_t)(('2'<<0) | ('0'<<8) | ('2'<<16) | ('3'<<24))

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

typedef struct __attribute__((__packed__)) {
        union { uint64_t magic_number;
        	    uint32_t magic_number_l, magic_number_h; };
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
#define LZSS_BLOCK_SIZE sizeof(__eno_block_struct)

#define LZSS_AID_MAGIC_NUMBER (uint64_t)(0xC96C5795D7870F42) // CRC64-ECMA/XZ
#define LZSS_AID_HEADER_SIG (int16_t)(('S'<<8) | 'C')
typedef struct __attribute__((__packed__)) {
        union { uint64_t magic_number;
        	    uint32_t magic_number_l, magic_number_h; };
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

#define Bx00000000 0x00L
#define Bx00000001 0x01L
#define Bx00000010 0x02L
#define Bx00000011 0x03L
#define Bx00000100 0x04L
#define Bx00000101 0x05L
#define Bx00000110 0x06L
#define Bx00000111 0x07L
#define Bx00001000 0x08L
#define Bx00001001 0x09L
#define Bx00001010 0x0AL
#define Bx00001011 0x0BL
#define Bx00001100 0x0CL
#define Bx00001101 0x0DL
#define Bx00001110 0x0EL
#define Bx00001111 0x0FL

#define Bx00000000 0x00L
#define Bx00010000 0x10L
#define Bx00100000 0x20L
#define Bx00110000 0x30L
#define Bx01000000 0x40L
#define Bx01010000 0x50L
#define Bx01100000 0x60L
#define Bx01110000 0x70L
#define Bx10000000 0x80L
#define Bx10010000 0x90L
#define Bx10100000 0xA0L
#define Bx10110000 0xB0L
#define Bx11000000 0xC0L
#define Bx11010000 0xD0L
#define Bx11100000 0xE0L
#define Bx11110000 0xF0L

#define Bx00011111 0x1FL
#define Bx00101111 0x2FL
#define Bx00111111 0x3FL
#define Bx01001111 0x4FL
#define Bx01011111 0x5FL
#define Bx01101111 0x6FL
#define Bx01111111 0x7FL
#define Bx10001111 0x8FL
#define Bx10011111 0x9FL
#define Bx10101111 0xAFL
#define Bx10111111 0xBFL
#define Bx11001111 0xCFL
#define Bx11011111 0xDFL
#define Bx11101111 0xEFL
#define Bx11111111 0xFFL

//---------------------------------------------------------------------------
#ifdef  LZSS_HEAD
/* LZSv4 one byte is minimum code size, 2,4,6,8 bits for determination of codes types and meaning
but it happens step by step, each 2 bits,
first LSB 2 bits determine data type xxxxxx00 literal, xxxxxx01 rle, xxxxxx10 dictionary
if its xxxxxx11 then next 2 bits of 8 are considered as code, so 4 total,
if 4bit code is xxxx1111, then 6 bits shall be used for code,
if 6bit code is xx111111, then 8 bits, but those 6,8 bit ones are currently unspecified
what is specified is the value 11111111 considered illegal it measns as for current version the end of stream EOF

although in the future could be extended
values of 0 means always lenghs 1, offsets more than 1, sizes of 1

for literal 00, highest bits 5,6 are special, determine how data is coded, should be 00
LSB0-3 are lenght 1 to 16x lenght,
for rle code xxxxxx01 first highest bits 5,6 tells what size of element is
LSB0-3 are lenght 1 to 16x lenght
for dictionary xxxxxx10 next 2 bits determine number of bytes used to describe offset
HSB4-8 are lenght 1 to 16x lenght of previously foind pattern in slighting window

level1 value xxxxxx11 mean level2 codes should be decoded
level2 are 4 bits starting "xxxx0011" literal xxxx0011, rle xxxx0111, dictionary xxxx1011, level3 code is xxxx1111
so highest 4 bits are used to extend number of bytes used for code, lower 4 bits to determine what type of data
level3 are 6 bits starting "xxxx1111" literal xx001111, rle xx011111, dictionary xx101111, level 4 code (reserved) is "11111111" = 0xFF

4 bits minimal for literal lenght and rle, 1 is min, 16 max, for offset means can reach up to 16 characters back 4bytes pattern ending 16 bytes back
to make it simple as possible there are no exceptions
but its possible to use more bytes 1,2,3 additional up to 32bits total = 4GB basic dictionary relative to current posistion
this could be LZW style of dictionary 16 max for dictionary */

//---------------------------------------------------------------------------
//@normal codes 	-->>
//---------------------------------------------------------------------------
#define L1_CODE_MASK				Bx00001111 		
#define L1_CODE_BITS                4
//---------------------------------------------------------------------------
//@literals LSB first 2-bit code, 2-bit encoding selector, 4-bit lenght = 8-bit total
#define L1_LIT_CODE_MASK			Bx00000011 		
#define L1_LIT_CODE					Bx00000000 		
#define L1_LIT_CODE_BITS			2
#define L1_LIT_CODE_PRICE	 		1               // minimal number of bytes to encode data, not counting data itself

#define L1_LIT_MODE_MASK			Bx00001100 		
#define L1_LIT_MODE_0				Bx00000000 		
#define L1_LIT_MODE_1				Bx00000100 		
#define L1_LIT_MODE_2				Bx00001000 		
#define L1_LIT_MODE_3				Bx00001100 		
#define L1_LIT_MODE_BITS			2

#define L1_LIT_LENGHT_MASK			Bx11110000 		
#define L1_LIT_LENGHT_BITS			4
#define L1_LIT_LENGHT_0_MIN 	    (uint32_t)(0)   
#define L1_LIT_LENGHT_0_MAX 	    (uint32_t)(0x0FL) 
//---------------------------------------------------------------------------
//@rle pattern LSB first
#define L1_RLE_CODE_MASK			Bx00000011 		
#define L1_RLE_CODE					Bx00000001 		
#define L1_RLE_CODE_BITS			2
#define L1_RLE_CODE_PRICE	 		1               // minimal number of bytes to encode data, not counting data itself

#define L1_RLE_SIZE_MASK			Bx00001100 		
#define L1_RLE_SIZE_BITS			2
#define L1_RLE_SIZE_1				Bx00000000 		
#define L1_RLE_SIZE_1_PRICE			1
#define L1_RLE_SIZE_2				Bx00000100 		
#define L1_RLE_SIZE_2_PRICE			2
#define L1_RLE_SIZE_3				Bx00001000 		
#define L1_RLE_SIZE_3_PRICE			3
#define L1_RLE_SIZE_4				Bx00001100 		
#define L1_RLE_SIZE_4_PRICE			4

#define L1_RLE_LENGHT_MASK			Bx11110000 		
#define L1_RLE_LENGHT_BITS			4
#define L1_RLE_LENGHT_0_MIN		    (uint32_t)(1)   
#define L1_RLE_LENGHT_0_MAX		    (uint32_t)(0x0FL) 
#define L1_RLE_LENGHT_MIN		    L1_RLE_LENGHT_0_MIN   
#define L1_RLE_LENGHT_MAX		    L1_RLE_LENGHT_0_MAX 
//---------------------------------------------------------------------------
//@found in sliding window, 2-bit code, 2-bit number of bytes for offset, 4-bit lenght
#define L1_DUP_CODE_MASK			Bx00000011 		
#define L1_DUP_CODE					Bx00000010 		
#define L1_DUP_CODE_BITS			2
#define L1_DUP_CODE_PRICE	 		1               // minimal number of bytes to encode data, not counting data itself

#define L1_DUP_OFFSET_MASK			Bx00001100 		
#define L1_DUP_OFFSET_CODE_BITS		2

#define L1_DUP_OFFSET_1_CODE		Bx00000000 		
#define L1_DUP_OFFSET_1_MIN		    (uint32_t)(0)
#define L1_DUP_OFFSET_1_MAX		    (uint32_t)(0x000000FFL + L1_DUP_OFFSET_MIN)
#define L1_DUP_OFFSET_1_PRICE		1

#define L1_DUP_OFFSET_2_CODE		Bx00000100 		
#define L1_DUP_OFFSET_2_MIN		    (uint32_t)(L1_DUP_OFFSET_1_MAX + 1)
#define L1_DUP_OFFSET_2_MAX		    (uint32_t)(0x0000FFFFL + L1_DUP_OFFSET_MIN)
#define L1_DUP_OFFSET_2_PRICE		2

#define L1_DUP_OFFSET_3_CODE		Bx00001000 		
#define L1_DUP_OFFSET_3_MIN		    (uint32_t)(L1_DUP_OFFSET_2_MAX + 1)
#define L1_DUP_OFFSET_3_MAX		    (uint32_t)(0x00FFFFFFL + L1_DUP_OFFSET_MIN)
#define L1_DUP_OFFSET_3_PRICE		3

#define L1_DUP_OFFSET_4_CODE		Bx00001100 		
#define L1_DUP_OFFSET_4_MIN		    (uint32_t)(L1_DUP_OFFSET_3_MAX + 1)
#define L1_DUP_OFFSET_4_MAX		    (uint32_t)(0xFFFFFFFFL)
#define L1_DUP_OFFSET_4_PRICE		4

#define L1_DUP_OFFSET_MIN		    L1_DUP_OFFSET_1_MIN
#define L1_DUP_OFFSET_MAX		    L1_DUP_OFFSET_4_MAX

#define L1_DUP_LENGHT_MASK 			Bx11110000 		
#define L1_DUP_LENGHT_BITS			4
#define L1_DUP_LENGHT_0_MIN			(uint32_t)(1)   
#define L1_DUP_LENGHT_0_MAX			(uint32_t)(0x0FL)
#define L1_DUP_LENGHT_MIN			L1_DUP_LENGHT_0_MIN
#define L1_DUP_LENGHT_MAX			L1_DUP_LENGHT_0_MAX
//---------------------------------------------------------------------------
//@extended codes	-->>
//---------------------------------------------------------------------------
#define L1_EXIT_CODE				L1_CODE_MASK 	
//---------------------------------------------------------------------------
#define L2_CODE_MASK			 	Bx00001111 		
#define L2_CODE_BITS				4
//---------------------------------------------------------------------------
#define L2_LIT_CODE_MASK	   		Bx00001111 		
#define L2_LIT_CODE					Bx00000011 		
#define L2_LIT_CODE_BITS			4
#define L2_LIT_CODE_PRICE	 		1               // minimal number of bytes to encode data, not counting data itself

#define L2_LIT_MODE_MASK			Bx00110000		
#define L2_LIT_MODE_BITS			2

#define L2_LIT_MODE_1_CODE			Bx00000000		
#define L2_LIT_MODE_2_CODE			Bx00010000		
#define L2_LIT_MODE_3_CODE			Bx00100000		
#define L2_LIT_MODE_4_CODE			Bx00110000		

#define L2_LIT_LENGHT_MASK			Bx11000000		
#define L2_LIT_LENGHT_CODE_BITS		2

#define L2_LIT_LENGHT_1_CODE		Bx00000000 		
#define L2_LIT_LENGHT_1_MIN		    (uint32_t)(1)   
#define L2_LIT_LENGHT_1_MAX		    (uint32_t)(0x000000FFL + L2_LIT_LENGHT_1_MIN)
#define L2_LIT_LENGHT_1_PRICE		1

#define L2_LIT_LENGHT_2_CODE		Bx01000000 		
#define L2_LIT_LENGHT_2_MIN		    (uint32_t)(L2_LIT_LENGHT_1_MAX + 1)  
#define L2_LIT_LENGHT_2_MAX		    (uint32_t)(0x0000FFFFL + L2_LIT_LENGHT_2_MIN)  
#define L2_LIT_LENGHT_2_PRICE		2

#define L2_LIT_LENGHT_3_CODE		Bx10000000 		
#define L2_LIT_LENGHT_3_MIN		    (uint32_t)(L2_LIT_LENGHT_2_MAX + 1)   
#define L2_LIT_LENGHT_3_MAX		    (uint32_t)(0x00FFFFFFL + L2_LIT_LENGHT_3_MIN)  
#define L2_LIT_LENGHT_3_PRICE		3

#define L2_LIT_LENGHT_4_CODE		Bx11000000 		
#define L2_LIT_LENGHT_4_MIN		    (uint32_t)(L2_LIT_LENGHT_3_MAX + 1)   
#define L2_LIT_LENGHT_4_MAX		    (uint32_t)(0xFFFFFFFFL)  
#define L2_LIT_LENGHT_4_PRICE		4

#define L2_LIT_LENGHT_MIN		    L2_LIT_LENGHT_1_MIN   
#define L2_LIT_LENGHT_MAX		    L2_LIT_LENGHT_4_MAX
//---------------------------------------------------------------------------
#define LIT_LENGHT_MIN		        L1_LIT_LENGHT_MIN 
#define LIT_LENGHT_MAX		        L2_LIT_LENGHT_MAX
//---------------------------------------------------------------------------
#define L2_RLE_CODE_MASK			Bx00001111 		
#define L2_RLE_BITS					4
#define L2_RLE_CODE					Bx00000111 		
#define L2_RLE_CODE_PRICE	 		1               // minimal number of bytes to encode data, not counting data itself

#define L2_RLE_SIZE_MASK			Bx00110000 		
#define L2_RLE_SIZE_BITS			2

#define L2_RLE_SIZE_1_CODE			Bx00000000 		
#define L2_RLE_SIZE_1_PRICE			1
#define L2_RLE_SIZE_2_CODE			Bx00010000 		
#define L2_RLE_SIZE_2_PRICE			2
#define L2_RLE_SIZE_3_CODE			Bx00100000 		
#define L2_RLE_SIZE_3_PRICE			3
#define L2_RLE_SIZE_4_CODE			Bx00110000 		
#define L2_RLE_SIZE_4_PRICE			4

#define L2_RLE_LENGHT_MASK		    Bx11000000		
#define L2_RLE_LENGHT_CODE_BITS	    2

#define L2_RLE_LENGHT_1_CODE		Bx00000000 		
#define L2_RLE_LENGHT_1_MIN		    (uint32_t)(1)   
#define L2_RLE_LENGHT_1_MAX		    (uint32_t)(0x000000FFL + L2_LIT_LENGHT_1_MIN)
#define L2_RLE_LENGHT_1_PRICE		1

#define L2_RLE_LENGHT_2_CODE		Bx01000000 		
#define L2_RLE_LENGHT_2_MIN		    (uint32_t)(L2_LIT_LENGHT_1_MAX + 1)  
#define L2_RLE_LENGHT_2_MAX		    (uint32_t)(0x0000FFFFL + L2_LIT_LENGHT_2_MIN)  
#define L2_RLE_LENGHT_2_PRICE		2

#define L2_RLE_LENGHT_3_CODE		Bx10000000 		
#define L2_RLE_LENGHT_3_MIN		    (uint32_t)(L2_LIT_LENGHT_2_MAX + 1)   
#define L2_RLE_LENGHT_3_MAX		    (uint32_t)(0x00FFFFFFL + L2_LIT_LENGHT_3_MIN)  
#define L2_RLE_LENGHT_3_PRICE		3

#define L2_RLE_LENGHT_4_CODE		Bx11000000 		
#define L2_RLE_LENGHT_4_MIN		    (uint32_t)(L2_LIT_LENGHT_3_MAX + 1)   
#define L2_RLE_LENGHT_4_MAX		    (uint32_t)(0xFFFFFFFFL)  
#define L2_RLE_LENGHT_4_PRICE		4

#define L2_RLE_LENGHT_MIN		    L2_RLE_LENGHT_1_MIN
#define L2_RLE_LENGHT_MAX		    L2_RLE_LENGHT_4_MAX
//---------------------------------------------------------------------------
#define RLE_LENGHT_MIN		        L1_RLE_LENGHT_MIN   
#define RLE_LENGHT_MAX		        L2_RLE_LENGHT_MAX
//---------------------------------------------------------------------------
#define L2_DUP_CODE_MASK   			Bx00001111
#define L2_DUP_BITS					4
#define L2_DUP_CODE					Bx00001011
#define L2_DUP_CODE_PRICE	 		1               // minimal number of bytes to encode data, not counting data itself

#define L2_DUP_OFFSET_MASK			Bx00110000
#define L2_DUP_OFFSET_CODE_BITS	    2

#define L2_DUP_OFFSET_1_CODE		Bx00000000
#define L2_DUP_OFFSET_1_MIN		    (uint32_t)(1)
#define L2_DUP_OFFSET_1_MAX		    (uint32_t)(0x000000FFL + L2_DUP_OFFSET_1_MIN)
#define L2_DUP_OFFSET_1_PRICE		1

#define L2_DUP_OFFSET_2_CODE 		Bx00010000
#define L2_DUP_OFFSET_2_MIN		    (uint32_t)(L2_DUP_OFFSET_1_MAX + 1)
#define L2_DUP_OFFSET_2_MAX		    (uint32_t)(0x0000FFFFL + L2_DUP_OFFSET_2_MIN)
#define L2_DUP_OFFSET_2_PRICE		2

#define L2_DUP_OFFSET_3_CODE 		Bx00100000
#define L2_DUP_OFFSET_3_MIN		    (uint32_t)(L2_DUP_OFFSET_2_MAX + 1)
#define L2_DUP_OFFSET_3_MAX		    (uint32_t)(0x00FFFFFFL + L2_DUP_OFFSET_3_MIN)
#define L2_DUP_OFFSET_3_PRICE		3

#define L2_DUP_OFFSET_4_CODE 		Bx00110000
#define L2_DUP_OFFSET_4_MIN		    (uint32_t)(L2_DUP_OFFSET_3_MAX + 1)
#define L2_DUP_OFFSET_4_MAX		    (uint32_t)(0xFFFFFFFFL)
#define L2_DUP_OFFSET_4_PRICE		4

#define L2_DUP_OFFSET_MIN  		    L2_DUP_OFFSET_1_MIN 
#define L2_DUP_OFFSET_MAX		    L2_DUP_OFFSET_4_MAX

#define DUP_OFFSET_MIN		        L1_DUP_OFFSET_MIN
#define DUP_OFFSET_MAX		        L2_DUP_OFFSET_MAX

#define L2_DUP_LENGHT_MASK			Bx11000000 		
#define L2_DUP_LENGHT_CODE_BITS		2

#define L2_DUP_LENGHT_1_CODE 		Bx00000000 		
#define L2_DUP_LENGHT_1_MIN		    (uint32_t)(1)
#define L2_DUP_LENGHT_1_MAX		    (uint32_t)(0x000000FFL + L2_DUP_OFFSET_1_MIN)
#define L2_DUP_LENGHT_1_PRICE 		1 		

#define L2_DUP_LENGHT_2_CODE		Bx01000000 		
#define L2_DUP_LENGHT_2_MIN		    (uint32_t)(L2_DUP_LENGHT_1_MAX + 1)
#define L2_DUP_LENGHT_2_MAX		    (uint32_t)(0x0000FFFFL + L2_DUP_OFFSET_2_MIN)
#define L2_DUP_LENGHT_2_PRICE 		2 		

#define L2_DUP_LENGHT_3_CODE 		Bx10000000 		
#define L2_DUP_LENGHT_3_MIN		    (uint32_t)(L2_DUP_LENGHT_2_MAX + 1)
#define L2_DUP_LENGHT_3_MAX		    (uint32_t)(0x00FFFFFFL + L2_DUP_OFFSET_3_MIN)
#define L2_DUP_LENGHT_3_PRICE 		3 		

#define L2_DUP_LENGHT_4_CODE 		Bx11000000 		
#define L2_DUP_LENGHT_4_MIN		    (uint32_t)(L2_DUP_LENGHT_3_MAX + 1)
#define L2_DUP_LENGHT_4_MAX		    (uint32_t)(0xFFFFFFFFL)
#define L2_DUP_LENGHT_4_PRICE 		4 		

#define L2_DUP_LENGHT_MIN			L2_DUP_LENGHT_1_MIN
#define L2_DUP_LENGHT_MAX			L2_DUP_LENGHT_4_MAX

#define DUP_LENGHT_MIN		        L1_DUP_LENGHT_MIN
#define DUP_LENGHT_MAX		        L2_DUP_LENGHT_MAX

//---------------------------------------------------------------------------
#define L2_EXIT_CODE		 	 	Bx00001111
//---------------------------------------------------------------------------
//@reserved codes, as for 2023 dont know how to extend further, same scheme or something else 2-->>
//---------------------------------------------------------------------------
#define L3_CODE_MASK			 	Bx00111111
#define L3_CODE_BITS				6
#define L3_CODE_0					Bx00001111
#define L3_CODE_1					Bx00011111
#define L3_CODE_2					Bx00101111
#define L3_EXIT_CODE				Bx00111111
//---------------------------------------------------------------------------
//@super reserved for future use,
//---------------------------------------------------------------------------
#define L4_CODE_MASK			    Bx11111111
#define L4_CODE_BITS		    	8
#define L4_CODE_0			    	Bx00111111
#define L4_CODE_1			    	Bx01111111
#define L4_CODE_2			    	Bx10111111
#define L4_EXIT_CODE 	   			Bx11111111
//
//---------------------------------------------------------------------------

class STK_IMPEXP __lzss_header_coder {
public:
                               __stdcall  __lzss_header_coder();
    virtual                    __stdcall ~__lzss_header_coder();
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
