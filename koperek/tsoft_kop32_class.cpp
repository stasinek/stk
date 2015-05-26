//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015--------------------------------
//---------------------------------------------------------------------------
#include "tsoft_kop32_class.h"
//---------------------------------------------------------------------------
#include "./../compression/tsoft_compression_API.h"
#include "./../cipher/tsoft_cipher_API.h"
#include "./../hash/tsoft_hash_API.h"
#include "./../pharser/tsoft_pharse_command_line.h"
#include "./../io/tsoft_file_eno_header.h"
#include "./../io/tsoft_file_io.h"
#include "./../io/tsoft_console.h"
#include "./../threads/tsoft_threads.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../time/tsoft_time.h"
//---------------------------------------------------------------------------
#ifndef __DEBUG_KOP32_CLASS__
#endif
//---------------------------------------------------------------------------
//
// z VCL'a
//---------------------------------------------------------------------------
#ifndef SCARD_W_CANCELLED_BY_USER
#define SCARD_W_CANCELLED_BY_USER   _HRESULT_TYPEDEF_(0x8010006EL)
#endif
//---------------------------------------------------------------------------
//#include <pthread.h>

/*
#include <omp.h>
int main() {
        #pragma omp parallel num_threads(2)
        ts::console::print_formated"Hi, I'm thread number %d!\n",omp_get_thread_num());
        #pragma omp parallel for num_threads(2)
        for(int i = 0;i < 20;i++) {
                ts::console::print_formated"\nThread number %d, executing iteration %d...",omp_get_thread_num(),i);
        }
}
*/
//---------------------------------------------------------------------------

__stdcall ts::__kop32_class::__kop32_class()
:	f_write_file_thread_handle(NULL),
        f_write_file_thread_id(0),
        f_write_file_thread_control(0),
        default_progress(this)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class:__kop32_class()");
ts::console::print("\r\n");
#endif
        options = new __kop32_class_options();
        options->mask_list->set_alias("OPTIONS_MASKS.clst");
        options->src_init_list->set_alias("SOURCE_INIT.rlst");
        options->dst_init_list->set_alias("DESTINATION_INIT.rlst");
        options->output_arguments_list->set_alias("OPTIONS_ARGTS.clst");
        list = new __kop32_class_list();
        list->src_main_list->set_alias("SOURCE_MAIN.rlst");
        list->dst_main_list->set_alias("DESTINATION_MAIN.rlst");
        list->output_formated_list->set_alias("OUT_FORMATED_LIST.flst");
        list->sync_op_list->set_alias("SYNC_OP_LIST.slst");

        progress = &default_progress;
        f_file_seeker = new __kop32_search(this);
        f_file_seeker->progress = progress;
        reset();
}
//---------------------------------------------------------------------------

void __stdcall ts::__kop32_class::reset(void)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class:reset()");
ts::console::print("\r\n");
#endif
        do_event(ON_BEFORE_RESET,EMPTY,EMPTY);
        this->progress->reset();
        options->reset();
        list->output_formated_list->clear();
        mem32::set(&f_src_file,(__int8)NULL,sizeof(file::__file_open_struct));
        list->src_main_list->clear();
        mem32::set(&f_dst_file,(__int8)NULL,sizeof(file::__file_open_struct));
        list->dst_main_list->clear();
        do_event(ON_RESETED,EMPTY,EMPTY);
}
//---------------------------------------------------------------------------

void __stdcall ts::__kop32_class::abort(void)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class:abort()");
ts::console::print("\r\n");
#endif
        do_event(ON_BEFORE_ABORT,EMPTY,EMPTY);
        progress->cancel = true;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::prepare_options(const char *alpCommand)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::prepare_options(alpCommand)\r\nalpCommand:%s",alpCommand);
ts::console::print("\r\n");
#endif
        if (!ts::cstr::test(do_event(ON_BEFORE_PREPARE_OPTIONS,OKCANCEL,alpCommand),OK))
                {abort();
                        return 0;
                }
        this->reset(); // RESET OPTIONS
        do_event(ON_PREPARE_OPTIONS_START,EMPTY,EMPTY);
        ts::__pharser p;
        ts::__cstr_class  *temp_lpCommand = new ts::__cstr_class(alpCommand);
        ts::__cstr_class  *temp_lpCommandSubOption = new ts::__cstr_class(512);
// Windows vs Linux, Unix, BSD

        char path_separator = '/';
        if (ts::cstr::chr(temp_lpCommand->c_str(),'\\')) path_separator = '\\';
//
// SELECT MAIN OPERATION TYPE AND SUBOPTIONS
//
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-X","--REMOVE","/REMOVE",NULL)==true :
        p.find(temp_lpCommand->c_str(),"-X","--REMOVE",NULL,NULL)==true)
   {options->operation  = OPERATION_REMOVE;
        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-D","--DECODE","/DECODE",NULL)==true :
        p.find(temp_lpCommand->c_str(),"-D","--DECODE",NULL,NULL)==true)
   {options->operation  = OPERATION_DECODE;
        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-E","--ENCODE",NULL,temp_lpCommandSubOption->data())==true :
        p.find(temp_lpCommand->c_str(),"-E","--ENCODE","/ENCODE",temp_lpCommandSubOption->data())==true)
   {options->operation  = OPERATION_ENCODE;

                options->coder  = 0x00000000L; //defauld coder type NOP

        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"CRC"))
                options->coder |= ENO_CODER_CRC;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"SSC"))
                options->coder |= ENO_CODER_SSC;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"XOR"))
                options->coder |= ENO_CODER_XOR;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"ROT"))
                options->coder |= ENO_CODER_ROT;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"LZS"))
                options->coder |= ENO_CODER_LZS;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"HUF"))
                options->coder |= ENO_CODER_HUF;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"ARI"))
                options->coder |= ENO_CODER_ARI;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"MTF"))
                options->coder |= ENO_CODER_MTF;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"BWT"))
                options->coder |= ENO_CODER_BWT;

        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-M","--MOVE","/MOVE",NULL)==true :
        p.find(temp_lpCommand->c_str(),"-M","--MOVE",NULL,NULL)==true)
   {options->operation = OPERATION_MOVE;
        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-C","--COPY","/COPY",NULL)==true :
        p.find(temp_lpCommand->c_str(),"-C","--COPY",NULL,NULL)==true)
   {options->operation = OPERATION_COPY;
        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-L","--LIST","/LIST",NULL) :
        p.find(temp_lpCommand->c_str(),"-L","--LIST",NULL,NULL))
   {options->operation = OPERATION_LIST;
        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-V","--COMPARE","/COMPARE",NULL) :
        p.find(temp_lpCommand->c_str(),"-V","--COMPARE",NULL,NULL))
   {options->operation = OPERATION_COMPARE;
        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-S","--SELECT","/SELECT",NULL) : // is copy the file list to windows clipboard
        p.find(temp_lpCommand->c_str(),"-S","--SELECT",NULL,NULL))
   {
                options->operation = OPERATION_SELECT;
        p.delete_found(temp_lpCommand->data());
        goto GOTO_OPTIONS;
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-H","--CHECKSUM","/CHECKSUM",temp_lpCommandSubOption->data()) :
        p.find(temp_lpCommand->c_str(),"-H","--CHECKSUM",NULL,temp_lpCommandSubOption->data()))
   {options->operation = OPERATION_CHECKSUM;
        if (-1!=ts::cstr::pos(temp_lpCommandSubOption->data(),0,"SSC1024"))
           options->checksum |= CHECKSUM_SSC1024;
        p.delete_found(temp_lpCommand->data());
   }
//
GOTO_OPTIONS:
//
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-I","--DICT","/DICT",temp_lpCommandSubOption->data())==2 :
        p.find(temp_lpCommand->c_str(),"-I","--DICT",NULL,temp_lpCommandSubOption->data())==2)
   {options->coder_LZS_dict_size = ts::cstr::atoi(temp_lpCommandSubOption->data());
        if (options->coder_LZS_dict_size > DICT_OFFSET_MAX || options->coder_LZS_dict_size < DICT_LEN_1)
           {do_event(ON_ERROR,"ERROR_INVALID_USER_BUFFER",OK);
                progress->cancel = true;
                return 0;
           }
        p.delete_found(temp_lpCommand->data());
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-B","--BUFOR","/BUFOR",temp_lpCommandSubOption->data())==2 :
        p.find(temp_lpCommand->c_str(),"-B","--BUFOR",NULL,temp_lpCommandSubOption->data())==2)
   {options->block_size = 1024 * ts::cstr::atoi(temp_lpCommandSubOption->data());
        if (options->block_size > 1024 * 65536 || options->block_size < 1 * 1024)
           {do_event(ON_ERROR,"ERROR_INVALID_USER_BUFFER",OK);
                progress->cancel = true;
                return 0;
           }
        p.delete_found(temp_lpCommand->data());
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-F","--CACHED","/CACHED",NULL) :
        p.find(temp_lpCommand->c_str(),"-F","--CACHED",NULL,NULL))
   {options->block_is_cached = true;
        p.delete_found(temp_lpCommand->data());
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-M","--MASK","/MASK",temp_lpCommandSubOption->data())==2 :
        p.find(temp_lpCommand->c_str(),"-M","--MASK",NULL,temp_lpCommandSubOption->data())==2)
   {options->mask_list->import_from("CVS",temp_lpCommandSubOption->data());
        p.delete_found(temp_lpCommand->data());
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-P","--PASSWORD","/PASSWORD",temp_lpCommandSubOption->data())==2 :
        p.find(temp_lpCommand->c_str(),"-P","--PASSWORD",NULL,temp_lpCommandSubOption->data())==2)
   {options->password->text = temp_lpCommandSubOption->data();
        p.delete_found(temp_lpCommand->data());
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-A","--ARGUMENTS","/ARGUMENTS",temp_lpCommandSubOption->data())==2 :
        p.find(temp_lpCommand->c_str(),"-A","--ARGUMENTS",NULL,temp_lpCommandSubOption->data())==2)
   {options->output_arguments_list->import_from("CVS", temp_lpCommandSubOption->data());
        p.delete_found(temp_lpCommand->data());
   }
if (path_separator=='\\' ?
        p.find(temp_lpCommand->c_str(),"-Q","--BREAK","/BREAK",temp_lpCommandSubOption->data()) :
        p.find(temp_lpCommand->c_str(),"-Q","--BREAK",NULL,temp_lpCommandSubOption->data()))
   {options->ask_at_break = ASK_USER; // default option
        if (temp_lpCommandSubOption->data()[0]=='T')
                options->ask_at_break = ASK_ALL;
        if (temp_lpCommandSubOption->data()[0]=='?')
                options->ask_at_break = ASK_USER;
        if (temp_lpCommandSubOption->data()[0]=='N')
                options->ask_at_break = ASK_NO;
        p.delete_found(temp_lpCommand->data());
   }
//
// ENO_CODER OPTIONS
//
//
/// prepare source and destination regarding command line
//
register uint32_t i,s,d;
options->src_init_list->import_from(temp_lpCommand->c_str(),"CVS");
for (i = 0; i < options->src_init_list->items()->count();)
        {
         if (ts::cstr::len(options->src_init_list->items()->get_text(i))==0)
                {options->src_init_list->items()->cut(i);
                 continue;
                }
         if (path_separator=='\\') {
         if (ts::cstr::brk(options->src_init_list->items()->get_text(i),"/<>\"|")!=NULL)
                {options->src_init_list->items()->cut(i);
                 continue;
                }
         if (ts::cstr::brk(options->src_init_list->items()->get_text(i),"?*")!=NULL)
                {if (options->mask_list->items()->search_text("*.*")!=-1) options->mask_list->clear();
                 options->mask_list->items()->add(options->src_init_list->items()->get(i));
                 options->src_init_list->items()->cut(i);
                 continue;
                }
         if (ts::cstr::pos(options->src_init_list->items()->get_text(i),0,"..")!=-1)
                {options->src_init_list->items()->cut(i);
                 continue;
                }
         }
         i++;
        }
if ((options->src_init_list->items()->count()%2)==1 && options->operation!=OPERATION_SELECT && options->operation!=OPERATION_REMOVE)
         options->src_init_list->items()->cut(0);

        for (s = 1; s < options->src_init_list->items()->count(); s+=2)
        {options->dst_init_list->items()->add(options->src_init_list->items()->get(s));
         options->src_init_list->items()->cut(s);
        }
if (options->src_init_list->items()->count()==0)
        options->operation = OPERATION_NULL;
if (options->dst_init_list->items()->count()==0 && options->operation!=OPERATION_SELECT && options->operation!=OPERATION_REMOVE)
        options->operation = OPERATION_NULL;

//----------------------------
GOTO_set_options_EXIT:
//----------------------------
if (options->operation==OPERATION_NULL)
   {
        do_event(ON_PREPARE_OPTIONS_ERROR,OK,"RPC_S_CANNOT_SUPPORT");
   }
else
if (!ts::cstr::test(do_event(ON_PREPARE_OPTIONS_OK,OKCANCEL,temp_lpCommand->c_str()),OK))
        {abort();
                return 0;
        }
delete temp_lpCommand;
delete temp_lpCommandSubOption;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print("__kop32_class:__prepare_options, return 1 (OK)");
ts::console::print("\r\n");
#endif
do_event(ON_PREPARE_OPTIONS_END,OK,EMPTY);
return 1;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::prepare_list(void)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
ts::__cstr_class  *temp_lpDestination = new ts::__cstr_class(512);
ts::__cstr_class  *temp_lpSource = new ts::__cstr_class(512);
uint32_t ret,z,d;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print("__kop32_class::prepare()");
ts::console::print("\r\n");
#endif
if (options->operation==OPERATION_NULL)
   {
        do_event(ON_PREPARE_OPTIONS_ERROR,OK,"RPC_S_CANNOT_SUPPORT");
        goto GOTO_prepare_EXIT_ERROR;
   }
else
if (!ts::cstr::test(do_event(ON_BEFORE_SEARCH,OKCANCEL,EMPTY),OK))
        {abort();
                return 0;
        }
progress->initialize_timer();
do_event(ON_SEARCH_START,OK,EMPTY);
if (options->operation==OPERATION_SELECT) {
        do_event(ON_SEARCH_SRC_START,OK,EMPTY);
        do_event(ON_SEARCH_SRC_PROGRESS,OK,EMPTY);
        if (OpenClipboard(NULL)==true) { if (options->ask_at_break==ASK_USER) do_event(ON_ERROR,ts::cstr::itoa(GetLastError()),OK);
                goto GOTO_prepare_EXIT_ERROR;
        }
        else {
                char *tStr = ts::cstr::alloc(64*1024);
                options->src_init_list->export_to(tStr,"CVS");
                SetClipboardData(CF_TEXT, tStr);
                CloseClipboard();
                goto GOTO_prepare_EXIT_OK;
        }
}
if (options->operation==OPERATION_REMOVE || options->operation==OPERATION_LIST)
   {
   for (z = 0; z < options->src_init_list->items()->count() && progress->cancel==0; z++)
        {
         ret = false;
         //sprawdzanie
                 ts::cstr::fix_file_path(temp_lpSource->data(),options->src_init_list->items()->get_text(z));
         if (ts::cstr::len(temp_lpSource->c_str()) > 3)
                {
                         f_src_file.find_data.hand = FindFirstFileA(options->src_init_list->items()->get_text(z),&f_src_file.find_data.data);
                 if (f_src_file.find_data.hand==INVALID_HANDLE_VALUE)
                        {ret =true;
                         SetLastError(ERROR_FILE_NOT_FOUND);
                        }
                 else FindClose(f_src_file.find_data.hand);
                }
         //jesli wszystko jest ok to szukaj
         if (ret==false)
                 ret = f_file_seeker->exec(options->src_init_list->items()->get_text(z),options->mask_list,list->src_main_list);
                 //zapytaj co dalej, jesli poszlo nie tak podczas przygotowan lub szukania
         if (ret!=0 ? ts::cstr::compare((char*)do_event((char*)ON_ERROR,ts::cstr::itoa(GetLastError()),"OKCANCEL"),(char*)"CANCEL")==0 : false)
                {progress->cancel = true;
                 goto GOTO_prepare_EXIT_ERROR;
                }
                 else continue;
        }
   }
else
if (options->operation==OPERATION_CHECKSUM || options->operation==OPERATION_COPY || options->operation==OPERATION_MOVE || options->operation==OPERATION_ENCODE || options->operation==OPERATION_DECODE)
   {
        for (z = 0; z < options->src_init_list->items()->count() && progress->cancel==0; z++)
        for (d = 0; d < options->dst_init_list->items()->count() && progress->cancel==0; d++) // X Bar loop mix all source to multiple destinations
                {
                 ret = 0;

         ts::cstr::fix_file_path(temp_lpSource->data(),options->src_init_list->items()->get_text(z));
         if (ts::cstr::len(temp_lpSource->c_str()) > 3)
                {
                         f_src_file.find_data.hand =FindFirstFileA(options->src_init_list->items()->get_text(z),&f_src_file.find_data.data);
                 if (f_src_file.find_data.hand==INVALID_HANDLE_VALUE)
                        {ret =true;
                         SetLastError(ERROR_FILE_NOT_FOUND);
                        }
                         else FindClose(f_src_file.find_data.hand);
                }

         ts::cstr::fix_file_path(temp_lpDestination->data(), options->dst_init_list->items()->get_text(d));
         if (ts::cstr::len(temp_lpDestination->c_str()) > 3)
                {
                                f_dst_file.find_data.hand =FindFirstFileA(options->dst_init_list->items()->get_text(d),&f_dst_file.find_data.data);
                        if (f_dst_file.find_data.hand==INVALID_HANDLE_VALUE)
                   {ret =true;
                        SetLastError(ERROR_FILE_NOT_FOUND);
                   }
                else FindClose(f_dst_file.find_data.hand);
                }

         ts::cstr::fix_file_path(temp_lpSource->data(), options->src_init_list->items()->get_text(z));
         ts::cstr::upr(temp_lpSource->data());
         ts::cstr::cat(temp_lpSource->data(),"\\");
         ts::cstr::fix_file_path(temp_lpDestination->data(), options->dst_init_list->items()->get_text(d));
         ts::cstr::upr(temp_lpDestination->data());
         ts::cstr::cat(temp_lpDestination->data(),"\\");

         if (ts::cstr::pos(temp_lpDestination->c_str(),0,temp_lpSource->c_str())>=0)
                {ret =1;
                 SetLastError(EPT_S_CANT_PERFORM_OP);
                }
//jesli ok szukaj
         if (ret==0)
                 ret = !f_file_seeker->exec(options->src_init_list->items()->get_text(z),options->mask_list,list->src_main_list);
         if (ret==0)
                 ret = !f_create_destination_list(options->dst_init_list->items()->get_text(d));
         //zapytaj co dalej, jesli posz�o nie tak
         if (ret!=0 ? ts::cstr::compare((char*)do_event((char*)ON_ERROR,OKCANCEL,ts::cstr::itoa(GetLastError())),(char*)"CANCEL")==0 : false)
                {progress->cancel = true;
                 goto GOTO_prepare_EXIT_ERROR;
                }
         //jesli ok, sprawd� wolne miejsce, stan urzadzenia itd.
         if (f_check_free_space(ts::cstr::extract_file_root(temp_lpDestination->data(),options->dst_init_list->items()->get_text(d)),progress->src->all->size,progress->dst->all->size,true,true) < 0)
                {progress->cancel = true;
                         goto GOTO_prepare_EXIT_ERROR;
                }
        }
   }
//----------------------------
GOTO_prepare_EXIT_OK:
progress->freeze_timer();
do_event(ON_SEARCH_OK,OK,EMPTY);
delete temp_lpSource;
delete temp_lpDestination;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print("__kop32_class:prepare, return 1(OK)");
ts::console::print("\r\n");
#endif
do_event(ON_SEARCH_END,OK,EMPTY);
return 1;

GOTO_prepare_EXIT_ERROR:
do_event(ON_SEARCH_ERROR,OK,EMPTY);
delete temp_lpSource;
delete temp_lpDestination;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print("__kop32_class:prepare, return 0(ERROR)");
ts::console::print("\r\n");
#endif
do_event(ON_SEARCH_END,OK,EMPTY);
return 0;
}
//---------------------------------------------------------------------------
__int32 __stdcall ts::__kop32_class::exec_one(__int32 a_item)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::execute_selected(a_item:%d)",a_item);
ts::console::print("\r\n");
#endif
return f_exec_one(a_item, options->operation);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::exec_all(void)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print("__kop32_class::execute_all()");
ts::console::print_formated("src->count():%d\r\n",list->src_main_list->items()->count());
ts::console::print_formated("dst->count():%d\r\n",list->dst_main_list->items()->count());
ts::console::print("\r\n");
#endif
ts::__cstr_class  *templp	= new ts::__cstr_class(512);
char *ret = ts::cstr::allocex(32,"");
uint32_t d;

if (options->ask_at_break==ASK_USER)
if (!ts::cstr::test(do_event(ON_BEFORE_IO_ALL,OKCANCEL,EMPTY),OK))
        {abort();goto GOTO_distribute_EXIT;
        }
progress->initialize_timer();
do_event(ON_IO_ALL_START,OK,EMPTY);
if (options->operation==OPERATION_REMOVE || options->operation==OPERATION_LIST)
   {list->inc_i = -1;
        list->start_i = list->src_main_list->items()->count()-1;
        list->cur_i = list->start_i;
   }
else
   {list->inc_i = +1;
    list->start_i =  0;
    list->cur_i = list->start_i;
   }
f_write_file_thread_control = 0; //czekaj 1 startuj, 2 zako�cz
f_write_file_thread_handle = CreateThread(NULL,0,&ts::__kop32_class::f_write_file_thread,this,0,&f_write_file_thread_id);
if (f_write_file_thread_handle==NULL)
        {abort();goto GOTO_distribute_EXIT;
        }
for (d = 0; list->cur_i >= 0 && list->cur_i < (__int32)list->src_main_list->items()->count() && progress->cancel==0; list->cur_i+=list->inc_i)
        {
         /// CHECK SRC
         if (list->src_main_list->items()->get_number(list->cur_i,IS)!=EXISTS)
                        { continue; }

         if (options->operation==OPERATION_CHECKSUM || options->operation==OPERATION_COPY || options->operation==OPERATION_ENCODE || options->operation==OPERATION_DECODE || options->operation==OPERATION_MOVE)  {
         // CHECK DST
         if (list->dst_main_list->items()->get_number(list->cur_i,IS)==EXISTS) {   // QUEST
         if (options->ask_at_break==ASK_USER)
                {
                 ts::cstr::mov(ret,do_event(ON_IO_BEFORE_REPLACE,OKYESALLCUSTOMNONOALLCANCEL,EMPTY)); // REPLACE
                 //
                 if (ts::cstr::compare(ret,"CANCEL")==0) // answer ->
                        {progress->cancel = true;
                         continue;
                        }
                 else
                 if (ts::cstr::compare(ret,"NOTOALL")==0)
                        {f_skip_one(list->cur_i,1);
                         continue;
                        }
                 else
                 if (ts::cstr::compare(ret,"NO")==0)
                        {f_skip_one(list->cur_i,0);
                         continue;
                        }
                 else
                 if (ts::cstr::compare(ret,"CUSTOM")==0)
                        {list->cur_i-=list->inc_i;
                         continue;
                        }
                 else
                 if (ts::cstr::compare(ret,"YESTOALL")==0)
                        {d = ts::cstr::chrr(list->src_main_list->items()->get_text(list->cur_i),'\\');
                         options->ask_at_break =ASK_ALL;
                        }
                 else
                 if (ts::cstr::compare(ret,"YES")==0 || ts::cstr::compare(ret,"OK")==0)
                        {// NOP
                        }
                 else
                        {continue;
                        }
                 }
         else
                 {
                  if ((__int32)d > ts::cstr::chrr(list->src_main_list->items()->get_text(list->cur_i),'\\'))
                         {list->cur_i-=list->inc_i;
                          options->ask_at_break =ASK_USER;
                          continue;
                         }
                 }
         }
         }
         /// GO GO GO
                 //
         if (f_exec_one(list->cur_i, options->operation)==0)
                {
                 if (options->ask_at_break==ASK_ALL) continue;
                 if (options->ask_at_break==ASK_NO)  progress->cancel = true;
                 if (options->ask_at_break==ASK_USER)
                         progress->cancel |= ts::cstr::compare((char*)do_event(ON_ERROR,OKCANCEL,ts::cstr::itoa(GetLastError())),"CANCEL");
                }
                 else
                                 continue;
        }
//----------------------------

if (options->operation==OPERATION_MOVE)
   {
        int all_nor_dir = options->mask_list->items()->search_text("*.*")>=0, ret_i;

        for (list->cur_i = list->start_i; progress->cancel==0; list->cur_i+=list->inc_i)
                {
                 if (list->src_main_list->items()->get_number(list->cur_i,IS)!=EXISTS)
                         continue;

                 if (all_nor_dir ? false : (list->src_main_list->items()->get_number(list->cur_i,ATTRIB) & FILE_ATTRIBUTE_DIRECTORY)!=0)
                        {continue;
                        }
                 if (list->src_main_list->items()->get_number(list->cur_i,ATTRIB) & FILE_ATTRIBUTE_DIRECTORY)
                        {
                         if (SetFileAttributesA(list->src_main_list->items()->get_text(list->cur_i),FILE_ATTRIBUTE_NORMAL)==false) ret_i=false;
                         else
                                 ret_i = DeleteFileA(list->src_main_list->items()->get_text(list->cur_i));
                        }
                 else
                        {
                         if (SetFileAttributesA(list->src_main_list->items()->get_text(list->cur_i),FILE_ATTRIBUTE_NORMAL)==false) ret_i=false;
                         else
                                 ret_i = DeleteFileA(list->src_main_list->items()->get_text(list->cur_i));
                        }
                 if (ret_i==false)
                        {
                         if (options->ask_at_break==ASK_ALL) continue;
                         if (options->ask_at_break==ASK_NO)  progress->cancel = true;
                         if (options->ask_at_break==ASK_USER)
                                 progress->cancel |= ts::cstr::compare((char*)do_event(ON_ERROR,OKCANCEL,ts::cstr::itoa(GetLastError())),"CANCEL")==0;
                        }
                }
        }
else
if (options->operation==OPERATION_LIST) // save list to file
   {
        for (list->cur_i = list->start_i; progress->cancel==0 && list->cur_i < (__int32)options->dst_init_list->items()->count(); list->cur_i+=list->inc_i)
                {
                         ts::cstr::mov(templp->data(), options->dst_init_list->items()->get_text(list->cur_i));
                         ts::cstr::upr(templp->data());

                 if (ts::cstr::pos(templp->c_str(),0,"CLIPBOARD:")>=0 ? ts::cstr::compare(ts::cstr::mov(ret,ts::cstr::itoa(OpenClipboard(NULL))),"0")!=0 : 0)
                          {
                          char *tStr = ts::cstr::dup(list->output_formated_list->items()->text("TEXT"));
                                 SetClipboardData(CF_TEXT,tStr);
                          CloseClipboard();
                          }
                  else
                          {
                          list->output_formated_list->set_alias(options->dst_init_list->items()->get_text(list->cur_i));
                          ts::cstr::mov(ret,ts::cstr::itoa(list->output_formated_list->save("LINES")));
                          }
                  if (ts::cstr::compare(ret,"0")==0)
                          {
                          if (options->ask_at_break==ASK_ALL) continue;
                          if (options->ask_at_break==ASK_NO)  progress->cancel = true;
                          if (options->ask_at_break==ASK_USER)
                                        progress->cancel |= ts::cstr::compare((char*)do_event(ON_ERROR,OKCANCEL,ts::cstr::itoa(GetLastError())),"CANCEL")==0;
                          }
                 }
        }
GOTO_distribute_EXIT:
f_write_file_thread_control &= 2;
while (f_write_file_thread_control & 1) { ts::time::wait_ms(22); }
TerminateThread(f_write_file_thread_handle,0);
f_write_file_thread_handle = NULL;

ts::cstr::free(ret);
delete templp;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::execute_all, return %d",(__int32)progress->cancel);
ts::console::print("\r\n");
#endif
progress->freeze_timer();
if (progress->cancel==true) {
        do_event("CANCELED",EMPTY,EMPTY);
        return 0;
        }
else {
        do_event("FINISHED",EMPTY,EMPTY);
        return -1;
        }
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::f_create_destination_list(const char *alpDestination)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_create_destination_list(alpDestination:%s)",alpDestination);
ts::console::print("\r\n");
#endif
if (list->src_main_list->items()->count()==0)
        return 0;
ts::__cstr_class *lpDestination = new ts::__cstr_class(512);
ts::__cstr_class *lpSource = new ts::__cstr_class(512);
ts::cstr::fix_file_path(lpDestination->data(),alpDestination);
ts::cstr::fix_file_path(lpSource->data(),list->src_main_list->items()->get_text(list->dst_main_list->items()->count()));
//
if (options->operation==OPERATION_ENCODE)
        {f_file_seeker->create_destination_list(lpDestination->c_str(),".eno","",list->dst_main_list);
        }
else
if (options->operation==OPERATION_DECODE)
        {f_file_seeker->create_destination_list(lpDestination->c_str(),".eno","",list->dst_main_list);
        }
else
if (options->operation==OPERATION_CHECKSUM)
                {f_file_seeker->create_destination_list(lpDestination->c_str(),".checksum.ssc1024","",list->dst_main_list);
                }
else
if (options->operation==OPERATION_COPY || options->operation==OPERATION_MOVE || options->operation==OPERATION_COMPARE)
        {f_file_seeker->create_destination_list(lpDestination->c_str(),"","",list->dst_main_list);
        }
delete lpDestination;
delete lpSource;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("dst->count():%d\r\n",list->dst_main_list->items()->count());
ts::console::print_formated("__kop32_class::f_create_destination_list, return 1");
ts::console::print("\r\n");
#endif
return 1;
}
//----------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::f_skip_one(const uint32_t aindex, const uint32_t a_skip_items_at_same_level)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_skip_one(aindex:%d,a_skip_items_at_same_level:%d)",aindex,a_skip_items_at_same_level);
ts::console::print_formated("src[aindex]:%s\r\n",list->src_main_list->items()->get_text(aindex));
if (aindex<list->dst_main_list->items()->count())
ts::console::print_formated("dst[aindex]:%s\r\n",list->dst_main_list->items()->get_text(aindex));
ts::console::print("\r\n");
#endif
ts::__cstr_class  *templp =  new ts::__cstr_class(512);
uint32_t crt;
do_event(ON_BEFORE_SKIP_ONE,OK,EMPTY);

//
// SOURCE DIRS & FILES
//
ts::cstr::mov(templp->data(),list->src_main_list->items()->get_text(aindex));
 if (a_skip_items_at_same_level==true)
         {ts::cstr::extract_file_path(templp->data(),templp->c_str());
         }
for (crt = aindex; crt < list->src_main_list->items()->count(); crt++) {
 if (ts::cstr::pos(list->src_main_list->items()->get_text(crt),0,templp->c_str())==-1)
         {break;
         }
 progress->src->all->size -= list->src_main_list->items()->get_number(crt,SIZE);
 list->src_main_list->items()->set_number(crt,IS,~EXISTS);
}
if (options->operation!=OPERATION_CHECKSUM && options->operation!=OPERATION_COPY && options->operation!=OPERATION_MOVE && options->operation!=OPERATION_ENCODE && options->operation!=OPERATION_DECODE) {
goto GOTO_execute_cleanup_OK;
}
//
// DESTINATION DIRS & FILES
//
ts::cstr::mov(templp->data(),list->dst_main_list->items()->get_text(aindex));
 if (a_skip_items_at_same_level==true)
         {ts::cstr::extract_file_path(templp->data(),templp->c_str());
         }
for (crt = aindex; crt < list->dst_main_list->items()->count(); crt++) {
 if (ts::cstr::pos(list->dst_main_list->items()->get_text(crt),0,templp->c_str())==-1)
         {break;
         }
 progress->src->all->size -= list->dst_main_list->items()->get_number(crt,SIZE);
 list->dst_main_list->items()->set_number(crt,IS,~EXISTS);
}
//
// CLEAR & EXIT
//
GOTO_execute_cleanup_OK:
delete templp;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print("__kop32_class::f_skip_one, return 1");
ts::console::print("\r\n");
#endif
return 1;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::f_exec_one(uint32_t aindex, uint32_t anaction)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_exec_one(aindex:%d,anaction:%d)",aindex,anaction);
ts::console::print("\r\n");
ts::console::print_formated("src[aindex]:%s\r\n",list->src_main_list->items()->get_text(aindex));
if (aindex<list->dst_main_list->items()->count())
ts::console::print_formated("dst[aindex]:%s\r\n",list->dst_main_list->items()->get_text(aindex));
#endif
char  root[3] = "A:";
ts::__cstr_class *templpStr1 = new ts::__cstr_class(512);
ts::__cstr_class *templpStr2 = new ts::__cstr_class(512);
//
// CHECK IS THE SOURCE STILL EXISTS OR IT HAS BEEN SKIPPED BY USER?
//
if (list->src_main_list->items()->get_number(aindex,IS)!=EXISTS) {
        goto GOTO_execute_cleanup_ERROR;
}
do_event(ON_IO_ONE_START,EMPTY,EMPTY);
//
// CHECK IS IT DIRECTORY OR FILE
//
if ((list->src_main_list->items()->get_number(aindex,ATTRIB) & FILE_ATTRIBUTE_DIRECTORY)==0) {
                goto GOTO_execute_FILE; }
else
if (anaction==OPERATION_MOVE) {
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
        if (list->dst_main_list->items()->get_number(aindex,IS)==EXISTS) {
        if (SetFileAttributesA(list->dst_main_list->items()->get_text(aindex),list->src_main_list->items()->get_number(aindex,ATTRIB))==false)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {goto GOTO_execute_cleanup_OK;
                }
        }
        if ((((char*)list->src_main_list->items()->get_text(aindex))[0] | 0x20L)==(((char*)list->dst_main_list->items()->get_text(aindex))[0] | 0x20L)) {
        if (rename(list->src_main_list->items()->get_text(aindex),list->dst_main_list->items()->get_text(aindex))==-1)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {f_skip_one(aindex,true);
                 goto GOTO_execute_cleanup_OK;
                }
        }
        else {
        if (f_exec_one(aindex,OPERATION_COPY)==false)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {goto GOTO_execute_cleanup_OK;
                }
        }

}
else
if (anaction==OPERATION_REMOVE) {
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
        if (SetFileAttributesA(list->src_main_list->items()->get_text(aindex),FILE_ATTRIBUTE_NORMAL)==false)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
        if (remove(list->src_main_list->items()->get_text(aindex))==0)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {goto GOTO_execute_cleanup_OK;
                }
}
else
if (anaction==OPERATION_CHECKSUM || anaction==OPERATION_COPY || anaction==OPERATION_ENCODE || anaction==OPERATION_DECODE) {
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
        if (list->dst_main_list->items()->get_number(aindex,IS)==EXISTS) {
        if (SetFileAttributesA(list->dst_main_list->items()->get_text(aindex),list->src_main_list->items()->get_number(aindex,ATTRIB))==false)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {goto GOTO_execute_cleanup_ERROR;
                }
        }
                else
        {
        if (CreateDirectoryA(list->dst_main_list->items()->get_text(aindex),NULL)==0)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {goto GOTO_execute_cleanup_OK;
                }
        }
}
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_exec_one, return 1(OK,DIR)");
ts::console::print("\r\n");
#endif
do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
do_event(ON_IO_ONE_OK,EMPTY,EMPTY);
do_event(ON_IO_ONE_END,EMPTY,EMPTY);
return 1;
//
GOTO_execute_FILE:
// PLIK PLIK ////////////////////////////////////////////////////////////////////////
f_src_file.hand_map = INVALID_HANDLE_VALUE;
f_src_file.hand = INVALID_HANDLE_VALUE;
f_dst_file.hand_map = INVALID_HANDLE_VALUE;
f_dst_file.hand = INVALID_HANDLE_VALUE;
//
if (anaction==OPERATION_LIST) {
progress->src->one->readed  = 0;
progress->src->one->size  = list->src_main_list->items()->get_number(aindex,SIZE);
progress->dst->one->readed  = 0;
progress->dst->one->size  = options->output_arguments_list->items()->count();
do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
__int32 iT;

for (iT = 0; iT < (__int32)options->output_arguments_list->items()->count(); iT++)
         {
         ts::cstr::mov(templpStr1->data(),options->output_arguments_list->items()->get_text(iT));

         ts::cstr::replace(templpStr1->data(),"#index",
                                        ts::cstr::itoa(aindex));
         ts::cstr::replace(templpStr1->data(),"#base_file_path",
                                        ts::cstr::mov_max(templpStr2->data(),list->src_main_list->items()->get_text(aindex),list->src_main_list->items()->get_number(aindex,FILENAME_BASE_PATH_LEN)));
         ts::cstr::replace(templpStr1->data(),"#file_path",
                                        ts::cstr::extract_file_path(templpStr2->data(),list->src_main_list->items()->get_text(aindex)));
         ts::cstr::replace(templpStr1->data(),"#file_path_and_name",
                                        list->src_main_list->items()->get_text(aindex));
         ts::cstr::replace(templpStr1->data(),"#relative_file_path_and_name",
                                        ts::cstr::substr_end(templpStr2->data(),list->src_main_list->items()->get_text(aindex),list->src_main_list->items()->get_number(aindex,FILENAME_BASE_PATH_LEN)+1,strlen(list->src_main_list->items()->get_text(aindex))));
         ts::cstr::replace(templpStr1->data(),"#file_name",
                                        ts::cstr::extract_file_name(templpStr2->data(),list->src_main_list->items()->get_text(aindex)));
         ts::cstr::replace(templpStr1->data(),"#file_creation_time_t",
                                        ts::cstr::itoa(list->src_main_list->items()->get_number(aindex,FILE_CREATION_DATE)));
         ts::cstr::replace(templpStr1->data(),"#file_modified_time_t",
                                        ts::cstr::itoa(list->src_main_list->items()->get_number(aindex,FILE_MODIFIED_DATE)));
         ts::cstr::replace(templpStr1->data(),"#file_accessed_time_t",
                                        ts::cstr::itoa(list->src_main_list->items()->get_number(aindex,FILE_ACCESSED_DATE)));
         ts::cstr::replace(templpStr1->data(),"#attribute",
                                        ts::cstr::itoa(list->src_main_list->items()->get_number(aindex,ATTRIB)));
         ts::cstr::replace(templpStr1->data(),"#size",
                                        ts::cstr::itoa(list->src_main_list->items()->get_number(aindex,SIZE)));
         list->output_formated_list->items()->add_text(templpStr1->c_str());

         //out_list_item_size = ts::cstr::len(templpStr1->c_str());
         }
progress->src->one->readed  = progress->src->one->size;
progress->src->all->readed += progress->src->one->size;
progress->dst->one->readed  = progress->dst->one->size;
progress->dst->all->readed += progress->dst->one->size;
do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
goto GOTO_execute_cleanup_OK;
}
else
if (anaction==OPERATION_MOVE) {
if ((((char*)list->src_main_list->items()->get_text(aindex))[0] | 0x20L)==(((char*)list->dst_main_list->items()->get_text(aindex))[0] | 0x20L)) // | 0x20L dla uzyskania ma�ych liter
        {
        f_src_file.readed = 0;
        f_src_file.size = list->src_main_list->items()->get_number(aindex,SIZE);
        progress->src->one->readed = f_src_file.readed;
        progress->dst->one->size = f_dst_file.size;
        f_dst_file.readed = 0;
        f_dst_file.size = list->dst_main_list->items()->get_number(aindex,SIZE);
        progress->dst->one->readed = f_dst_file.readed;
        progress->dst->one->size = f_dst_file.size;
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
        //
        if (list->dst_main_list->items()->get_number(aindex,IS)==EXISTS) {
        if (SetFileAttributesA(list->dst_main_list->items()->get_text(aindex),FILE_ATTRIBUTE_NORMAL)==false)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
        if (remove(list->dst_main_list->items()->get_text(aindex))==0)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        }
        if (rename(list->src_main_list->items()->get_text(aindex),list->dst_main_list->items()->get_text(aindex))==false)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_OK;
                }
        }
else
        {
        if (f_exec_one(aindex,OPERATION_COPY)==false)
                {f_skip_one(aindex,false);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {f_src_file.readed = f_dst_file.size;
                 progress->src->one->readed = f_src_file.readed;
                 f_dst_file.readed = f_dst_file.size;
                 progress->dst->one->readed = f_dst_file.readed;
                 goto GOTO_execute_cleanup_OK;
                }
        }
}
else
if (anaction==OPERATION_REMOVE) {
        f_src_file.readed = 0;
        f_src_file.size = list->src_main_list->items()->get_number(aindex,SIZE);
        progress->src->one->readed = f_src_file.readed;
        progress->src->one->size = f_src_file.size;
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
//
        if (SetFileAttributesA(list->src_main_list->items()->get_text(aindex),FILE_ATTRIBUTE_NORMAL)==false)
                {f_skip_one(aindex,false);
                 do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
        if (remove(list->src_main_list->items()->get_text(aindex))==0)
                {f_skip_one(aindex,false);
                 do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                 goto GOTO_execute_cleanup_ERROR;
                }
        else
                {f_src_file.readed += f_src_file.size;
                 progress->src->one->readed += f_src_file.size;
                 progress->src->all->readed += f_src_file.size;
                 do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                 goto GOTO_execute_cleanup_OK;
                }
}
else
if (anaction==OPERATION_CHECKSUM || anaction==OPERATION_COPY || anaction==OPERATION_ENCODE || anaction==OPERATION_DECODE) {
        file_header::__eno_header_struct hdr;
        file_header::__eno_block_header_struct b_hdr;
        f_src_file.hand = INVALID_HANDLE_VALUE;
        f_src_file.hand_map = INVALID_HANDLE_VALUE;
        f_src_file.readed = 0;
        f_src_file.size = list->src_main_list->items()->get_number(aindex,SIZE);
        progress->src->one->readed  = 0;
        progress->src->one->size  = f_src_file.size;
        progress->src->all->readed += 0;
        f_dst_file.hand = INVALID_HANDLE_VALUE;
        f_dst_file.hand_map = INVALID_HANDLE_VALUE;
        f_dst_file.readed = 0;
        f_dst_file.size = list->dst_main_list->items()->get_number(aindex,SIZE);
        progress->dst->one->readed  = 0;
        progress->dst->one->size  = f_dst_file.size;
        progress->dst->all->readed += 0;
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
         //
        root[0] = ((char*)list->dst_main_list->items()->get_text(aindex))[0];
        if (f_check_free_space(root,list->src_main_list->items()->get_number(aindex,SIZE),list->dst_main_list->items()->get_number(aindex,SIZE),true,false) < 0)
                {abort();
                 goto GOTO_execute_io_cleanup_ERROR;
                }
         // Open src >>
        f_src_file.hand = ts::file::create(list->src_main_list->items()->get_text(aindex),
                                                                                GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING,
                                                                                FILE_FLAG_SEQUENTIAL_SCAN, NULL);
        if (f_src_file.hand==INVALID_HANDLE_VALUE)
                {goto GOTO_execute_io_cleanup_ERROR;
                }
         // Open dst >>
        if (list->dst_main_list->items()->get_number(aindex,IS)==EXISTS)
                        SetFileAttributesA(list->dst_main_list->items()->get_text(aindex),FILE_ATTRIBUTE_NORMAL);
        f_dst_file.hand = ts::file::create(list->dst_main_list->items()->get_text(aindex),
                                                                                GENERIC_READ|GENERIC_WRITE, FILE_SHARE_DELETE, NULL, CREATE_ALWAYS,
                                                                                FILE_FLAG_SEQUENTIAL_SCAN|FILE_ATTRIBUTE_ARCHIVE, f_src_file.hand);
        if (f_dst_file.hand==INVALID_HANDLE_VALUE)
                {goto GOTO_execute_io_cleanup_ERROR;
                }
        //
        // open HDR
        //
        if (anaction==OPERATION_CHECKSUM)
                {
                 f_src_file.readed = 0;
                 f_src_file.size = GetFileSize(f_src_file.hand, NULL);
                 f_dst_file.readed = 0;
                 f_dst_file.size = 1024/8;
                }
        else
        if (anaction==OPERATION_COPY)
                {
                f_src_file.readed = 0;
                f_src_file.size = GetFileSize(f_src_file.hand, NULL);
                f_dst_file.readed = 0;
                f_dst_file.size = f_src_file.size;
                }
        else
        if (anaction==OPERATION_ENCODE)
                {
                f_src_file.readed = 0;
                f_src_file.size = GetFileSize(f_src_file.hand, NULL);
                f_dst_file.readed = 0;
                f_dst_file.size = f_src_file.size;
                f_dst_file.size+= sizeof(file_header::__eno_header_struct) + sizeof(file_header::__eno_block_header_struct)*(1 + (f_src_file.size / options->block_size));

                if (options->coder &ENO_CODER_BWT)
                f_dst_file.size+= BWT_TRASH_BPB(options->block_size,options->coder_LZS_dict_size) * (1 + (f_src_file.size / options->block_size));
                if (options->coder &ENO_CODER_LZS)
                f_dst_file.size+= LZS_TRASH_BPB(options->block_size,options->coder_LZS_dict_size) * (1 + (f_src_file.size / options->block_size));
                if (options->coder &ENO_CODER_HUF)
                f_dst_file.size+= HUF_TRASH_BPB(options->block_size)*(1+(f_src_file.size / options->block_size));
                if (options->coder &ENO_CODER_ARI)
                f_dst_file.size+= ARI_TRASH_BPB(options->block_size)*(1+(f_src_file.size / options->block_size));

                f_dst_file.hand_map = ts::file::create_map(f_dst_file.hand, NULL,
                                                                                                                PAGE_READWRITE|SEC_RESERVE,
                                                                                                                0,sizeof(file_header::__eno_header_struct),NULL);
                        f_dst_file.buffer.ptr = ts::file::create_map_view(f_dst_file.hand_map,FILE_MAP_WRITE,0,0,sizeof(file_header::__eno_header_struct));
                if (f_dst_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                hdr.signature  = ENO_HEADER_SIG;
                hdr.size = f_src_file.size;
                ts::mem32::mov(f_dst_file.buffer.ptr,(void*)&hdr,sizeof(file_header::__eno_header_struct));
                f_dst_file.readed += sizeof(file_header::__eno_header_struct);
                if (options->block_is_cached==0)
                ts::file::flush_map_view(f_dst_file.buffer.ptr,sizeof(file_header::__eno_block_header_struct));
                ts::file::close_map_view(f_dst_file.buffer.ptr);
                ts::file::close_map(f_dst_file.hand_map);
                //
                progress->src->one->readed = 0;
                progress->src->one->size = f_src_file.size;
                progress->src->all->readed += 0;
                progress->dst->one->readed = f_dst_file.readed;
                progress->dst->one->size = f_dst_file.size;
                progress->dst->all->readed += sizeof(file_header::__eno_header_struct);
                }
        else
        if (anaction==OPERATION_DECODE)
                {
                f_src_file.readed = 0;
                f_src_file.size = GetFileSize(f_src_file.hand, NULL);
                f_src_file.hand_map = ts::file::create_map(f_src_file.hand, NULL,
                                                                                                                PAGE_READONLY|SEC_RESERVE,
                                                                                                                0,sizeof(file_header::__eno_header_struct),NULL);
                f_src_file.buffer.ptr = ts::file::create_map_view(f_src_file.hand_map, FILE_MAP_READ,0,0,sizeof(file_header::__eno_header_struct));
                if (f_src_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                ts::mem32::mov((void*)&hdr,f_src_file.buffer.ptr,sizeof(file_header::__eno_header_struct));
                f_src_file.readed += sizeof(file_header::__eno_header_struct);
                ts::file::close_map_view(f_src_file.buffer.ptr);
                ts::file::close_map(f_src_file.hand_map);
                if (hdr.signature!=ENO_HEADER_SIG)
                        {SetLastError(ERROR_INVALID_DATATYPE);
                         goto GOTO_execute_io_cleanup_ERROR;
                        }
                f_dst_file.readed = 0;
                f_dst_file.size = hdr.size;
                //
                progress->src->one->readed = f_src_file.readed;
                progress->src->one->size = f_src_file.size;
                progress->src->all->readed += sizeof(file_header::__eno_header_struct);
                progress->dst->one->readed = f_dst_file.readed;
                progress->dst->one->size = f_dst_file.size;
                progress->dst->all->readed += 0;
                }
        //
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                root[0] = ((char*)list->dst_main_list->items()->get_text(aindex))[0];
        if (f_check_free_space(root,f_dst_file.size,list->dst_main_list->items()->get_number(aindex,SIZE),true,false) < 0)
                {abort();
                 goto GOTO_execute_io_cleanup_ERROR;
                }
         // map src >>
        f_src_file.hand_map = ts::file::create_map(f_src_file.hand, NULL,
                                                                                                PAGE_READONLY|SEC_RESERVE,
                                                                                                0,f_src_file.size,NULL);
        if (f_src_file.hand_map==INVALID_HANDLE_VALUE)
                {goto GOTO_execute_io_cleanup_ERROR;
                }
         // map dst >>
        f_dst_file.hand_map = ts::file::create_map(f_dst_file.hand, NULL,
                                                                                                PAGE_READWRITE|SEC_RESERVE,
                                                                                                0,f_dst_file.size,NULL);
        if (f_dst_file.hand_map==INVALID_HANDLE_VALUE)
                {goto GOTO_execute_io_cleanup_ERROR;
                }
        //
        // START MOVE
        //
        if (anaction==OPERATION_CHECKSUM) {
                for (;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
                {
                f_src_file.buffer.size = f_src_file.size -f_src_file.readed;
                                if (f_src_file.buffer.size > options->block_size) f_src_file.buffer.size = options->block_size;
                f_src_file.buffer.offset = f_src_file.readed % 65536;
                f_src_file.buffer.ptr = ts::file::create_map_view(f_src_file.hand_map, FILE_MAP_READ, 0,
                                f_src_file.readed - f_src_file.buffer.offset, f_src_file.buffer.size + f_src_file.buffer.offset);
                if (f_src_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                f_mem_buffer_map.index=0;

                if (options->checksum & CHECKSUM_SSC1024)
                                                {f_mem_buffer_map.map[f_mem_buffer_map.index].ptr = (void*)ts::hash::ssc1::calc_SSC1((void*)((__int8*)f_src_file.buffer.ptr + f_src_file.buffer.offset),f_src_file.buffer.size,1024);
                                 f_mem_buffer_map.map[f_mem_buffer_map.index].size = 1024/8;
                                }
                f_dst_file.buffer.size = f_mem_buffer_map.map[f_mem_buffer_map.index].size;
                f_dst_file.buffer.offset = f_dst_file.readed % 65536;
                f_dst_file.buffer.ptr = ts::file::create_map_view(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
                                f_dst_file.readed - f_dst_file.buffer.offset, f_dst_file.buffer.size + f_dst_file.buffer.offset);
                if (f_dst_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                ts::mem32::mov((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset), f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                f_src_file.readed += f_src_file.buffer.size;
                ts::file::close_map_view(f_src_file.buffer.ptr);
                f_dst_file.readed += f_dst_file.buffer.size;
                if (options->block_is_cached==0)
                ts::file::flush_map_view((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset),f_dst_file.buffer.size);
                ts::file::close_map_view(f_dst_file.buffer.ptr);

                progress->src->one->readed  = f_src_file.readed;
                progress->src->one->size = f_src_file.size;
                progress->src->all->readed += f_src_file.buffer.size;

                progress->dst->one->readed = 1024/8;
                progress->dst->one->size = f_dst_file.size;
                progress->dst->all->readed += f_dst_file.buffer.size;
                do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                }
        }
else
        if (anaction==OPERATION_COPY) {

                f_mem_buffer_map.index=0; f_mem_buffer_map.count=8;
                f_mem_buffer_map.previous_index=0;

                for (;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
                {
                do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                f_src_file.buffer.size = f_src_file.size -f_src_file.readed;
                if (f_src_file.buffer.size > options->block_size) f_src_file.buffer.size = options->block_size;
                f_src_file.buffer.offset = f_src_file.readed % 65536;
                f_src_file.buffer.ptr = ts::file::create_map_view(f_src_file.hand_map, FILE_MAP_READ, 0,
                                                                                        f_src_file.readed - f_src_file.buffer.offset, f_src_file.buffer.size + f_src_file.buffer.offset);
                if (f_src_file.buffer.ptr==NULL) {goto GOTO_execute_io_cleanup_ERROR;
                        }
                f_mem_buffer_map.map[f_mem_buffer_map.index].size = f_src_file.buffer.size;
                f_mem_buffer_map.map[f_mem_buffer_map.index].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                ts::mem32::mov(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,(void*)((__int8*)f_src_file.buffer.ptr + f_src_file.buffer.offset),f_src_file.buffer.size);
                f_src_file.readed += f_src_file.buffer.size;
                ts::file::close_map_view(f_src_file.buffer.ptr);
                progress->src->one->readed  = f_src_file.readed;
                progress->src->one->size = f_src_file.size;
                progress->src->all->readed += f_src_file.buffer.size;
                do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                //
                // ewentualne operacje na bufferze
                // ...
                //
                DWORD x;
                if (f_write_file_thread_handle==NULL) goto GOTO_execute_io_cleanup_ERROR;
                if (GetExitCodeThread(f_write_file_thread_handle,&x)==0) goto GOTO_execute_io_cleanup_ERROR;
                if (x!=STILL_ACTIVE) goto GOTO_execute_io_cleanup_ERROR; // jesli nie to przerwij natychmiast

                while (f_write_file_thread_control & 1) { time::wait_ms(1); do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY); } // dopuki system nie zako�czy poprzedniej procedury zapisu czekaj
                   if (f_write_file_thread_control & 4) goto GOTO_execute_io_cleanup_ERROR; // zapisywanie zako�czone ale niepoprawnie
                                f_mem_buffer_map.previous_index = f_mem_buffer_map.index;
                if (f_mem_buffer_map.index==f_mem_buffer_map.count-1) f_mem_buffer_map.index =0;
                else f_mem_buffer_map.index++;

                f_write_file_thread_control = 1; //startuj kolejny zapis
                SwitchToThread();
                // doputy czekaj, pusci na jej starcie, a dalej sobie bedzie leciala r�wnolegle,
                // wtedy dokona kolejnego odczytu w kolejnej petli i poczeka na zako�czenie zapisu po jej zakoczeniu



/*				f_dst_file.buffer.size = f_mem_buffer_map.map[f_mem_buffer_map.previous_index].size;
                f_dst_file.buffer.offset = f_dst_file.readed % 65536;
                f_dst_file.buffer.ptr = ts::file::create_map_view(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
                                f_dst_file.readed - f_dst_file.buffer.offset, f_dst_file.buffer.size + f_dst_file.buffer.offset);
                if (f_dst_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                ts::mem32::mov((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset), (void*)f_mem_buffer_map.map[f_mem_buffer_map.previous_index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.previous_index].size);
                ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.previous_index].ptr);
                f_dst_file.readed += f_dst_file.buffer.size;
                if (options->block_is_cached==0)
                ts::file::flush_map_view((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset),f_dst_file.buffer.size);
                ts::file::close_map_view(f_dst_file.buffer.ptr);
                progress->dst->one->readed = f_dst_file.readed;
                progress->dst->one->size = f_dst_file.size;
                progress->dst->all->readed += f_dst_file.buffer.size;
*/
                }
        }
else
        if (anaction==OPERATION_ENCODE) {
                for	(;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
                {
                //
                do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                                                f_src_file.buffer.size = f_src_file.size -f_src_file.readed;
                                if (f_src_file.buffer.size > options->block_size) f_src_file.buffer.size = options->block_size;
                f_src_file.buffer.offset = f_src_file.readed % 65536;
                f_src_file.buffer.ptr = ts::file::create_map_view(f_src_file.hand_map, FILE_MAP_READ, 0,
                                                                                                         f_src_file.readed - f_src_file.buffer.offset,
                                                                                                         f_src_file.buffer.size + f_src_file.buffer.offset);
                if (f_src_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                f_mem_buffer_map.index=0;
                f_mem_buffer_map.map[f_mem_buffer_map.index].size = f_src_file.buffer.size;
                f_mem_buffer_map.map[f_mem_buffer_map.index].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                ts::mem32::mov(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,(void*)((__int8*)f_src_file.buffer.ptr + f_src_file.buffer.offset),f_src_file.buffer.size);
                f_mem_buffer_map.count=1;

                if (options->coder & ENO_CODER_BWT) {
                f_mem_buffer_map.map[f_mem_buffer_map.count].size = f_mem_buffer_map.map[f_mem_buffer_map.count-1].size + BWT_TRASH_BPB(f_mem_buffer_map.map[f_mem_buffer_map.count-1].size,options->coder_LZS_dict_size);
                f_mem_buffer_map.count++;}
                if (options->coder & ENO_CODER_LZS) {
                f_mem_buffer_map.map[f_mem_buffer_map.count].size = f_mem_buffer_map.map[f_mem_buffer_map.count-1].size + LZS_TRASH_BPB(f_mem_buffer_map.map[f_mem_buffer_map.count-1].size,options->coder_LZS_dict_size);
                f_mem_buffer_map.count++;}
                if (options->coder & ENO_CODER_HUF) {
                f_mem_buffer_map.map[f_mem_buffer_map.count].size = f_mem_buffer_map.map[f_mem_buffer_map.count-1].size + HUF_TRASH_BPB(f_mem_buffer_map.map[f_mem_buffer_map.count-1].size);
                f_mem_buffer_map.count++;}
                if (options->coder & ENO_CODER_ARI) {
                f_mem_buffer_map.map[f_mem_buffer_map.count].size = f_mem_buffer_map.map[f_mem_buffer_map.count-1].size + ARI_TRASH_BPB(f_mem_buffer_map.map[f_mem_buffer_map.count-1].size);
                f_mem_buffer_map.count++;}
                //
                // transformacja Burrowsa-Wheelra
                if (options->coder & ENO_CODER_BWT)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index+1].size+1);
                         f_mem_buffer_map.map[f_mem_buffer_map.index+1].size = ts::compression::compress_BWT(f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index++;
                        }
                // kompresja LZS
                if (options->coder & ENO_CODER_LZS)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index+1].size+1);
                         f_mem_buffer_map.map[f_mem_buffer_map.index+1].size = ts::compression::compress_LZS(f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index++;
                        }
                // kodowanie MTF
                if (options->coder & ENO_CODER_MTF)
                        {ts::cipher::cript_MTF(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                        }
                // kompresja HUFFMANA
                if (options->coder & ENO_CODER_HUF)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index+1].size+1);
                         f_mem_buffer_map.map[f_mem_buffer_map.index+1].size = ts::compression::compress_HUF(f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index++;
                        }
                                // kompresja ARYTMETYCZNA
                if (options->coder & ENO_CODER_ARI)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index+1].size+1);
                         f_mem_buffer_map.map[f_mem_buffer_map.index+1].size = ts::compression::compress_ARI(f_mem_buffer_map.map[f_mem_buffer_map.index+1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index++;
                        }
                // QDRowanie
                if (options->coder & ENO_CODER_ROT)
                        {ts::cipher::cript_ROT(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->password->text.size());
                        }
                // Xorowanie
                if (options->coder & ENO_CODER_XOR)
                        {ts::cipher::cript_XOR(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->password->text.get(),options->password->text.size());
                        }
                                // FILE INTEGRITY PROTECTION 32bit CHECKSUM
                                if (options->coder & ENO_CODER_SSC)
                        {b_hdr.data_protection_code = ts::hash::ssc1::calc_SSC1(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,32)[0];
                        }
                                else
                                if (options->coder & ENO_CODER_CRC)
                        {b_hdr.data_protection_code = ts::hash::crc32::calc_CRC32(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                        }
                // naglowek
                f_dst_file.buffer.size = f_mem_buffer_map.map[f_mem_buffer_map.index].size;
                f_dst_file.buffer.offset = f_dst_file.readed % 65536;
                f_dst_file.buffer.ptr = ts::file::create_map_view(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
                                f_dst_file.readed - f_dst_file.buffer.offset, sizeof(file_header::__eno_block_header_struct) + f_dst_file.buffer.size + f_dst_file.buffer.offset);
                if (f_dst_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                ts::mem32::set((void*)&b_hdr.size,0,sizeof(b_hdr.size));
                b_hdr.signature = ENO_BLOCK_HEADER_SIG;
                b_hdr.signature_version = 0x0001L;
                b_hdr.data_range = f_src_file.readed;
                b_hdr.data_compression_coder = options->coder;
                                b_hdr.size_count = f_mem_buffer_map.count;
                for (__int32 i = 0; i < f_mem_buffer_map.count; i++) {b_hdr.size[i] = (__int32)f_mem_buffer_map.map[i].size;
                         }
                ts::mem32::mov((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset),(void*)&b_hdr,sizeof(file_header::__eno_block_header_struct));
                f_dst_file.readed += sizeof(file_header::__eno_block_header_struct);
                ts::mem32::mov((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset + sizeof(file_header::__eno_block_header_struct)),f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                f_src_file.readed += f_src_file.buffer.size;
//		if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                        ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                ts::file::close_map_view((void*)f_src_file.buffer.ptr);
                f_dst_file.readed += f_dst_file.buffer.size;
                                if (options->block_is_cached==0) ts::file::flush_map_view((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset),f_dst_file.buffer.size + sizeof(file_header::__eno_block_header_struct));
                ts::file::close_map_view((void*)f_dst_file.buffer.ptr);

                progress->src->one->readed  = f_src_file.readed;
                progress->src->one->size  = f_src_file.size;
                progress->src->all->readed += f_src_file.buffer.size;
                progress->dst->one->readed  = f_dst_file.readed;
                progress->dst->one->size  = f_dst_file.size;
                progress->dst->all->readed += f_dst_file.buffer.size;
                progress->dst->all->readed += sizeof(file_header::__eno_block_header_struct);
                do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                }
        }
else
        if (anaction==OPERATION_DECODE) {
  for (;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
                {
                // naglowek
                do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                f_src_file.buffer.size = sizeof(file_header::__eno_block_header_struct);
                f_src_file.buffer.offset = f_src_file.readed % 65536;
                f_src_file.buffer.ptr = ts::file::create_map_view(f_src_file.hand_map, FILE_MAP_READ, 0,
                                f_src_file.readed - f_src_file.buffer.offset,sizeof(file_header::__eno_block_header_struct) + f_src_file.buffer.offset);
                ts::mem32::mov((void*)&b_hdr,(void*)((__int8*)f_src_file.buffer.ptr + f_src_file.buffer.offset),sizeof(file_header::__eno_block_header_struct));
                f_src_file.readed += sizeof(file_header::__eno_block_header_struct);
                f_mem_buffer_map.count=1;
                //
                if (b_hdr.signature_version!=0x0001L)
                        {SetLastError(ERROR_INVALID_DATATYPE);
                         goto GOTO_execute_io_cleanup_ERROR;
                        }
                if (b_hdr.data_compression_coder & ENO_CODER_ARI)
                {f_mem_buffer_map.count++;}
                if (b_hdr.data_compression_coder & ENO_CODER_HUF)
                {f_mem_buffer_map.count++;}
                if (b_hdr.data_compression_coder & ENO_CODER_LZS)
                {f_mem_buffer_map.count++;}
                if (b_hdr.data_compression_coder & ENO_CODER_BWT)
                {f_mem_buffer_map.count++;}

//				f_mem_buffer_map.count = b_hdr.s_count;
                for (__int32 i = 0; i < f_mem_buffer_map.count; i++)
                {f_mem_buffer_map.map[i].size = b_hdr.size[i];
                        }
                ts::file::close_map_view((void*)f_src_file.buffer.ptr);
                if (b_hdr.signature!=ENO_BLOCK_HEADER_SIG)
                        {SetLastError(ERROR_INVALID_DATATYPE);
                         goto GOTO_execute_io_cleanup_ERROR;
                        }
                f_mem_buffer_map.index = f_mem_buffer_map.count-1;
                //
                f_src_file.buffer.size = f_mem_buffer_map.map[f_mem_buffer_map.index].size;
                f_src_file.buffer.offset = f_src_file.readed % 65536;
                f_src_file.buffer.ptr = ts::file::create_map_view(f_src_file.hand_map, FILE_MAP_READ, 0,
                                f_src_file.readed - f_src_file.buffer.offset, f_src_file.buffer.size + f_src_file.buffer.offset);
                if (f_src_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                f_mem_buffer_map.map[f_mem_buffer_map.index].size = f_src_file.buffer.size;
                f_mem_buffer_map.map[f_mem_buffer_map.index].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                ts::mem32::mov(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,(void*)((__int8*)f_src_file.buffer.ptr + f_src_file.buffer.offset),f_src_file.buffer.size);

                if (b_hdr.data_compression_coder & ENO_CODER_SSC) {
                if (b_hdr.data_protection_code!=ts::hash::ssc1::calc_SSC1(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,32)[0])
                        {SetLastError(ERROR_CRC);
                         goto GOTO_execute_io_cleanup_ERROR;
                        }
                }
                else {
                if (b_hdr.data_compression_coder & ENO_CODER_CRC) {
                if (b_hdr.data_protection_code!=ts::hash::crc32::calc_CRC32(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size))
                        {SetLastError(ERROR_CRC);
                         goto GOTO_execute_io_cleanup_ERROR;
                        }
                }}
                // DEXORowanie
                if (b_hdr.data_compression_coder & ENO_CODER_XOR)
                        {ts::cipher::uncript_XOR(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->password->text.get(),options->password->text.size());
                        }
                // DEQDRowanie
                if (b_hdr.data_compression_coder & ENO_CODER_ROT)
                        {ts::cipher::uncript_ROT(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size,options->password->text.size());
                        }
                // DEkompresja ARI
                if (b_hdr.data_compression_coder & ENO_CODER_ARI)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index-1].size+1);
                         ts::compression::uncompress_ARI(f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index-1].size,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index--;
                         }
                // DEkompresja HUF
                if (b_hdr.data_compression_coder & ENO_CODER_HUF)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index-1].size+1);
                         ts::compression::uncompress_HUF(f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index-1].size,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index--;
                         }
                // DEkodowanie MTF
                if (b_hdr.data_compression_coder & ENO_CODER_MTF)
                        {ts::cipher::uncript_MTF(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                        }
                // DEkompresja LZS
                if (b_hdr.data_compression_coder & ENO_CODER_LZS)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index-1].size+1);
                         ts::compression::uncompress_LZS(f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index-1].size,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index--;
                         }
                // DEkompresja Burrowsa-Wheelra
                if (b_hdr.data_compression_coder & ENO_CODER_BWT)
                        {f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr = ts::mem32::alloc(f_mem_buffer_map.map[f_mem_buffer_map.index-1].size+1);
                         ts::compression::uncompress_BWT(f_mem_buffer_map.map[f_mem_buffer_map.index-1].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index-1].size,f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
//			 if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                         f_mem_buffer_map.index--;
                        }
                f_dst_file.buffer.size = f_mem_buffer_map.map[f_mem_buffer_map.index].size;
                f_dst_file.buffer.offset = f_dst_file.readed % 65536;
                f_dst_file.buffer.ptr = ts::file::create_map_view(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
                                f_dst_file.readed - f_dst_file.buffer.offset, f_dst_file.buffer.size + f_dst_file.buffer.offset);
                if (f_dst_file.buffer.ptr==NULL)
                        {goto GOTO_execute_io_cleanup_ERROR;
                        }
                ts::mem32::mov((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset),f_mem_buffer_map.map[f_mem_buffer_map.index].ptr,f_mem_buffer_map.map[f_mem_buffer_map.index].size);
                f_src_file.readed += f_src_file.buffer.size;
                ts::file::close_map_view(f_src_file.buffer.ptr);
//		if (f_mem_buffer_map.index!=0) ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                ts::mem32::free(f_mem_buffer_map.map[f_mem_buffer_map.index].ptr);
                if (options->block_is_cached==0)
                ts::file::flush_map_view((void*)((__int8*)f_dst_file.buffer.ptr + f_dst_file.buffer.offset),f_dst_file.buffer.size);
                ts::file::close_map_view(f_dst_file.buffer.ptr);
                f_dst_file.readed += f_dst_file.buffer.size;

                progress->src->one->readed  = f_src_file.readed;
                progress->src->one->size  = f_src_file.size;
                progress->src->all->readed += f_src_file.buffer.size;
                progress->src->all->readed += sizeof(file_header::__eno_block_header_struct);
                progress->dst->one->readed  = f_dst_file.readed;
                progress->dst->one->size  = f_dst_file.size;
                progress->dst->all->readed += f_dst_file.buffer.size;
                do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                }
        }
//------------------------------------------
        GOTO_execute_IO_DONE:
//------------------------------------------
        while (f_write_file_thread_control & 1) { time::wait_ms(1); do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY); } // dopuki system nie zako�czy poprzedniej procedury zapisu czekaj
        f_write_file_thread_control = 0;

        ts::file::close_map(f_src_file.hand_map);
        ts::file::close_map(f_dst_file.hand_map);
        SetFilePointer(f_dst_file.hand, f_dst_file.readed, 0, FILE_BEGIN); SetEndOfFile(f_dst_file.hand);
        //
        // SET THE FILE ATTRIBUTES AND DATES BASED ON SOURCE FILE
        //
        FILETIME creation,lastaccess, lastwrite;
        if (anaction==OPERATION_CHECKSUM || anaction==OPERATION_COPY)
           {GetFileTime(f_src_file.hand,&creation,&lastaccess,&lastwrite);
                SetFileTime(f_dst_file.hand,&creation,&lastaccess,&lastwrite);
                                                }
        ts::file::close(f_src_file.hand);
        ts::file::close(f_dst_file.hand);
                                //
                                // CHECK AGAIN IS ALL TRANSFERRED? IN THIS PLACE YOU COULD ADD CRC,ADLER, MD5 LAST CHECKER!
                                //
        if (f_src_file.readed < f_src_file.size)
           {SetFileAttributesA(list->dst_main_list->items()->get_text(f_mem_buffer_map.index),FILE_ATTRIBUTE_NORMAL);
                DeleteFileA(list->dst_main_list->items()->get_text(f_mem_buffer_map.index));
           }
        //
        // WHATEVER RETURN POSITIVE!
        //
goto GOTO_execute_cleanup_OK;
//------------------------------------------
GOTO_execute_io_cleanup_ERROR:
//------------------------------------------
        while (f_write_file_thread_control & 1) { time::wait_ms(1); do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY); } // dopuki system nie zako�czy poprzedniej procedury zapisu czekaj
        f_write_file_thread_control = 0;

                if (f_src_file.hand_map!=INVALID_HANDLE_VALUE)
                         ts::file::close_map(f_src_file.hand_map);
                if (f_dst_file.hand_map!=INVALID_HANDLE_VALUE)
                         ts::file::close_map(f_dst_file.hand_map);
                if (f_src_file.hand!=INVALID_HANDLE_VALUE)
                         ts::file::close(f_src_file.hand);
                if (f_dst_file.hand!=INVALID_HANDLE_VALUE)
                         ts::file::close(f_dst_file.hand);
                                //
                                // DELETE THE INCOMPLETE FILE!
                                //
                if (f_dst_file.hand!=INVALID_HANDLE_VALUE)
                        {SetFileAttributesA(list->dst_main_list->items()->get_text(f_mem_buffer_map.index),FILE_ATTRIBUTE_NORMAL);
                         DeleteFileA(list->dst_main_list->items()->get_text(f_mem_buffer_map.index));
                        }
        progress->src->all->readed -= progress->src->one->readed;
        progress->src->all->size -= progress->src->one->size;
        progress->src->one->readed  = 0;
        progress->src->one->size  = 1;
        progress->dst->all->readed -= progress->dst->one->readed;
        progress->dst->all->size -= progress->dst->one->size;
        progress->dst->one->readed  = 0;
        progress->dst->one->size  = 1;
        do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
goto GOTO_execute_cleanup_ERROR;
//------------------------------------------
        }
GOTO_execute_cleanup_OK:
do_event(ON_IO_ONE_OK,EMPTY,EMPTY);
delete templpStr1;
delete templpStr2;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_exec_one, return 1(OK)");
ts::console::print("\r\n");
#endif
do_event(ON_IO_ONE_END,EMPTY,EMPTY);
return 1;

GOTO_execute_cleanup_ERROR:
do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
delete templpStr1;
delete templpStr2;
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_exec_one, return 0(ERROR)");
ts::console::print("\r\n");
#endif
do_event(ON_IO_ONE_END,EMPTY,EMPTY);
return 0;
}
//---------------------------------------------------------------------------

DWORD WINAPI ts::__kop32_class::f_write_file_thread(LPVOID a_caller) {
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_write_file_thread(a_caller=%d)",(__int32)a_caller);
ts::console::print("\r\n");
#endif
register ts::__kop32_class *caller_kop32 = (ts::__kop32_class*)a_caller;

 while ((caller_kop32->f_write_file_thread_control & 2) == 0) {
        if ((caller_kop32->f_write_file_thread_control & 1) != 0) {

#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_write_file_thread, thread_control=%d)",1/*(__int32)caller_kop32->f_write_file_thread_control*/);
ts::console::print("\r\n");
#endif
                //int i =  caller_kop32->f_mem_buffer_map.previous_index;
                caller_kop32->do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                caller_kop32->f_dst_file.buffer.size = caller_kop32->f_mem_buffer_map.map[caller_kop32->f_mem_buffer_map.previous_index].size;
                caller_kop32->f_dst_file.buffer.offset = caller_kop32->f_dst_file.readed % 65536;
                caller_kop32->f_dst_file.buffer.ptr = ts::file::create_map_view(caller_kop32->f_dst_file.hand_map, FILE_MAP_WRITE, 0,
                                caller_kop32->f_dst_file.readed - caller_kop32->f_dst_file.buffer.offset, caller_kop32->f_dst_file.buffer.size + caller_kop32->f_dst_file.buffer.offset);
                if (caller_kop32->f_dst_file.buffer.ptr==NULL)
                   {caller_kop32->f_write_file_thread_control = 4;
                   }
                ts::mem32::mov((void*)((__int8*)caller_kop32->f_dst_file.buffer.ptr + caller_kop32->f_dst_file.buffer.offset), (void*)caller_kop32->f_mem_buffer_map.map[caller_kop32->f_mem_buffer_map.previous_index].ptr,caller_kop32->f_mem_buffer_map.map[caller_kop32->f_mem_buffer_map.previous_index].size);
                ts::mem32::free(caller_kop32->f_mem_buffer_map.map[caller_kop32->f_mem_buffer_map.previous_index].ptr);
                caller_kop32->f_dst_file.readed += caller_kop32->f_dst_file.buffer.size;
                if (caller_kop32->options->block_is_cached==0)
                ts::file::flush_map_view((void*)((__int8*)caller_kop32->f_dst_file.buffer.ptr + caller_kop32->f_dst_file.buffer.offset),caller_kop32->f_dst_file.buffer.size);
                ts::file::close_map_view(caller_kop32->f_dst_file.buffer.ptr);
                caller_kop32->progress->dst->one->readed = caller_kop32->f_dst_file.readed;
                caller_kop32->progress->dst->one->size = caller_kop32->f_dst_file.size;
                caller_kop32->progress->dst->all->readed += caller_kop32->f_dst_file.buffer.size;
                caller_kop32->do_event(ON_IO_ONE_PROGRESS,EMPTY,EMPTY);
                caller_kop32->f_write_file_thread_control = 0;
                                SwitchToThread();
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_write_file_thread, thread_control=%d)",(__int32)caller_kop32->f_write_file_thread_control);
ts::console::print("\r\n");
#endif
                }
else
                {
                                time::wait_ms(1);
                }
}
return 0;
}
//---------------------------------------------------------------------------

__int64 __stdcall ts::__kop32_class::f_check_free_space(const char *avolume_name, const __int64 anumber_of_source_bytes, const __int64 anumber_of_destination_bytes, const bool acheck_until_positive, const bool auser_could_ignore)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::f_check_free_space(avolume_name:%s)",avolume_name);
ts::console::print("\r\n");
#endif
ULARGE_INTEGER disk_UInt;
__int64 disk_real_free_space = 0;
do_event(ON_FREE_SPACE,EMPTY,EMPTY);
__int32 user_decision_dword;
//
// CHECK IS IT DISK OR UNC NAME AND ADD TRAILING BACKSLASH "\" AT END of directory because GetDiskFreeSpaceEx needs it in UNC path!
//
char *r_volume_name = ts::cstr::dup(avolume_name);
if (ts::cstr::len(avolume_name)>1)
if (r_volume_name[1]!=':')
if (r_volume_name[ts::cstr::len(r_volume_name)-1]!='\\') strcat(r_volume_name,"\\");
//
//
while (::GetDiskFreeSpaceExA(avolume_name,&disk_UInt,NULL,NULL))	 {
                disk_real_free_space = disk_UInt.QuadPart + anumber_of_destination_bytes - anumber_of_source_bytes;

                if (disk_real_free_space > 0)
                                break;
        if (options->ask_at_break==ASK_NO)
                        break;
        if (auser_could_ignore==true && options->ask_at_break==ASK_ALL)
                        break;
        if (acheck_until_positive==false)
                        break;
        if (auser_could_ignore==true) user_decision_dword= ts::cstr::atoi((char*)do_event(ON_ERROR,"ERROR_DISK_FULL","MB_ABORTRETRYIGNORE"));
        else
                        user_decision_dword = ts::cstr::atoi((char*)do_event(ON_ERROR,"ERROR_DISK_FULL","MB_RETRYCANCEL"));

        if (auser_could_ignore==true && user_decision_dword==IDIGNORE)
                        break;
                if (user_decision_dword==IDRETRY)
                        continue;
//
// IF THERE IS NO ANOTHER CHANCE, SIMPLY SET ERROR END EXIT
//
                SetLastError(ERROR_DISK_FULL);
                break;
}
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class::check_free_space, return %d",disk_real_free_space);
ts::console::print("\r\n");
#endif
return disk_real_free_space;
}
//---------------------------------------------------------------------------

const char* __stdcall ts::__kop32_class::do_event(const char *a_event, const char *a_code, const char *a_code_ex)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class_progress_controler::do_event(a_event,a_code,a_code_ex)\r\n");
ts::console::print_formated("a_event:%s, a_code:%s\r\n",a_event,a_code);
ts::console::print_formated("a_code_ex:%s\r\n",a_code_ex);
#endif
return progress->do_event(a_event,a_code,a_code_ex);
}
//---------------------------------------------------------------------------

__stdcall ts::__kop32_class::~__kop32_class(void)
{
#ifdef __DEBUG_KOP32_CLASS__
__DEBUG_FUNC_CALLED__
#endif
#ifdef __DEBUG_KOP32_CLASS__
ts::console::print_formated("__kop32_class:~__kop32_class()");
ts::console::print("\r\n");
#endif
        delete list;
        delete options;
        delete f_file_seeker;
}
//---------------------------------------------------------------------------
