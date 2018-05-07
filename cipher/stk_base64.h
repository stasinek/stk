//---------------------------------------------------------------------------
//----------------- "sstsoft.pl 2001-2017 -----------------------------------
//---------------------------------------------------------------------------
#ifndef __stk_base64_h
#define __stk_base64_h
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
namespace stk { namespace cipher {
//---------------------------------------------------------------------------
/******************************************************************************
 * BASE64
 ******************************************************************************/

#define TEST_MIME_CODES
#define ___
static const int cLineLen = 72;

template <class in_iter_t, class out_iter_t>
class __mime_coder
{
public:
    virtual out_iter_t Filter( out_iter_t out, in_iter_t in_head, in_iter_t in_end ) = 0;
    virtual out_iter_t Finish( out_iter_t out ) = 0;
};

template <class in_iter_t, class out_iter_t>
class __base64_encoder : public __mime_coder<in_iter_t, out_iter_t>
{
public:
    __base64_encoder() : its3Len(0), itsLinePos(0) {}
    virtual out_iter_t Filter( out_iter_t out, in_iter_t in_head, in_iter_t in_end );
     virtual out_iter_t Finish( out_iter_t out );
private:
     unsigned char   itsCurr3[3];
    int             its3Len;
    int             itsLinePos;
    void EncodeCurr3( out_iter_t& out );
};

template <class in_iter_t, class out_iter_t>
class __base64_decoder : public __mime_coder<in_iter_t, out_iter_t>
{
public:
    __base64_decoder() : its4Len(0), itsEnded(0) {}
    virtual out_iter_t Filter( out_iter_t out, in_iter_t in_head, in_iter_t in_end );
     virtual out_iter_t Finish( out_iter_t out );
private:
    unsigned char   itsCurr4[4];
    int             its4Len;
    int             itsEnded;
    int             itsErrNum;
    void DecodeCurr4( out_iter_t& out );
};

/******************************************************************************
 * __base64_encoder
 ******************************************************************************/
static const char c__base64Codes[] =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static const char CR = 13;
static const char LF = 10;

template <class in_iter_t, class out_iter_t>
out_iter_t __base64_encoder<in_iter_t, out_iter_t>::Filter(
     out_iter_t out,
    in_iter_t in_head,
    in_iter_t in_end )
{
    for(;;) {
        for(; itsLinePos < cLineLen; itsLinePos += 4) {
            for (; its3Len < 3; its3Len++) {
                if (in_head == in_end)
___ ___ ___ ___ ___ return out;
                itsCurr3[its3Len] = *in_head;
                ++in_head;
            }
            EncodeCurr3(out);
            its3Len = 0;
          } // for loop until end of line
        *out++ = CR;
        *out++ = LF;
        itsLinePos = 0;
    } // for (;;)
//    return out;
}

template <class in_iter_t, class out_iter_t>
out_iter_t __base64_encoder<in_iter_t, out_iter_t>::Finish( out_iter_t out )
{
    if (its3Len)
        EncodeCurr3(out);
     its3Len = 0;
    itsLinePos = 0;

    return out;
}

template <class in_iter_t, class out_iter_t>
void __base64_encoder<in_iter_t, out_iter_t>::EncodeCurr3( out_iter_t& out )
{
    if (its3Len < 3) itsCurr3[its3Len] = 0;

    *out++ = c__base64Codes[ itsCurr3[0] >> 2 ];
    *out++ = c__base64Codes[ ((itsCurr3[0] & 0x3)<< 4) |
                           ((itsCurr3[1] & 0xF0) >> 4) ];
     if (its3Len == 1) *out++ = '=';
    else
        *out++ = c__base64Codes[ ((itsCurr3[1] & 0xF) << 2) |
                               ((itsCurr3[2] & 0xC0) >>6) ];
    if (its3Len < 3) *out++ = '=';
    else
        *out++ = c__base64Codes[ itsCurr3[2] & 0x3F ];
}

/******************************************************************************
 * __base64_decoder
 ******************************************************************************/
#define XX 127

static const unsigned char cIndex64[256] = {
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,62, XX,XX,XX,63,
    52,53,54,55, 56,57,58,59, 60,61,XX,XX, XX,XX,XX,XX,
    XX, 0, 1, 2,  3, 4, 5, 6,  7, 8, 9,10, 11,12,13,14,
    15,16,17,18, 19,20,21,22, 23,24,25,XX, XX,XX,XX,XX,
    XX,26,27,28, 29,30,31,32, 33,34,35,36, 37,38,39,40,
    41,42,43,44, 45,46,47,48, 49,50,51,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
     XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
    XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX, XX,XX,XX,XX,
};

template <class in_iter_t, class out_iter_t>
out_iter_t __base64_decoder<in_iter_t, out_iter_t>::Filter(
    out_iter_t out,
    in_iter_t in_head,
    in_iter_t in_end )
{
    unsigned char c;
    itsErrNum = 0;

     for (;;) {
        while (its4Len < 4) {
            if (in_head == in_end)
___ ___ ___ ___ return out;
            c = *in_head;
            if ((cIndex64[c] != XX) || (c == '='))
                itsCurr4[its4Len++] = c;
            else if ((c != CR) && (c != LF)) ++itsErrNum; // error
            ++in_head;
        } // while (its4Len < 4)
        DecodeCurr4(out);
        its4Len = 0;
    } // for (;;)

//       return out;
}

template <class in_iter_t, class out_iter_t>
out_iter_t __base64_decoder<in_iter_t, out_iter_t>::Finish( out_iter_t out )
{
    its4Len = 0;
    if (itsEnded) return out;
    else { // error
        itsEnded = 0;
        return out;
    }
}

template <class in_iter_t, class out_iter_t>
void __base64_decoder<in_iter_t, out_iter_t>::DecodeCurr4( out_iter_t& out )
{
    if (itsEnded) {
        ++itsErrNum;
        itsEnded = 0;
    }

    for (int i = 0; i < 2; i++)
        if (itsCurr4[i] == '=') {
            ++itsErrNum; // error
___ ___ ___ return;
        }
        else itsCurr4[i] = cIndex64[itsCurr4[i]];

    *out++ = (itsCurr4[0] << 2) | ((itsCurr4[1] & 0x30) >> 4);
    if (itsCurr4[2] == '=') {
        if (itsCurr4[3] == '=') itsEnded = 1;
        else ++itsErrNum;
    } else {
        itsCurr4[2] = cIndex64[itsCurr4[2]];
        *out++ = ((itsCurr4[1] & 0x0F) << 4) | ((itsCurr4[2] & 0x3C) >> 2);
        if (itsCurr4[3] == '=') itsEnded = 1;
        else *out++ = ((itsCurr4[2] & 0x03) << 6) | cIndex64[itsCurr4[3]];
    }
}

size_t STK_IMPEXP  __stdcall char2base64(char *Z, int s, char *out);
int STK_IMPEXP  __stdcall base642char(char *Z, int s, char *out);
class  __base64 {
private:
//---------------------------------------------------------------------------
        uint8_t  *order;
//---------------------------------------------------------------------------
public:
//---------------------------------------------------------------------------
        __base64(void);
       ~__base64(void);
//---------------------------------------------------------------------------
        void STK_IMPEXP  __stdcall  initialize(void);
//---------------------------------------------------------------------------
        char STK_IMPEXP  __stdcall  encode(const char a_ch);
        char STK_IMPEXP  __stdcall  decode(const char a_ch);
//---------------------------------------------------------------------------
};
//---------------------------------------------------------------------------
}}
//-------------------------------THE END-------------------------------------
#endif
//---------------------------------------------------------------------------
