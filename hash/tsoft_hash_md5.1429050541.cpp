//---------------------------------------------------------------------------
#include "tsoft_hash_md5.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
#include <string.h>
//---------------------------------------------------------------------------

const uint32_t ts::hash::md5::k[64] = {
	0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee ,
	0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501 ,
	0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be ,
	0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821 ,
	0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa ,
	0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8 ,
	0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed ,
	0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a ,
	0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c ,
	0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70 ,
	0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05 ,
	0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665 ,
	0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039 ,
	0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1 ,
	0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1 ,
	0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391
};

uint32_t  ts::hash::md5::h[4];

#define LEFTROTATE(x, c) (((x) << (c)) | ((x) >> (32 - (c))))

// These vars will contain the hash

//---------------------------------------------------------------------------

void __stdcall ts::hash::md5::init_MD5(void)
{
}
//---------------------------------------------------------------------------

uint32_t*  __stdcall ts::hash::md5::calc_MD5(const char *initial_msg, __int32 initial_len)
{
	// Message (to prepare)
		__int8 *msg_chunk_ptr = NULL;
		__int8 *last_msg_chunk_ptr = NULL;
	__int32 final_len = 512;
		__int32 bits_len;
	__int32 offset, last_msg_chunk_offset = 0;
		__int32 *w;
		__int32 a, b, c, d, i, f, g, temp;
	// per-round shift amounts
		const __int32 r[] = {7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
								  5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20,
								  4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
								  6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21
								 };
	// initialize hash variables - simple count in nibbles:
	h[0] = 0x67452301;
	h[1] = 0xefcdab89;
	h[2] = 0x98badcfe;
	h[3] = 0x10325476;
	// Pre-processing: adding a single 1 bit
	// append "1" bit to message
	/* Notice: the input bytes are considered as bits strings,
	   where the first bit is the most significant bit of the byte.[37] */
	// Pre-processing: padding with zeros
	// append "0" bit until message length in bit ? 448 (mod 512)
	// append length mod (2 pow 64) to message
		msg_chunk_ptr = (__int8*)calloc(final_len + 64, 1); // also appends "0" bits
	// (we alloc also 64 extra bytes...)
	memcpy(last_msg_chunk_ptr, initial_msg, initial_len);
	msg_chunk_ptr[initial_len] = 0x10; // write the "1" bit
	bits_len = 8 * initial_len; // note, we append the len
	memcpy(msg_chunk_ptr + final_len, &bits_len, 4);		   // in bits at the end of the buffer
	// Process the message in successive 512-bit chunks:
	//for each 512-bit chunk of message:
	for(offset=0; offset < final_len; offset += (512/8)) {
		// break chunk into sixteen 32-bit words w[j], 0 ? j ? 15
				if (offset!=last_msg_chunk_offset) w = (__int32 *) (msg_chunk_ptr + offset);
				else w = (__int32*)(last_msg_chunk_ptr);
		// initialize hash value for this chunk:
		a = h[0];
		b = h[1];
		c = h[2];
		d = h[3];
		// Main loop:
		for(i = 0; i<64; i++) {
			if (i < 16) {
				f = (b & c) | ((~b) & d);
				g = i;
			} else if (i < 32) {
				f = (d & b) | ((~d) & c);
				g = (5*i + 1) % 16;
			} else if (i < 48) {
				f = b ^ c ^ d;
				g = (3*i + 5) % 16;
			} else {
				f = c ^ (b | (~d));
				g = (7*i) % 16;
			}
			temp = d;
			d = c;
			c = b;
			b = b + LEFTROTATE((a + f + k[i] + w[g]), r[i]);
			a = temp;
		}
		// Add this chunk's hash to result so far:
		h[0] += a;
		h[1] += b;
		h[2] += c;
		h[3] += d;
	}
	// cleanup
	free(msg_chunk_ptr);
	return &h[0];
}



