//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#pragma hdrstop
#include "../text/stk_cstr_utils.h"
#include "../koperek/stk_kop32_class.h"
#include "./../time/stk_time.h"
//---------------------------------------------------------------------------
#include "stk_kop32_search.h"
//---------------------------------------------------------------------------

__stdcall stk::__kop32_search::__kop32_search(stk::__kop32_class *aowner)
: f_owner(aowner), options(), default_progress(aowner)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        progress = &default_progress;
        progress->cancel = false;
}
//---------------------------------------------------------------------------

void __stdcall stk::__kop32_search::set_owner(stk::__kop32_class *aowner)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        f_owner = aowner;
        progress->set_owner(aowner);
}
//---------------------------------------------------------------------------

stk::__kop32_class* __stdcall stk::__kop32_search::owner(void)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        return f_owner;
}
//---------------------------------------------------------------------------
int32_t __stdcall stk::__kop32_search::exec(const char *a_dir, const stk::__database* a_mask_list_ptr, stk::__database* a_output_list_ptr)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        f_src_output_list_ptr = a_output_list_ptr;
        f_mask_list_ptr = a_mask_list_ptr;
        return f_seek_src(a_dir);
}
//---------------------------------------------------------------------------

#define SEEKSRC_FIND_FIRST(patch)\
                          f_src_file.find_data.hand = FindFirstFileA(patch,&f_src_file.find_data.data); \
                  f_src_file.find_data.next = f_src_file.find_data.hand!=INVALID_HANDLE_VALUE; \
        for (;f_src_file.find_data.next!=0 ? f_src_file.find_data.data.cFileName[0]=='.' : false;)\
                                { f_src_file.find_data.next = FindNextFileA(f_src_file.find_data.hand, &f_src_file.find_data.data);\
                }
#define SEEKSRC_FIND_NEXT()\
        f_src_file.find_data.next = FindNextFileA(f_src_file.find_data.hand, &f_src_file.find_data.data);
#define SEEKSRC_FIND_CLOSE()\
        if (f_src_file.find_data.hand!=INVALID_HANDLE_VALUE){\
                FindClose(f_src_file.find_data.hand);\
                }
#define SEEKSRC_FIND_ADD_TO_list_ptr(path,found,bpl)\
        if (found && f_src_file.find_data.data.nFileSizeHigh==0)\
                {current = f_src_output_list_ptr->items()->add_text(path);\
                 f_src_output_list_ptr->items()->set_numbers(current,IS,EXISTS);\
                 f_src_output_list_ptr->items()->set_numbers(current,FILE_CREATION_DATE,stk::time::FILETIME_to_time_t(&f_src_file.find_data.data.ftCreationTime));\
                 f_src_output_list_ptr->items()->set_numbers(current,FILE_MODIFIED_DATE,stk::time::FILETIME_to_time_t(&f_src_file.find_data.data.ftLastWriteTime));\
                 f_src_output_list_ptr->items()->set_numbers(current,FILE_ACCESSED_DATE,stk::time::FILETIME_to_time_t(&f_src_file.find_data.data.ftLastAccessTime));\
                 f_src_output_list_ptr->items()->set_numbers(current,ATTRIB,f_src_file.find_data.data.dwFileAttributes);\
                 f_src_output_list_ptr->items()->set_numbers(current,SIZE,f_src_file.find_data.data.nFileSizeLow);\
                 f_src_output_list_ptr->items()->set_numbers(current,SIZE_H_DWORD,f_src_file.find_data.data.nFileSizeHigh);\
                 f_src_output_list_ptr->items()->set_numbers(current,FILENAME_BASE_PATH_LEN,bpl);\
                 progress->src->all->size += f_src_file.find_data.data.nFileSizeLow;\
                }\
        else\
                {current = f_src_output_list_ptr->items()->add_text(path);\
                 f_src_output_list_ptr->items()->set_numbers(current,IS,!EXISTS);\
                 f_src_output_list_ptr->items()->set_numbers(current,FILE_CREATION_DATE,0);\
                 f_src_output_list_ptr->items()->set_numbers(current,FILE_MODIFIED_DATE,0);\
                 f_src_output_list_ptr->items()->set_numbers(current,FILE_ACCESSED_DATE,0);\
                 f_src_output_list_ptr->items()->set_numbers(current,ATTRIB,0);\
                 f_src_output_list_ptr->items()->set_numbers(current,SIZE,0);\
                 f_src_output_list_ptr->items()->set_numbers(current,SIZE_H_DWORD,0);\
                 f_src_output_list_ptr->items()->set_numbers(current,FILENAME_BASE_PATH_LEN,bpl);\
                }
#define SEEKSRC_STACK_push(current_path)\
                seek_stack->push(current_path,(void*)f_src_file.find_data.hand);

#define SEEKSRC_STACK_pop(current_path)\
                f_src_file.find_data.hand = seek_stack->handle.top();\
                stk::cstr::mov(current_path, seek_stack->path.top()->c_str());

#include <stack>

int32_t __stdcall stk::__kop32_search::f_seek_src(const char *a_lpSource)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        register int32_t current;
        stk::__cstr_class *currentlpSource = new stk::__cstr_class(1024);
        currentlpSource->set(a_lpSource);
        stk::cstr::fix_file_path(currentlpSource->data(),a_lpSource);
        stk::__cstr_class *templp = new stk::__cstr_class(1024);
        templp->set("");

        struct __seek_stack {
                std::stack < stk::__cstr_class* > path;
                std::stack < HANDLE > handle;
                int32_t base_path_len; // this is corrent if source is DIRECTORY
                 HANDLE base_path_handle;

                bool __stdcall empty(void)
                {
                        return path.empty();
                }
                int32_t __stdcall push(const char *a_path, HANDLE a_handle)
                {
                        path.push(new stk::__cstr_class(a_path));
                        handle.push(a_handle);
                        return path.size();
                }
                int32_t __stdcall pop(void)
                {
                        delete path.top();
                        path.pop();
                        handle.pop();
                        if (empty()) return 0;
                        return 1;
                }
        }  *seek_stack;
                seek_stack = new __seek_stack;
                f_src_file.find_data.hand = FindFirstFileA(currentlpSource->c_str(),&f_src_file.find_data.data);
                f_src_file.find_data.next = f_src_file.find_data.hand!=INVALID_HANDLE_VALUE;
                seek_stack->base_path_len = stk::cstr::len(currentlpSource->c_str());
                seek_stack->base_path_handle = f_src_file.find_data.hand;
        if (f_src_file.find_data.next==0 ? currentlpSource->len() > 3 : false) {
                goto GOTO_seek_src_cleanup_ERROR;
        }

        if (f_src_file.find_data.next!=0 ? (f_src_file.find_data.data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)==0 : false) {
                stk::cstr::get_file_path(templp->data(),currentlpSource->c_str());
                seek_stack->base_path_len = templp->len(); // but source is FILE, change to corrent values
                SEEKSRC_FIND_CLOSE();
                SEEKSRC_FIND_ADD_TO_list_ptr(currentlpSource->c_str(),f_src_file.find_data.next,seek_stack->base_path_len);
                goto GOTO_seek_src_cleanup_OK;
        }
        if (f_src_file.find_data.next!=0) {
                SEEKSRC_FIND_CLOSE();
        }
//------------------------------------------
        for (; progress->cancel==0;) {
//------------------------------------------
                SEEKSRC_FIND_ADD_TO_list_ptr(currentlpSource->c_str(),f_src_file.find_data.next,seek_stack->base_path_len);
// szukaj plik�w w podkatalogu
                this->f_seek_src_file(currentlpSource->c_str(),seek_stack->base_path_len);
// stw�rz nazwe przeszukiwania podkatalog�w
                templp->set(currentlpSource);
                templp->add("\\*.*");
//szukaj i dodaj szukanie do stosu
                SEEKSRC_FIND_FIRST(templp->c_str());
                SEEKSRC_STACK_push(currentlpSource->c_str());
                for (; progress->cancel==0;) {
//jesli nic dalej nie ma cofnij o poziom
                        if (f_src_file.find_data.next==0) {
                                SEEKSRC_STACK_pop(currentlpSource->data());
                                SEEKSRC_FIND_CLOSE();
//jesli koniec stosu jestes na powierzchni, przerwij szukanie
                                if (seek_stack->pop()==0)
                                        break;
                                SEEKSRC_STACK_pop(currentlpSource->data());
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
                if (seek_stack->empty())
                        break;
//------------------------------------------
        }
//------------------------------------------
GOTO_seek_src_cleanup_OK:

        delete templp;
        delete currentlpSource;
        delete seek_stack;
        return 1;
GOTO_seek_src_cleanup_ERROR:
        delete templp;
        delete currentlpSource;
        delete seek_stack;
        return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__kop32_search::f_seek_src_file(const char *a_lpSource, const int32_t base_path_len)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        register uint32_t current;
        stk::__cstr_class *currentlpSource = new stk::__cstr_class(1024);//f_text_stack->push(1024);
        for (uint32_t i = 0; i < f_mask_list_ptr->items()->count() && progress->cancel==0; i++) {
                currentlpSource->set(a_lpSource);
                currentlpSource->add("\\");
                currentlpSource->add((char*)f_mask_list_ptr->items()->get_text(i));
                SEEKSRC_FIND_FIRST(currentlpSource->c_str());
//------------------
                for (; progress->cancel==0;) {
//------------------
                        if (f_src_file.find_data.next==0) {
                                SEEKSRC_FIND_CLOSE();
                                break;
                        } else if ((f_src_file.find_data.data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)==0) {
                                currentlpSource->set(a_lpSource);
                                currentlpSource->add("\\");
                                currentlpSource->add(f_src_file.find_data.data.cFileName);
                                SEEKSRC_FIND_ADD_TO_list_ptr(currentlpSource->c_str(),f_src_file.find_data.next,base_path_len);
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
        delete currentlpSource;
        return 1;
}
//---------------------------------------------------------------------------

#define SEEKDST_FIND_FIRST(patch)\
        f_dst_file.find_data.hand = FindFirstFileA(patch, &f_dst_file.find_data.data);\
        f_dst_file.find_data.next = f_dst_file.find_data.hand!=INVALID_HANDLE_VALUE;
#define SEEKDST_FIND_NEXT()\
        f_dst_file.find_data.next = FindNextFileA(f_dst_file.find_data.hand, &f_dst_file.find_data.data);
#define SEEKDST_FIND_CLOSE()\
        if (f_dst_file.find_data.hand!=INVALID_HANDLE_VALUE)\
                {FindClose(f_dst_file.find_data.hand);\
                }
#define SEEKDST_FIND_ADD_TO_list_ptr(patch,found)\
        if (found && f_dst_file.find_data.data.nFileSizeHigh==0)\
                {current = f_dst_output_list_ptr->items()->add_text(patch);\
                 f_dst_output_list_ptr->items()->set_numbers(current,IS, EXISTS);\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILE_CREATION_DATE, stk::time::FILETIME_to_time_t(&f_dst_file.find_data.data.ftCreationTime));\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILE_MODIFIED_DATE, stk::time::FILETIME_to_time_t(&f_dst_file.find_data.data.ftLastWriteTime));\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILE_ACCESSED_DATE, stk::time::FILETIME_to_time_t(&f_dst_file.find_data.data.ftLastAccessTime));\
                 f_dst_output_list_ptr->items()->set_numbers(current,ATTRIB, f_dst_file.find_data.data.dwFileAttributes);\
                 f_dst_output_list_ptr->items()->set_numbers(current,SIZE, f_dst_file.find_data.data.nFileSizeLow);\
                 f_dst_output_list_ptr->items()->set_numbers(current,SIZE_H_DWORD, f_dst_file.find_data.data.nFileSizeHigh);\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILENAME_BASE_PATH_LEN, base_path_len);\
                 progress->dst->all->size += f_dst_file.find_data.data.nFileSizeLow;\
                }\
        else\
                {current = f_dst_output_list_ptr->items()->add_text(patch);\
                 f_dst_output_list_ptr->items()->set_numbers(current,IS, 0);\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILE_CREATION_DATE, 0);\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILE_MODIFIED_DATE, 0);\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILE_ACCESSED_DATE, 0);\
                 f_dst_output_list_ptr->items()->set_numbers(current,ATTRIB, 0);\
                 f_dst_output_list_ptr->items()->set_numbers(current,SIZE, 0);\
                 f_dst_output_list_ptr->items()->set_numbers(current,FILENAME_BASE_PATH_LEN, base_path_len);\
                }

int32_t __stdcall stk::__kop32_search::create_destination_list(const char *a_lpDestination, const char *a_lpExtension_to_add, const char *a_lpExtension_to_delete, __database* a_output_list_ptr)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        f_dst_output_list_ptr = a_output_list_ptr;
        return f_seek_dst(a_lpDestination, a_lpExtension_to_add, a_lpExtension_to_delete);
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__kop32_search::f_seek_dst(const char *a_lpDestination, const char *a_lpExtension_to_add, const char *a_lpExtension_to_delete)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

        if (f_src_output_list_ptr->items()->count()==0)
                return 0;
        stk::__cstr_class *lpDestination = new stk::__cstr_class(1024);
        stk::__cstr_class *lpSource = new stk::__cstr_class(1024);
        stk::cstr::fix_file_path(lpDestination->data(),a_lpDestination);
        stk::cstr::fix_file_path(lpSource->data(),f_src_output_list_ptr->items()->get_text(f_dst_output_list_ptr->items()->count()));
        stk::__cstr_class *temp_lpDestination = new stk::__cstr_class(1024);
        stk::__cstr_class *temp_lpSource = new stk::__cstr_class(1024);
        int32_t len_of_ext_to_add = stk::cstr::len(a_lpExtension_to_add), len_of_ext_to_delete = stk::cstr::len(a_lpExtension_to_delete);
        if (lpSource->len() > 3) {
                lpDestination->add("\\");
                stk::cstr::get_file_name(temp_lpSource->data(),lpSource->c_str());
                lpDestination->add(temp_lpSource->c_str());
                if (len_of_ext_to_add > 0) {
                        lpDestination->add(a_lpExtension_to_add);
                }
                if (len_of_ext_to_delete > 0) {
                        if (*(int32_t*)((int8_t*)lpDestination+lpDestination->len()-4)==*(int32_t*)a_lpExtension_to_delete)
                                lpDestination->data()[lpDestination->len()-4] = '\0';
                }
        }
        int32_t current;
        int32_t base_path_len = lpDestination->len();
//
//
        if (len_of_ext_to_add==0 && len_of_ext_to_delete==0) {
                temp_lpSource->set(lpSource);
                stk::cstr::upr(temp_lpSource->data());
                temp_lpDestination->set(lpDestination);
                stk::cstr::upr(temp_lpDestination->data());
                if (stk::cstr::compare(temp_lpSource->c_str(),temp_lpDestination->c_str())==0)
                        for (int nKopii =1; progress->cancel==0; nKopii++) {
                                stk::cstr::get_file_path(lpDestination->data(),lpDestination->c_str());
                                if (nKopii==1) {
                                        lpDestination->add("\\Kopia ");
                                        stk::cstr::get_file_name(temp_lpSource->data(),lpSource->c_str());
                                        lpDestination->add(temp_lpSource->c_str());
                                } else {
                                        lpDestination->add("\\Kopia (");
                                        lpDestination->add(stk::cstr::itoa(nKopii));
                                        lpDestination->add(") ");
                                        stk::cstr::get_file_name(temp_lpSource->data(),lpSource->c_str());
                                        lpDestination->add(temp_lpSource->c_str());
                                }
                                SEEKDST_FIND_FIRST(temp_lpSource->c_str());
                                if (!f_dst_file.find_data.next) {
                                        break;
                                }
                                SEEKDST_FIND_CLOSE();
                        }
        }
        for (int  srclen_old = lpSource->len(), dstlen_old = lpDestination->len(); f_dst_output_list_ptr->items()->count() < f_src_output_list_ptr->items()->count() && progress->cancel==0; ) {
                // NEW NAME BASED ON OLD NAME
                temp_lpSource->set(lpDestination);
                temp_lpSource->add((char*)((char*)f_src_output_list_ptr->items()->get_text(f_dst_output_list_ptr->items()->count()) + srclen_old));
                // PREPARE NEW NAME
                if (len_of_ext_to_add > 0) {
                        for (int p = temp_lpSource->len(); p > dstlen_old; p--)
                                if (temp_lpSource->c_str()[p]=='\\' || temp_lpSource->c_str()[p]=='\0')
                                        stk::cstr::insert(temp_lpSource->data(),p,a_lpExtension_to_add);
                }
                if (len_of_ext_to_delete > 0) {
                        for (int p = stk::cstr::len(temp_lpSource->c_str()); p > dstlen_old; p--)
                                if (temp_lpSource->c_str()[p]=='\\' || temp_lpSource->c_str()[p]=='\0')
                                        if (*(int32_t*)(temp_lpSource->c_str()+p-4)==*(int*)a_lpExtension_to_delete)
                                                stk::cstr::cut(temp_lpSource->data(),p-=4,4);
                }
                // CHECK FOR REAL DESTINATION FREE SPACE BY SUBB USSED BY REPLACED DESTINATION FILES
                SEEKDST_FIND_FIRST(temp_lpSource->c_str());
                SEEKDST_FIND_ADD_TO_list_ptr(temp_lpSource->c_str(),f_dst_file.find_data.next);
                SEEKDST_FIND_CLOSE();
        }
        delete temp_lpSource;
        delete temp_lpDestination;
        delete lpSource;
        delete lpDestination;
        return 1;
}
//---------------------------------------------------------------------------

__stdcall stk::__kop32_search::~__kop32_search(void)
{
#ifdef __DEBUG_KOP32_SEARCH__
__DEBUG_CALLED("")
#endif

}
//---------------------------------------------------------------------------
#include <iostream>
#include <stdio.h>

int search(char a_dir[MAX_PATH])
{
WIN32_FIND_DATAA FindFileData;
HANDLE hFind;

std::cout<<"Path: ";
std::cin.get(a_dir, MAX_PATH);
std::cout<<"\n";
strncat(a_dir, "\\*", 3);
hFind = ::FindFirstFileA(a_dir, &FindFileData);

if(hFind == INVALID_HANDLE_VALUE)
{
    std::cout<<"Error: invalid path\n";
}

std::cout<<FindFileData.cFileName<<"\n";
while(::FindNextFileA(hFind, &FindFileData) != 0)
{
    std::cout<<FindFileData.cFileName<<"\n";
}
::FindClose(hFind);
return 0;
}
