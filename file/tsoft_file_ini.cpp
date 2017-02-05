//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_file_ini.h"
#include "./../mem/tsoft_mem.h"
#include "./../text/tsoft_cstr_utils.h"
//---------------------------------------------------------------------------
#include "tsoft_console.h"
//---------------------------------------------------------------------------

// equivalent to GetPrivateProfileStringW from WinAPI
DWORD __cdecl ts::file::get_wchar_value_at_ini_section(wchar_t *lpSection, wchar_t *lpValue,
									   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile)
{
#ifdef __DEBUG_FILE_INI__
__DEBUG_FUNC_CALLED("")
#endif
//As far as I know the corrent UNICODE line ending on windows platform is \r\n,
//that is 0x000D000AL and ansii 0x0D0AL
//so properly encoded UTF16 file should have a BOM, FF FE in the first 2 byte positions.
//function supports only unicode 16-bit files
	HANDLE hfile = CreateFileW(szPathAndFile,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,0,(wchar_t*)NULL);
	if (hfile==INVALID_HANDLE_VALUE) {
		ts::con::prints("Can't open .ini file?! %s",szPathAndFile);
		return 1;
	}
	unsigned long i = 0,b = GetFileSize(hfile,NULL), e = b/2, br, l = 0;
	wchar_t* lpbuffer = (wchar_t*)ts::mem32::alloc((e+1)*sizeof(wchar_t));
	wchar_t* linia = (wchar_t*)ts::mem32::alloc(100*sizeof(wchar_t));
	bool found = false, foundsection = false;
	if (e<=2) {
		ts::con::prints(".ini file too small?! %s",szPathAndFile);
		return 1;
	}
	if (!ReadFile(hfile,lpbuffer,b,&br,NULL)) {
		ts::con::prints("For unknown reason - I can't open .ini file?! %s",szPathAndFile);
		return 1;
	}
	if (lpbuffer[i++]!=0xFEFFL) {
		ts::con::prints("Wspieram .ini UTF16 - zmien kodowanie w notatniku",szPathAndFile);
		return 1;
	}
	for (; i < e; ) {
		linia[l] = lpbuffer[i];
		if (found==false && foundsection==false) {
			if ((lpbuffer[i]=='\r' && lpbuffer[i+1]=='\n') || (lpbuffer[i]=='\r' && lpbuffer[i+1]=='\0')) {
				linia[l]= MAKEWORD('\0',0);
				if (wcscmp(linia,lpSection)==0) foundsection = true;
				l = 0;
				i+=2;  //przejd� do nowej linii po znalezieniu sekcji
				continue;
			}
		}
		if (found==false && foundsection==TRUE) {
			if ((lpbuffer[i]=='\r' && lpbuffer[i+1]=='\n') || (lpbuffer[i]=='\r' && lpbuffer[i+1]=='\0')) {
				linia[l]=MAKEWORD('\0',0);
				l = 0;
				i+=2;
				continue;
			}
			if (linia[l]==' ' || linia[l]=='=') {
				linia[l]=MAKEWORD('\0',0);
				if (wcscmp(linia,lpValue)==0) found = true;
				l = 0;
				i+=1;
				continue;
			}
			if (linia[l]=='[' || linia[l]==']') {
				wcscpy(lpBuffer,lpdefault);
				break;
			}
		}
		if (found==TRUE  && foundsection==TRUE) {
			if ((lpbuffer[i]=='\r' && lpbuffer[i+1]=='\n') || (lpbuffer[i]=='\r' && lpbuffer[i+1]=='\0') || i==e-1) {
				linia[l] = MAKEWORD('\0',0);
				wcscpy(lpBuffer,linia);
				l = 0;
				break;
			}
		}
		i++;
		l++;
	}
	CloseHandle(hfile);
	ts::mem32::free(lpbuffer); ts::mem32::free(linia);
	if (found==false) {
		wcscpy(lpBuffer,lpdefault);
		return 1;
	}
	return 1;
}
//---------------------------------------------------------------------------

DWORD __cdecl get_value_at_ini_section(wchar_t *lpSection, wchar_t *lpValue,
	   wchar_t *lpdefault, wchar_t *lpBuffer, DWORD dwBufSize, wchar_t *szPathAndFile)
{
#ifdef __DEBUG_FILE_INI__
__DEBUG_FUNC_CALLED("")
#endif
return 0;
}
//---------------------------------------------------------------------------
