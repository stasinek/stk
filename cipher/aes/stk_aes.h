#ifndef __stk_aes_h__
#define __stk_aes_h__
//-----------------------------------------------------------------------------
#include "./../../stk_main.h"
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
extern STK_IMPEXP state_t* aes_state;
//-----------------------------------------------------------------------------
// The Key input to the AES Program
//-----------------------------------------------------------------------------
extern STK_IMPEXP const uint8_t* aes_key;
extern STK_IMPEXP void aes_ECB_decrypt(uint8_t* input, uint8_t *output);
//-----------------------------------------------------------------------------
#ifdef __cplusplus
}}
#endif
//-----------------------------------------------------------------------------
#endif
//-----------------------------------------------------------------------------
