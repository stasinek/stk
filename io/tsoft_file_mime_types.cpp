//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
#pragma hdrstop
#include "tsoft_file_mime_types.h"
//---------------------------------------------------------------------------
#define mime_t_file
#ifndef mime_t_filename
#define mime_t_filename "mime_type.txt"
#endif
//---------------------------------------------------------------------------
static char  *filecontent = NULL;
static size_t filecontent_size = 0;
//---------------------------------------------------------------------------
#ifdef __WATCOMC__
void ts::file::mime::atexit(void)
#else
void __cdecl  ts::file::mime::atexit(void)
#endif
{
if (filecontent!=NULL) ts::mem32::free(filecontent);
filecontent_size = 0;
}
//---------------------------------------------------------------------------

char *__stdcall ts::file::mime::decode(char* a_file_name)
{

        static char t[40] = "file/unknown";
        static __int32 tl = 12, tb,te;
        static char e[20];
        static __int32 el, eb,ee;
        ts::cstr::extract_file_extt(e, a_file_name);
        ts::cstr::insert(e,0,".");
        el = ts::cstr::len(e);

        if (filecontent==NULL) {
                filecontent_size = 64*1024;
                filecontent = new char[filecontent_size];
                ::atexit(&ts::file::mime::atexit);
                }
        struct _stat statbuf;
        register __int32 file_c, filesize, filehandle = _open(mime_t_filename, O_RDONLY|O_BINARY);
        if (filehandle== -1)
                return t;
        if (_fstat(filehandle, &statbuf)==-1) {
                _close(filehandle);
                return t;
        }
        filesize = statbuf.st_size;
        if (filesize < 0 || filesize > 1024*1024*1024) {
                _close(filehandle);
                return t;
        }
        if (filesize > (__int32)filecontent_size) {
                filecontent_size = filesize;
                filecontent = (char*)ts::mem32::realloc(filecontent,filecontent_size);
        }
        file_c = _read(filehandle, filecontent, filesize);
//---------------------------------------------------------------------------
        eb = ts::mem32::pos((void*)filecontent,file_c, 0, e, el);
        if (eb > 0) {
                for (tb = eb + el; tb < file_c; tb++)
                        if (filecontent[tb]!='\t')
                                break;
                for (te = tb; te < file_c; te++)
                        if (filecontent[te]=='\n' || filecontent[te]=='\r')
                                break;
                if (te-tb < 20) {
                        ts::mem32::mov(t,&filecontent[tb],te-tb);
                        t[te-tb]='\0';
                }
        }
//---------------------------------------------------------------------------
        if (filecontent_size > 64*1024) {
                filecontent_size = 64*1024;
                filecontent = (char*)ts::mem32::realloc(filecontent,filecontent_size);
        }
        close(filehandle);
        return  t;
}
//---------------------------------------------------------------------------
