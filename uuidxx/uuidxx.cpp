#include "uuidxx.h"
#include <stdio.h>
#define __STDC_FORMAT_MACROS
#ifdef __GNUC__
#include <inttypes.h>
#endif
using namespace std;
using namespace stk;
//#include <random>

#ifdef _WIN32
#define sscanf sscanf //_s
#endif

bool stk::uuid::operator == (const stk::uuid & guid2) const
{
        return memcmp(&guid2, this, sizeof(stk::uuid)) == 0;
}

bool stk::uuid::operator != (const uuid & guid2) const
{
        return !(*this == guid2);
}

bool stk::uuid::operator < (const uuid &guid2) const
{
        return memcmp(this, &guid2, sizeof(uuid)) < 0;
}

bool stk::uuid::operator > (const uuid &guid2) const
{
        return memcmp(this, &guid2, sizeof(uuid)) > 0;
}

void stk::uuid::init (const char *uuidString)
{
        if (uuidString == NULL)
        {
                return;
        }

        if (uuidString[0] == '{')
        {
                sscanf(uuidString, "{%08" SCNx32 "-%04" SCNx16 "-%04" SCNx16 "-%02" SCNx8 "%02" SCNx8 "-%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "}", &Data1, &Data2, &Data3, &Data4[0], &Data4[1], &Data4[2], &Data4[3], &Data4[4], &Data4[5], &Data4[6], &Data4[7]);
        }
        else
        {
                sscanf(uuidString, "%08" SCNx32 "-%04" SCNx16 "-%04" SCNx16 "-%02" SCNx8 "%02" SCNx8 "-%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "%02" SCNx8 "", &Data1, &Data2, &Data3, &Data4[0], &Data4[1], &Data4[2], &Data4[3], &Data4[4], &Data4[5], &Data4[6], &Data4[7]);
        }
}

stk::uuid::uuid (const std::string &uuidString)
{
init(uuidString.c_str());
}

stk::uuid::uuid (const char *uuidString)
{
init(uuidString);
}
stk::uuid::uuid (void)
{
init(NULL);
}

string stk::uuid::to_str(bool withBraces) const
{
        string buffer;
        buffer.reserve(38);
#ifndef _WIN32
        sprintf(const_cast<char *>(buffer.data()), "%s%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X%s", withBraces ? "{" : "", Data1, Data2, Data3, Data4[0], Data4[1], Data4[2], Data4[3], Data4[4], Data4[5], Data4[6], Data4[7], withBraces ? "}" : "");
#else
        sprintf(const_cast<char *>(buffer.data()), "%s%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X%s", withBraces ? "{" : "", Data1, Data2, Data3, Data4[0], Data4[1], Data4[2], Data4[3], Data4[4], Data4[5], Data4[6], Data4[7], withBraces ? "}" : "");
#endif
        return buffer; //^ 38+1,
}

uuid stk::uuid::from_str(const char *uuidString)
{
        uuid temp(uuidString);
        return temp;
}

uuid stk::uuid::from_str(const std::string &uuidString)
{
        uuid temp(uuidString.c_str());
        return temp;
}
/*
uuid stk::uuid::make()
{
#if !defined(__APPLE__) //mach-o does not support TLS
        thread_local std::random_device rd;
        thread_local auto gen = std::mt19937_64(rd());
#else
        std::random_device rd;
        std::mt19937_64 gen(rd());
#endif
        std::uniform_int_distribution<uint64_t> dis64;

        uuid newGuid;
        newGuid.WideIntegers[0] = dis64(gen);
        newGuid.WideIntegers[1] = dis64(gen);

        return newGuid;
}
*/
