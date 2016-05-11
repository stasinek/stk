//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_pharse_math.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include "./../io/tsoft_console.h"
//---------------------------------------------------------------------------

__stdcall ts::__math_pharser:: __math_pharser(void)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_FUNC_CALLED__
#endif
		result = 0;
		f_expression = NULL;
		//f_splited_expression = (char[]*)NULL;
		f_splited_expression_count = 0;
}
//---------------------------------------------------------------------------

__stdcall ts::__math_pharser::~__math_pharser(void)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_FUNC_CALLED__
#endif
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__math_pharser::f_decode_subexpression(const __int32 a_index)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_FUNC_CALLED__
#endif
return 0;
}
//---------------------------------------------------------------------------

__int32 __stdcall ts::__math_pharser::decode(const char *a_expression)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_FUNC_CALLED__
#endif



		/*char *lpsrc_upr = strdup(lpsrc); text::upr(lpsrc_upr);
		register __int32 initiator = -1, start = -1, end = -1, terminator = -1;
		__int32 srclen = ts::cstr::len(lpsrc_upr), parameterlen = 0;
		__int32 first_file_delimiter = ts::cstr::delimiter(lpsrc_upr,DELIMITER,+1);
		if (first_file_delimiter < 0) first_file_delimiter = srclen;

		lpsrc_upr[first_file_delimiter] = '\0';

		if (first_file_delimiter > 0) {
				initiator = ts::cstr::pos(lpsrc_upr,0,lpparameter_alternative);
				parameterlen = ts::cstr::len(lpparameter_alternative);
				}
		if (initiator==-1) {
				initiator = ts::cstr::pos(lpsrc_upr,0,lpparameter_normal);
				parameterlen = ts::cstr::len(lpparameter_normal);
				}
		if (initiator==-1) {
				initiator = ts::cstr::pos(lpsrc_upr,0,lpparameter_min);
				parameterlen = ts::cstr::len(lpparameter_min);
				if (initiator > 0)
				if (lpsrc_upr[initiator-1]=='-') initiator =-1;
				}
				//----------------
		if (initiator==-1 || initiator>=first_file_delimiter) {
				if (lpdst!=NULL) lpdst[0]='\0';
				result_positions[PHASE_INITIATOR_POS]=-1;
				result_positions[PHASE_START_POS]=-1;
				result_positions[PHASE_END_POS]=-1;
				result_positions[PHASE_TERMINATOR_POS]=-1;
				ts::cstr::free(lpsrc_upr);
				return 0;
		   }
		//----------------
				start = initiator + parameterlen + 1;
		//----------------
		if (lpsrc[start-1]=='-' || lpsrc[start-1]==' ' || start+2 > srclen ? true : lpsrc[start-1]!='(' && lpsrc[start-1]!='[' && lpsrc[start-1]!='{') {
				if (lpdst!=NULL) lpdst[0] = '\0';
				result_positions[PHASE_INITIATOR_POS]=initiator;
				result_positions[PHASE_START_POS]=-1;
				result_positions[PHASE_END_POS]=-1;
				result_positions[PHASE_TERMINATOR_POS]=start - 2;
				ts::cstr::free(lpsrc_upr);
				return 1;
		   }
		//----------------
		if (lpsrc[start-1]=='(') {
				end = ts::cstr::pos(lpsrc,start-1,")")-1;
				}
		if (lpsrc[start-1]=='[') {
				end = ts::cstr::pos(lpsrc,start-1,"]")-1;
				}
		if (lpsrc[start-1]=='{') {
				end = ts::cstr::pos(lpsrc,start-1,"}")-1;
				}
		if (end==-1) {
				if (lpdst!=NULL) lpdst[0] = '\0';
				result_positions[PHASE_INITIATOR_POS]=-1;
				result_positions[PHASE_START_POS]=-1;
				result_positions[PHASE_END_POS]=-1;
				result_positions[PHASE_TERMINATOR_POS]=-1;
				ts::cstr::free(lpsrc_upr);
				return 0;
		   }
		//----------------
				terminator = end + 1;
		//----------------
				if (lpdst!=NULL) { mem32::mov(lpdst,&(lpsrc[start]),end-start+1); lpdst[end-start+1] = '\0'; }
				result_positions[PHASE_INITIATOR_POS]=initiator;
				result_positions[PHASE_START_POS]=start;
				result_positions[PHASE_END_POS]=end;
				result_positions[PHASE_TERMINATOR_POS]=terminator;
				ts::cstr::free(lpsrc_upr);*/
		return 1;
}
//---------------------------------------------------------------------------
