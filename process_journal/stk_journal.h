//---------------------------------------------------------------------------
#ifndef __stk_journal_h
#define __stk_journal_h
//---------------------------------------------------------------------------
#include ".\..\stk_MAIN.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __journal {
        time_t f_current_time;
        char f_current_time_asci[20+1];
        struct tm *f_current_time_info;
        FILE *f_stream;
        char *f_stream_name;
        uint32_t f_buffer_size;
        char *f_write_buffer;
public:
        STK_IMPEXP  __stdcall  __journal();
        STK_IMPEXP  __stdcall ~__journal();
        const FILE	 STK_IMPEXP *__stdcall create(void);
        const FILE	 STK_IMPEXP *__stdcall open(void);
        const FILE	 STK_IMPEXP *__stdcall get_stream(void);
        int32_t STK_IMPEXP  __stdcall write_formated_line(const char* __restrict__ a_format, ...);
        int32_t STK_IMPEXP  __stdcall write_line(const char *a_line);
        int32_t STK_IMPEXP  __stdcall get_first_line(const time_t a_ttime);
        int32_t STK_IMPEXP  __stdcall get_next_line(void);
        const char 	 STK_IMPEXP *__stdcall read_line(const uint32_t a_line_number);
        inline void operator << (const char a_char) {
            write_formated_line("%c",a_char);
        }
        inline void operator << (const char * __restrict__ a_text) {
            write_formated_line("%s",a_text);
        }
        inline void operator << (const uint32_t a_int32) {
            write_formated_line("%d",a_int32);
        }
        inline void operator << (const int64_t a_int64) {
            write_formated_line("%lld",a_int64);
        }
        inline void operator << (const double a_double) {
            write_formated_line("%f",a_double);
        }
        void	 STK_IMPEXP  __stdcall close(void);
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
