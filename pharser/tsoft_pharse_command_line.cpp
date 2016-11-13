//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_pharse_command_line.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../mem/tsoft_mem.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------
#ifndef __DEBUG_PHARSER__
#endif
//---------------------------------------------------------------------------

__stdcall ts::__pharser:: __pharser(void)
{
#ifdef __DEBUG_PHARSER__
__DEBUG_FUNC_CALLED("")
#endif
        for (register int32_t x = 0; x < 4; x++) f_result_positions[x]=-1;
}
//---------------------------------------------------------------------------

__stdcall ts::__pharser::~__pharser(void)
{
#ifdef __DEBUG_PHARSER__
__DEBUG_FUNC_CALLED("")
#endif
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::__pharser::find(const char *lpsrc, const char *lpparameter_min, const char *lpparameter_normal, const char *lpparameter_alternative, char *r_lpsuboption)
{
#ifdef __DEBUG_PHARSER__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __DEBUG_PHARSER__
ts::con::prints("__pharser::find(a_src_ptr:%s,lpparameter_min:%s,lpparameter_normal:%s,lpparameter_alternative:%s,",lpsrc,lpparameter_min,lpparameter_normal,lpparameter_alternative);
if (r_lpsuboption==NULL) ts::con::print("NULL)");
else ts::con::prints("%s)",r_lpsuboption);
ts::con::print("\n");
#endif

		f_result_base = (char*)lpsrc;
		register char *lpsrc_upr = ts::cstr::dup(lpsrc);
		ts::cstr::upr(lpsrc_upr);
/// illegal char in file name \ / : * ? " < > |

        register int32_t initiator = -1;
        register int32_t srclen = ts::cstr::len(lpsrc_upr), parameterlen;

//	register int32_t comma_separator1 = ts::cstr::delimiter(lpsrc_upr,'\"',0), comma_separator2 = -1;
//	while (comma_separator1!=-1)
//	{ comma_separator2 = ts::cstr::delimiter(lpsrc_upr,'\"',comma_separator1);
//	  if (comma_separator2!=-1) comma_separator1 = comma_separator2;
//		  continue;
//	}
//	register int32_t first_file_delimiter = ts::cstr::delimiter(lpsrc_upr,DELIMITER,+1);
//	lpsrc_upr[first_file_delimiter] = '\0';
//	if (first_file_delimiter > 0) {
//}
				 if (lpparameter_alternative==NULL) {
						 parameterlen=0;
						 }
				else {
						 parameterlen = ts::cstr::len(lpparameter_alternative);
						 initiator = ts::cstr::pos(lpsrc_upr,0,lpparameter_alternative);
						 }
		if (initiator==-1) {
				 if (lpparameter_normal==NULL) {
						 parameterlen=0; initiator = -1;
						 }
				else {
						 parameterlen = ts::cstr::len(lpparameter_normal);
						 initiator = ts::cstr::pos(lpsrc_upr,0,lpparameter_normal);
						 }
		}
		if (initiator==-1) {
				 if (lpparameter_min==NULL) {
						 parameterlen=0;
						 }
				else {
						 parameterlen = ts::cstr::len(lpparameter_min);
						 initiator = ts::cstr::pos(lpsrc_upr,0,lpparameter_min);
						 }
				if (initiator > 0)
						if (lpsrc_upr[initiator-1]=='-') initiator =-1;
		}
		//----------------
		if (initiator==-1) { // || initiator>=first_file_delimiter) {
				if (r_lpsuboption!=NULL) r_lpsuboption[0]='\0';
				f_result_positions[PHASE_INITIATOR_POS]=-1;
				f_result_positions[PHASE_START_POS]=-1;
				f_result_positions[PHASE_END_POS]=-1;
				f_result_positions[PHASE_TERMINATOR_POS]=-1;
				ts::cstr::free(lpsrc_upr);
				return 0;
		}
//----------------
        register int32_t start = initiator + parameterlen + 1;
        register int32_t end = -1;
//----------------
		if (lpsrc[start-1]=='-' || lpsrc[start-1]==' ' || start+2 > srclen ? true : lpsrc[start-1]!='(' && lpsrc[start-1]!='[' && lpsrc[start-1]!='<') {
				if (r_lpsuboption!=NULL) r_lpsuboption[0] = '\0';
				f_result_positions[PHASE_INITIATOR_POS]=initiator;
				f_result_positions[PHASE_START_POS]=-1;
				f_result_positions[PHASE_END_POS]=-1;
				f_result_positions[PHASE_TERMINATOR_POS]=start - 2;
				ts::cstr::free(lpsrc_upr);
				return 1;
		}
		else
		if (lpsrc[start-1]=='(') {
				end = ts::cstr::pos(lpsrc,start-1,")")-1;
		}
		if (lpsrc[start-1]=='[') {
				end = ts::cstr::pos(lpsrc,start-1,"]")-1;
		}
		if (lpsrc[start-1]=='<') {
				end = ts::cstr::pos(lpsrc,start-1,">")-1;
		}
		if (end==-1) {
				if (r_lpsuboption!=NULL) r_lpsuboption[0] = '\0';
				f_result_positions[PHASE_INITIATOR_POS]=-1;
				f_result_positions[PHASE_START_POS]=-1;
				f_result_positions[PHASE_END_POS]=-1;
				f_result_positions[PHASE_TERMINATOR_POS]=-1;
				ts::cstr::free(lpsrc_upr);
				return 0;
		}
//----------------
		f_result_positions[PHASE_INITIATOR_POS]=initiator;
		f_result_positions[PHASE_START_POS]=start;
		f_result_positions[PHASE_END_POS]=end;
		f_result_positions[PHASE_TERMINATOR_POS]=end + 1;
		if (r_lpsuboption!=NULL) {
				mem32::mov(r_lpsuboption,&(lpsrc[start]),end-start+1);
				r_lpsuboption[end-start+1] = '\0';
		}
		ts::cstr::free(lpsrc_upr);
				return 2;
}
//---------------------------------------------------------------------------

void __stdcall ts::__pharser::delete_found(char *lpsrc)
{
#ifdef __DEBUG_PHARSER__
__DEBUG_FUNC_CALLED("")
#endif
		if (lpsrc!=f_result_base) return;
#ifdef __DEBUG_PHARSER__
ts::con::prints("__pharser::delete_found(%s)",lpsrc);
ts::con::prints("initiator:%d, terminator:%d, len:%d",f_result_positions[PHASE_INITIATOR_POS],f_result_positions[PHASE_TERMINATOR_POS],ts::cstr::len(lpsrc));
ts::con::print("\n");
#endif
		if (f_result_positions[PHASE_INITIATOR_POS]<0 || f_result_positions[PHASE_TERMINATOR_POS]<0) return;
		ts::cstr::cut_end(lpsrc,f_result_positions[PHASE_INITIATOR_POS],f_result_positions[PHASE_TERMINATOR_POS]);
}
