//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015--------------------------------
//---------------------------------------------------------------------------
#include "tsoft_kop32_class.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../io/tsoft_file_io.h"
#include "./../io/tsoft_console.h"
#include "./../pharser/tsoft_pharse_command_line.h"
#include "./../compression/tsoft_compression_API.h"
#include "./../cipher/tsoft_cipher_API.h"
#include "./../hash/tsoft_hash_crc32.h"
#include "./../hash/tsoft_hash_ssc1.h"
//---------------------------------------------------------------------------
#include <windows.h>
#include <direct.h>
#include <io.h>
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

__stdcall ts::__kop32_class::__kop32_class() : default_progress()
{
		f_text_stack = new ts::__cstr_stack();

		options = new __kop32_class_options();
		options->mask_list->alias = "OPTIONS_MASKS.clst";
		options->src_init_list->alias = "SOURCE_INIT.rlst";
		options->dst_init_list->alias = "DESTINATION_INIT.rlst";
		options->output_arguments_list->alias = "OPTIONS_ARGTS.clst";
		list = new __kop32_class_list();
		list->src_main_list->alias = "SOURCE_MAIN.rlst";
		list->dst_main_list->alias = "DESTINATION_MAIN.rlst";
		list->output_formated_list->alias = "OUT_FORMATED_LIST.flst";
		list->sync_op_list->alias = "SYNC_OP_LIST.slst";

		progress = &default_progress;
		f_file_seeker = new file::__search();
		f_file_seeker->progress = progress;

		reset();
}
//---------------------------------------------------------------------------

void __stdcall ts::__kop32_class::reset(void)
{
		this->progress->reset();
		options->reset();
		list->output_formated_list->clear();
		mem32::set(&f_src_file,(__int8)NULL,sizeof(file::__open_file_struct));
		list->src_main_list->clear();
		mem32::set(&f_dst_file,(__int8)NULL,sizeof(file::__open_file_struct));
		list->dst_main_list->clear();
}
//---------------------------------------------------------------------------

void __stdcall ts::__kop32_class::cancel (void)
{
		progress->cancel = true;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::prepare_options(char *alpCommand) {
		this->reset(); // RESET OPTIONS
		ts::__pharser p;
		ts::__cstr_class  *temp_lpCommand = f_text_stack->push(512 + ts::cstr::len(alpCommand), alpCommand);
		ts::__cstr_class  *temp_lpCommandSubOption = f_text_stack->push(512);
//
// SELECT MAIN OPERATION TYPE AND SUBOPTIONS
//
if (p.find(temp_lpCommand->c_str(),"-X","--REMOVE","/REMOVE",NULL)==true)
   {options->operation  = OPERATION_REMOVE;
		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-D","--DECODE","/DECODE",NULL)==true)
   {options->operation  = OPERATION_DECODE;
		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-E","--ENCODE","/ENCODE",temp_lpCommandSubOption->c_str())==true)
   {options->operation  = OPERATION_ENCODE;

				options->coder  = 0x00000000; //defauld coder type NOP

		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"CRC"))
		options->coder |= ENO_CODER_CRC;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"SSC"))
		options->coder |= ENO_CODER_SSC;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"XOR"))
				options->coder |= ENO_CODER_XOR;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"ROT"))
				options->coder |= ENO_CODER_ROT;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"LZS"))
		options->coder |= ENO_CODER_LZS;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"HUF"))
				options->coder |= ENO_CODER_HUF;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"ARI"))
		options->coder |= ENO_CODER_ARI;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"MTF"))
		options->coder |= ENO_CODER_MTF;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"BWT"))
		options->coder |= ENO_CODER_BWT;

		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-M","--MOVE","/MOVE",NULL)==true)
   {options->operation = OPERATION_MOVE;
		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-C","--COPY","/COPY",NULL)==true)
   {options->operation = OPERATION_COPY;
		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-L","--LIST","/LIST",NULL))
   {options->operation = OPERATION_LIST;
		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-V","--COMPARE","/COMPARE",NULL))
   {options->operation = OPERATION_COMPARE;
		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-S","--SELECT","/SELECT",NULL)) // is copy the file list to windows clipboard
   {
		options->operation = OPERATION_SELECT;
		p.delete_found(temp_lpCommand->c_str());
	goto GOTO_OPTIONS;
   }
if (p.find(temp_lpCommand->c_str(),"-H","--CHECKSUM","/CHECKSUM",temp_lpCommandSubOption->c_str()))
   {options->operation = OPERATION_CHECKSUM;
		if (-1!=ts::cstr::pos(temp_lpCommandSubOption->c_str(),0,"SSC1024"))
	   options->checksum |= CHECKSUM_SSC1024;
		p.delete_found(temp_lpCommand->c_str());
   }
//
GOTO_OPTIONS:
//
if (p.find(temp_lpCommand->c_str(),"-I","--DICT","/DICT",temp_lpCommandSubOption->c_str()))
   {options->coder_LZS_dict_size = ts::cstr::atoi(temp_lpCommandSubOption->c_str());
	if (options->coder_LZS_dict_size > DICT_OFFSET_MAX || options->coder_LZS_dict_size < DICT_LEN_1)
		   {execute_event(ON_ERROR,"ERROR_INVALID_USER_BUFFER","MB_OK");
				progress->cancel = true;
		return 0;
	   }
		p.delete_found(temp_lpCommand->c_str());
   }
if (p.find(temp_lpCommand->c_str(),"-B","--BUFOR","/BUFOR",temp_lpCommandSubOption->c_str()))
   {options->block_size = 1024 * ts::cstr::atoi(temp_lpCommandSubOption->c_str());
	if (options->block_size > 1024 * 65536 || options->block_size < 1 * 1024)
		   {execute_event(ON_ERROR,"ERROR_INVALID_USER_BUFFER","MB_OK");
				progress->cancel = true;
		return 0;
	   }
		p.delete_found(temp_lpCommand->c_str());
   }
if (p.find(temp_lpCommand->c_str(),"-F","--CACHED","/CACHED",NULL))
   {options->block_is_cached = true;
		p.delete_found(temp_lpCommand->c_str());
   }
if (p.find(temp_lpCommand->c_str(),"-M","--MASK","/MASK",temp_lpCommandSubOption->c_str()))
   {options->mask_list->import_from("CVS",temp_lpCommandSubOption->c_str());
		p.delete_found(temp_lpCommand->c_str());
   }
if (p.find(temp_lpCommand->c_str(),"-P","--PASSWORD","/PASSWORD",temp_lpCommandSubOption->c_str()))
   {options->password->text = temp_lpCommandSubOption->c_str();
		p.delete_found(temp_lpCommand->c_str());
   }
if (p.find(temp_lpCommand->c_str(),"-A","--ARGUMENTS","/ARGUMENTS",temp_lpCommandSubOption->c_str()))
   {options->output_arguments_list->import_from("CVS", temp_lpCommandSubOption->c_str());
		p.delete_found(temp_lpCommand->c_str());
   }
if (p.find(temp_lpCommand->c_str(),"-A","--BREAK","/BREAK",temp_lpCommandSubOption->c_str()))
   {options->ask_at_break = REPLACE_ASK_USER; // default option
		if (temp_lpCommandSubOption->c_str()[0]=='T')
		options->ask_at_break = REPLACE_ALL;
		if (temp_lpCommandSubOption->c_str()[0]=='?')
		options->ask_at_break = REPLACE_ASK_USER;
		if (temp_lpCommandSubOption->c_str()[0]=='N')
		options->ask_at_break = REPLACE_NO;
		p.delete_found(temp_lpCommand->c_str());
   }
//
// ENO_CODER OPTIONS
//
// 
/// prepare source and destination regarding command line

//
register __int32 i,s,d;
options->src_init_list->import_from("CVS", temp_lpCommand->c_str());
for (i = 0; i < options->src_init_list->items.count;)
		{if (ts::cstr::pos(options->src_init_list->items[i]->text,0,":")==-1)
				 options->src_init_list->items.cut(i);
		else i++;
	}
s = (i>>2) + (i&0x01);
for (i = s, d = 0; i < options->src_init_list->items.count; d++)
		{options->src_init_list->items.set(d,options->src_init_list->items.get(i));
		 options->src_init_list->items.cut(i);
		}
if (options->src_init_list->items.count==0)
	options->operation = OPERATION_NULL;
if (options->dst_init_list->items.count==0 && options->operation!=OPERATION_SELECT && options->operation!=OPERATION_REMOVE)
	options->operation = OPERATION_NULL;

//----------------------------
GOTO_set_options_EXIT:
//----------------------------
execute_event("PREPARED_EVENT","OPTIONS","");
f_text_stack->pop(4);
return 1;
}
//---------------------------------------------------------------------------


#define IF_USER_NOT_ACCEPT_ERROR_GOTO(ExitID)\
if (error_execute_event(ts::cstr::itoa(GetLastError()),"MB_OKCANCEL")==IDCANCEL)\
   {progress->cancel = true;\
	goto ExitID;\
   };
__int32 __stdcall ts::__kop32_class::prepare(void) {
ts::__cstr_class  *temp_lpDestination = f_text_stack->push(512);
ts::__cstr_class  *temp_lpSource = f_text_stack->push(512);

int ret,z,d;

if (options->operation==OPERATION_NULL)
   {
		execute_event(ON_ERROR,"RPC_S_CANNOT_SUPPORT","MB_OK");
	goto GOTO_prepare_EXIT;
   }

if (options->operation==OPERATION_SELECT)
   {
		if (OpenClipboard(NULL)==true) { if (options->ask_at_break==REPLACE_ASK_USER) execute_event(ON_ERROR,ts::cstr::itoa(GetLastError()),"MB_OK");
		goto GOTO_prepare_EXIT;
	   }
	else {
	char *tStr = ts::cstr::alloc(64*1024); 
		options->src_init_list->export_to(tStr,"CVS");
		SetClipboardData(CF_TEXT, tStr);
	CloseClipboard();
	goto GOTO_prepare_EXIT;
	}
   }
/////////////////////////////////////////////
//
execute_event(ON_START,0,0); // START >>>>
//
/////////////////////////////////////////////

if (options->operation==OPERATION_REMOVE || options->operation==OPERATION_LIST)
   {
   for (z = 0; z < options->src_init_list->items.count && progress->cancel==0; z++)
   	{
   	 ret = false;
	 //sprawdzanie
				 ts::text::fix_file_path(temp_lpSource->c_str(),options->src_init_list->items[z]->text);
		 if (ts::cstr::len(temp_lpSource->c_str()) > 3)
   		{
						 f_src_file.find_data.hand = FindFirstFileA(options->src_init_list->items[z]->text,&f_src_file.find_data.data);
		 if (f_src_file.find_data.hand==INVALID_HANDLE_VALUE)
   			{ret =true;
   			 SetLastError(ERROR_FILE_NOT_FOUND);
   			}
		 else FindClose(f_src_file.find_data.hand);
   		}
   	 //jesli wszystko jest ok to szukaj
	 if (ret==false)
				 ret = f_file_seeker->execute(options->src_init_list->items[z]->text,options->mask_list,list->src_main_list);
		 //zapytaj co dalej, jesli poszlo nie tak podczas przygotowan lub szukania
		 if (ret!=0 ? ts::cstr::cmpex((char*)execute_event((char*)ON_ERROR,ts::cstr::itoa(GetLastError()),"MB_OKCANCEL"),(char*)"CANCEL") : false)
				{progress->cancel = true;
		 goto GOTO_prepare_EXIT;
		}
		 else continue;
   	}
   }
else
if (options->operation==OPERATION_CHECKSUM || options->operation==OPERATION_COPY || options->operation==OPERATION_MOVE || options->operation==OPERATION_ENCODE || options->operation==OPERATION_DECODE)
   {
		for (z = 0; z < options->src_init_list->items.count && progress->cancel==0; z++)
		for (d = 0; d < options->dst_init_list->items.count && progress->cancel==0; d++) // X Bar loop mix all source to multiple destinations
		{
		 ret = 0;

		 ts::text::fix_file_path(temp_lpSource->c_str(),options->src_init_list->items[z]->text);
		 if (ts::cstr::len(temp_lpSource->c_str()) > 3)
		{
						 f_src_file.find_data.hand =FindFirstFileA(options->src_init_list->items[z]->text,&f_src_file.find_data.data);
		 if (f_src_file.find_data.hand==INVALID_HANDLE_VALUE)
			{ret =true;
			 SetLastError(ERROR_FILE_NOT_FOUND);
			}
			 else FindClose(f_src_file.find_data.hand);
		}

		 ts::text::fix_file_path(temp_lpDestination->c_str(), options->dst_init_list->items[d]->text);
		 if (ts::cstr::len(temp_lpDestination->c_str()) > 3)
		{
								f_dst_file.find_data.hand =FindFirstFileA(options->dst_init_list->items[d]->text,&f_dst_file.find_data.data);
			if (f_dst_file.find_data.hand==INVALID_HANDLE_VALUE)
		   {ret =true;
			SetLastError(ERROR_FILE_NOT_FOUND);
		   }
		else FindClose(f_dst_file.find_data.hand);
		}

		 ts::text::fix_file_path(temp_lpSource->c_str(), options->src_init_list->items[z]->text);
		 ts::text::upr(temp_lpSource->c_str());
		 ts::cstr::add(temp_lpSource->c_str(),"\\");
		 ts::text::fix_file_path(temp_lpDestination->c_str(), options->dst_init_list->items[d]->text);
		 ts::text::upr(temp_lpDestination->c_str());
		 ts::cstr::add(temp_lpDestination->c_str(),"\\");

		 if (ts::cstr::pos(temp_lpDestination->c_str(),0,temp_lpSource->c_str())>=0)
		{ret =1;
		 SetLastError(EPT_S_CANT_PERFORM_OP);
		}

   	 //jesli ok szukaj
	 if (ret==0)
				 ret = !f_file_seeker->execute(options->src_init_list->items[z]->text,options->mask_list,list->src_main_list);
	 if (ret==0)
				 ret = !f_create_destination_list(options->dst_init_list->items[d]->text);
	 //zapytaj co dalej, jesli posz³o nie tak
		 if (ret!=0 ? ts::cstr::cmpex((char*)execute_event((char*)ON_ERROR,ts::cstr::itoa(GetLastError()),"MB_OKCANCEL"),(char*)"CANCEL") : false)
				{progress->cancel = true;
		 goto GOTO_prepare_EXIT;
		}
	 //jesli ok, sprawdŸ wolne miejsce, stan urzadzenia itd.
		 if (check_environment(ts::text::extract_fileroot(temp_lpDestination->c_str(),options->dst_init_list->items[d]->text),progress->src_all->size,progress->dst_all->size,true,true) < 0)
				{progress->cancel = true;
			 goto GOTO_prepare_EXIT;
		}
	}
   }
//----------------------------
f_text_stack->pop(2);
return 1;

GOTO_prepare_EXIT:
f_text_stack->pop(2);
return 0;
}
//---------------------------------------------------------------------------
__int32	  __stdcall ts::__kop32_class::execute_selected(__int32 a_item)
{
return f_execute_one_item(a_item, options->operation);
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::execute_all(void) {
ts::__cstr_class  *templp	= f_text_stack->push(512);
int d; char *ret = "1";

if (options->ask_at_break==REPLACE_ASK_USER)
   {
				ret = (char*)execute_event(ON_ASK_USER,0,"MB_YESNOCANCEL");
		if (!ts::cstr::cmpex(ret,"OK") && !ts::cstr::cmpex(ret,"YES"))
		   {progress->cancel = false;
		goto GOTO_distribute_EXIT;
	   }
   }
if (options->operation==OPERATION_REMOVE || options->operation==OPERATION_LIST)
   {list->inc_i = -1;
	list->start_i = list->src_main_list->items.count-1;
	list->cur_i = list->start_i;
   }
else
   {list->inc_i = +1;
	list->start_i =  0;
	list->cur_i = list->start_i;
   }
execute_event(ON_IO,0,0); // IO >>>>
f_write_file_thread_control = 0; //czekaj 1 startuj, 2 zakoñcz
f_write_file_thread_handle = CreateThread(NULL,0,&ts::__kop32_class::f_write_file_thread,this,0,&f_write_file_thread_id);
if (f_write_file_thread_handle==NULL) { progress->cancel = true; goto GOTO_distribute_EXIT;
   }

for (d = 0; list->cur_i >= 0 && list->cur_i < list->src_main_list->items.count && progress->cancel==0; list->cur_i+=list->inc_i)
	{
	 /// CHECK SRC
		 if (list->src_main_list->items[list->cur_i]->number[IS]!=FILE_EXISTS)
			{ continue; }

	 if (options->operation==OPERATION_CHECKSUM || options->operation==OPERATION_COPY || options->operation==OPERATION_ENCODE || options->operation==OPERATION_DECODE || options->operation==OPERATION_MOVE)  {
	 // CHECK DST
		 if (list->dst_main_list->items[list->cur_i]->number[IS]==FILE_EXISTS) {   // QUEST
	 if (options->ask_at_break==REPLACE_ASK_USER)
		{
				 ret = (char*)execute_event(ON_REPLACE,0,"MB_YESNOCANCEL"); // REPLACE
		 //
				 if (ts::cstr::cmpex(ret,"CANCEL")) // answer ->
						{progress->cancel = true;
			 continue;
			}
		 else
				 if (ts::cstr::cmpex(ret,"NOTOALL"))
			{f_skip_one_item(list->cur_i,1);
			 continue;
			}
		 else
				 if (ts::cstr::cmpex(ret,"NO"))
			{f_skip_one_item(list->cur_i,0);
			 continue;
			}
		 else
				 if (ts::cstr::cmpex(ret,"YESTOALL"))
						{d = ts::text::delimiter(list->src_main_list->items[list->cur_i]->text,'\\',-1);
			 options->ask_at_break =REPLACE_ALL;
			}
		 else
				 if (ts::cstr::cmpex(ret,"YES"))
			{// NOP
			}
		 else
			{continue;
			}
		 }
	 else
		 {
				  if (d > ts::text::delimiter(list->src_main_list->items[list->cur_i]->text,'\\',-1))
			 {list->cur_i--;
			 options->ask_at_break =REPLACE_ASK_USER;
			  continue;
			 }
		 }
	 }
	 }
	 /// GO GO GO
		 //
	 if (f_execute_one_item(list->cur_i, options->operation)==0)
		{
		 if (options->ask_at_break==REPLACE_ALL) continue;
				 if (options->ask_at_break==REPLACE_NO)  progress->cancel = true;
		 if (options->ask_at_break==REPLACE_ASK_USER)
						 progress->cancel |= !ts::cstr::cmpex((char*)execute_event(ON_ERROR,ts::cstr::itoa(GetLastError()),"MB_OKCANCEL"),"YES");
		}
		 else
				 continue;
	}
//----------------------------

if (options->operation==OPERATION_MOVE)
   {
	int all_nor_dir = options->mask_list->items.search_text(0,"*.*")>=0, ret;

		for (list->cur_i = list->src_main_list->items.count-1; progress->cancel==0 && list->cur_i >= 0; list->cur_i--)
		{
				 if (list->src_main_list->items[list->cur_i]->number[IS]!=FILE_EXISTS)
			 continue;

				 if (all_nor_dir ? false : (list->src_main_list->items[list->cur_i]->number[ATTRIB] & FILE_ATTRIBUTE_DIRECTORY)!=0)
			{continue;
			}
				 if (list->src_main_list->items[list->cur_i]->number[ATTRIB] & FILE_ATTRIBUTE_DIRECTORY)
			{
						 if (SetFileAttributesA(list->src_main_list->items[list->cur_i]->text,FILE_ATTRIBUTE_NORMAL)==false) ret=false;
			 else
								 ret = DeleteFileA(list->src_main_list->items[list->cur_i]->text);
			}
		 else
			{
						 if (SetFileAttributesA(list->src_main_list->items[list->cur_i]->text,FILE_ATTRIBUTE_NORMAL)==false) ret=false;
			 else
								 ret = DeleteFileA(list->src_main_list->items[list->cur_i]->text);
			}
		 if (ret==false)
			{
			 if (options->ask_at_break==REPLACE_ALL) continue;
						 if (options->ask_at_break==REPLACE_NO)  progress->cancel = true;
			 if (options->ask_at_break==REPLACE_ASK_USER)
								 progress->cancel |= !ts::cstr::cmpex((char*)execute_event(ON_ERROR,ts::cstr::itoa(GetLastError()),"MB_OKCANCEL"),"YES");
			}
		}
	}
else
if (options->operation==OPERATION_LIST) // save list to file
   {
		for (list->cur_i = 0; progress->cancel==0 && list->cur_i < options->dst_init_list->items.count; list->cur_i++)
		{
						 ts::cstr::mov(templp->c_str(), options->dst_init_list->items[list->cur_i]->text);
						 ts::text::upr(templp->c_str());
				 if (ts::cstr::pos(templp->c_str(),0,"CLIPBOARD:")>=0 ? !ts::cstr::cmpex(ret = ts::cstr::itoa(OpenClipboard(NULL)),"0") : 0)
			  {
			  char *tStr = ts::cstr::dup(list->output_formated_list->items.text("TEXT"));
								 SetClipboardData(CF_TEXT,tStr);
			  CloseClipboard();
			  }
		  else
			  {
						  list->output_formated_list->alias = options->dst_init_list->items[list->cur_i]->text;
						  ret = ts::cstr::itoa(list->output_formated_list->save("LINES"));
			  }
				  if (ts::cstr::cmpex(ret,"0"))
			  {
			  if (options->ask_at_break==REPLACE_ALL) continue;
						  if (options->ask_at_break==REPLACE_NO)  progress->cancel = true;
			  if (options->ask_at_break==REPLACE_ASK_USER)
										progress->cancel |= !ts::cstr::cmpex((char*)execute_event(ON_ERROR,ts::cstr::itoa(GetLastError()),"MB_OKCANCEL"),"YES");
			  }
		 }
	}
GOTO_distribute_EXIT:
f_write_file_thread_control &= 2;
Sleep(22);
TerminateThread(f_write_file_thread_handle,0);
f_write_file_thread_handle = NULL;

f_text_stack->pop(1);
if (progress->cancel==true) { return 0; }
else { return -1; }
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::f_create_destination_list(char *alpDestination) {
if (list->src_main_list->items.count==0)
	return 0;

ts::__cstr_class *lpDestination	  = f_text_stack->push(512);
ts::__cstr_class *lpSource	  = f_text_stack->push(512);
ts::text::fix_file_path(lpDestination->c_str(),alpDestination);
ts::text::fix_file_path(lpSource->c_str(),list->src_main_list->items[list->dst_main_list->items.count]->text);
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
f_text_stack->pop(2);
return 1;
}
//----------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::f_skip_one_item(__int32 aindex, __int32 a_skip_items_at_same_level) {
ts::__cstr_class  *templp = f_text_stack->push(512);
//
__int32 crt;
//
// SOURCE DIRS & FILES
//
ts::cstr::mov(templp->c_str(),list->src_main_list->items[aindex]->text);
 if (a_skip_items_at_same_level==true)
		 {ts::text::extract_file_path(templp->c_str(),templp->c_str());
	 }
for (crt = aindex; crt < list->src_main_list->items.count; crt++) {
 if (ts::cstr::pos(list->src_main_list->items[crt]->text,0,templp->c_str())==-1)
	 {break;
	 }
 progress->src_all->size -= list->src_main_list->items[crt]->number[SIZE];
 list->src_main_list->items[crt]->number[IS] = ~FILE_EXISTS;
}
if (options->operation!=OPERATION_CHECKSUM && options->operation!=OPERATION_COPY && options->operation!=OPERATION_MOVE && options->operation!=OPERATION_ENCODE && options->operation!=OPERATION_DECODE) {
goto GOTO_skip_EXIT;
}
//
// DESTINATION DIRS & FILES
//
ts::cstr::mov(templp->c_str(),list->dst_main_list->items[aindex]->text);
 if (a_skip_items_at_same_level==true)
		 {ts::text::extract_file_path(templp->c_str(),templp->c_str());
	 }
for (crt = aindex; crt < list->dst_main_list->items.count; crt++) {
 if (ts::cstr::pos(list->dst_main_list->items[crt]->text,0,templp->c_str())==-1)
	 {break;
	 }
 progress->src_all->size -= list->dst_main_list->items[crt]->number[SIZE];
 list->dst_main_list->items[crt]->number[IS] = ~FILE_EXISTS;
}
//
// CLEAR & EXIT
//
GOTO_skip_EXIT:
f_text_stack->pop(1);
return 1;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__kop32_class::f_execute_one_item(__int32 aindex, __int32 anaction) {
char  root[3] = "A:";
//
// CHECK IS THE SOURCE STILL EXISTS OR IT HAS BEEN SKIPPED BY USER?
//
if ( list->src_main_list->items[aindex]->number[IS]!=FILE_EXISTS) {
		return 0; }
//
// CHECK IS IT DIRECTORY OR FILE
//
if ((list->src_main_list->items[aindex]->number[ATTRIB] & FILE_ATTRIBUTE_DIRECTORY)==0) {
		goto GOTO_execute_FILE; }
else
execute_event(ON_PROGRESS,0,0);
//
// MOVE DIRECTORY
//
if (anaction==OPERATION_MOVE) {
		if (list->dst_main_list->items[aindex]->number[IS]==FILE_EXISTS) {
		if (SetFileAttributesA(list->dst_main_list->items[aindex]->text,list->src_main_list->items[aindex]->number[ATTRIB])==false)
		{f_skip_one_item(aindex,false);
		 return 0;
		}
	else
		{return 1;
		}
	}
		if ((((char*)list->src_main_list->items[aindex]->text)[0] | 0x20L)==(((char*)list->dst_main_list->items[aindex]->text)[0] | 0x20L)) {
		if (rename(list->src_main_list->items[aindex]->text,list->dst_main_list->items[aindex]->text)==-1)
		{f_skip_one_item(aindex,false);
		 return 0;
		}
	else
		{f_skip_one_item(aindex,true);
		 return 1;
		}
	}
	else {
	if (f_execute_one_item(aindex,OPERATION_COPY)==false)
		{f_skip_one_item(aindex,false);
		 return 0;
		}
	else
		{return 1;
		}
	}

}
if (anaction==OPERATION_REMOVE) {
		if (SetFileAttributesA(list->src_main_list->items[aindex]->text,FILE_ATTRIBUTE_NORMAL)==false)
		{f_skip_one_item(aindex,false);
		 return 0;
		}
	else
		if (remove(list->src_main_list->items[aindex]->text)==0)
		{f_skip_one_item(aindex,false);
		 return 0;
		}
	else
		{return 1;
		}
}

if (anaction==OPERATION_CHECKSUM || anaction==OPERATION_COPY || anaction==OPERATION_ENCODE || anaction==OPERATION_DECODE) {
		if (list->dst_main_list->items[aindex]->number[IS]==FILE_EXISTS) {
		if (SetFileAttributesA(list->dst_main_list->items[aindex]->text,list->src_main_list->items[aindex]->number[ATTRIB])==false)
		{f_skip_one_item(aindex,false);
		 return 0;
		}
	else
		{return 1;
		}
	}
		else
	{
		if (CreateDirectoryA(list->dst_main_list->items[aindex]->text,NULL)==0)
		{f_skip_one_item(aindex,false);
		 return 0;
		}
	else
		{return 1;
		}
	}
}
return 1;
//
GOTO_execute_FILE:
// PLIK PLIK ////////////////////////////////////////////////////////////////////////

f_src_file.hand_map = INVALID_HANDLE_VALUE;
f_src_file.hand = INVALID_HANDLE_VALUE;
f_dst_file.hand_map = INVALID_HANDLE_VALUE;
f_dst_file.hand = INVALID_HANDLE_VALUE;


execute_event(ON_PROGRESS,0,0);
//
ts::__cstr_class *templpStr1 = f_text_stack->push(512);
ts::__cstr_class *templpStr2 = f_text_stack->push(512);
//
if (anaction==OPERATION_LIST) {
progress->src_one->readed  = 0;
progress->src_one->size  = list->src_main_list->items[aindex]->number[SIZE];
progress->dst_one->readed  = 0;
progress->dst_one->size  = options->output_arguments_list->items.count;
execute_event(ON_PROGRESS,0,0);

__int32 iT;

for (iT = 0; iT < options->output_arguments_list->items.count; iT++)
	 {
		 ts::cstr::mov(templpStr1->c_str(),options->output_arguments_list->items[iT]->text);

		 ts::text::replace(templpStr1->c_str(),"#index",
										ts::cstr::itoa(aindex));
		 ts::text::replace(templpStr1->c_str(),"#base_file_path",
										ts::text::movn(templpStr2->c_str(),list->src_main_list->items[aindex]->text,list->src_main_list->items[aindex]->number[FILENAME_BASE_PATH_LEN]));
		 ts::text::replace(templpStr1->c_str(),"#file_path",
										ts::text::extract_file_path(templpStr2->c_str(),list->src_main_list->items[aindex]->text));
		 ts::text::replace(templpStr1->c_str(),"#file_path_and_name",
										list->src_main_list->items[aindex]->text);
		 ts::text::replace(templpStr1->c_str(),"#relative_file_path_and_name",
										ts::cstr::substr_end(templpStr2->c_str(),list->src_main_list->items[aindex]->text,list->src_main_list->items[aindex]->number[FILENAME_BASE_PATH_LEN]+1,strlen(list->src_main_list->items[aindex]->text)));
		 ts::text::replace(templpStr1->c_str(),"#file_name",
										ts::text::extract_file_name(templpStr2->c_str(),list->src_main_list->items[aindex]->text));
		 ts::text::replace(templpStr1->c_str(),"#file_creation_time_t",
										ts::cstr::itoa(list->src_main_list->items[aindex]->number[FILE_CREATION_DATE]));
		 ts::text::replace(templpStr1->c_str(),"#file_modified_time_t",
										ts::cstr::itoa(list->src_main_list->items[aindex]->number[FILE_MODIFIED_DATE]));
		 ts::text::replace(templpStr1->c_str(),"#file_accessed_time_t",
										ts::cstr::itoa(list->src_main_list->items[aindex]->number[FILE_ACCESSED_DATE]));
		 ts::text::replace(templpStr1->c_str(),"#attribute",
										ts::cstr::itoa(list->src_main_list->items[aindex]->number[ATTRIB]));
		 ts::text::replace(templpStr1->c_str(),"#size",
										ts::cstr::itoa(list->src_main_list->items[aindex]->number[SIZE]));
		 list->output_formated_list->items.add(ts::CHAR_TO_DATABASE_ATOM(templpStr1->c_str()));

		 //out_list_item_size = ts::cstr::strlen(templpStr1->c_str());
	 }
progress->src_one->readed  = progress->src_one->size;
progress->src_all->readed += progress->src_one->size;
progress->dst_one->readed  = progress->dst_one->size;
progress->dst_all->readed += progress->dst_one->size;
execute_event(ON_PROGRESS,0,0);
f_text_stack->pop(2);
return 1;
}
else
if (anaction==OPERATION_MOVE) {
if ((((char*)list->src_main_list->items[aindex]->text)[0] | 0x20L)==(((char*)list->dst_main_list->items[aindex]->text)[0] | 0x20L)) // | 0x20L dla uzyskania ma³ych liter
	{
	f_src_file.readed = 0;
		f_src_file.size = list->src_main_list->items[aindex]->number[SIZE];
	f_dst_file.readed = 0;
		f_dst_file.size = list->dst_main_list->items[aindex]->number[SIZE];
	//
progress->src_one->size = f_src_file.size;
progress->dst_one->size = f_dst_file.size;
execute_event(ON_PROGRESS,0,0);
	//
		if (list->dst_main_list->items[aindex]->number[IS]==FILE_EXISTS) {
		if (SetFileAttributesA(list->dst_main_list->items[aindex]->text,FILE_ATTRIBUTE_NORMAL)==false)
		{f_skip_one_item(aindex,false);
								 f_text_stack->pop(2);
		 return 0;
		}
	else
		if (remove(list->dst_main_list->items[aindex]->text)==0)
		{f_skip_one_item(aindex,false);
								 f_text_stack->pop(2);
		 return 0;
		}
	}
		if (rename(list->src_main_list->items[aindex]->text,list->dst_main_list->items[aindex]->text)==false)
		{f_skip_one_item(aindex,false);
				 execute_event(ON_PROGRESS,0,0);
								 f_text_stack->pop(2);
		 return 0;
		}
	else
		{f_skip_one_item(aindex,false);
				 execute_event(ON_PROGRESS,0,0);
								 f_text_stack->pop(2);
		 return 1;
		}
	}
else
	{
	if (f_execute_one_item(aindex,OPERATION_COPY)==false)
		{f_skip_one_item(aindex,false);
				 execute_event(ON_PROGRESS,0,0);
								 f_text_stack->pop(2);
		 return 0;
		}
	else
				{execute_event(ON_PROGRESS,0,0);
								 f_text_stack->pop(2);
		 return 1;
		}
	}
}
else
if (anaction==OPERATION_REMOVE) {
				f_src_file.size = list->src_main_list->items[aindex]->number[SIZE];
		f_src_file.readed = 0;
progress->src_one->size = f_src_file.size;
execute_event(ON_PROGRESS,0,0);
//
		if (SetFileAttributesA(list->src_main_list->items[aindex]->text,FILE_ATTRIBUTE_NORMAL)==false)
		{f_skip_one_item(aindex,false);
				 execute_event(ON_PROGRESS,0,0);
								 f_text_stack->pop(2);
		 return 0;
		}
	else
		if (remove(list->src_main_list->items[aindex]->text)==0)
		{f_skip_one_item(aindex,false);
				 execute_event(ON_PROGRESS,0,0);
								 f_text_stack->pop(2);
		 return 0;
		}
	else
		{f_src_file.readed += f_src_file.size;
progress->src_one->readed += f_src_file.size;
progress->src_all->readed += f_src_file.size;
execute_event(ON_PROGRESS,0,0);
f_text_stack->pop(2);
return 1;
		}
}
else
if (anaction==OPERATION_CHECKSUM || anaction==OPERATION_COPY || anaction==OPERATION_ENCODE || anaction==OPERATION_DECODE) {
file_header::__eno_header_struct hdr;
file_header::__eno_block_header_struct b_hdr;
f_src_file.hand = INVALID_HANDLE_VALUE;
f_src_file.hand_map = INVALID_HANDLE_VALUE;
f_src_file.readed = 0;
f_src_file.size = list->src_main_list->items[aindex]->number[SIZE];
f_dst_file.hand = INVALID_HANDLE_VALUE;
f_dst_file.hand_map = INVALID_HANDLE_VALUE;
f_dst_file.readed = 0;
f_dst_file.size = list->dst_main_list->items[aindex]->number[SIZE];
	//
progress->src_one->readed  = 0;
progress->src_one->size  = f_src_file.size;
progress->src_all->readed += 0;

progress->dst_one->readed  = 0;
progress->dst_one->size  = f_dst_file.size;
progress->dst_all->readed += 0;

execute_event(ON_PROGRESS,0,0);
	 //
				root[0] = ((char*)list->dst_main_list->items[aindex]->text)[0];
		if (check_environment(root,list->src_main_list->items[aindex]->number[SIZE],list->dst_main_list->items[aindex]->number[SIZE],true,false) < 0)
				{progress->cancel = true;
		 goto GOTO_execute_IO_ERROR;
		}
	 // Open src >>
		f_src_file.hand = CreateFileA(list->src_main_list->items[aindex]->text,
										GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING,
										FILE_FLAG_SEQUENTIAL_SCAN, NULL);
	if (f_src_file.hand==INVALID_HANDLE_VALUE)
		{goto GOTO_execute_IO_ERROR;
		}
	 // Open dst >>
		if (list->dst_main_list->items[aindex]->number[IS]==FILE_EXISTS)
						SetFileAttributesA(list->dst_main_list->items[aindex]->text,FILE_ATTRIBUTE_NORMAL);
		f_dst_file.hand = CreateFileA(list->dst_main_list->items[aindex]->text,
										GENERIC_READ|GENERIC_WRITE, FILE_SHARE_DELETE, NULL, CREATE_ALWAYS,
										FILE_ATTRIBUTE_ARCHIVE, f_src_file.hand);
	if (f_dst_file.hand==INVALID_HANDLE_VALUE)
		{goto GOTO_execute_IO_ERROR;
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

		f_dst_file.hand_map = CreateFileMapping(f_dst_file.hand, NULL,
														PAGE_READWRITE|SEC_RESERVE,
														0,sizeof(file_header::__eno_header_struct),NULL);
						f_dst_file.map.lptr = MapViewOfFile(f_dst_file.hand_map,FILE_MAP_WRITE,0,0,sizeof(file_header::__eno_header_struct));
				if (f_dst_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
		hdr.signature  = ENO_HEADER_SIG;
		hdr.size = f_src_file.size;
				ts::mem32::mov(f_dst_file.map.lptr,(void*)&hdr,sizeof(file_header::__eno_header_struct));
		f_dst_file.readed += sizeof(file_header::__eno_header_struct);
		if (options->block_is_cached==0)
				FlushViewOfFile(f_dst_file.map.lptr,sizeof(file_header::__eno_block_header_struct));
				UnmapViewOfFile(f_dst_file.map.lptr);
		CloseHandle(f_dst_file.hand_map);
		//
progress->src_one->readed = f_src_file.readed;
progress->src_one->size = f_src_file.size;
progress->src_all->readed += 0;

progress->dst_one->readed = f_dst_file.readed;
progress->dst_one->size = f_dst_file.size;
progress->dst_all->readed += sizeof(file_header::__eno_header_struct);

execute_event(ON_PROGRESS,0,0);
		}
	else
	if (anaction==OPERATION_DECODE)
		{
		f_src_file.readed = 0;
		f_src_file.size = GetFileSize(f_src_file.hand, NULL);
		f_src_file.hand_map = CreateFileMapping(f_src_file.hand, NULL,
														PAGE_READONLY|SEC_RESERVE,
														0,sizeof(file_header::__eno_header_struct),NULL);
				f_src_file.map.lptr = MapViewOfFile(f_src_file.hand_map, FILE_MAP_READ,0,0,sizeof(file_header::__eno_header_struct));
				if (f_src_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
				ts::mem32::mov((void*)&hdr,f_src_file.map.lptr,sizeof(file_header::__eno_header_struct));
		f_src_file.readed += sizeof(file_header::__eno_header_struct);
				UnmapViewOfFile(f_src_file.map.lptr);
		CloseHandle(f_src_file.hand_map);
		if (hdr.signature!=ENO_HEADER_SIG)
			{SetLastError(ERROR_INVALID_DATATYPE);
			 goto GOTO_execute_IO_ERROR;
			}
		f_dst_file.readed = 0;
		f_dst_file.size = hdr.size;
		//
progress->src_one->readed = f_src_file.readed;
progress->src_one->size = f_src_file.size;
progress->src_all->readed += sizeof(file_header::__eno_header_struct);

progress->dst_one->readed = f_dst_file.readed;
progress->dst_one->size = f_dst_file.size;
progress->dst_all->readed += 0;

execute_event(ON_PROGRESS,0,0);
		}
	//
				root[0] = ((char*)list->dst_main_list->items[aindex]->text)[0];
		if (check_environment(root,f_dst_file.size,list->dst_main_list->items[aindex]->number[SIZE],true,false) < 0)
				{progress->cancel = true;
		 goto GOTO_execute_IO_ERROR;
		}
	 // map src >>
	f_src_file.hand_map = CreateFileMapping(f_src_file.hand, NULL,
												PAGE_READONLY|SEC_RESERVE,
												0,f_src_file.size,NULL);
	if (f_src_file.hand_map==INVALID_HANDLE_VALUE)
		{goto GOTO_execute_IO_ERROR;
		}
	 // map dst >>
	f_dst_file.hand_map = CreateFileMapping(f_dst_file.hand, NULL,
												PAGE_READWRITE|SEC_RESERVE,
												0,f_dst_file.size,NULL);
	if (f_dst_file.hand_map==INVALID_HANDLE_VALUE)
		{goto GOTO_execute_IO_ERROR;
		}
	//
	// START MOVE
	//
execute_event(ON_PROGRESS,0,0);
	//
	if (anaction==OPERATION_CHECKSUM) {
				for (;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
		{
				f_src_file.map.size = f_src_file.size -f_src_file.readed;
								if (f_src_file.map.size > options->block_size) f_src_file.map.size = options->block_size;
				f_src_file.map.offset = f_src_file.readed % 65536;
				f_src_file.map.lptr = MapViewOfFile(f_src_file.hand_map, FILE_MAP_READ, 0,
								f_src_file.readed - f_src_file.map.offset, f_src_file.map.size + f_src_file.map.offset);
				if (f_src_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
		f_mem_buffer_stack.index=0;

		if (options->checksum & CHECKSUM_SSC1024)
												{f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr = (void*)ts::hash::ssc1::calc_SSC1((void*)((ULONG)f_src_file.map.lptr + f_src_file.map.offset),f_src_file.map.size,1024);
								 f_mem_buffer_stack.map[f_mem_buffer_stack.index].size = 1024/8;
				}
				f_dst_file.map.size = f_mem_buffer_stack.map[f_mem_buffer_stack.index].size;
				f_dst_file.map.offset = f_dst_file.readed % 65536;
				f_dst_file.map.lptr = MapViewOfFile(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
								f_dst_file.readed - f_dst_file.map.offset, f_dst_file.map.size + f_dst_file.map.offset);
				if (f_dst_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
				ts::mem32::mov((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset), f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
				f_src_file.readed += f_src_file.map.size;
				UnmapViewOfFile(f_src_file.map.lptr);
				f_dst_file.readed += f_dst_file.map.size;
		if (options->block_is_cached==0)
				FlushViewOfFile((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset),f_dst_file.map.size);
				UnmapViewOfFile(f_dst_file.map.lptr);

progress->src_one->readed  = f_src_file.readed;
progress->src_one->size = f_src_file.size;
progress->src_all->readed += f_src_file.map.size;

progress->dst_one->readed = 1024/8;
progress->dst_one->size = f_dst_file.size;
progress->dst_all->readed += f_dst_file.map.size;

execute_event(ON_PROGRESS,0,0);
		}
	}
else
	if (anaction==OPERATION_COPY) {

				f_mem_buffer_stack.index=0; f_mem_buffer_stack.count=2;
				f_mem_buffer_stack.previous_index=0;

				for (;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
		{
				f_src_file.map.size = f_src_file.size -f_src_file.readed;
								if (f_src_file.map.size > options->block_size) f_src_file.map.size = options->block_size;
				f_src_file.map.offset = f_src_file.readed % 65536;
				f_src_file.map.lptr = MapViewOfFile(f_src_file.hand_map, FILE_MAP_READ, 0,
																						f_src_file.readed - f_src_file.map.offset, f_src_file.map.size + f_src_file.map.offset);
				if (f_src_file.map.lptr==NULL) {goto GOTO_execute_IO_ERROR;
			}
				f_mem_buffer_stack.map[f_mem_buffer_stack.index].size = f_src_file.map.size;
				f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
				ts::mem32::mov(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,(void*)((ULONG)f_src_file.map.lptr + f_src_file.map.offset),f_src_file.map.size);
				f_src_file.readed += f_src_file.map.size;
				UnmapViewOfFile(f_src_file.map.lptr);
progress->src_one->readed  = f_src_file.readed;
progress->src_one->size = f_src_file.size;
progress->src_all->readed += f_src_file.map.size;

				//
		// ewentualne operacje na bufferze
		// ...
		//
				DWORD x;
				if (f_write_file_thread_handle==NULL) goto GOTO_execute_IO_ERROR;
				if (GetExitCodeThread(f_write_file_thread_handle,&x)==0) goto GOTO_execute_IO_ERROR;
				if (x!=STILL_ACTIVE) goto GOTO_execute_IO_ERROR; // jesli nie to przerwij natychmiast

				while (f_write_file_thread_control & 1) { Sleep(1); execute_event(ON_PROGRESS,0,0); } // dopuki system nie zakoñczy poprzedniej procedury zapisu czekaj
				   if (f_write_file_thread_control & 4) goto GOTO_execute_IO_ERROR; // zapisywanie zakoñczone ale niepoprawnie
f_mem_buffer_stack.previous_index = f_mem_buffer_stack.index;
						  if (f_mem_buffer_stack.index==f_mem_buffer_stack.count) f_mem_buffer_stack.index =0;
						 else f_mem_buffer_stack.index++;

				f_write_file_thread_control = 1; //startuj kolejny zapis
//		  SwitchToThread();
				// doputy czekaj, pusci na jej starcie, a dalej sobie bedzie leciala równolegle,
				// wtedy dokona kolejnego odczytu w kolejnej petli i poczeka na zakoñczenie zapisu po jej zakoczeniu



/*				f_dst_file.map.size = f_mem_buffer_stack.map[f_mem_buffer_stack.previous_index].size;
				f_dst_file.map.offset = f_dst_file.readed % 65536;
				f_dst_file.map.lptr = MapViewOfFile(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
								f_dst_file.readed - f_dst_file.map.offset, f_dst_file.map.size + f_dst_file.map.offset);
				if (f_dst_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
				ts::mem32::mov((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset), (void*)f_mem_buffer_stack.map[f_mem_buffer_stack.previous_index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.previous_index].size);
				ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.previous_index].lptr);
				f_dst_file.readed += f_dst_file.map.size;
		if (options->block_is_cached==0)
				FlushViewOfFile((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset),f_dst_file.map.size);
				UnmapViewOfFile(f_dst_file.map.lptr);
*/
progress->dst_one->readed = f_dst_file.readed;
progress->dst_one->size = f_dst_file.size;
progress->dst_all->readed += f_dst_file.map.size;

execute_event(ON_PROGRESS,0,0);
		}
	}
else
	if (anaction==OPERATION_ENCODE) {
				for	(;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
		{
		//
																f_src_file.map.size = f_src_file.size -f_src_file.readed;
								if (f_src_file.map.size > options->block_size) f_src_file.map.size = options->block_size;
				f_src_file.map.offset = f_src_file.readed % 65536;
				f_src_file.map.lptr = MapViewOfFile(f_src_file.hand_map, FILE_MAP_READ, 0,
																										 f_src_file.readed - f_src_file.map.offset,
																										 f_src_file.map.size + f_src_file.map.offset);
				if (f_src_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
		f_mem_buffer_stack.index=0;
				f_mem_buffer_stack.map[f_mem_buffer_stack.index].size = f_src_file.map.size;
				f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
				ts::mem32::mov(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,(void*)((ULONG)f_src_file.map.lptr + f_src_file.map.offset),f_src_file.map.size);
		f_mem_buffer_stack.count=1;

		if (options->coder & ENO_CODER_BWT) {
				f_mem_buffer_stack.map[f_mem_buffer_stack.count].size = f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size + BWT_TRASH_BPB(f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size,options->coder_LZS_dict_size);
		f_mem_buffer_stack.count++;}
		if (options->coder & ENO_CODER_LZS) {
				f_mem_buffer_stack.map[f_mem_buffer_stack.count].size = f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size + LZS_TRASH_BPB(f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size,options->coder_LZS_dict_size);
		f_mem_buffer_stack.count++;}
		if (options->coder & ENO_CODER_HUF) {
				f_mem_buffer_stack.map[f_mem_buffer_stack.count].size = f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size + HUF_TRASH_BPB(f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size);
		f_mem_buffer_stack.count++;}
		if (options->coder & ENO_CODER_ARI) {
				f_mem_buffer_stack.map[f_mem_buffer_stack.count].size = f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size + ARI_TRASH_BPB(f_mem_buffer_stack.map[f_mem_buffer_stack.count-1].size);
		f_mem_buffer_stack.count++;}
		//
		// transformacja Burrowsa-Wheelra
		if (options->coder & ENO_CODER_BWT)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size+1);
						 f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size = ts::compression::compress_BWT(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index++;
			}
		// kompresja LZS
		if (options->coder & ENO_CODER_LZS)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size+1);
						 f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size = ts::compression::compress_LZS(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index++;
			}
		// kodowanie MTF
		if (options->coder & ENO_CODER_MTF)
						{ts::cipher::cript_MTF(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
			}
		// kompresja HUFFMANA
		if (options->coder & ENO_CODER_HUF)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size+1);
						 f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size = ts::compression::compress_HUF(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index++;
			}
				// kompresja ARYTMETYCZNA
		if (options->coder & ENO_CODER_ARI)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size+1);
						 f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].size = ts::compression::compress_ARI(f_mem_buffer_stack.map[f_mem_buffer_stack.index+1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->coder_LZS_dict_size);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index++;
			}
		// QDRowanie
		if (options->coder & ENO_CODER_ROT)
						{ts::cipher::cript_ROT(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->password->text.size());
			}
		// Xorowanie
		if (options->coder & ENO_CODER_XOR)
						{ts::cipher::cript_XOR(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->password->text.get(),options->password->text.size());
			}
				// FILE INTEGRITY PROTECTION 32bit CHECKSUM
				if (options->coder & ENO_CODER_SSC)
						{b_hdr.data_protection_code = ts::hash::ssc1::calc_SSC1(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,32)[0];
			}
				else
				if (options->coder & ENO_CODER_CRC)
						{b_hdr.data_protection_code = ts::hash::crc32::calc_CRC32(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
			}
		// naglowek
				f_dst_file.map.size = f_mem_buffer_stack.map[f_mem_buffer_stack.index].size;
				f_dst_file.map.offset = f_dst_file.readed % 65536;
				f_dst_file.map.lptr = MapViewOfFile(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
								f_dst_file.readed - f_dst_file.map.offset, sizeof(file_header::__eno_block_header_struct) + f_dst_file.map.size + f_dst_file.map.offset);
				if (f_dst_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
				ts::mem32::set((void*)&b_hdr.size,0,sizeof(b_hdr.size));
		b_hdr.signature = ENO_BLOCK_HEADER_SIG;
		b_hdr.signature_version = 0x0001;
		b_hdr.data_range = f_src_file.readed;
		b_hdr.data_compression_coder = options->coder;
				b_hdr.s_count = f_mem_buffer_stack.count;
				for (__int32 i = 0; i < f_mem_buffer_stack.count; i++) {b_hdr.size[i] = (__int32)f_mem_buffer_stack.map[i].size;
			 }
				ts::mem32::mov((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset),(void*)&b_hdr,sizeof(file_header::__eno_block_header_struct));
		f_dst_file.readed += sizeof(file_header::__eno_block_header_struct);
				ts::mem32::mov((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset + sizeof(file_header::__eno_block_header_struct)),f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
				f_src_file.readed += f_src_file.map.size;
//		if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
				UnmapViewOfFile((void*)f_src_file.map.lptr);
				f_dst_file.readed += f_dst_file.map.size;
								if (options->block_is_cached==0) FlushViewOfFile((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset),f_dst_file.map.size + sizeof(file_header::__eno_block_header_struct));
				UnmapViewOfFile((void*)f_dst_file.map.lptr);

progress->src_one->readed  = f_src_file.readed;
progress->src_one->size  = f_src_file.size;
progress->src_all->readed += f_src_file.map.size;
progress->dst_one->readed  = f_dst_file.readed;
progress->dst_one->size  = f_dst_file.size;
progress->dst_all->readed += f_dst_file.map.size;
progress->dst_all->readed += sizeof(file_header::__eno_block_header_struct);
execute_event(ON_PROGRESS,0,0);
		}
	}
else
	if (anaction==OPERATION_DECODE) {
  for (;progress->cancel==0 && f_src_file.readed < f_src_file.size;)
		{
		// naglowek
				f_src_file.map.size = sizeof(file_header::__eno_block_header_struct);
				f_src_file.map.offset = f_src_file.readed % 65536;
				f_src_file.map.lptr = MapViewOfFile(f_src_file.hand_map, FILE_MAP_READ, 0,
								f_src_file.readed - f_src_file.map.offset,sizeof(file_header::__eno_block_header_struct) + f_src_file.map.offset);
				ts::mem32::mov((void*)&b_hdr,(void*)((ULONG)f_src_file.map.lptr + f_src_file.map.offset),sizeof(file_header::__eno_block_header_struct));
		f_src_file.readed += sizeof(file_header::__eno_block_header_struct);
		f_mem_buffer_stack.count=1;
		//
		if (b_hdr.signature_version!=0x0001)
			{SetLastError(ERROR_INVALID_DATATYPE);
			 goto GOTO_execute_IO_ERROR;
			}
		if (b_hdr.data_compression_coder & ENO_CODER_ARI)
		{f_mem_buffer_stack.count++;}
		if (b_hdr.data_compression_coder & ENO_CODER_HUF)
		{f_mem_buffer_stack.count++;}
		if (b_hdr.data_compression_coder & ENO_CODER_LZS)
		{f_mem_buffer_stack.count++;}
		if (b_hdr.data_compression_coder & ENO_CODER_BWT)
		{f_mem_buffer_stack.count++;}

//				f_mem_buffer_stack.count = b_hdr.s_count;
				for (__int32 i = 0; i < f_mem_buffer_stack.count; i++)
				{f_mem_buffer_stack.map[i].size = b_hdr.size[i];
			}
				UnmapViewOfFile((void*)f_src_file.map.lptr);
		if (b_hdr.signature!=ENO_BLOCK_HEADER_SIG)
			{SetLastError(ERROR_INVALID_DATATYPE);
			 goto GOTO_execute_IO_ERROR;
			}
		f_mem_buffer_stack.index = f_mem_buffer_stack.count-1;
		//
				f_src_file.map.size = f_mem_buffer_stack.map[f_mem_buffer_stack.index].size;
				f_src_file.map.offset = f_src_file.readed % 65536;
				f_src_file.map.lptr = MapViewOfFile(f_src_file.hand_map, FILE_MAP_READ, 0,
								f_src_file.readed - f_src_file.map.offset, f_src_file.map.size + f_src_file.map.offset);
				if (f_src_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
				f_mem_buffer_stack.map[f_mem_buffer_stack.index].size = f_src_file.map.size;
				f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
				ts::mem32::mov(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,(void*)((ULONG)f_src_file.map.lptr + f_src_file.map.offset),f_src_file.map.size);

		if (b_hdr.data_compression_coder & ENO_CODER_SSC) {
				if (b_hdr.data_protection_code!=ts::hash::ssc1::calc_SSC1(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,32)[0])
			{SetLastError(ERROR_CRC);
			 goto GOTO_execute_IO_ERROR;
			}
		}
		else {
		if (b_hdr.data_compression_coder & ENO_CODER_CRC) {
				if (b_hdr.data_protection_code!=ts::hash::crc32::calc_CRC32(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size))
			{SetLastError(ERROR_CRC);
			 goto GOTO_execute_IO_ERROR;
			}
		}}
		// DEXORowanie
		if (b_hdr.data_compression_coder & ENO_CODER_XOR)
						{ts::cipher::uncript_XOR(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->password->text.get(),options->password->text.size());
			}
		// DEQDRowanie
		if (b_hdr.data_compression_coder & ENO_CODER_ROT)
						{ts::cipher::uncript_ROT(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size,options->password->text.size());
			}
		// DEkompresja ARI
		if (b_hdr.data_compression_coder & ENO_CODER_ARI)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size+1);
						 ts::compression::uncompress_ARI(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index--;
			 }
		// DEkompresja HUF
		if (b_hdr.data_compression_coder & ENO_CODER_HUF)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size+1);
						 ts::compression::uncompress_HUF(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index--;
			 }
		// DEkodowanie MTF
		if (b_hdr.data_compression_coder & ENO_CODER_MTF)
						{ts::cipher::uncript_MTF(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
			}
		// DEkompresja LZS
		if (b_hdr.data_compression_coder & ENO_CODER_LZS)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size+1);
						 ts::compression::uncompress_LZS(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index--;
			 }
		// DEkompresja Burrowsa-Wheelra
		if (b_hdr.data_compression_coder & ENO_CODER_BWT)
						{f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr = ts::mem32::alloc(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size+1);
						 ts::compression::uncompress_BWT(f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index-1].size,f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
//			 if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
						 ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
			 f_mem_buffer_stack.index--;
			}
				f_dst_file.map.size = f_mem_buffer_stack.map[f_mem_buffer_stack.index].size;
				f_dst_file.map.offset = f_dst_file.readed % 65536;
				f_dst_file.map.lptr = MapViewOfFile(f_dst_file.hand_map, FILE_MAP_WRITE, 0,
								f_dst_file.readed - f_dst_file.map.offset, f_dst_file.map.size + f_dst_file.map.offset);
				if (f_dst_file.map.lptr==NULL)
			{goto GOTO_execute_IO_ERROR;
			}
				ts::mem32::mov((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset),f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr,f_mem_buffer_stack.map[f_mem_buffer_stack.index].size);
				f_src_file.readed += f_src_file.map.size;
				UnmapViewOfFile(f_src_file.map.lptr);
//		if (f_mem_buffer_stack.index!=0) ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
				ts::mem32::free(f_mem_buffer_stack.map[f_mem_buffer_stack.index].lptr);
		if (options->block_is_cached==0)
				FlushViewOfFile((void*)((ULONG)f_dst_file.map.lptr + f_dst_file.map.offset),f_dst_file.map.size);
				UnmapViewOfFile(f_dst_file.map.lptr);
				f_dst_file.readed += f_dst_file.map.size;

progress->src_one->readed  = f_src_file.readed;
progress->src_one->size  = f_src_file.size;
progress->src_all->readed += f_src_file.map.size;
progress->src_all->readed += sizeof(file_header::__eno_block_header_struct);
progress->dst_one->readed  = f_dst_file.readed;
progress->dst_one->size  = f_dst_file.size;
progress->dst_all->readed += f_dst_file.map.size;
execute_event(ON_PROGRESS,0,0);
		}
	}
//------------------------------------------
	GOTO_execute_IO_DONE:
//------------------------------------------
		CloseHandle(f_src_file.hand_map);
		CloseHandle(f_dst_file.hand_map);
			SetFilePointer(f_dst_file.hand, f_dst_file.readed, 0, FILE_BEGIN); SetEndOfFile(f_dst_file.hand);
				//
				// SET THE FILE ATTRIBUTES AND DATES BASED ON SOURCE FILE
				//
		FILETIME creation,lastaccess, lastwrite;
		if (anaction==OPERATION_CHECKSUM || anaction==OPERATION_COPY)
						{GetFileTime(f_src_file.hand,&creation,&lastaccess,&lastwrite);
				 SetFileTime(f_dst_file.hand,&creation,&lastaccess,&lastwrite);
						}
		CloseHandle(f_src_file.hand);
		CloseHandle(f_dst_file.hand);
				//
				// CHECK AGAIN IS ALL TRANSFERRED? IN THIS PLACE YOU COULD ADD CRC,ADLER, MD5 LAST CHECKER!
				//
		if (f_src_file.readed < f_src_file.size)
						{SetFileAttributesA(list->dst_main_list->items[f_mem_buffer_stack.index]->text,FILE_ATTRIBUTE_NORMAL);
						 DeleteFileA(list->dst_main_list->items[f_mem_buffer_stack.index]->text);
			}
				//
				// WHATEVER RETURN POSITIVE!
				//
execute_event(ON_PROGRESS,0,0);
f_text_stack->pop(2);
return 1;
//------------------------------------------
	GOTO_execute_IO_ERROR:
//------------------------------------------
		while (f_write_file_thread_control & 1) { Sleep(1); execute_event(ON_PROGRESS,0,0); } // dopuki system nie zakoñczy poprzedniej procedury zapisu czekaj
		f_write_file_thread_control = 0;

				if (f_src_file.hand_map!=INVALID_HANDLE_VALUE)
			 CloseHandle(f_src_file.hand_map);
		if (f_dst_file.hand_map!=INVALID_HANDLE_VALUE)
			 CloseHandle(f_dst_file.hand_map);
		if (f_src_file.hand!=INVALID_HANDLE_VALUE)
			 CloseHandle(f_src_file.hand);
		if (f_dst_file.hand!=INVALID_HANDLE_VALUE)
			 CloseHandle(f_dst_file.hand);
				//
				// DELETE THE INCOMPLETE FILE!
				//
		if (f_dst_file.hand!=INVALID_HANDLE_VALUE)
						{SetFileAttributesA(list->dst_main_list->items[f_mem_buffer_stack.index]->text,FILE_ATTRIBUTE_NORMAL);
						 DeleteFileA(list->dst_main_list->items[f_mem_buffer_stack.index]->text);
			}
progress->src_all->readed -= progress->src_one->readed;
progress->src_all->size -= progress->src_one->size;
progress->src_one->readed  = 0;
progress->src_one->size  = 1;
progress->dst_all->readed -= progress->dst_one->readed;
progress->dst_all->size -= progress->dst_one->size;
progress->dst_one->readed  = 0;
progress->dst_one->size  = 1;
execute_event(ON_PROGRESS,0,0);
f_text_stack->pop(2);
return 0;
//------------------------------------------
	}
//GOTO_execute_EXIT:
f_text_stack->pop(2);
return 1;
}
//---------------------------------------------------------------------------

DWORD WINAPI ts::__kop32_class::f_write_file_thread(LPVOID a_caller)
{
register ts::__kop32_class *caller_kop32 = (ts::__kop32_class*)a_caller;

 while ((caller_kop32->f_write_file_thread_control & 2) == 0) {
		if ((caller_kop32->f_write_file_thread_control & 1) != 0) {

				//int i =  caller_kop32->f_mem_buffer_stack.previous_index;

				caller_kop32->f_dst_file.map.size = caller_kop32->f_mem_buffer_stack.map[caller_kop32->f_mem_buffer_stack.previous_index].size;
				caller_kop32->f_dst_file.map.offset = caller_kop32->f_dst_file.readed % 65536;
				caller_kop32->f_dst_file.map.lptr = MapViewOfFile(caller_kop32->f_dst_file.hand_map, FILE_MAP_WRITE, 0,
								caller_kop32->f_dst_file.readed - caller_kop32->f_dst_file.map.offset, caller_kop32->f_dst_file.map.size + caller_kop32->f_dst_file.map.offset);
				if (caller_kop32->f_dst_file.map.lptr==NULL)
				   {caller_kop32->f_write_file_thread_control = 4;
				   }
				ts::mem32::mov((void*)((ULONG)caller_kop32->f_dst_file.map.lptr + caller_kop32->f_dst_file.map.offset), (void*)caller_kop32->f_mem_buffer_stack.map[caller_kop32->f_mem_buffer_stack.previous_index].lptr,caller_kop32->f_mem_buffer_stack.map[caller_kop32->f_mem_buffer_stack.previous_index].size);
				ts::mem32::free(caller_kop32->f_mem_buffer_stack.map[caller_kop32->f_mem_buffer_stack.previous_index].lptr);
				caller_kop32->f_dst_file.readed += caller_kop32->f_dst_file.map.size;
				if (caller_kop32->options->block_is_cached==0)
				FlushViewOfFile((void*)((ULONG)caller_kop32->f_dst_file.map.lptr + caller_kop32->f_dst_file.map.offset),caller_kop32->f_dst_file.map.size);
				UnmapViewOfFile(caller_kop32->f_dst_file.map.lptr);
				caller_kop32->f_write_file_thread_control = 0;
								SwitchToThread();
				}
else
				{
								Sleep(1);
				}
}
return 0;
}
//---------------------------------------------------------------------------

__int64 __stdcall ts::__kop32_class::check_environment(char *avolume_name, __int64 anumber_of_source_bytes, __int64 anumber_of_destination_bytes, bool acheck_until_positive, bool auser_could_ignore) {
ULARGE_INTEGER disk_UInt;
__int64 disk_real_free_space = 0;
execute_event(ON_ENV_CHECK,0,0);
__int32 user_decision_dword;
//
// CHECK IS IT DISK OR UNC NAME AND ADD TRAILING BACKSLASH "\" AT END of directory because GetDiskFreeSpaceEx needs it in UNC path!
//
if (ts::cstr::strlen(avolume_name)>1)
if (avolume_name[1]!=':')
if (avolume_name[ts::cstr::strlen(avolume_name)-1]!='\\') strcat(avolume_name,"\\");
//
//
while (::GetDiskFreeSpaceExA(avolume_name,&disk_UInt,NULL,NULL))	 {
		disk_real_free_space = disk_UInt.QuadPart + anumber_of_destination_bytes - anumber_of_source_bytes;

		if (disk_real_free_space > 0)
				break;
	if (options->ask_at_break==REPLACE_NO)
			break;
	if (auser_could_ignore==true && options->ask_at_break==REPLACE_ALL)
			break;
	if (acheck_until_positive==false)
			break;
		if (auser_could_ignore==true) user_decision_dword= ts::cstr::atoi((char*)execute_event(ON_ERROR,"ERROR_DISK_FULL","MB_ABORTRETRYIGNORE"));
	else
						user_decision_dword = ts::cstr::atoi((char*)execute_event(ON_ERROR,"ERROR_DISK_FULL","MB_RETRYCANCEL"));

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
return disk_real_free_space;
}
//---------------------------------------------------------------------------

const char* __stdcall ts::__kop32_class::execute_event(char *a_event, char *a_code, char *a_code_ex)
{
if (!callback_event_handler_ptr) return default_callback_event_handler(a_event,a_code, a_code_ex);
else return callback_event_handler_ptr(a_event,a_code,a_code_ex);
}
//---------------------------------------------------------------------------
const char* __stdcall ts::__kop32_class::default_callback_event_handler(char*, char*, char*) {
return "OK";
}
//---------------------------------------------------------------------------

__stdcall ts::__kop32_class::~__kop32_class(void)
{
		delete list; delete options;
		delete f_file_seeker; delete f_text_stack;

}
//---------------------------------------------------------------------------
