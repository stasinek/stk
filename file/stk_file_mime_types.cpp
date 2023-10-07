//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#pragma hdrstop
#include "./../mem/stk_mem.h"
#include "./../text/stk_cstr_utils.h"
//---------------------------------------------------------------------------
#include "stk_file_mime_types.h"
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
void stk::file::mime::atexit(void)
#else
void __cdecl  stk::file::mime::atexit(void)
#endif
{
if (filecontent!=NULL) stk::mem::free(filecontent);
filecontent_size = 0;
}
//---------------------------------------------------------------------------

char *__stdcall stk::file::mime::decode(char* a_file_name)
{

        static char t[40] = "file/unknown";
        static int32_t tl = 12, tb,te;
        static char e[20];
        static int32_t el, eb,ee;
        stk::cstr::get_file_extt(e, a_file_name);
        stk::cstr::insert(e,(size_t)0,".");
        el = stk::cstr::len(e);

        if (filecontent==NULL) {
                filecontent_size = 64*1024;
                filecontent = new char[filecontent_size];
                ::atexit(&stk::file::mime::atexit);
                }
        struct stat statbuf;
        register int32_t file_c, filesize, filehandle = _open(mime_t_filename, O_RDONLY|O_BINARY);
        if (filehandle== -1)
                return t;
        if (fstat(filehandle, &statbuf)==-1) {
                _close(filehandle);
                return t;
        }
        filesize = statbuf.st_size;
        if (filesize < 0 || filesize > 1024*1024*1024) {
                _close(filehandle);
                return t;
        }
        if (filesize > (int32_t)filecontent_size) {
                filecontent_size = filesize;
                filecontent = (char*)stk::mem::realloc(filecontent,filecontent_size);
        }
        file_c = _read(filehandle, filecontent, filesize);
//---------------------------------------------------------------------------
        eb = stk::mem::pos((void*)filecontent,file_c, 0, e, el);
        if (eb > 0) {
                for (tb = eb + el; tb < file_c; tb++)
                        if (filecontent[tb]!='\t')
                                break;
                for (te = tb; te < file_c; te++)
                        if (filecontent[te]=='\n' || filecontent[te]=='\r')
                                break;
                if (te-tb < 20) {
                        stk::mem::mov(t,&filecontent[tb],te-tb);
                        t[te-tb]='\0';
                }
        }
//---------------------------------------------------------------------------
        if (filecontent_size > 64*1024) {
                filecontent_size = 64*1024;
                filecontent = (char*)stk::mem::realloc(filecontent,filecontent_size);
        }
        close(filehandle);
        return  t;
}
//---------------------------------------------------------------------------
