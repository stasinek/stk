//---------------------------------------------------------------------------
#pragma hdrstop
#include <string.h>
#include <locale>
#pragma hdrstop
#include <stk_cstr_utils.h>
//---------------------------------------------------------------------------
#include "stk_base64.h"
//---------------------------------------------------------------------------
static const char base64_chars[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ""abcdefghijklmnopqrstuvwxyz""0123456789+/";
//---------------------------------------------------------------------------

static inline bool is_base64(unsigned char c)
{
    return (isalnum(c) || (c == '+') || (c == '/'));
}
//---------------------------------------------------------------------------

unsigned int base64_encode(const unsigned char* bytes_to_encode, unsigned int in_len, unsigned char* encoded_buffer, unsigned int& out_len)
{
    int i = 0,  j = 0;
    unsigned char char_array_3[3] = { 0, 0, 0 };
    unsigned char char_array_4[4] = { 0, 0, 0, 0 };
	out_len = 0;
 
    while (in_len--)
    {
        char_array_3[i++] = *(bytes_to_encode++);
        if (i == 3)
        {
            char_array_4[0] = ((char_array_3[0] & 0xFC) >> 2);
            char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xF0) >> 4);
            char_array_4[2] = ((char_array_3[1] & 0x0F) << 2) + ((char_array_3[2] & 0xC0) >> 6);
            char_array_4[3] = ((char_array_3[2] & 0x3F));

            encoded_buffer[out_len++] = base64_chars[char_array_4[0]];
            encoded_buffer[out_len++] = base64_chars[char_array_4[1]];
            encoded_buffer[out_len++] = base64_chars[char_array_4[2]];
            encoded_buffer[out_len++] = base64_chars[char_array_4[3]];
            i = 0;
        }
    }

    if (i!=0)
    {
            char_array_3[i+0] = '\0';
            char_array_3[i+1] = '\0';
            char_array_3[i+2] = '\0';

            char_array_4[0] = ((char_array_3[0] & 0xFC) >> 2);
            char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xF0) >> 4);
            char_array_4[2] = ((char_array_3[1] & 0x0F) << 2) + ((char_array_3[2] & 0xC0) >> 6);
            char_array_4[3] = ((char_array_3[2] & 0x3F));

        for (j = 0; j < (i + 1); j++)
        {
            encoded_buffer[out_len++] = base64_chars[char_array_4[j]];
        }
        while (i++ < 3)
        {
            encoded_buffer[out_len++] = '=';
        }
    }
    return out_len;
}
//---------------------------------------------------------------------------

unsigned int base64_decode(const unsigned char* encoded_string, unsigned int in_len, unsigned char* decoded_buffer, unsigned int& out_len)
{
    size_t i = 0, j = 0;
    int in_ = 0;
    unsigned char char_array_3[3] = { 0, 0, 0 };
    unsigned char char_array_4[4] = { 0, 0, 0, 0 };

    out_len = 0;
    while (in_len-- && (encoded_string[in_] != '=') && is_base64(encoded_string[in_]))
    {
        char_array_4[i++] = encoded_string[in_]; in_++;
        if (i == 4)
        {
            char_array_4[0] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[0]));
            char_array_4[1] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[1]));
            char_array_4[2] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[2]));
            char_array_4[3] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[3]));

            char_array_3[0] = (char_array_4[0] << 2) + ((char_array_4[1] & 0x30) >> 4);
            char_array_3[1] = ((char_array_4[1] & 0xf) << 4) + ((char_array_4[2] & 0x3c) >> 2);
            char_array_3[2] = ((char_array_4[2] & 0x3) << 6) + char_array_4[3];

            decoded_buffer[out_len++] = char_array_3[0];
            decoded_buffer[out_len++] = char_array_3[1];
            decoded_buffer[out_len++] = char_array_3[2];
            i = 0;
        }
    }

    if (i)
    {
        char_array_4[j] = 0;
        char_array_4[j] = 0;
        char_array_4[j] = 0;
        char_array_4[j] = 0;

        char_array_4[0] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[0]));
        char_array_4[1] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[1]));
        char_array_4[2] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[2]));
        char_array_4[3] = static_cast<unsigned char>(stk::cstr::chr(base64_chars,char_array_4[3]));

        char_array_3[0] = (char_array_4[0] << 2) + ((char_array_4[1] & 0x30) >> 4);
        char_array_3[1] = ((char_array_4[1] & 0xf) << 4) + ((char_array_4[2] & 0x3c) >> 2);
        char_array_3[2] = ((char_array_4[2] & 0x3) << 6) + char_array_4[3];

        for (j = 0; (j < i - 1); j++)
        {
            decoded_buffer[out_len++] = char_array_3[j];
        }
    }
    return out_len;
}
//---------------------------------------------------------------------------
