//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_pharse_math.h"
#include "./../text/stk_cstr_utils.h"
#include "./../io/stk_console.h"
//---------------------------------------------------------------------------

__stdcall stk::__math_pharser:: __math_pharser(void)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_CALLED("")
#endif
		result = 0;
		f_expression = NULL;
		//f_splited_expression = (char[]*)NULL;
		f_splited_expression_count = 0;
}
//---------------------------------------------------------------------------

__stdcall stk::__math_pharser::~__math_pharser(void)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_CALLED("")
#endif
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__math_pharser::f_decode_subexpression(const uint32_t a_index)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_CALLED("")
#endif
return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall stk::__math_pharser::decode(const char *a_expression)
{
#ifdef __DEBUG_MATH_PHARSER__
__DEBUG_CALLED("")
#endif



		/*char *lpsrc_upr = strdup(lpsrc); text::upr(lpsrc_upr);
        register int32_t initiator = -1, start = -1, end = -1, terminator = -1;
        int32_t srclen = stk::cstr::len(lpsrc_upr), parameterlen = 0;
        int32_t first_file_delimiter = stk::cstr::delimiter(lpsrc_upr,DELIMITER,+1);
		if (first_file_delimiter < 0) first_file_delimiter = srclen;

		lpsrc_upr[first_file_delimiter] = '\0';

		if (first_file_delimiter > 0) {
				initiator = stk::cstr::pos(lpsrc_upr,0,lpparameter_alternative);
				parameterlen = stk::cstr::len(lpparameter_alternative);
				}
		if (initiator==-1) {
				initiator = stk::cstr::pos(lpsrc_upr,0,lpparameter_normal);
				parameterlen = stk::cstr::len(lpparameter_normal);
				}
		if (initiator==-1) {
				initiator = stk::cstr::pos(lpsrc_upr,0,lpparameter_min);
				parameterlen = stk::cstr::len(lpparameter_min);
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
				stk::cstr::free(lpsrc_upr);
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
				stk::cstr::free(lpsrc_upr);
				return 1;
		   }
		//----------------
		if (lpsrc[start-1]=='(') {
				end = stk::cstr::pos(lpsrc,start-1,")")-1;
				}
		if (lpsrc[start-1]=='[') {
				end = stk::cstr::pos(lpsrc,start-1,"]")-1;
				}
		if (lpsrc[start-1]=='{') {
				end = stk::cstr::pos(lpsrc,start-1,"}")-1;
				}
		if (end==-1) {
				if (lpdst!=NULL) lpdst[0] = '\0';
				result_positions[PHASE_INITIATOR_POS]=-1;
				result_positions[PHASE_START_POS]=-1;
				result_positions[PHASE_END_POS]=-1;
				result_positions[PHASE_TERMINATOR_POS]=-1;
				stk::cstr::free(lpsrc_upr);
				return 0;
		   }
		//----------------
				terminator = end + 1;
		//----------------
				if (lpdst!=NULL) { mem::mov(lpdst,&(lpsrc[start]),end-start+1); lpdst[end-start+1] = '\0'; }
				result_positions[PHASE_INITIATOR_POS]=initiator;
				result_positions[PHASE_START_POS]=start;
				result_positions[PHASE_END_POS]=end;
				result_positions[PHASE_TERMINATOR_POS]=terminator;
				stk::cstr::free(lpsrc_upr);*/
		return 1;
}
//---------------------------------------------------------------------------
