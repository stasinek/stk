//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_file_search_H__
#define __tsoft_file_search_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
#include "./../database/tsoft_database.h"
#include "./../koperek/tsoft_kop32_controler.h"
#include "tsoft_file_io.h"
//---------------------------------------------------------------------------
namespace ts { namespace file {
//---------------------------------------------------------------------------
#define IS										  (__int8)0
#define FILE_CREATION_DATE		  (__int8)1
#define FILE_MODIFIED_DATE		  (__int8)2
#define FILE_ACCESSED_DATE		  (__int8)3
#define ATTRIB								  (__int8)4
#define SIZE										(__int8)5
#define SIZE_H_DWORD			(__int8)6
#define FILENAME_BASE_PATH_LEN	(__int8)7
//------------------------------------
#define FILE_EXISTS						 (__int32)0xFFFFFFFFL
//---------------------------------------------------------------------------
class __search {
//------------------------------------
private:
//------------------------------------
		const ts::__database  *f_external_mask_list_ptr;
//------------------------------------
		__int32 __stdcall  f_seek_src				(const char *a_Source_ptr);
		__int32 __stdcall  f_seek_src_file			(const char *a_Source_ptr, const __int32 a_Base_path_len);
		ts::__database  *f_external_src_output_list_ptr;
		__open_file_struct  f_src_file;
//------------------------------------
		__int32 __stdcall  f_seek_dst				(const char *a_Destination_ptr, const char *a_Extension_to_add_ptr, const char *a_Extension_to_delete_ptr);
		ts::__database  *f_external_dst_output_list_ptr;
		__open_file_struct  f_dst_file;
//------------------------------------
//CURRENTLY SUPPORT ONLY .XXX (4 bytes) extensions!!!!! not 5 not 3 ONLY 4
#define ADD_EXT								 (__int8)1
#define REMOVE_IF_FOUNDED		   (__int8)-1
#define PRESERVE_UNCHAGED_EXT   (__int8)0
//------------------------------------
public:
//------------------------------------
		ts::__kop32_class_progress_controler   *progress;
		ts::__kop32_class_progress_controler  f_progress;
//------------------------------------
		__stdcall				  __search					(void);
		__stdcall				 ~__search					(void);
//------------------------------------
public:
		class __options {
		public:
		} options;
//------------------------------------
		__int32 __stdcall execute					(const char* a_Source_path_ptr, const ts::__database* a_Mask_ptr, ts::__database* a_Destination_database_ptr);
		__int32 __stdcall create_destination_list	(const char* a_Destination_path_ptr, const char *a_Extension_to_add_ptr, const char *a_Extension_to_delete_ptr, __database* a_Destination_database_ptr);
//------------------------------------
#define ITS_FILE				(__int32)0x00000800L
#define ITS_DIRECTORY			(__int32)0x00000400L
#define ITS_SRC					(__int32)0x00000200L
#define ITS_DST					(__int32)0x00000100L
};
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
//---------------------------------------------------------------------------
