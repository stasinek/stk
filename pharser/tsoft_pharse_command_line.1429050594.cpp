//---------------------------------------------------------------------------
//----------------- sstsoft 2001-2015 -------------------------------
//---------------------------------------------------------------------------
#include "./../pharser/tsoft_pharse_command_line.h"
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_text_manipulation.h"
//---------------------------------------------------------------------------

__stdcall ts::__pharser:: __pharser(void)
{
	for ( int x = 0; x < 4; x++) result_positions[x]=-1;
}
//---------------------------------------------------------------------------

__stdcall ts::__pharser::~__pharser(void)
{
}
//---------------------------------------------------------------------------

bool __stdcall ts::__pharser::find(const char *lpsrc, const char *lpparameter_min, const char *lpparameter_normal, const char *lpparameter_alternative, char *lpsuboption)
{
		result_base = (char*)lpsrc;
	char *lpsrc_upr = ts::cstr::dup(lpsrc);
	ts::text::upr(lpsrc_upr);
	register __int32 initiator = -1, start = -1, end = -1, terminator = -1;
	__int32 srclen = ts::cstr::len(lpsrc_upr), parameterlen = 0;
	__int32 first_file_delimiter = text::delimiter(lpsrc_upr,DELIMITER,+1);
	if (first_file_delimiter < 0) first_file_delimiter = srclen;
	lpsrc_upr[first_file_delimiter] = '\0';
	if (first_file_delimiter > 0) {
		initiator = text::pos(lpsrc_upr,0,lpparameter_alternative);
		parameterlen = ts::cstr::len(lpparameter_alternative);
	}
	if (initiator==-1) {
		initiator = text::pos(lpsrc_upr,0,lpparameter_normal);
		parameterlen = ts::cstr::len(lpparameter_normal);
	}
	if (initiator==-1) {
		initiator = text::pos(lpsrc_upr,0,lpparameter_min);
		parameterlen = ts::cstr::len(lpparameter_min);
		if (initiator > 0)
			if (lpsrc_upr[initiator-1]=='-') initiator =-1;
	}
	//----------------
	if (initiator==-1 || initiator>=first_file_delimiter) {
				if (lpsuboption!=NULL) lpsuboption[0]='\0';
		result_positions[PHASE_INITIATOR_POS]=-1;
		result_positions[PHASE_START_POS]=-1;
		result_positions[PHASE_END_POS]=-1;
		result_positions[PHASE_TERMINATOR_POS]=-1;
		text::free(lpsrc_upr);
		return 0;
	}
//----------------
	start = initiator + parameterlen + 1;
//----------------
	if (lpsrc[start-1]=='-' || lpsrc[start-1]==' ' || start+2 > srclen ? true : lpsrc[start-1]!='(' && lpsrc[start-1]!='[' && lpsrc[start-1]!='{') {
				if (lpsuboption!=NULL) lpsuboption[0] = '\0';
		result_positions[PHASE_INITIATOR_POS]=initiator;
		result_positions[PHASE_START_POS]=-1;
		result_positions[PHASE_END_POS]=-1;
		result_positions[PHASE_TERMINATOR_POS]=start - 2;
		text::free(lpsrc_upr);
		return 1;
	}
//----------------
	if (lpsrc[start-1]=='(') {
		end = text::pos(lpsrc,start-1,")")-1;
	}
	if (lpsrc[start-1]=='[') {
		end = text::pos(lpsrc,start-1,"]")-1;
	}
	if (lpsrc[start-1]=='{') {
		end = text::pos(lpsrc,start-1,"}")-1;
	}
	if (end==-1) {
				if (lpsuboption!=NULL) lpsuboption[0] = '\0';
		result_positions[PHASE_INITIATOR_POS]=-1;
		result_positions[PHASE_START_POS]=-1;
		result_positions[PHASE_END_POS]=-1;
		result_positions[PHASE_TERMINATOR_POS]=-1;
		text::free(lpsrc_upr);
		return 0;
	}
//----------------
	terminator = end + 1;
//----------------
		if (lpsuboption!=NULL) {
				mem32::mov(lpsuboption,&(lpsrc[start]),end-start+1);
				lpsuboption[end-start+1] = '\0';
	}
	result_positions[PHASE_INITIATOR_POS]=initiator;
	result_positions[PHASE_START_POS]=start;
	result_positions[PHASE_END_POS]=end;
	result_positions[PHASE_TERMINATOR_POS]=terminator;
	text::free(lpsrc_upr);
	return 1;
}
//---------------------------------------------------------------------------

void __stdcall ts::__pharser::delete_found(char *lpsrc)
{
		if (lpsrc!=result_base) return;
		if (result_positions[PHASE_INITIATOR_POS]<0 || result_positions[PHASE_TERMINATOR_POS]<0) return;
		text::deln(lpsrc,result_positions[PHASE_INITIATOR_POS],result_positions[PHASE_TERMINATOR_POS]+1);
}
