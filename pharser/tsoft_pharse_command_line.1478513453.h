//---------------------------------------------------------------------------
#ifndef __tsoft_pharser_HDR__
#define __tsoft_pharser_HDR__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
#define PHASE_INITIATOR_POS	 0
#define PHASE_START_POS		 1
#define PHASE_END_POS		   2
#define PHASE_TERMINATOR_POS	3
//---------------------------------------------------------------------------
class __pharser {
private:
public:
		__stdcall  __pharser(void);
		__stdcall ~__pharser(void);
		//example find_phase("name.exe -m --normal /alternate --withsuboption[some othe including,"" {}()[]]
		//	--another(suboptions here)","-o", "--opt", "/opt", suboptionstore);
		// if suboptions are found result positions[1] and [2] will index them and suboption char will be filled with
        int32_t __stdcall find(const char *lpsrc, const char *lpparameter_min, const char *lpparameter_normal, const char *lpparameter_alternative, char *r_lpsuboption);
        void    __stdcall delete_found(char *lpdst);
private:
        int32_t  f_result_positions[4];
        char    *f_result_base;
		};
//---------------------------------------------------------------------------
}
//---------------------------------------------------------------------------
#endif