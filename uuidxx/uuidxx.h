#pragma once

#include <cstdint>
#include <string>

namespace stk
{
        union uuid
        {
                uint64_t WideIntegers[2];
                struct
                {
                        uint32_t Data1;
                        uint16_t Data2;
                        uint16_t Data3;
                        uint8_t  Data4[8];
                };

                bool operator == (const uuid &guid2) const;
                bool operator != (const uuid &guid2) const;
                bool operator  < (const uuid &guid2) const;
                bool operator  > (const uuid &guid2) const;

                //uuid() = default;

                uuid(const char *uuidString);
                uuid(const std::string &uuidString);
                uuid();
                void init(const char *uuidString);
                static uuid from_str(const char *uuidString);
                static uuid from_str(const std::string &uuidString);
                static uuid make();

                std::string to_str(bool withBraces = true) const;
        };

       // #if 2*sizeof(int64_t)!=sizeof(stk::uuid)
       // #pragma warning "Check uuid type declaration/padding!"
       // #endif
}
