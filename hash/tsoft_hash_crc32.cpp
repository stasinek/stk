//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "../text/tsoft_cstr_manipulation.h"
#include "../ssthreads/tsoft_threads.h"
//---------------------------------------------------------------------------
#include "tsoft_hash_crc32.h"
//---------------------------------------------------------------------------

static const uint8_t POLY_TAB[] = {0,1,2,4,5,7,8,10,11,12,16,22,23,26};
//x32 + x26 + x23 + x22 + x16 + x12 + x11 + x10 + x8 + x7 + x5 + x4 + x2 + x1 + x^0
// standard dla PKZIP, AUTODIN II, Ethernet, FDDI etc,
//CRC32 1(0000 0100 1100 0001 0001 1101 1011 0111)= 0x04C11DB7
/* Name   : "CRC-32/MPEG-2"
   Width  : 32
   Poly   : 04C11DB7
   Init   : FFFFFFFF
   RefIn  : False
   RefOut : False
   XorOut : 00000000 <- ZIP version below, ONLY DIFFERENCE with MPEG2
   Check  : 0376E6E7
  */

static uint32_t POLY_NOMIAL = 0x04C11DB7L;
uint32_t CRC32_TAB[256] = {
                0x00000000L, 0x77073096L, 0xEE0E612CL, 0x990951BAL, 0x076DC419L,
                0x706AF48FL, 0xE963A535L, 0x9E6495A3L, 0x0EDB8832L, 0x79DCB8A4L,
                0xE0D5E91EL, 0x97D2D988L, 0x09B64C2BL, 0x7EB17CBDL, 0xE7B82D07L,
                0x90BF1D91L, 0x1DB71064L, 0x6AB020F2L, 0xF3B97148L, 0x84BE41DEL,
                0x1ADAD47DL, 0x6DDDE4EBL, 0xF4D4B551L, 0x83D385C7L, 0x136C9856L,
                0x646BA8C0L, 0xFD62F97AL, 0x8A65C9ECL, 0x14015C4FL, 0x63066CD9L,
                0xFA0F3D63L, 0x8D080DF5L, 0x3B6E20C8L, 0x4C69105EL, 0xD56041E4L,
                0xA2677172L, 0x3C03E4D1L, 0x4B04D447L, 0xD20D85FDL, 0xA50AB56BL,
                0x35B5A8FAL, 0x42B2986CL, 0xDBBBC9D6L, 0xACBCF940L, 0x32D86CE3L,
                0x45DF5C75L, 0xDCD60DCFL, 0xABD13D59L, 0x26D930ACL, 0x51DE003AL,
                0xC8D75180L, 0xBFD06116L, 0x21B4F4B5L, 0x56B3C423L, 0xCFBA9599L,
                0xB8BDA50FL, 0x2802B89EL, 0x5F058808L, 0xC60CD9B2L, 0xB10BE924L,
                0x2F6F7C87L, 0x58684C11L, 0xC1611DABL, 0xB6662D3DL, 0x76DC4190L,
                0x01DB7106L, 0x98D220BCL, 0xEFD5102AL, 0x71B18589L, 0x06B6B51FL,
                0x9FBFE4A5L, 0xE8B8D433L, 0x7807C9A2L, 0x0F00F934L, 0x9609A88EL,
                0xE10E9818L, 0x7F6A0DBBL, 0x086D3D2DL, 0x91646C97L, 0xE6635C01L,
                0x6B6B51F4L, 0x1C6C6162L, 0x856530D8L, 0xF262004EL, 0x6C0695EDL,
                0x1B01A57BL, 0x8208F4C1L, 0xF50FC457L, 0x65B0D9C6L, 0x12B7E950L,
                0x8BBEB8EAL, 0xFCB9887CL, 0x62DD1DDFL, 0x15DA2D49L, 0x8CD37CF3L,
                0xFBD44C65L, 0x4DB26158L, 0x3AB551CEL, 0xA3BC0074L, 0xD4BB30E2L,
                0x4ADFA541L, 0x3DD895D7L, 0xA4D1C46DL, 0xD3D6F4FBL, 0x4369E96AL,
                0x346ED9FCL, 0xAD678846L, 0xDA60B8D0L, 0x44042D73L, 0x33031DE5L,
                0xAA0A4C5FL, 0xDD0D7CC9L, 0x5005713CL, 0x270241AAL, 0xBE0B1010L,
                0xC90C2086L, 0x5768B525L, 0x206F85B3L, 0xB966D409L, 0xCE61E49FL,
                0x5EDEF90EL, 0x29D9C998L, 0xB0D09822L, 0xC7D7A8B4L, 0x59B33D17L,
                0x2EB40D81L, 0xB7BD5C3BL, 0xC0BA6CADL, 0xEDB88320L, 0x9ABFB3B6L,
                0x03B6E20CL, 0x74B1D29AL, 0xEAD54739L, 0x9DD277AFL, 0x04DB2615L,
                0x73DC1683L, 0xE3630B12L, 0x94643B84L, 0x0D6D6A3EL, 0x7A6A5AA8L,
                0xE40ECF0BL, 0x9309FF9DL, 0x0A00AE27L, 0x7D079EB1L, 0xF00F9344L,
                0x8708A3D2L, 0x1E01F268L, 0x6906C2FEL, 0xF762575DL, 0x806567CBL,
                0x196C3671L, 0x6E6B06E7L, 0xFED41B76L, 0x89D32BE0L, 0x10DA7A5AL,
                0x67DD4ACCL, 0xF9B9DF6FL, 0x8EBEEFF9L, 0x17B7BE43L, 0x60B08ED5L,
                0xD6D6A3E8L, 0xA1D1937EL, 0x38D8C2C4L, 0x4FDFF252L, 0xD1BB67F1L,
                0xA6BC5767L, 0x3FB506DDL, 0x48B2364BL, 0xD80D2BDAL, 0xAF0A1B4CL,
                0x36034AF6L, 0x41047A60L, 0xDF60EFC3L, 0xA867DF55L, 0x316E8EEFL,
                0x4669BE79L, 0xCB61B38CL, 0xBC66831AL, 0x256FD2A0L, 0x5268E236L,
                0xCC0C7795L, 0xBB0B4703L, 0x220216B9L, 0x5505262FL, 0xC5BA3BBEL,
                0xB2BD0B28L, 0x2BB45A92L, 0x5CB36A04L, 0xC2D7FFA7L, 0xB5D0CF31L,
                0x2CD99E8BL, 0x5BDEAE1DL, 0x9B64C2B0L, 0xEC63F226L, 0x756AA39CL,
                0x026D930AL, 0x9C0906A9L, 0xEB0E363FL, 0x72076785L, 0x05005713L,
                0x95BF4A82L, 0xE2B87A14L, 0x7BB12BAEL, 0x0CB61B38L, 0x92D28E9BL,
                0xE5D5BE0DL, 0x7CDCEFB7L, 0x0BDBDF21L, 0x86D3D2D4L, 0xF1D4E242L,
                0x68DDB3F8L, 0x1FDA836EL, 0x81BE16CDL, 0xF6B9265BL, 0x6FB077E1L,
                0x18B74777L, 0x88085AE6L, 0xFF0F6A70L, 0x66063BCAL, 0x11010B5CL,
                0x8F659EFFL, 0xF862AE69L, 0x616BFFD3L, 0x166CCF45L, 0xA00AE278L,
                0xD70DD2EEL, 0x4E048354L, 0x3903B3C2L, 0xA7672661L, 0xD06016F7L,
                0x4969474DL, 0x3E6E77DBL, 0xAED16A4AL, 0xD9D65ADCL, 0x40DF0B66L,
                0x37D83BF0L, 0xA9BCAE53L, 0xDEBB9EC5L, 0x47B2CF7FL, 0x30B5FFE9L,
                0xBDBDF21CL, 0xCABAC28AL, 0x53B39330L, 0x24B4A3A6L, 0xBAD03605L,
                0xCDD70693L, 0x54DE5729L, 0x23D967BFL, 0xB3667A2EL, 0xC4614AB8L,
                0x5D681B02L, 0x2A6F2B94L, 0xB40BBE37L, 0xC30C8EA1L, 0x5A05DF1BL,
                0x2D02EF8DL
};
//---------------------------------------------------------------------------
/*
 *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
 *  code or tables extracted from it, as desired without restriction.
 *
 *  First, the polynomial itself and its table of feedback terms.  The
 *  polynomial is
 *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
 *
 *  Note that we take it "backwards" and put the highest-order term in
 *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
 *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
 *  the MSB being 1
 *
 *  Note that the usual hardware shift register implementation, which
 *  is what we're using (we're merely optimizing it by doing eight-bit
 *  chunks at a time) shifts bits into the lowest-order term.  In our
 *  implementation, that means shifting towards the right.  Why do we
 *  do it this way?  Because the calculated CRC must be transmitted in
 *  order from highest-order term to lowest-order term.  UARTs transmit
 *  characters in order from LSB to MSB.  By storing the CRC this way
 *  we hand it to the UART in the order low-byte to high-byte; the UART
 *  sends each low-bit to hight-bit; and the result is transmission bit
 *  by bit from highest- to lowest-order term without requiring any bit
 *  shuffling on our part.  Reception works similarly
 *
 *  The feedback terms table consists of 256, 32-bit entries.  Notes
 *
 *      The table can be generated at runtime if desired; code to do so
 *      is shown later.  It might not be obvious, but the feedback
 *      terms simply represent the results of eight shift/xor opera
 *      tions for all combinations of data and CRC register values
 *
 *      The values must be right-shifted by eight bits by the "updcrc
 *      logic; the shift must be unsigned (bring in zeroes).  On some
 *      hardware you could probably optimize the shift in assembler by
 *      using byte-swap instructions
 *      polynomial $edb88320
 *
 *
 * CRC32 code derived from work by Gary S. Brown.
 */

bool __stdcall ts::hash::crc32::test_CRC32(bool a_reset_table)
{
#ifdef __DEBUG_HASH_CRC32__
__DEBUG_FUNC_CALLED("")
#endif
char t[100]; int times = 0;
if (a_reset_table) reset_CRC32();
do{
ts::cstr::mov(t,"123456789");
if (calc_CRC32(t,ts::cstr::len(t))==0xCBF43926) {
ts::cstr::mov(t,"ZYXWVUTSRQPONMLKJIHGFEDBCA");
if (calc_CRC32(t,ts::cstr::len(t))==0x99cdfdb2) {
ts::cstr::mov(t,"The quick brown fox jumps over the lazy dog");
if (calc_CRC32(t,ts::cstr::len(t))==0x414fa339) {
continue;
}}}
} while (times++ < 1000000);
if (times >= 1000000) return true;
else return 0;
//https://asecuritysite.com/encryption/crc32?word=Test%20vector%20from%20febooti.com
}
//---------------------------------------------------------------------------

void __stdcall ts::hash::crc32::reset_CRC32(void)
{
#ifdef __DEBUG_HASH_CRC32__
__DEBUG_FUNC_CALLED("")
#endif
                __builtin_prefetch(&CRC32_TAB,1,0);
        register uint32_t n, k, c;
        //z POLY_TAM robi np. 0x04C11DB7
        POLY_NOMIAL = 0x00000000L;
        for (n = 0; n < sizeof(POLY_TAB); n++) {
                 POLY_NOMIAL |= 0x01L << (31-POLY_TAB[n]); // prosta kalkulacja 0x04C11DB7 ^^ na podstawie bitów const POLY_TAB
        }
        for (n = 0; n <= 0xFF; n++) { // od 0 do 255 poz w TAB
                for (c = n, k = 0; k < 8; k++) { // od 0 do 7 bitu
                        if (c & 1) c = (c >> 1) ^ POLY_NOMIAL; // jeœli kolejne LSB c == 1 licz kolejny wynik modulo dzielenia(xoruj) dla bajtu n.
                        else  c >>=1;
                }
                CRC32_TAB[n] = c;
        }
/*for (uint i = 0; i <= 0xFF; i++)
        {
        // 4 lub 8
        CRC32_TAB[1][i] = (CRC32_TAB[0][i] >> 8) ^ CRC32_TAB[0][CRC32_TAB[0][i] & 0xFF];
        CRC32_TAB[2][i] = (CRC32_TAB[1][i] >> 8) ^ CRC32_TAB[0][CRC32_TAB[1][i] & 0xFF];
        CRC32_TAB[3][i] = (CRC32_TAB[2][i] >> 8) ^ CRC32_TAB[0][CRC32_TAB[2][i] & 0xFF];
        // 8
        CRC32_TAB[4][i] = (CRC32_TAB[3][i] >> 8) ^ CRC32_TAB[0][CRC32_TAB[3][i] & 0xFF];
        CRC32_TAB[5][i] = (CRC32_TAB[4][i] >> 8) ^ CRC32_TAB[0][CRC32_TAB[4][i] & 0xFF];
        CRC32_TAB[6][i] = (CRC32_TAB[5][i] >> 8) ^ CRC32_TAB[0][CRC32_TAB[5][i] & 0xFF];
        CRC32_TAB[7][i] = (CRC32_TAB[6][i] >> 8) ^ CRC32_TAB[0][CRC32_TAB[6][i] & 0xFF];
        }
*/
}
//---------------------------------------------------------------------------
/*
Pseudo Code
Crc_value = 0FFFFFFFFh
Loop (for all the bytes in input)
   position = (byte_from_input XOR Crc_value) AND 0FFh
   table_value = Crc32_table[position]
   Crc_value = Crc_value >> 8
   Crc_value = Crc_Value XOR table_value
then in the end
Crc_value = Crc_value XOR 0xFFFFFFFFL
*/
uint32_t __stdcall ts::hash::crc32::calc_CRC32(const void *a_src_ptr,const uint32_t a_count)
{
return calc_CRC32(a_src_ptr,a_count,0);
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::hash::crc32::calc_CRC32_bitwise(const void* a_src_ptr, const size_t a_count, const uint32_t a_previous = 0)
{
#ifdef __DEBUG_HASH_CRC32__
__DEBUG_FUNC_CALLED("")
#endif
register uint32_t crc = ~a_previous; // to samo co xor 0xffffff z previous
register uint8_t* r_src_ptr = (uint8_t*)a_src_ptr;
register uint8_t* r_src_ptr_end = (uint8_t*)r_src_ptr + a_count;
        //  to 0 - 1 == crc & 1 * 0xFFFFFFF
#define UPDATE1()\
        mask  = 0 - (crc & 1);\
        crc >>= 1;\
        crc  ^= (mask & POLY_NOMIAL);

for (register uint32_t mask;r_src_ptr < r_src_ptr_end;) {
         crc ^= r_src_ptr[0];
         //// instead of code in 8 bit loop unrolled for(bit 0-7)
         //if (crc & 1)
         //  crc = (crc >> 1) ^ POLY_NOMIAL;
         //else
         //  crc =  crc >> 1;
         //// ->
         UPDATE1() //1
         UPDATE1() //2
         UPDATE1() //3
         UPDATE1() //4
         UPDATE1() //5
         UPDATE1() //6
         UPDATE1() //7
         UPDATE1() //8
         // <-
         r_src_ptr++;
}
return ~crc;
}
//---------------------------------------------------------------------------

uint32_t __stdcall ts::hash::crc32::calc_CRC32(const void *a_src_ptr,const uint32_t a_count, const uint32_t a_previous = 0)
{
#ifdef __DEBUG_HASH_CRC32__
__DEBUG_FUNC_CALLED("")
#endif
ATOMIC(1)
ATOMIC_LOCK(1)
register uint32_t crc = 0xFFFFFFFFL ^ a_previous;
// for previous 0 -> init stays FFFFFFF, for real "previous" calculation it could be chunked etc.
 /*
#if (defined(__BORLANDC__) | defined(_MSC_VER)) & defined(__ASM_OPT__)
static uint32_t *tab_p = ((uint32_t*)&CRC32_TAB);
                __asm { // old algo
                                mov EDI,a_src_ptr;
                                mov EDX,EDI;
                                add EDX,a_count;
                                cmp EDI,EDX;
                                jnl calc_CRC32_EXIT;

                                mov ESI,tab_p;
                                mov EAX,crc;
                                xor EBX,EBX;

                                calc_CRC32_NEXT:

                                mov BL,[EDI];
                                xor BL,AL;
                                shr EAX,8;
                                xor EAX,[ESI+EBX];
                                inc EDI;
                                cmp EDI,EDX;
                                jl  calc_CRC32_NEXT;

                                xor EAX,0xFFFFFFFFL;
                                calc_CRC32_EXIT:
//return EAX
                }
#else  */
register  uint8_t *r_src_ptr = static_cast<uint8_t*> (const_cast<void*>(a_src_ptr));
__builtin_prefetch(r_src_ptr,0,0);
register  uint8_t *r_src_ptr_end = (uint8_t*)a_src_ptr + a_count;
register  uint8_t *r_src_ptr_end_modulo_64 = (uint8_t*)((size_t)r_src_ptr_end - ((size_t)r_src_ptr_end % 64));
register  uint8_t position;
__builtin_prefetch(&CRC32_TAB,0,1);
#define UPDATE8()\
        position =  (uint8_t)crc ^ (uint8_t)r_src_ptr[0];\
        crc = crc>> 8;\
        crc = crc ^ CRC32_TAB[position];
for (; r_src_ptr  < r_src_ptr_end_modulo_64;) { __builtin_prefetch(r_src_ptr + 64,0,0); // do prefetch next cache line while will calculate current
for (register  uint8_t prefetched_num = 0; prefetched_num < 64; prefetched_num++) {
         UPDATE8()
         r_src_ptr++;
}}
for (;r_src_ptr  < r_src_ptr_end;) {
         UPDATE8()
         r_src_ptr++;
}
        //register uint8_t *r_src_ptr_end_modulo_8 = (uint8_t*)((size_t)r_src_ptr_end - ((size_t)r_src_ptr_end>>3));
/*for (;r_src_ptr < r_src_ptr_end_modulo_8;)
        {
        register uint32_t one = *((uint32_t*)r_src_ptr) ^ crc;
        r_src_ptr+=4;
        register uint32_t two = *((uint32_t*)r_src_ptr);
        r_src_ptr+=4;
        crc = CRC32_TAB[7][ one      & 0xFF] ^
                  CRC32_TAB[6][(one>> 8) & 0xFF] ^
                  CRC32_TAB[5][(one>>16) & 0xFF] ^
                  CRC32_TAB[4][ one>>24        ] ^
                  CRC32_TAB[3][ two      & 0xFF] ^
                  CRC32_TAB[2][(two>> 8) & 0xFF] ^
                  CRC32_TAB[1][(two>>16) & 0xFF] ^
                  CRC32_TAB[0][ two>>24        ];
        }
        // remaining 1 to 7 bytes
        while (r_src_ptr < r_src_ptr_end) crc = (crc >> 8) ^ CRC32_TAB[0][(crc & 0xFF) ^ *r_src_ptr++];
*/
crc ^= 0xFFFFFFFFL;
ATOMIC_UNLOCK(1)
return   crc;
//#endif
}
//-------------------------------THE END-------------------------------------

/*
//Pseudo Code
//loop (for all the bytes in input)
//   for (num_MAX bytes)
//        s0 += byte from input
//        s1 += s0
//   s0 = Adler_lo_value % num_MAX
//   s1 = Adler_hi_value % num_MAX
//in the end
//Adler_value = s1<<16 | s2
*/

#define MOD_ADLER 65521
// largest prime smaller than 65536
#define NUM_MAX 5550
// the largest n such that 255n(n+1)/2 + (n+1)(BASE-1) <= 2^32-1

uint32_t __stdcall ts::hash::adler32::calc_ADLER32(const void *a_src_ptr,const uint32_t a_count)
{
#ifdef __DEBUG_HASH_ADLER32__
__DEBUG_FUNC_CALLED("")
#endif
/*#if (defined(__BORLANDC__) | defined(_MSC_VER)) & defined(__ASM_OPT__)
__asm {
 mov EDI,a_src_ptr;
 mov EDX,EDI;
 add EDX,a_count;
 cmp EDI,EDX;
 jnl calc_ADLER32_EXIT;

 mov ESI,NUM_MAX;
 xor EAX,EAX;
 xor EBX,EBX;
 xor ECX,ECX;

calc_ADLER32_NEXT:

 mov CL,[EDI];
 add AX,CX;
 add BX,AX;
 dec ESI;
test ESI,ESI;
 jnz calc_ADLER32_INC;
push EDX;
 mov EBX,MOD_ADLER;
 div EBX;
push EDX;
 mov EAX,EBX;
 div EBX;
push EDX;

 pop EBX;
 pop EAX;
 pop EDX;
 mov ESI,NUM_MAX;

calc_ADLER32_INC:
 inc EDI;
 cmp EDI,EDX;
 jl  calc_ADLER32_NEXT;
 shl EAX,16;
  or AX,BX;

calc_ADLER32_EXIT:
                }
#else */
register  uint8_t *r_src_ptr = (uint8_t*)a_src_ptr;
        register uint32_t  a = 1, b = 0;
        register uint32_t  d_count = a_count;
        register uint32_t  t_count;

while (d_count) {
           t_count = d_count > NUM_MAX ? NUM_MAX : d_count;
           d_count-= t_count;
           do { a += *((uint8_t*)r_src_ptr++); b += a;
           } while (--t_count);
           a = (a & 0xffff) + (a >> 16) * (65536-MOD_ADLER);
           b = (b & 0xffff) + (b >> 16) * (65536-MOD_ADLER);
           }
/* It can be shown that b can reach 0xffef1 here. */
b = (b & 0xffff) + (b >> 16) * (65536-MOD_ADLER);
if (b >= MOD_ADLER)
b -= MOD_ADLER;
 /* It can be shown that a <= 0x1013a here, so a single subtract will do. */
if (a >= MOD_ADLER)
a -= MOD_ADLER;
return (b << 16) | a;
//#endif
}
