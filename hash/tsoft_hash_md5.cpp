//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
#include "tsoft_hash_md5.h"
//---------------------------------------------------------------------------
// NOT THREAD SAFE!
//---------------------------------------------------------------------------


static const uint32_t k[64] = {
                0xd76aa478L, 0xe8c7b756L, 0x242070dbL, 0xc1bdceeeL ,
                0xf57c0fafL, 0x4787c62aL, 0xa8304613L, 0xfd469501L ,
                0x698098d8L, 0x8b44f7afL, 0xffff5bb1L, 0x895cd7beL ,
                0x6b901122L, 0xfd987193L, 0xa679438eL, 0x49b40821L ,
                0xf61e2562L, 0xc040b340L, 0x265e5a51L, 0xe9b6c7aaL ,
                0xd62f105dL, 0x02441453L, 0xd8a1e681L, 0xe7d3fbc8L ,
                0x21e1cde6L, 0xc33707d6L, 0xf4d50d87L, 0x455a14edL ,
                0xa9e3e905L, 0xfcefa3f8L, 0x676f02d9L, 0x8d2a4c8aL ,
                0xfffa3942L, 0x8771f681L, 0x6d9d6122L, 0xfde5380cL ,
                0xa4beea44L, 0x4bdecfa9L, 0xf6bb4b60L, 0xbebfbc70L ,
                0x289b7ec6L, 0xeaa127faL, 0xd4ef3085L, 0x04881d05L ,
                0xd9d4d039L, 0xe6db99e5L, 0x1fa27cf8L, 0xc4ac5665L ,
                0xf4292244L, 0x432aff97L, 0xab9423a7L, 0xfc93a039L ,
                0x655b59c3L, 0x8f0ccc92L, 0xffeff47dL, 0x85845dd1L ,
                0x6fa87e4fL, 0xfe2ce6e0L, 0xa3014314L, 0x4e0811a1L ,
                0xf7537e82L, 0xbd3af235L, 0x2ad7d2bbL, 0xeb86d391L
};

static uint32_t  h[4];

#define LEFTROTATE(x, c) (((x) << (c)) | ((x) >> (32 - (c))))

// These vars will contain the hash

//---------------------------------------------------------------------------

void __stdcall ts::hash::md5::reset_MD5(void)
{
#ifdef __DEBUG_HASH_MD5__
__DEBUG_FUNC_CALLED__
#endif
}
//---------------------------------------------------------------------------

const uint32_t*  __stdcall ts::hash::md5::calc_MD5(const char *a_data, __int32 a_len)
{
#ifdef __DEBUG_HASH_MD5__
__DEBUG_FUNC_CALLED__
#endif
                __int8 *data_chunk = NULL;
                __int8 *last_data_chunk = NULL;
                __int32 final_len = 512;
                __int32 bits_len;
                __int32 offset, last_data_chunk_offset = 0;
                __int32 *w;
                __int32 a, b, c, d, i, f, g, temp;
                // per-round shift amounts
                const __int32 r[] = {   7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
                                                        5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20,
                                                        4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
                                                        6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21
                                                };
                // initialize hash variables - simple count in nibbles:
                h[0] = 0x67452301L;
                h[1] = 0xefcdab89L;
                h[2] = 0x98badcfeL;
                h[3] = 0x10325476L;
                // Pre-processing: adding a single 1 bit
                // append "1" bit to message
                /* Notice: the input bytes are considered as bits strings,
                   where the first bit is the most significant bit of the byte.[37] */
                // Pre-processing: padding with zeros
                // append "0" bit until message length in bit ? 448 (mod 512)
                // append length mod (2 pow 64) to message
                data_chunk = (__int8*)calloc(final_len + 64, 1); // also appends "0" bits
                // (we alloc also 64 extra bytes...)
                ts::mem32::mov(last_data_chunk, a_data, a_len);
                data_chunk[a_len] = 0x10L; // write the "1" bit
                bits_len = 8 * a_len; // note, we append the len
                ts::mem32::mov(data_chunk + final_len, &bits_len, 4);              // in bits at the end of the buffer
                // Process the message in successive 512-bit chunks:
                //for each 512-bit chunk of message:
                for(offset=0; offset < final_len; offset += (512/8)) {
                                // break chunk into sixteen 32-bit words w[j], 0 ? j ? 15
                                if (offset!=last_data_chunk_offset) w = (__int32 *) (data_chunk + offset);
                                else w = (__int32*)(last_data_chunk);
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
                free(data_chunk);
                return &h[0];
}

