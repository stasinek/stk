#ifndef __STK_AES_H
#define __STK_AES_H
//-----------------------------------------------------------------------------
#include <stk_MAIN.h>
//-----------------------------------------------------------------------------
#ifdef __GNUC__
#include <stdint.h>
#endif
#include <string.h>
//-----------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace cipher {
#endif
//-----------------------------------------------------------------------------
/*****************************************************************************/
/* Defines:                                                                  */
/*****************************************************************************/
// The number of columns comprising a state in AES. This is a constant in AES. Value=4
#define Nb 4
// The number of 32 bit words in a key.
#define Nk 4
// Key length in bytes [128 bit]
#define KEYLEN 16
// The number of rounds in AES Cipher.
#define Nr 10
/*****************************************************************************/
/* variables:                                                        */
/*****************************************************************************/
// state - array holding the intermediate results during decryption.
typedef uint8_t state_t[4][4];
extern STK_IMPEXP state_t* state;
//-----------------------------------------------------------------------------
extern STK_IMPEXP uint8_t* temp_value;
// The array that stores the round keys.
extern STK_IMPEXP uint8_t RoundKey[176];
//-----------------------------------------------------------------------------
// The Key input to the AES Program
//-----------------------------------------------------------------------------
extern STK_IMPEXP const uint8_t* Key;
//-----------------------------------------------------------------------------
extern STK_IMPEXP uint8_t getSBoxValue(uint8_t num);
extern STK_IMPEXP uint8_t getSBoxInvert(uint8_t num);
//-----------------------------------------------------------------------------
extern STK_IMPEXP void KeyExpansion(void);
extern STK_IMPEXP void AddRoundKey(uint8_t round);
extern STK_IMPEXP void InvMixColumns(void);
extern STK_IMPEXP void InvSubBytes(void);
extern STK_IMPEXP void InvShiftRows(void);
extern STK_IMPEXP void InvCipher(void);
extern STK_IMPEXP void block_copy(uint8_t* output, uint8_t* input);
extern STK_IMPEXP void AES128_ECB_decrypt(uint8_t* input, uint8_t *output);
//-----------------------------------------------------------------------------
#ifdef __cplusplus
}}
#endif
//-----------------------------------------------------------------------------
#endif
//-----------------------------------------------------------------------------
