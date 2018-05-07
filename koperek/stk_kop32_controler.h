//---------------------------------------------------------------------------
#ifndef __stk_kop32_controler_H
#define __stk_kop32_controler_H
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __kop32_class;
class STK_IMPEXP __kop32_class_progress_controler {
//---------------------------------------------------------------------------
    class __stat {
    public:
                STK_IMPEXP  __stdcall  __stat	(void);
                STK_IMPEXP  __stdcall ~__stat	(void);
    void 		STK_IMPEXP  __stdcall   reset	(void);
    //------------------------------------
    int64_t readed, size;
    int32_t     STK_IMPEXP  __stdcall percent	(void);
    //------------------------------------
    };
//---------------------------------------------------------------------------
private:
        stk::__kop32_class *f_owner;
        bool f_timer_freezed; uint32_t f_t1, f_t2; time_t f_t;
public:
        STK_IMPEXP  __stdcall  __kop32_class_progress_controler(stk::__kop32_class *aowner);
        STK_IMPEXP  __stdcall ~__kop32_class_progress_controler();
        struct	__stat_group {
                __stat *one, *all;
                STK_IMPEXP  __stdcall  __stat_group 	(void) {
                    one = new __stat();
                                all = new __stat();
                }
                STK_IMPEXP  __stdcall ~__stat_group 	(void) {
                    delete one;
                    delete all;
            }
                void STK_IMPEXP  __stdcall reset		(void) {
                            one->reset();
                                all->reset();
                        }
                        void STK_IMPEXP  __stdcall add_readed	(uint32_t areaded) {
                            one->readed+=areaded;
                                all->readed+=areaded;
                        }
        } *src, *dst;
        //------------------------------------
        stk::__kop32_class  STK_IMPEXP *__stdcall owner		(void);
        void STK_IMPEXP  __stdcall set_owner				(stk::__kop32_class *aowner);
        //------------------------------------
        void	STK_IMPEXP  __stdcall reset();
        //------------------------------------
        uint32_t STK_IMPEXP  __stdcall initialize_timer		(void);
        void	STK_IMPEXP  __stdcall freeze_timer			(void);
        void	STK_IMPEXP  __stdcall resume_timer			(void);
        uint32_t STK_IMPEXP  __stdcall elapsed				(void);
        uint32_t STK_IMPEXP  __stdcall actual_time			(void);
        bool cancel, pause;
        //------------------------------------
        const char	STK_IMPEXP *__stdcall do_event(const char*, const char*, const char*);
        //------------------------------------
        typedef const char* (__stdcall __callback_event_handler)(__kop32_class*, const char *a_event, const char *a_code, const char *a_code_ex);
        __callback_event_handler *callback_event_handler;
         static const char*  __stdcall  default_callback_event_handler(__kop32_class*, const char*, const char*, const char*);
};
        //------------------------------------
        #define EMPTY								""
        #define ON_ERROR							"ERROR"
        #define ON_NOP								"NOP"
        #define ON_BEFORE_RESET						"BEFORE_RESET"
        #define ON_RESETED							"RESETED"
        #define ON_BEFORE_PREPARE_OPTIONS			"BEFORE_PREPARE_OPTIONS"
        #define ON_PREPARE_OPTIONS_START			"PREPARE_OPTIONS_START"
        #define ON_PREPARE_OPTIONS_OK				"PREPARE_OPTIONS_OK"
        #define ON_PREPARE_OPTIONS_ERROR			"PREPARE_OPTIONS_ERROR"
        #define ON_PREPARE_OPTIONS_END				"PREPARE_OPTIONS_END"
        #define ON_BEFORE_SEARCH					"BEFORE_SEARCH"
        #define ON_SEARCH_START						"SEARCH_START"
        #define ON_SEARCH_PROGRESS					"SEARCH_PROGRESS"
        #define ON_BERORE_SEARCH_SRC				"BEFORE_SEARCH_SRC"
        #define ON_SEARCH_SRC_START					"SEARCH_SRC_START"
        #define ON_SEARCH_SRC_PROGRESS				"SEARCH_SRC_PROGRESS"
        #define ON_SEARCH_SRC_OK					"SEARCH_SRC_OK"
        #define ON_SEARCH_SRC_ERROR					"SEARCH_SRC_ERROR"
        #define ON_SEARCH_SRC_END					"SEARCH_SRC_END"
        #define ON_BERORE_SEARCH_DST				"BEFORE_SEARCH_DST"
        #define ON_SEARCH_DST_START					"SEARCH_DST_START"
        #define ON_SEARCH_DST_PROGRESS				"SEARCH_DST_PROGRESS"
        #define ON_SEARCH_DST_OK					"SEARCH_DST_OK"
        #define ON_SEARCH_DST_ERROR					"SEARCH_DST_ERROR"
        #define ON_SEARCH_DST_END					"SEARCH_DST_END"
        #define ON_SEARCH_ERROR						"SEARCH_ERROR"
        #define ON_SEARCH_OK   						"SEARCH_OK"
        #define ON_SEARCH_END						"SEARCH_END"
        #define ON_BEFORE_IO_ALL					"BEFORE_IO_ALL"
        #define ON_IO_ALL_START						"IO_ALL_START"
        #define ON_IO_ALL_PROGRESS					"IO_ALL_PROGRESS"
        #define ON_IO_ALL_OK						"IO_ALL_OK"
        #define ON_IO_ALL_ERROR						"IO_ALL_ERROR"
        #define ON_IO_ALL_END						"IO_ALL_END"
        #define ON_IO_BEFORE_REPLACE				"IO_BEFORE_REPLACE"
        #define ON_BEFORE_IO_ONE					"BEFORE_IO_ONE"
        #define ON_IO_ONE_START						"IO_ONE_START"
        #define ON_IO_ONE_PROGRESS					"IO_ONE_PROGRESS"
        #define ON_IO_ONE_BEFORE_VERIFY				"IO_ONE_BEFORE_VERIFY"
        #define ON_IO_ONE_VERIFY_OK					"IO_ONE_VERIFY_OK"
        #define ON_IO_ONE_VERIFY_DIFFERENT			"IO_ONE_VERIFY_DIFFERENT"
        #define ON_IO_ONE_VERIFY_ERROR				"IO_ONE_VERIFY_ERROR"
        #define ON_IO_ONE_OK						"IO_ONE_OK"
        #define ON_IO_ONE_ERROR						"IO_ONE_ERROR"
        #define ON_IO_ONE_END						"IO_ONE_END"
        #define ON_BEFORE_SKIP_ONE					"BEFORE_SKIP_ONE"
        #define ON_SKIPPED_ONE						"SKIPPED_ONE"
        #define ON_BEFORE_ABORT						"BEFORE_ABORT"
        #define ON_FREE_SPACE						"FREE_SPACE"

        #define OK									"OK"
        #define OKCANCEL							"OK_CANCEL"
        #define YESNO								"YES_NO"
        #define TESNOCANCEL							"YES_NO_CANCEL"
        #define YESALLNOCANCEL						"YES_ALL_NO_CANCEL"
        #define YESALLCUSTOMNOCANCEL				"YES_ALL_CUSTOM_NO_CANCEL"
        #define YESALLCUSTOMNONOALLCANCEL			"YES_ALL_CUSTOM_NO_NOALL_CANCEL"
        #define OKYESALLCUSTOMNONOALLCANCEL			"OK_YES_ALL_CUSTOM_NO_NOALL_CANCEL"
        #define INFO								"INFO"

//---------------------------------------------------------------------------
#ifdef __cplusplus
}
#endif
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

