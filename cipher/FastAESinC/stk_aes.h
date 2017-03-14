#ifndef AES_H
#define AES_H

#include <stdint.h>
#include <string.h> 
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
state_t* state;

uint8_t* temp_value;
// The array that stores the round keys.
uint8_t RoundKey[176];

// The Key input to the AES Program
const uint8_t* Key;

uint8_t getSBoxValue(uint8_t num);
uint8_t getSBoxInvert(uint8_t num);

void KeyExpansion(void);

void AddRoundKey(uint8_t round);

void InvMixColumns(void);

void InvSubBytes(void);

void InvShiftRows(void);

void InvCipher(void);

void BlockCopy(uint8_t* output, uint8_t* input);

void AES128_ECB_decrypt(uint8_t* input, uint8_t *output);

#endif
