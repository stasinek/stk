//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "tsoft_file_search.h"
//---------------------------------------------------------------------------
#include "tsoft_file_io.h"
#include "./../mem/tsoft_mem32.h"
//---------------------------------------------------------------------------
#include <windows.h>
//---------------------------------------------------------------------------

__stdcall ts::file::__search::__search() : f_progress(), options()
{
		f_text_stack = new ts::__cstr_stack();
	progress = &f_progress;
		progress->cancel = false;
}
//---------------------------------------------------------------------------
__int32	__stdcall ts::file::__search::execute(char *a_dir, ts::__database* a_mask_list_ptr,ts::__database* a_output_list_ptr)
{
	external_src_output_list_ptr = a_output_list_ptr;
	external_mask_list_ptr = a_mask_list_ptr;
	return f_seek_src(a_dir);
}
//---------------------------------------------------------------------------

#define SEEKSRC_FIND_FIRST(patch)\
						  f_src_file.find_data.hand = FindFirstFileA(patch,&f_src_file.find_data.data); \
		  f_src_file.find_data.Next = f_src_file.find_data.hand!=INVALID_HANDLE_VALUE; \
	for (;f_src_file.find_data.Next!=0 ? f_src_file.find_data.data.cFileName[0]=='.' : false;)\
				{ f_src_file.find_data.Next = FindNextFileA(f_src_file.find_data.hand, &f_src_file.find_data.data);\
		}
#define SEEKSRC_FIND_NEXT()\
	f_src_file.find_data.Next = FindNextFileA(f_src_file.find_data.hand, &f_src_file.find_data.data);
#define SEEKSRC_FIND_CLOSE()\
	if (f_src_file.find_data.hand!=INVALID_HANDLE_VALUE){\
		FindClose(f_src_file.find_data.hand);\
		}
#define SEEKSRC_FIND_ADD_TO_list_ptr(patch,found)\
	if (found)\
		{crt = external_src_output_list_ptr->items.add(CHAR_TO_DATABASE_ATOM(patch));\
				 external_src_output_list_ptr->items[crt]->number[IS] = FILE_EXISTS;\
				 external_src_output_list_ptr->items[crt]->number[FILE_CREATION_DATE] = FILETIME_to_time_t(f_src_file.find_data.data.ftCreationTime);\
				 external_src_output_list_ptr->items[crt]->number[FILE_MODIFIED_DATE] = FILETIME_to_time_t(f_src_file.find_data.data.ftLastWriteTime);\
				 external_src_output_list_ptr->items[crt]->number[FILE_ACCESSED_DATE] = FILETIME_to_time_t(f_src_file.find_data.data.ftLastAccessTime);\
				 external_src_output_list_ptr->items[crt]->number[ATTRIB] = f_src_file.find_data.data.dwFileAttributes;\
				 external_src_output_list_ptr->items[crt]->number[SIZE] = f_src_file.find_data.data.nFileSizeLow;\
				 external_src_output_list_ptr->items[crt]->number[SIZE_H_DWORD] = f_src_file.find_data.data.nFileSizeHigh;\
								 external_src_output_list_ptr->items[crt]->number[FILENAME_BASE_PATH_LEN] = base_path_len;\
				 progress->src_all->size += f_src_file.find_data.data.nFileSizeLow;\
		}\
	else\
		{crt = external_src_output_list_ptr->items.add(CHAR_TO_DATABASE_ATOM(patch));\
				 external_src_output_list_ptr->items[crt]->number[IS] = !FILE_EXISTS;\
				 external_src_output_list_ptr->items[crt]->number[FILE_CREATION_DATE] = 0;\
				 external_src_output_list_ptr->items[crt]->number[FILE_MODIFIED_DATE] = 0;\
				 external_src_output_list_ptr->items[crt]->number[FILE_ACCESSED_DATE] = 0;\
				 external_src_output_list_ptr->items[crt]->number[ATTRIB] = 0;\
				 external_src_output_list_ptr->items[crt]->number[SIZE] = 0;\
				 external_src_output_list_ptr->items[crt]->number[SIZE_H_DWORD] = 0;\
				 external_src_output_list_ptr->items[crt]->number[FILENAME_BASE_PATH_LEN] = base_path_len;\
		}
#define SEEKSRC_STACK_push(patch)\
		crt = seek_stack_list_ptr->items.add(CHAR_TO_DATABASE_ATOM(patch));\
						  seek_stack_list_ptr->items[crt]->lptr[IS] = (void*)f_src_file.find_data.hand;

#define SEEKSRC_STACK_pop(patch)\
				 f_src_file.find_data.hand = seek_stack_list_ptr->items[seek_stack_list_ptr->items.count-1]->lptr[IS];\
				ts::cstr::mov(patch, seek_stack_list_ptr->items[seek_stack_list_ptr->items.count-1]->text);

__int32 __stdcall ts::file::__search::f_seek_src(char *a_lpSource)
{
		ts::__cstr_class *currentlpSource = f_text_stack->push(1024,a_lpSource);
		ts::text::fix_file_path(currentlpSource->c_str(),a_lpSource);
		ts::__cstr_class *templp = f_text_stack->push(1024);
	__database *seek_stack_list_ptr = new __database("STACK");
		__int32 crt, base_path_len = ts::cstr::strlen(currentlpSource->c_str()); // this is corrent if source is DIRECTORY
//
		f_src_file.find_data.hand = FindFirstFileA(currentlpSource->c_str(),&f_src_file.find_data.data);
	f_src_file.find_data.Next = f_src_file.find_data.hand!=INVALID_HANDLE_VALUE;
		if (f_src_file.find_data.Next==0 ? currentlpSource->len() > 3 : false) {
				f_text_stack->pop(2);
		return 0;
	}
	if (f_src_file.find_data.Next!=0 ? (f_src_file.find_data.data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)==0 : false) {
				ts::text::extract_file_path(templp->c_str(),currentlpSource->c_str());
				base_path_len = templp->len(); // but source is FILE, change to corrent values
		SEEKSRC_FIND_CLOSE();
				SEEKSRC_FIND_ADD_TO_list_ptr(currentlpSource->c_str(),f_src_file.find_data.Next);
				f_text_stack->pop(2);
		return 1;
	}
	if (f_src_file.find_data.Next!=0) {
		SEEKSRC_FIND_CLOSE();
	}
//------------------------------------------
		for (; progress->cancel==0;) {
//------------------------------------------
				SEEKSRC_FIND_ADD_TO_list_ptr(currentlpSource->c_str(),f_src_file.find_data.Next);
// szukaj plik�w w podkatalogu
				this->f_seek_src_file(currentlpSource->c_str(),base_path_len);
// stw�rz nazwe przeszukiwania podkatalog�w
				templp->set(currentlpSource);
				templp->add("\\*.*");
//szukaj i dodaj szukanie do stosu
				SEEKSRC_FIND_FIRST(templp->c_str());
				SEEKSRC_STACK_push(currentlpSource->c_str());
				for (; progress->cancel==0;) {
//jesli nic dalej nie ma cofnij o poziom
			if (f_src_file.find_data.Next==0) {
								SEEKSRC_STACK_pop(currentlpSource->c_str());
				SEEKSRC_FIND_CLOSE();
//jesli koniec stosu jestes na powierzchni, przerwij szukanie
				if (seek_stack_list_ptr->items.cut(seek_stack_list_ptr->items.count-1)==0)
					break;
								SEEKSRC_STACK_pop(currentlpSource->c_str());
				SEEKSRC_FIND_NEXT();
				continue;
			} else {
				if ((f_src_file.find_data.data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)!=0) {
										currentlpSource->add("\\");
										currentlpSource->add(f_src_file.find_data.data.cFileName);
					break;
				} else {
					SEEKSRC_FIND_NEXT();
					continue;
				}
			}
//----------------------
		}
//----------------------
		if (seek_stack_list_ptr->items.count==0)
			break;
//------------------------------------------
	}
//------------------------------------------
seek_srcX:
//------------------------------------------
	delete seek_stack_list_ptr;
		f_text_stack->pop(2);
	return 1;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::file::__search::f_seek_src_file(char *a_lpSource, __int32 base_path_len)
{
		ts::__cstr_class *currentlpSource = f_text_stack->push(1024);
	__int32   crt;
		for (__int32 i = 0; i < external_mask_list_ptr->items.count && progress->cancel==0; i++) {
				currentlpSource->set(a_lpSource);
				currentlpSource->add("\\");
				currentlpSource->add(external_mask_list_ptr->items[i]->text);
				SEEKSRC_FIND_FIRST(currentlpSource->c_str());
//------------------
				for (; progress->cancel==0;) {
//------------------
			if (f_src_file.find_data.Next==0) {
				SEEKSRC_FIND_CLOSE();
				break;
			} else if ((f_src_file.find_data.data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)==0) {
								currentlpSource->set(a_lpSource);
								currentlpSource->add("\\");
								currentlpSource->add(f_src_file.find_data.data.cFileName);
								SEEKSRC_FIND_ADD_TO_list_ptr(currentlpSource->c_str(),f_src_file.find_data.Next);
				SEEKSRC_FIND_NEXT();
				continue;
			} else {
				SEEKSRC_FIND_NEXT();
				continue;
			}
		}
//------------------
	}
//------------------------------------------
		f_text_stack->pop(1);
	return 1;
}
//---------------------------------------------------------------------------

#define SEEKDST_FIND_FIRST(patch)\
	f_dst_file.find_data.hand = FindFirstFileA(patch, &f_dst_file.find_data.data);\
	f_dst_file.find_data.Next = f_dst_file.find_data.hand!=INVALID_HANDLE_VALUE;
#define SEEKDST_FIND_NEXT()\
	f_dst_file.find_data.Next = FindNextFileA(f_dst_file.find_data.hand, &f_dst_file.find_data.data);
#define SEEKDST_FIND_CLOSE()\
	if (f_dst_file.find_data.hand!=INVALID_HANDLE_VALUE)\
		{FindClose(f_dst_file.find_data.hand);\
		}
#define SEEKDST_FIND_ADD_TO_list_ptr(patch,found)\
	if (found)\
				{crt = external_dst_output_list_ptr->items.add(CHAR_TO_DATABASE_ATOM(patch));\
				 external_dst_output_list_ptr->items[crt]->number[IS] = FILE_EXISTS;\
				 external_dst_output_list_ptr->items[crt]->number[FILE_CREATION_DATE] = FILETIME_to_time_t(f_dst_file.find_data.data.ftCreationTime);\
				 external_dst_output_list_ptr->items[crt]->number[FILE_MODIFIED_DATE] = FILETIME_to_time_t(f_dst_file.find_data.data.ftLastWriteTime);\
				 external_dst_output_list_ptr->items[crt]->number[FILE_ACCESSED_DATE] = FILETIME_to_time_t(f_dst_file.find_data.data.ftLastAccessTime);\
				 external_dst_output_list_ptr->items[crt]->number[ATTRIB] = f_dst_file.find_data.data.dwFileAttributes;\
				 external_dst_output_list_ptr->items[crt]->number[SIZE] = f_dst_file.find_data.data.nFileSizeLow;\
				 external_dst_output_list_ptr->items[crt]->number[SIZE_H_DWORD] = f_dst_file.find_data.data.nFileSizeHigh;\
				 external_dst_output_list_ptr->items[crt]->number[FILENAME_BASE_PATH_LEN] = base_path_len;\
		 progress->dst_all->size += f_dst_file.find_data.data.nFileSizeLow;\
		}\
	else\
		{crt = external_dst_output_list_ptr->items.add(CHAR_TO_DATABASE_ATOM(patch));\
				 external_dst_output_list_ptr->items[crt]->number[IS] = 0;\
				 external_dst_output_list_ptr->items[crt]->number[FILE_CREATION_DATE] = 0;\
				 external_dst_output_list_ptr->items[crt]->number[FILE_MODIFIED_DATE] = 0;\
				 external_dst_output_list_ptr->items[crt]->number[FILE_ACCESSED_DATE] = 0;\
				 external_dst_output_list_ptr->items[crt]->number[ATTRIB] = 0;\
				 external_dst_output_list_ptr->items[crt]->number[SIZE] = 0;\
				 external_dst_output_list_ptr->items[crt]->number[FILENAME_BASE_PATH_LEN] = base_path_len;\
		}

__int32 __stdcall ts::file::__search::create_destination_list(char *a_lpDestination, char *a_lpExtension_to_add, char *a_lpExtension_to_delete, __database* a_output_list_ptr)
{
	external_dst_output_list_ptr = a_output_list_ptr;
	return f_seek_dst(a_lpDestination, a_lpExtension_to_add, a_lpExtension_to_delete);
}


__int32 __stdcall ts::file::__search::f_seek_dst(char *a_lpDestination, char *a_lpExtension_to_add, char *a_lpExtension_to_delete)
{
	if (external_src_output_list_ptr->items.count==0)
		return 0;
		ts::__cstr_class *lpDestination = f_text_stack->push(1024);
		ts::__cstr_class *lpSource = f_text_stack->push(1024);
		ts::text::fix_file_path(lpDestination->c_str(),a_lpDestination);
		ts::text::fix_file_path(lpSource->c_str(),external_src_output_list_ptr->items[external_dst_output_list_ptr->items.count]->text);
		ts::__cstr_class *temp_lpDestination = f_text_stack->push(1024);
		ts::__cstr_class *temp_lpSource = f_text_stack->push(1024);
	__int32 len_of_ext_to_add = ts::cstr::strlen(a_lpExtension_to_add), len_of_ext_to_delete = ts::cstr::strlen(a_lpExtension_to_delete);
		if (lpSource->len() > 3) {
				lpDestination->add("\\");
				ts::text::extract_file_name(temp_lpSource->c_str(),lpSource->c_str());
				lpDestination->add(temp_lpSource->c_str());
		if (len_of_ext_to_add > 0) {
						lpDestination->add(a_lpExtension_to_add);
		}
		if (len_of_ext_to_delete > 0) {
						if (*(__int32*)((__int32)lpDestination+lpDestination->len()-4)==*(__int32*)a_lpExtension_to_delete)
								lpDestination->c_str()[lpDestination->len()-4] = '\0';
		}
	}
	__int32 crt;
		__int32 base_path_len = lpDestination->len();
//
//
	if (len_of_ext_to_add==0 && len_of_ext_to_delete==0) {
				temp_lpSource->set(lpSource);
				ts::text::upr(temp_lpSource->c_str());
				temp_lpDestination->set(lpDestination);
				ts::text::upr(temp_lpDestination->c_str());
				if (ts::cstr::cmpex(temp_lpSource->c_str(),temp_lpDestination->c_str())==0)
						for (int nKopii =1; progress->cancel==0; nKopii++) {
								ts::text::extract_file_path(lpDestination->c_str(),lpDestination->c_str());
				if (nKopii==1) {
										lpDestination->add("\\Kopia ");
										ts::text::extract_file_name(temp_lpSource->c_str(),lpSource->c_str());
										lpDestination->add(temp_lpSource->c_str());
				} else {
										lpDestination->add("\\Kopia (");
										lpDestination->add(ts::cstr::itoa(nKopii));
										lpDestination->add(") ");
										ts::text::extract_file_name(temp_lpSource->c_str(),lpSource->c_str());
										lpDestination->add(temp_lpSource->c_str());
				}
								SEEKDST_FIND_FIRST(temp_lpSource->c_str());
				if (!f_dst_file.find_data.Next) {
					break;
				}
				SEEKDST_FIND_CLOSE();
			}
	}
		for (int  srclen_old = lpSource->len(), dstlen_old = lpDestination->len(); external_dst_output_list_ptr->items.count < external_src_output_list_ptr->items.count && progress->cancel==0; ) {
		// NEW NAME BASED ON OLD NAME
				temp_lpSource->set(lpDestination);
				temp_lpSource->add((char*)((uint32_t)(char*)external_src_output_list_ptr->items[external_dst_output_list_ptr->items.count]->text + srclen_old));
		// PREPARE NEW NAME
		if (len_of_ext_to_add > 0) {
						for (int p = temp_lpSource->len(); p > dstlen_old; p--)
								if (temp_lpSource->c_str()[p]=='\\' || temp_lpSource->c_str()[p]=='\0')
										ts::text::insert(temp_lpSource->c_str(),p,a_lpExtension_to_add);
		}
		if (len_of_ext_to_delete > 0) {
						for (int p = ts::cstr::len(temp_lpSource->c_str()); p > dstlen_old; p--)
								if (temp_lpSource->c_str()[p]=='\\' || temp_lpSource->c_str()[p]=='\0')
										if (*(__int32*)((uint32_t)temp_lpSource->c_str()+p-4)==*(int*)a_lpExtension_to_delete)
												ts::text::del(temp_lpSource->c_str(),p-=4,4);
		}
		// CHECK FOR REAL DESTINATION FREE SPACE BY SUBB USSED BY REPLACED DESTINATION FILES
				SEEKDST_FIND_FIRST(temp_lpSource->c_str());
				SEEKDST_FIND_ADD_TO_list_ptr(temp_lpSource->c_str(),f_dst_file.find_data.Next);
		SEEKDST_FIND_CLOSE();
	}
		f_text_stack->pop(4);
	return 1;
}

//---------------------------------------------------------------------------

__stdcall ts::file::__search::~__search(void)
{
	delete f_text_stack;
}
//---------------------------------------------------------------------------
