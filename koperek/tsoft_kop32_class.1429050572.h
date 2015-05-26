//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002--------------------------------
//---------------------------------------------------------------------------
// -------------cos jak SHFileOperation(..., ...);---------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_H__
#define __tsoft_kop32_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include <inttypes.h>
#include "./../io/tsoft_file_search.h"
#include "./../io/tsoft_file_eno_header.h"
#include "./../text/tsoft_text_stack.h"
#include "./../database/tsoft_database.h"
#include "./../hash/tsoft_hash_password.h"
#include "tsoft_kop32_controler.h"
#include "tsoft_kop32_options.h"
#include "tsoft_kop32_list.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
class   __kop32_class {
//---------------------------------------------------------------------------
private:
//------------------------------------
		text::__cstr_stack *f_text_stack;
	file::__open_file_struct f_src_file;
	file::__open_file_struct f_dst_file;
		file::__file_buffer_struct_stack f_mem_buffer_stack;
		file::__search *f_file_seeker;
//------------------------------------
	__int32 __stdcall f_create_source_list			(char *a_lp_source_path);
	__int32 __stdcall f_create_destination_list		(char *a_lp_destination_path);
		__int32 __stdcall f_create_diff_list			(char *a_lp_source_path, char *a_lp_destination_path, __int8 a_direction);
		__int32 __stdcall f_execute_one_item			(__int32 a_index, __int32 a_action);
	__int32 __stdcall f_skip_one_item				(__int32 a_index, __int32 a_skip_items_at_same_level);
static DWORD WINAPI		  f_write_file_thread( LPVOID a_caller);
		HANDLE f_write_file_thread_handle;
		DWORD  f_write_file_thread_id;
		DWORD  f_write_file_thread_control;
//---------------------------------------------------------------------------
public:
//------------------------------------
		__stdcall  __kop32_class (void);
	__stdcall ~__kop32_class (void);
//------------------------------------
	__kop32_class_options *options;
	__int32	  __stdcall prepare_options(char *a_lpCommand);
//------------------------------------
	__kop32_class_progress_controler *progress;
		__kop32_class_progress_controler  default_progress;
		__int64   __stdcall check_environment(char *a_volume_name, __int64 a_number_of_source_bytes, __int64 a_number_of_destination_bytes, bool a_check_until_positive, bool a_user_could_ignore);
//------------------------------------
	__kop32_class_list *list;
	__int32	  __stdcall prepare(void);
	__int32	  __stdcall execute_all(void);
		__int32	  __stdcall execute_selected(__int32 a_item);
		void	  __stdcall cancel (void);
		const char*  __stdcall  execute_event(char*,char*,char*);
		//------------------------------------
		const char* (__stdcall *callback_event_handler_ptr)(char *a_event, char *a_code, char *a_code_ex);
		const char*  __stdcall  default_callback_event_handler(char*,char*,char*);
		//------------------------------------
		#define ON_NOP			"NOP_EVENT"
		#define ON_PROGRESS		"PROGRESS_EVENT"
		#define ON_START		"START_EVENT"
		#define ON_IO			"IO_EVENT"
		#define ON_ASK_USER		"ASK_USER_EVENT"
		#define ON_REPLACE		"ASK_USER_REPLACE_EVENT"
		#define ON_ENV_CHECK	"ENV_CHECK_EVENT"
		#define ON_STOP			"STOP_EVENT"
		#define ON_ERROR		"ERROR_EVENT"
		//------------------------------------
		void __stdcall reset(void);
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

