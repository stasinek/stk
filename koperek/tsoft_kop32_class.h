//---------------------------------------------------------------------------
#ifndef __tsoft_kop32_H__
#define __tsoft_kop32_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "tsoft_kop32_search.h"
#include "./../text/tsoft_cstr_stack.h"
#include "./../database/tsoft_database.h"
//---------------------------------------------------------------------------
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
		__kop32_search *f_file_seeker;
		__int32			__stdcall	f_create_source_list		(const char *a_source_path_ptr);
		__int32			__stdcall	f_create_destination_list	(const char *a_destination_path_ptr);
		__int32			__stdcall	f_create_diff_list			(const char *a_source_path_ptr, const char *a_destination_path_ptr, const __int8 a_direction);
//------------------------------------
		file::__file_open_struct f_src_file;
		file::__file_buffer_struct_map f_mem_buffer_map;
		file::__file_open_struct f_dst_file;
		__int32			__stdcall	f_exec_one					(const uint32_t a_index, const uint32_t a_action);
		__int32			__stdcall	f_skip_one					(const uint32_t a_index, const uint32_t a_skip_items_at_same_level);
static	DWORD		WINAPI		f_write_file_thread				(LPVOID a_caller);
		HANDLE f_write_file_thread_handle;
		DWORD  f_write_file_thread_id;
		DWORD  f_write_file_thread_control;
		__int64   		__stdcall 	f_check_free_space			(const char *a_volume_name, const __int64 a_number_of_source_bytes, const __int64 a_number_of_destination_bytes, const bool a_check_until_positive, const bool a_user_could_ignore);
//---------------------------------------------------------------------------
public:
//------------------------------------
					__stdcall  	__kop32_class   (void);
					__stdcall ~	__kop32_class   (void);
//------------------------------------
		void				__stdcall reset 			(void);
//------------------------------------
		__kop32_class_options		 *options;
		__int32		__stdcall prepare_options	(const char *a_command_ptr);
//------------------------------------
		__kop32_class_list			 *list;
		__int32		__stdcall prepare_list		(void);
//------------------------------------
		__int32		__stdcall exec_all			(void);
		__int32		__stdcall exec_one			(const __int32 a_item);
//------------------------------------
		__kop32_class_progress_controler 		 *progress;
		__kop32_class_progress_controler  default_progress;
//------------------------------------
		const char*	__stdcall do_event			(const char*, const char*, const char*);
//------------------------------------
		void		__stdcall abort 			(void);
//------------------------------------
};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------

