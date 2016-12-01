//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "tsoft_sockets.h"
//---------------------------------------------------------------------------
#include "./../io/tsoft_file_mime_types.h"
#include "./../io/tsoft_console.h"
#include "./../mem/tsoft_mem.h"
#include "./../ssthreads/tsoft_threads.h"
#include "./../time/tsoft_time.h"
//---------------------------------------------------------------------------

SOCKET __stdcall ts::socket::create_server_socket(const char *aipv4_port_s, const int atimeout_s)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        return create_server_socket("0.0.0.0",aipv4_port_s,atimeout_s);
}
//---------------------------------------------------------------------------


SOCKET __stdcall ts::socket::create_server_socket(const char *aipv4_addr_s, const char *aipv4_port_s, const int atimeout_s)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        SOCKET socket;
        SOCKET main_socket, accepted_socket;
        SOCKET_BUFFER_CLASS buffer;
        sockaddr_in main_service;
        struct timeval tv;
#ifdef __WIN32__
        WSADATA wsadata;
        int result = WSAStartup( MAKEWORD( 2, 2 ), & wsadata );
        if( result!= NO_ERROR ) {
        goto NEW_GOTO_ERROR_SOCKET;
        }
#endif
        main_socket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
        if( main_socket == INVALID_SOCKET ) {
        goto NEW_GOTO_ERROR_SOCKET;
        }
        memset( & main_service, 0, sizeof( main_service ) );
        main_service.sin_family = AF_INET;
// socket bez podawania IP lub na okreslone IP
        if (ts::cstr::compare(aipv4_addr_s,"0.0.0.0")==0) main_service.sin_addr.s_addr = INADDR_ANY;
        else main_service.sin_addr.s_addr = inet_addr( aipv4_addr_s );
        main_service.sin_port = htons( atol(aipv4_port_s) );
        if( bind( main_socket,( SOCKADDR * ) & main_service, sizeof( main_service ) ) == SOCKET_ERROR ) {
        goto NEW_GOTO_ERROR_SOCKET;
        }
        if( listen( main_socket, 1 ) == SOCKET_ERROR ) {
        goto NEW_GOTO_ERROR_SOCKET;
        }
        if (atimeout_s!=0) {
        tv.tv_sec = atimeout_s;  /* 30 Secs Timeout */
        tv.tv_usec = 0;
        setsockopt(main_socket, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));
        }
        accepted_socket = SOCKET_ERROR;
        ts::con::prints("Waiting for a client to connect...\n" );
        while( accepted_socket == (unsigned int)SOCKET_ERROR ) {
        accepted_socket = accept( main_socket, NULL, NULL );
ts::time::wait_ms(500);
        }
        ts::con::prints("Client connected.\n" );
        main_socket = accepted_socket;
        buffer.recv_done_count = SOCKET_ERROR;
        ts::cstr::mov(buffer.recv_lp,"");
        ts::mem32::mov(&socket, &main_socket, sizeof(SOCKET));
        ts::con::prints("SOCKET %d Connection established.\n",socket );
        return socket;
NEW_GOTO_ERROR_SOCKET:
        ts::con::prints("SOMETHING GOES WRONG! SOCKET Terminated.\n" );
        return SOCKET_ERROR;
}

//---------------------------------------------------------------------------

SOCKET __stdcall ts::socket::create_client_socket(const char *aipv4_addr_s, const char *aipv4_port_s, const int atimeout_s)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        SOCKET socket;
        SOCKET main_socket, accepted_socket;
        SOCKET_BUFFER_CLASS buffer;
        sockaddr_in main_service;
        struct timeval tv;
#ifdef __WIN32__
        WSADATA wsadata;
        int result = WSAStartup( MAKEWORD( 2, 2 ), & wsadata );
        if( result!= NO_ERROR ) {
        goto NEW_GOTO_ERROR_SOCKET;
        }
#endif
        main_socket = ::socket( AF_INET, SOCK_STREAM, IPPROTO_TCP );
        if( main_socket == INVALID_SOCKET ) {
        goto NEW_GOTO_ERROR_SOCKET;
        }
        memset( & main_service, 0, sizeof( main_service ) );
        main_service.sin_family = AF_INET;
        main_service.sin_addr.s_addr = inet_addr( aipv4_addr_s );
        main_service.sin_port = htons( atol(aipv4_port_s) );
        if (connect( main_socket,( SOCKADDR * ) & main_service, sizeof( main_service ) ) == SOCKET_ERROR ) {
        goto NEW_GOTO_ERROR_SOCKET;
        }
        if (atimeout_s!=0) {
        tv.tv_sec = atimeout_s;  /* 30 Secs Timeout */
        tv.tv_usec = 0;
        setsockopt(main_socket, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));
        }
        ts::mem32::mov(&socket, &main_socket, sizeof(SOCKET));
        ts::con::prints("SOCKET %d Connection established.\n",socket );
        return socket;
NEW_GOTO_ERROR_SOCKET:
        ts::con::prints("SOMETHING GOES WRONG! SOCKET Terminated.\n" );
        return SOCKET_ERROR;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::socket::close_socket(SOCKET amain_socket)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        register int ret = closesocket( amain_socket );
#ifdef __WIN32__
        WSACleanup();
#endif
        return ret;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::socket::send_for_sure(SOCKET amain_socket,const char *asend_lp, const int32_t alen, const int32_t ax)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        register int32_t s = 0;
        register int32_t s_sum = 0;
        register int32_t to_s = alen;
        while(s_sum<to_s) {
        s =  send(amain_socket,&asend_lp[s_sum],to_s-s_sum,0);
        if (s<0) break;
        else if (s>0) s_sum += s;
        else {
        ts::time::wait_ms(22);
        }
        }
        ts::con::prints("send_for_sure(%d); sent: %dB\n", amain_socket, s_sum );
        ts::con::prints("-----------------------------------------------------------------------\n");
        ts::con::prints("%s\n", asend_lp );
        ts::con::prints("-----------------------------------------------------------------------\n");
        return s_sum;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::socket::recv_for_sure(SOCKET amain_socket, char *arecv_lp, const int32_t alen, const int32_t ax)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        register int32_t r = 0;
        register int32_t r_sum = 0;
        register int32_t to_r = alen;
        ts::mem32::set(arecv_lp,0,to_r);
        do {
        r = recv(amain_socket,&arecv_lp[r_sum], to_r-r_sum, 0);
        if (r <0 || r==WSAECONNRESET || r==SOCKET_ERROR) break;
        else if (r==0) {
        ts::time::wait_ms(22);
        } else r_sum+=r;
        } while (r_sum>=to_r);
        ts::con::prints("recv_for_sure(%d); received: %dB\n", amain_socket, r_sum );
        ts::con::prints("-----------------------------------------------------------------------\n");
        ts::con::prints("%s\n", arecv_lp );
        ts::con::prints("-----------------------------------------------------------------------\n");
        return r_sum;
}
//---------------------------------------------------------------------------


int32_t __stdcall ts::socket::start_tftp_server(const char* path, const char *aipv4_addr_s, const char *aipv4_port_s)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        SOCKET main_socket;
        SOCKET_BUFFER_CLASS buffer;
        char *temp_lp = new char[ MAX_REQUEST ];
        char temp_count, temp_size;
        main_socket = ts::socket::create_server_socket(aipv4_addr_s,aipv4_port_s,0);
        if (main_socket==(unsigned int)SOCKET_ERROR)
        goto HTTP_GOTO_ERROR_SOCKET;
        buffer.recv_done_count = (int) SOCKET_ERROR;
        ts::cstr::mov(buffer.send_lp,"100\r\n");
        for (buffer.send_done_count = 0; buffer.send_done_count < buffer.send_count;) {
        buffer.send_done_count += send( main_socket, &buffer.send_lp[buffer.send_done_count], buffer.send_count, 0 );
        }
        while(true) {
        ts::mem32::set(buffer.recv_lp,0,MAX_REQUEST);
        buffer.recv_done_count = recv( main_socket,buffer.recv_lp,MAX_REQUEST,0 );
        if (buffer.recv_done_count == 0 || buffer.recv_done_count == WSAECONNRESET || buffer.recv_done_count  < 0 || buffer.recv_done_count == SOCKET_ERROR)
        break;
        ts::con::prints("received: %dB\n", buffer.recv_done_count );
        ts::con::prints("-----------------------------------------------------------------------\n");
        ts::con::prints("%s\n", buffer.recv_lp );
        ts::con::prints("-----------------------------------------------------------------------\n");
        if (buffer.recv_done_count < 4) {
//
/* BAD COMMAND
*/
        ts::cstr::mov(buffer.send_lp,"503\r\n");
        buffer.send_count = ts::cstr::len(buffer.send_lp);
        } else
/*Abort an active file transfer.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"ABOR")==0) {
        } else
//
/*Account information.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"ACCT")==0) {
        } else
//RFC 2228
/*Authentication/Security data
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"ADAT")==0) {
        } else
//
/*Allocate sufficient disk space to receive a file.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"ALLO")==0) {
        } else
//
/*Append.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"APPE")==0) {
        } else
//RFC 2228
/*Authentication/Security Mechanism
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"AUTH")==0) {
        } else
//RFC 2228
/*Clear Command Channel
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"CCC ")==0) {
        } else
//
/*Change to Parent Directory.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"CDUP")==0) {
        } else
//RFC 2228
/*Confidentiality Protection Command
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"CONF")==0) {
        } else
//
/*Change working directory.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"CWD ")==0) {
        } else
//
/*Delete file.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"DELE")==0) {
        } else
//RFC 2228
/*Privacy Protected Channel
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"ENC")==0) {
        } else
//RFC 2428
/*Specifies an extended address and port to which the server should connect.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"EPRT")==0) {
        } else
//RFC 2428
/*Enter extended passive mode.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"EPSV")==0) {
        } else
//RFC 2389
/*Get the feature list implemented by the server.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"FEAT")==0) {
        } else
//
/*Returns usage documentation on a command if specified, else a general help document is returned.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"HELP")==0) {
        } else
//RFC 2640
/*Language Negotiation
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"LANG")==0) {
        } else
//
/*Returns information of a file or directory if specified, else information of the current working directory is returned.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"LIST")==0) {
        } else
//RFC 1639
/*Specifies a long address and port to which the server should connect.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"LPRT")==0) {
        } else
//RFC 1639
/*Enter long passive mode.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"LPSV")==0) {
        } else
//RFC 3659
/*Return the last-modified time of a specified file.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"MDTM")==0) {
        } else
//RFC 2228
/*Integrity Protected Command
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"MIC ")==0) {
        } else
//
/*Make directory.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"MKD ")==0) {
        } else
//RFC 3659
/*Lists the contents of a directory if a directory is named.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"MLSD")==0) {
        } else
//RFC 3659
/*Provides data about exactly the object named on its command line, and no others.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"MLST")==0) {
        } else
//
/*Sets the transfer mode (Stream, Block, or compressed).
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"MODE")==0) {
        } else
//
/*Returns a list of file names in a specified directory.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"NLST")==0) {
        } else
//
/*No operation (dummy packet; used mostly on keepalives).
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"NOOP")==0) {
        } else
//RFC 2389
/*Select options for a feature.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"OPTS")==0) {
        } else
//
/*Authentication password.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"PLAIN")==0) {
        } else
//
/*Enter passive mode.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"PASV")==0) {
        } else
//RFC 2228
/*Protection Buffer size
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"PBSZ")==0) {
        } else
//
/*Specifies an address and port to which the server should connect.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"PORT")==0) {
        } else
//RFC 2228
/*Data Channel Protection Level.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"PROT")==0) {
        } else
//
/*Print working directory. Returns the current directory of the host.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"PWD ")==0) {
        } else
//
/*Disconnect.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"QUIT")==0) {
        } else
//
/*Re initializes the connection.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"REIN")==0) {
        } else
//
/*Restart transfer from the specified point.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"REST")==0) {
        } else
//
/*Transfer a copy of the file
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"RETR")==0) {
        } else
//
/*Remove a directory.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"RMD ")==0) {
        } else
//
/*Rename from.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"RNFR")==0) {
        } else
//
/*Rename to.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"RNTO")==0) {
        } else
//
/*Sends site specific commands to remote server.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"SITE")==0) {
        } else
//RFC 3659
/*Return the size of a file.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"SIZE")==0) {
        } else
//
/*Mount file structure.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"SMNT")==0) {
        } else
//
/*Returns the current status.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"STAT")==0) {
        } else
//
/*Accept the data and to store the data as a file at the server site
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"STOR")==0) {
        } else
//
/*Store file uniquely.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"STOU")==0) {
        } else
//
/*Set file transfer structure.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"STRU")==0) {
        } else
//
/*Return system type.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"SYST")==0) {
        } else
//
/*Sets the transfer mode (ASCII/Binary).
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"TYPE")==0) {
        } else
//
/*Authentication username.
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"USER")==0) {
        } else
//RFC 775
/*Change to the parent of the current working directory
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XCUP")==0) {
        } else
//RFC 775
/*Make a directory
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XMKD")==0) {
        } else
//RFC 775
/*Print the current working directory
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XPWD")==0) {
        } else
//RFC 743
/*Recipient specification
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XRCP")==0) 
{
        } else
//RFC 775
/*Remove the directory
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XRMD")==0) {
        } else
//RFC 743
/*Recipients first
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XRSQ")==0) {
        } else
//RFC 737
/*Send, mail if cannot
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XSEM")==0) {
        }
//RFC 737
/*Send to terminal
*/
        if (ts::cstr::pos(buffer.recv_lp,0,"XSEN")==0) {
        } else {
/*CODE Not Implemented
*/
        ts::cstr::mov(buffer.send_lp,"502\r\n");
        buffer.send_count = ts::cstr::len(buffer.send_lp);
        }
/* SEND ALL ANSWERS
*/
        buffer.send_done_count = ts::socket::send_for_sure(main_socket,buffer.send_lp, buffer.send_count, 0 );
        continue;
        }
HTTP_GOTO_CLOSE_SOCKET:
        close_socket(main_socket);
        delete temp_lp;
        return 1;
HTTP_GOTO_ERROR_SOCKET:
        if (main_socket!=(unsigned int)SOCKET_ERROR) close_socket(main_socket);
        ts::con::prints("SOCKET Terminated!\n" );
        delete temp_lp;
        return 0;
}

//---------------------------------------------------------------------------

int32_t __stdcall ts::socket::start_http_server(const char* path, const char *aipv4_addr_s, const char *aipv4_port_s)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        SOCKET main_socket;
        SOCKET_BUFFER_CLASS buffer;
        char *temp_lp = new char[ MAX_REQUEST ];
        register int  temp_count, temp_size;
        main_socket = ts::socket::create_server_socket(aipv4_addr_s,aipv4_port_s,0);
        if (main_socket==(unsigned int)SOCKET_ERROR)
        goto HTTP_GOTO_ERROR_SOCKET;
        buffer.recv_done_count = SOCKET_ERROR;
        ts::cstr::mov(buffer.send_lp,"HTTP/1.1 200 OK\r\n");
        buffer.send_done_count = send( main_socket, buffer.send_lp, ts::cstr::len(buffer.send_lp) + 1, 0 );
        while(true) {
        ts::mem32::set(buffer.recv_lp,0,MAX_REQUEST);
        buffer.recv_done_count = recv( main_socket,buffer.recv_lp,MAX_REQUEST,0 );
        if (buffer.recv_done_count == 0 || buffer.recv_done_count == WSAECONNRESET || buffer.recv_done_count  < 0 || buffer.recv_done_count == SOCKET_ERROR)
        break;
        ts::con::prints("received: %dB text:\n", buffer.recv_done_count );
        ts::con::prints("-----------------------------------------------------------------------\n");
        ts::con::prints("%s\n", buffer.recv_lp );
        ts::con::prints("-----------------------------------------------------------------------\n");
        if (buffer.recv_done_count < 4) {
        ts::cstr::mov(buffer.send_lp,"HTTP/1.1 400 Bad Request\r\n");
        buffer.send_count = ts::cstr::len(buffer.send_lp);
        } else if (ts::cstr::pos(buffer.recv_lp,0,"GET")>=0) {
        temp_count = ts::cstr::pos(buffer.recv_lp,4,"HTTP/1.1\r\n") - 1;
        ts::cstr::mov(temp_lp,path);
        ts::cstr::substr_end(&temp_lp[ts::cstr::len(temp_lp)],buffer.recv_lp,4,temp_count);
        temp_count = ts::cstr::len(temp_lp);
        ts::cstr::replace_chr(temp_lp,'/','\\');
        ts::cstr::mov(buffer.send_lp,"HTTP/1.1 200 OK\r\n");
        ts::cstr::cat(buffer.send_lp,"Date: Fri, 31 Dec 1999 23:59:59 GMT\r\n");
        ts::cstr::cat(buffer.send_lp,"Server: tsoft/0.1\r\n");
        ts::cstr::cat(buffer.send_lp,"Transfer-Encoding: identity\r\n");
        ts::cstr::cat(buffer.send_lp,"Content-Type: ");
        ts::cstr::cat(buffer.send_lp,(char*)ts::file::mime::decode((char*)temp_lp));
        ts::cstr::cat(buffer.send_lp,"\r\n");
        ts::cstr::cat(buffer.send_lp,"Content-Length: ");
        ts::cstr::cat(buffer.send_lp,ts::socket::get_file_size_ansi(temp_lp));
        ts::cstr::cat(buffer.send_lp,"\r\n");
        ts::cstr::cat(buffer.send_lp,"\r\n");
        buffer.send_count = ts::cstr::len(buffer.send_lp);
        buffer.send_count += ts::socket::get_file_content(temp_lp,&buffer.send_lp[buffer.send_count],MAX_REQUEST);
        } else {
        ts::cstr::mov(buffer.send_lp,"HTTP/1.1 501 Not Implemented\r\n");
        buffer.send_count = ts::cstr::len(buffer.send_lp);
        }
        buffer.send_done_count = ts::socket::send_for_sure(main_socket,buffer.send_lp, buffer.send_count, 0 );
        continue;
        }
HTTP_GOTO_CLOSE_SOCKET:
        close_socket(main_socket);
        delete temp_lp;
        return 1;
HTTP_GOTO_ERROR_SOCKET:
        if (main_socket!=(unsigned int)SOCKET_ERROR) close_socket(main_socket);
        ts::con::prints("SOCKET Terminated!\n" );
        delete temp_lp;
        return 0;
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::socket::get_file_size(const char* path)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        static struct _stat statbuf;
        _stat(path, &statbuf);
        return statbuf.st_size;
}
//---------------------------------------------------------------------------

const char *__stdcall ts::socket::get_file_size_ansi(const char* path)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        static char a[12] = "";
        static struct _stat statbuf;
        _stat(path, &statbuf);
        return ts::cstr::itoa(statbuf.st_size,a,10);
}
//---------------------------------------------------------------------------

int32_t __stdcall ts::socket::get_file_content(const char* path, char *filecontent, const int32_t max_size)
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
        struct _stat statbuf;
        register int32_t t, filesize, filehandle = open(path, O_RDONLY|O_BINARY);
        if (filehandle== -1)
        return -1;
        if (_fstat(filehandle, &statbuf)==-1) {
        _close(filehandle);
        return -1;
        }
        filesize = statbuf.st_size;
        if (filesize > max_size) {
        _close(filehandle);
        return -1;
        }
        t = read(filehandle, filecontent, filesize);
        _close(filehandle);
        return  t;
}

//---------------------------------------------------------------------------

void __stdcall ts::socket::print_socket_error()
{
#ifdef __DEBUG_SOCKET__
__DEBUG_FUNC_CALLED("")
#endif
#ifdef __WIN32__
        int serrorno = WSAGetLastError();
#else
        int serrorno = errno();
#endif
        switch(serrorno) {
        case WSA_INVALID_HANDLE:
//6
        ts::con::prints("%s\n","Specified event object handle is invalid.\
An application attempts to use an event object, but the specified handle is not valid. \
Note that this error is returned by the operating system, so the error number may change in future releases of Windows. \
");
        break;
        case WSA_NOT_ENOUGH_MEMORY:
//8
        ts::con::prints("%s\n","Insufficient memory available. \
An application used a Windows Sockets function that directly maps to a Windows function. \
The Windows function is indicating a lack of required memory resources. \
Note that this error is returned by the operating system, so the error number may change in future releases of Windows. \
");
        break;
        case WSA_INVALID_PARAMETER:
//87
        ts::con::prints("%s\n","One or more parameters are invalid. \
An application used a Windows Sockets function which directly maps to a Windows function. \
The Windows function is indicating a problem with one or more parameters. \
Note that this error is returned by the operating system, so the error number may change in future releases of Windows. \
");
        break;
        case WSA_OPERATION_ABORTED:
//995
        ts::con::prints("%s\n","Overlapped operation aborted. \
An overlapped operation was canceled due to the closure of the socket, or the execution of the SIO_FLUSH command in case WSAIoctl. \
Note that this error is returned by the operating system, so the error number may change in future releases of Windows. \
");
        break;
        case WSA_IO_INCOMPLETE:
//996
        ts::con::prints("%s\n","Overlapped I/O event object not in signaled state. \
The application has tried to determine the status of an overlapped operation which is not yet completed. \
Applications that use case WSAGetOverlappedResult (with the fWait flag set to FALSE) in a polling mode to determine when an overlapped operation has completed, get this error code until the operation is complete. \
Note that this error is returned by the operating system, so the error number may change in future releases of Windows. \
");
        break;
        case WSA_IO_PENDING:
//997
        ts::con::prints("%s\n","Overlapped operations will complete later. \
The application has initiated an overlapped operation that cannot be completed immediately. \
A completion indication will be given later when the operation has been completed. \
Note that this error is returned by the operating system, so the error number may change in future releases of Windows. \
");
        break;
        case WSAEINTR:
//10004
        ts::con::prints("%s\n","Interrupted function call. \
A blocking operation was interrupted by a call to case WSAcancelBlockingCall. \
");
        break;
        case WSAEBADF:
//10009
        ts::con::prints("%s\n","File handle is not valid. \
The file handle supplied is not valid. \
");
        break;
        case WSAEACCES:
//10013
        ts::con::prints("%s\n","Permission denied. \
An attempt was made to access a socket in a way forbidden by its access permissions. \
An example is using a broadcast address for sendto without broadcast permission being set using setsockopt(SO_BROADCAST). \
Another possible reason for the case WSAEACCES error is that when the bind function is called (on Windows NT 4. \0 with SP4 and later), another application, service, or kernel mode driver is bound to the same address with exclusive access. \
Such exclusive access is a new feature of Windows NT 4. \0 with SP4 and later, and is implemented by using the SO_EXCLUSIVEADDRUSE option. \
");
        break;
        case WSAEFAULT:
//10014
        ts::con::prints("%s\n","Bad address. \
The system detected an invalid pointer address in attempting to use a pointer argument of a call. \
This error occurs if an application passes an invalid pointer value, or if the length of the buffer is too small. \
For instance, if the length of an argument, which is a sockaddr structure, is smaller than the sizeof(sockaddr). \
");
        break;
        case WSAEINVAL:
//10022
        ts::con::prints("%s\n","Invalid argument. \
Some invalid argument was supplied (for example, specifying an invalid level to the setsockopt function). \
In some instances, it also refers to the current state of the socket�for instance, calling accept on a socket that is not listening. \
");
        break;
        case WSAEMFILE:
//10024
        ts::con::prints("%s\n","Too many open files. \
Too many open sockets. \
Each implementation may have a maximum number of socket handles available, either globally, per process, or per thread. \
");
        break;
        case WSAEWOULDBLOCK:
//10035
        ts::con::prints("%s\n","Resource temporarily unavailable. \
This error is returned from operations on nonblocking sockets that cannot be completed immediately, for example recv when no data is queued to be read from the socket. \
It is a nonfatal error, and the operation should be retried later. \
It is normal for case WSAEWOULDBLOCK to be reported as the result from calling connect on a nonblocking SOCK_STREAM socket, since some time must elapse for the connection to be established. \
");
        break;
        case WSAEINPROGRESS:
//10036
        ts::con::prints("%s\n","Operation now in progress. \
A blocking operation is currently executing. \
Windows Sockets only allows a single blocking operation�per- task or thread�to be outstanding, and if any other function call is made (whether or not it references that or any other socket) the function fails with the case WSAEINPROGRESS error. \
");
        break;
        case WSAEALREADY:
//10037
        ts::con::prints("%s\n","Operation already in progress. \
An operation was attempted on a nonblocking socket with an operation already in progress�that is, calling connect a second time on a nonblocking socket that is already connecting, or canceling an asynchronous request (case WSAAsyncGetXbyY) that has already been canceled or completed. \
");
        break;
        case WSAENOTSOCK:
//10038
        ts::con::prints("%s\n","Socket operation on nonsocket. \
An operation was attempted on something that is not a socket. \
Either the socket handle parameter did not reference a valid socket, or for select, a member of an fd_set was not valid. \
");
        break;
        case WSAEDESTADDRREQ:
//10039
        ts::con::prints("%s\n","Destination address required. \
A required address was omitted from an operation on a socket. \
For example, this error is returned if sendto is called with the remote address of ADDR_ANY. \
");
        break;
        case WSAEMSGSIZE:
//10040
        ts::con::prints("%s\n","Message too long. \
A message sent on a datagram socket was larger than the internal message buffer or some other network limit, or the buffer used to receive a datagram was smaller than the datagram itself. \
");
        break;
        case WSAEPROTOTYPE:
//10041
        ts::con::prints("%s\n","Protocol wrong type for socket. \
A protocol was specified in the socket function call that does not support the semantics of the socket type requested. \
For example, the ARPA Internet UDP protocol cannot be specified with a socket type of SOCK_STREAM. \
");
        break;
        case WSAENOPROTOOPT:
//10042
        ts::con::prints("%s\n","Bad protocol option. \
An unknown, invalid or unsupported option or level was specified in a getsockopt or setsockopt call. \
");
        break;
        case WSAEPROTONOSUPPORT:
//10043
        ts::con::prints("%s\n","Protocol not supported. \
The requested protocol has not been configured into the system, or no implementation for it exists. \
For example, a socket call requests a SOCK_DGRAM socket, but specifies a stream protocol. \
");
        break;
        case WSAESOCKTNOSUPPORT:
//10044
        ts::con::prints("%s\n","Socket type not supported. \
The support for the specified socket type does not exist in this address family. \
For example, the optional type SOCK_RAW might be selected in a socket call, and the implementation does not support SOCK_RAW sockets at all. \
");
        break;
        case WSAEOPNOTSUPP:
//10045
        ts::con::prints("%s\n","Operation not supported. \
The attempted operation is not supported for the type of object referenced. \
Usually this occurs when a socket descriptor to a socket that cannot support this operation is trying to accept a connection on a datagram socket. \
");
        break;
        case WSAEPFNOSUPPORT:
//10046
        ts::con::prints("%s\n","Protocol family not supported. \
The protocol family has not been configured into the system or no implementation for it exists. \
This message has a slightly different meaning from case WSAEAFNOSUPPORT. \
However, it is interchangeable in most cases, and all Windows Sockets functions that return one of these messages also specify case WSAEAFNOSUPPORT. \
");
        break;
        case WSAEAFNOSUPPORT:
//10047
        ts::con::prints("%s\n","Address family not supported by protocol family. \
An address incompatible with the requested protocol was used. \
All sockets are created with an associated address family (that is, AF_INET for Internet Protocols) and a generic protocol type (that is, SOCK_STREAM). \
This error is returned if an incorrect protocol is explicitly requested in the socket call, or if an address of the wrong family is used for a socket, for example, in sendto. \
");
        break;
        case WSAEADDRINUSE:
//10048
        ts::con::prints("%s\n","Address already in use. \
Typically, only one usage of each socket address (protocol/IP address/port) is permitted. \
This error occurs if an application attempts to bind a socket to an IP address/port that has already been used for an existing socket, or a socket that was not closed properly, or one that is still in the process of closing. \
For server applications that need to bind multiple sockets to the same port number, consider using setsockopt (SO_REUSEADDR). \
Client applications usually need not call bind at all�connect chooses an unused port automatically. \
When bind is called with a wildcard address (involving ADDR_ANY), a case WSAEADDRINUSE error could be delayed until the specific address is committed. \
This could happen with a call to another function later, including connect, listen, case WSAConnect, or case WSAJoinLeaf. \
");
        break;
        case WSAEADDRNOTAVAIL:
//10049
        ts::con::prints("%s\n","Cannot assign requested address. \
The requested address is not valid in its context. \
This normally results from an attempt to bind to an address that is not valid for the local computer. \
This can also result from connect, sendto, case WSAConnect, case WSAJoinLeaf, or case WSASendTo when the remote address or port is not valid for a remote computer (for example, address or port 0). \
");
        break;
        case WSAENETDOWN:
//10050
        ts::con::prints("%s\n","Network is down. \
A socket operation encountered a dead network. \
This could indicate a serious failure of the network system (that is, the protocol stack that the Windows Sockets DLL runs over), the network interface, or the local network itself. \
");
        break;
        case WSAENETUNREACH:
//10051
        ts::con::prints("%s\n","Network is unreachable. \
A socket operation was attempted to an unreachable network. \
This usually means the local software knows no route to reach the remote host. \
");
        break;
        case WSAENETRESET:
//10052
        ts::con::prints("%s\n","Network dropped connection on reset. \
The connection has been broken due to keep-alive activity detecting a failure while the operation was in progress. \
It can also be returned by setsockopt if an attempt is made to set SO_KEEPALIVE on a connection that has already failed. \
");
        break;
        case WSAECONNABORTED:
//10053
        ts::con::prints("%s\n","Software caused connection abort. \
An established connection was aborted by the software in your host computer, possibly due to a data transmission time-out or protocol error. \
");
        break;
        case WSAECONNRESET:
//10054
        ts::con::prints("%s\n","Connection reset by peer. \
An existing connection was forcibly closed by the remote host. \
This normally results if the peer application on the remote host is suddenly stopped, the host is rebooted, the host or remote network interface is disabled, or the remote host uses a hard close (see setsockopt for more information on the SO_LINGER option on the remote socket). \
This error may also result if a connection was broken due to keep-alive activity detecting a failure while one or more operations are in progress. \
operations that were in progress fail with case WSAENETRESET. \
Subsequent operations fail with case WSAECONNRESET. \
");
        break;
        case WSAENOBUFS:
//10055
        ts::con::prints("%s\n","No buffer space available. \
An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full. \
");
        break;
        case WSAEISCONN:
//10056
        ts::con::prints("%s\n","Socket is already connected. \
A connect request was made on an already-connected socket. \
Some implementations also return this error if sendto is called on a connected SOCK_DGRAM socket (for SOCK_STREAM sockets, the to parameter in sendto is ignored) although other implementations treat this as a legal occurrence. \
");
        break;
        case WSAENOTCONN:
//10057
        ts::con::prints("%s\n","Socket is not connected. \
A request to send or receive data was disallowed because the socket is not connected and (when sending on a datagram socket using sendto) no address was supplied. \
Any other type of operation might also return this error�for example, setsockopt setting SO_KEEPALIVE if the connection has been reset. \
");
        break;
        case WSAESHUTDOWN:
//10058
        ts::con::prints("%s\n","Cannot send after socket shutdown. \
A request to send or receive data was disallowed because the socket had already been shut down in that direction with a previous shutdown call. \
By calling shutdown a partial close of a socket is requested, which is a signal that sending or receiving, or both have been discontinued. \
");
        break;
        case WSAETOOMANYREFS:
//10059
        ts::con::prints("%s\n","Too many references. \
Too many references to some kernel object. \
");
        break;
        case WSAETIMEDOUT:
//10060
        ts::con::prints("%s\n","Connection timed out. \
A connection attempt failed because the connected party did not properly respond after a period of time, or the established connection failed because the connected host has failed to respond. \
");
        break;
        case WSAECONNREFUSED:
//10061
        ts::con::prints("%s\n","Connection refused. \
No connection could be made because the target computer actively refused it. \
This usually results from trying to connect to a service that is inactive on the foreign host�that is, one with no server application running. \
");
        break;
        case WSAELOOP:
//10062
        ts::con::prints("%s\n","Cannot translate name. \
Cannot translate a name. \
");
        break;
        case WSAENAMETOOLONG:
//10063
        ts::con::prints("%s\n","Name too long. \
A name component or a name was too long. \
");
        break;
        case WSAEHOSTDOWN:
//10064
        ts::con::prints("%s\n","Host is down. \
A socket operation failed because the destination host is down. \
A socket operation encountered a dead host. \
Networking activity on the local host has not been initiated. \
These conditions are more likely to be indicated by the error case WSAETIMEDOUT. \
");
        break;
        case WSAEHOSTUNREACH:
//10065
        ts::con::prints("%s\n","No route to host. \
A socket operation was attempted to an unreachable host. \
See case WSAENETUNREACH. \
");
        break;
        case WSAENOTEMPTY:
//10066
        ts::con::prints("%s\n","Directory not empty. \
Cannot remove a directory that is not empty. \
");
        break;
        case WSAEPROCLIM:
//10067
        ts::con::prints("%s\n","Too many processes. \
A Windows Sockets implementation may have a limit on the number of applications that can use it simultaneously. \
case WSAStartup may fail with this error if the limit has been reached. \
");
        break;
        case WSAEUSERS:
//10068
        ts::con::prints("%s\n","User quota exceeded. \
Ran out of user quota. \
");
        break;
        case WSAEDQUOT:
//10069
        ts::con::prints("%s\n","Disk quota exceeded. \
Ran out of disk quota. \
");
        break;
        case WSAESTALE:
//10070
        ts::con::prints("%s\n","Stale file handle reference. \
The file handle reference is no longer available. \
");
        break;
        case WSAEREMOTE:
//10071
        ts::con::prints("%s\n","Item is remote. \
The item is not available locally. \
");
        break;
        case WSASYSNOTREADY:
//10091
        ts::con::prints("%s\n","Network subsystem is unavailable. \
This error is returned by case WSAStartup if the Windows Sockets implementation cannot function at this time because the underlying system it uses to provide network services is currently unavailable. \
Users should check: \
That the appropriate Windows Sockets DLL file is in the current path. \
That they are not trying to use more than one Windows Sockets implementation simultaneously. \
If there is more than one Winsock DLL on your system, be sure the first one in the path is appropriate for the network subsystem currently loaded. \
The Windows Sockets implementation documentation to be sure all necessary components are currently installed and configured correctly. \
");
        break;
        case WSAVERNOTSUPPORTED:
//10092
        ts::con::prints("%s\n","Winsock.dll version out of range. \
The current Windows Sockets implementation does not support the Windows Sockets specification version requested by the application. \
Check that no old Windows Sockets DLL files are being accessed. \
");
        break;
        case WSANOTINITIALISED:
//10093
        ts::con::prints("%s\n","Successful case WSAStartup not yet performed. \
Either the application has not called case WSAStartup or case WSAStartup failed. \
The application may be accessing a socket that the current active task does not own (that is, trying to share a socket between tasks), or case WSACleanup has been called too many times. \
");
        break;
        case WSAEDISCON:
//10101
        ts::con::prints("%s\n","Graceful shutdown in progress. \
Returned by case WSARecv and case WSARecvFrom to indicate that the remote party has initiated a graceful shutdown sequence. \
");
        break;
        case WSAENOMORE:
//10102
        ts::con::prints("%s\n","No more results. \
No more results can be returned by the case WSALookupServiceNext function. \
");
        break;
        case WSAECANCELLED:
//10103
        ts::con::prints("%s\n","Call has been canceled. \
A call to the case WSALookupServiceEnd function was made while this call was still processing. \
The call has been canceled. \
");
        break;
        case WSAEINVALIDPROCTABLE:
//10104
        ts::con::prints("%s\n","Procedure call table is invalid. \
The service provider procedure call table is invalid. \
A service provider returned a bogus procedure table to Ws2_32.dll. \
This is usually caused by one or more of the function pointers being NULL. \
");
        break;
        case WSAEINVALIDPROVIDER:
//10105
        ts::con::prints("%s\n","Service provider is invalid. \
The requested service provider is invalid. \
This error is returned by the WSCGetProviderInfo and WSCGetProviderInfo32 functions if the protocol entry specified could not be found. \
This error is also returned if the service provider returned a version number other than 2. \0. \
");
        break;
        case WSAEPROVIDERFAILEDINIT:
//10106
        ts::con::prints("%s\n","Service provider failed to initialize. \
The requested service provider could not be loaded or initialized. \
This error is returned if either a service provider's DLL could not be loaded (LoadLibrary failed) or the provider's WSPStartup or NSPStartup function failed. \
");
        break;
        case WSASYSCALLFAILURE:
//10107
        ts::con::prints("%s\n","System call failure. \
A system call that should never fail has failed. \
This is a generic error code, returned under various conditions. \
Returned when a system call that should never fail does fail. \
For example, if a call to WaitForMultipleEvents fails or one of the registry functions fails trying to manipulate the protocol/namespace catalogs. \
Returned when a provider does not return SUCCESS and does not provide an extended error code. \
Can indicate a service provider implementation error. \
");
        break;
        case WSASERVICE_NOT_FOUND:
//10108
        ts::con::prints("%s\n","Service not found. \
No such service is known. \
The service cannot be found in the specified name space. \
");
        break;
        case WSATYPE_NOT_FOUND:
//10109
        ts::con::prints("%s\n","Class type not found. \
The specified class was not found. \
");
        break;
        case WSA_E_NO_MORE:
//10110
        ts::con::prints("%s\n","No more results. \
No more results can be returned by the case WSALookupServiceNext function. \
");
        break;
        case WSA_E_CANCELLED:
//10111
        ts::con::prints("%s\n","Call was canceled. \
A call to the case WSALookupServiceEnd function was made while this call was still processing. \
The call has been canceled. \
");
        break;
        case WSAEREFUSED:
//10112
        ts::con::prints("%s\n","database query was refused. \
A database query failed because it was actively refused. \
");
        break;
        case WSAHOST_NOT_FOUND:
//11001
        ts::con::prints("%s\n","Host not found. \
No such host is known. \
The name is not an official host name or alias, or it cannot be found in the database(s) being queried. \
This error may also be returned for protocol and service queries, and means that the specified name could not be found in the relevant database. \
");
        break;
        case WSATRY_AGAIN:
//11002
        ts::con::prints("%s\n","Nonauthoritative host not found. \
This is usually a temporary error during host name resolution and means that the local server did not receive a response from an authoritative server. \
A retry at some time later may be successful. \
");
        break;
        case WSANO_RECOVERY:
//11003
        ts::con::prints("%s\n","This is a nonrecoverable error. \
This indicates that some sort of nonrecoverable error occurred during a database lookup. \
This may be because the database files (for example, BSD-compatible HOSTS, SERVICES, or PROTOCOLS files) could not be found, or a DNS request was returned by the server with a severe error. \
");
        break;
        case WSANO_DATA:
//11004
        ts::con::prints("%s\n","Valid name, no data record of requested type. \
The requested name is valid and was found in the database, but it does not have the correct associated data being resolved for. \
The usual example for this is a host name-to-address translation attempt (using gethostbyname or case WSAAsyncGetHostByName) which uses the DNS (Domain Name Server). \
An MX record is returned but no A record�indicating the host itself exists, but is not directly reachable. \
");
        break;
        case WSA_QOS_RECEIVERS:
//11005
        ts::con::prints("%s\n","QoS receivers. \
At least one QoS reserve has arrived. \
");
        break;
        case WSA_QOS_SENDERS:
//11006
        ts::con::prints("%s\n","QoS senders. \
At least one QoS send path has arrived. \
");
        break;
        case WSA_QOS_NO_SENDERS:
//11007
        ts::con::prints("%s\n","No QoS senders. \
There are no QoS senders. \
");
        break;
        case WSA_QOS_NO_RECEIVERS:
//11008
        ts::con::prints("%s\n","QoS no receivers. \
There are no QoS receivers. \
");
        break;
        case WSA_QOS_REQUEST_CONFIRMED:
//11009
        ts::con::prints("%s\n","QoS request confirmed. \
The QoS reserve request has been confirmed. \
");
        break;
        case WSA_QOS_ADMISSION_FAILURE:
//11010
        ts::con::prints("%s\n","QoS admission error. \
A QoS error occurred due to lack of resources. \
");
        break;
        case WSA_QOS_POLICY_FAILURE:
//11011
        ts::con::prints("%s\n","QoS policy failure. \
The QoS request was rejected because the policy system couldn't allocate \
the requested resource within the existing policy. \
");
        break;
        case WSA_QOS_BAD_STYLE:
//11012
        ts::con::prints("%s\n","QoS bad style. \
An unknown or conflicting QoS style was encountered. \
");
        break;
        case WSA_QOS_BAD_OBJECT:
//11013
        ts::con::prints("%s\n","QoS bad object. \
A problem was encountered with some part of the filterspec or the provider-specific buffer in general. \
");
        break;
        case WSA_QOS_TRAFFIC_CTRL_ERROR:
//11014
        ts::con::prints("%s\n","QoS traffic control error. \
An error with the underlying traffic control (TC)  \
API as the generic QoS request was converted for local enforcement by the TC API. \
This could be due to an out of memory error or to an internal QoS provider error. \
");
        break;
        case WSA_QOS_GENERIC_ERROR:
//11015
        ts::con::prints("%s\n","QoS generic error. \
A general QoS error. \
");
        break;
        case WSA_QOS_ESERVICETYPE:
//11016
        ts::con::prints("%s\n","QoS service type error. \
An invalid or unrecognized service type was found in the QoS flowspec. \
");
        break;
        case WSA_QOS_EFLOWSPEC:
//11017
        ts::con::prints("%s\n","QoS flowspec error. \
An invalid or inconsistent flowspec was found in the QOS structure. \
");
        break;
        case WSA_QOS_EPROVSPECBUF:
//11018
        ts::con::prints("%s\n","Invalid QoS provider buffer. \
An invalid QoS provider-specific buffer. \
");
        break;
        case WSA_QOS_EFILTERSTYLE:
//11019
        ts::con::prints("%s\n","Invalid QoS filter style. \
An invalid QoS filter style was used. \
");
        break;
        case WSA_QOS_EFILTERTYPE:
//11020
        ts::con::prints("%s\n","Invalid QoS filter type. \
An invalid QoS filter type was used. \
");
        break;
        case WSA_QOS_EFILTERCOUNT:
//11021
        ts::con::prints("%s\n","Incorrect QoS filter count. \
An incorrect number of QoS FILTERSPECs were specified in the FLOWDESCRIPTOR. \
");
        break;
        case WSA_QOS_EOBJLENGTH:
//11022
        ts::con::prints("%s\n","Invalid QoS object length. \
An object with an invalid ObjectLength field was specified in the QoS provider-specific buffer. \
");
        break;
        case WSA_QOS_EFLOWCOUNT:
//11023
        ts::con::prints("%s\n","Incorrect QoS flow count. \
An incorrect number of flow descriptors was specified in the QoS structure. \
");
        break;
#ifndef __WATCOMC__
        case WSA_QOS_EUNKOWNPSOBJ:
//11024
        ts::con::prints("%s\n","Unrecognized QoS object. \
An unrecognized object was found in the QoS provider-specific buffer. \
");
        break;
#endif
        case WSA_QOS_EPOLICYOBJ:
//11025
        ts::con::prints("%s\n","Invalid QoS policy object. \
An invalid policy object was found in the QoS provider-specific buffer. \
");
        break;
        case WSA_QOS_EFLOWDESC:
//11026
        ts::con::prints("%s\n","Invalid QoS flow descriptor. \
An invalid QoS flow descriptor was found in the flow descriptor list. \
");
        break;
        case WSA_QOS_EPSFLOWSPEC:
//11027
        ts::con::prints("%s\n","Invalid QoS provider-specific flowspec. \
An invalid or inconsistent flowspec was found in the QoS provider-specific buffer. \
");
        break;
        case WSA_QOS_EPSFILTERSPEC:
//11028
        ts::con::prints("%s\n","Invalid QoS provider-specific filterspec. \
An invalid FILTERSPEC was found in the QoS provider-specific buffer. \
");
        break;
        case WSA_QOS_ESDMODEOBJ:
//11029
        ts::con::prints("%s\n","Invalid QoS shape discard mode object. \
An invalid shape discard mode object was found in the QoS provider-specific buffer. \
");
        break;
        case WSA_QOS_ESHAPERATEOBJ:
//11030
        ts::con::prints("%s\n","Invalid QoS shaping rate object. \
An invalid shaping rate object was found in the QoS provider-specific buffer. \
");
        break;
        case WSA_QOS_RESERVED_PETYPE:
//11031
        ts::con::prints("%s\n","Reserved policy QoS element type. \
A reserved policy element was found in the QoS provider-specific buffer. \
");
        break;
        default:
        break;
        }
}

//FTP RETURN CODES
/*

1xx     Positive Preliminary reply
The requested action is being initiated; expect another reply before proceeding with a new command. (The user-process sending another command before the completion reply would be in violation of protocol; but server-FTP processes should queue any commands that arrive while a preceding command is in progress.) This type of reply can be used to indicate that the command was accepted and the user-process may now pay attention to the data connections, for implementations where simultaneous monitoring is diffic
ult. The server-FTP process may send at most, one 1xx reply per command.

2xx     Positive Completion reply
The requested action has been successfully completed. A new request may be initiated.

3xx     Positive Intermediate reply
The command has been accepted, but the requested action is being held in abeyance, pending receipt of further information. The user should send another command specifying this information. This reply is used in command sequence groups.

4xx     Transient Negative Completion reply
The command was not accepted and the requested action did not take place, but the error condition is temporary and the action may be requested again. The user should return to the beginning of the command sequence, if any. It is difficult to assign a meaning to "transient", particularly when two distinct sites (Server- and User-processes) have to agree on the interpretation. Each reply in the 4xx category might have a slightly different time value, but the intent is that the user-process is encouraged to t
ry again. A rule of thumb in determining if a reply fits into the 4xx or the 5xx (Permanent Negative) category is that replies are 4xx if the commands can be repeated without any change in command form or in properties of the User or Server (e.g., the command is spelled the same with the same arguments used; the user does not change his file access or user name; the server does not put up a new implementation.)

5xx     Permanent Negative Completion reply
The command was not accepted and the requested action did not take place. The User-process is discouraged from repeating the exact request (in the same sequence). Even some "permanent" error conditions can be corrected, so the human user may want to direct his User-process to reinitiate the command sequence by direct action at some point in the future (e.g., after the spelling has been changed, or the user has altered his directory status.)

6xx     Protected reply
The RFC 2228 introduced the concept of protected replies to increase security over the FTP communications. The 6xx replies are Base64 encoded protected messages that serves as responses to secure commands. When properly decoded, these replies fall into the above categories.

The second digit is a grouping digit and encodes the following information:

Range   Purpose
x0x     Syntax
These replies refer to syntax errors, syntactically correct commands that don't fit any functional category, unimplemented or superfluous commands.

x1x     Information
These are replies to requests for information, such as status or help.

x2x     Connections
Replies referring to the control and data connections.

x3x     Authentication and accounting
Replies for the login process and accounting procedures.

x4x     Unspecified as of RFC 959.
x5x     File system
These replies indicate the status of the Server file system vis-a-vis the requested transfer or other file system action.

Below is a list of all known return codes that may be issued by an FTP server.

Code    Explanation
100 Series      The requested action is being initiated, expect another reply before proceeding with a new command.
110     Restart marker replay . In this case, the text is exact and not left to the particular implementation; it must read: MARK yyyy = mmmm where yyyy is User-process data stream marker, and mmmm server's equivalent marker (note the spaces between markers and "=").
120     Service ready in nnn minutes.
125     data connection already open; transfer starting.
150     File status okay; about to open data connection.
200 Series      The requested action has been successfully completed.
202     Command not implemented, superfluous at this site.
211     System status, or system help reply.
212     Directory status.
213     File status.
214     Help message.On how to use the server or the meaning of a particular non-standard command. This reply is useful only to the human user.
215     NAME system type. Where NAME is an official system name from the registry kept by IANA.
220     Service ready for new user.
221     Service closing control connection.
225     data connection open; no transfer in progress.
226     Closing data connection. Requested file action successful (for example, file transfer or file abort).
227     Entering passive Mode (h1,h2,h3,h4,p1,p2).
228     Entering Long passive Mode (long address, port).
229     Entering Extended passive Mode (|||port|).
230     User logged in, proceed. Logged out if appropriate.
231     User logged out; service terminated.
232     Logout command noted, will complete when transfer done.
250     Requested file action okay, completed.
257     "PATHNAME" created.
300 Series      The command has been accepted, but the requested action is on hold, pending receipt of further information.
331     User name okay, need password.
332     Need account for login.
350     Requested file action pending further information
400 Series      The command was not accepted and the requested action did not take place, but the error condition is temporary and the action may be requested again.
421     Service not available, closing control connection. This may be a reply to any command if the service knows it must shut down.
425     Can't open data connection.
426     Connection closed; transfer aborted.
430     Invalid username or password
434     Requested host unavailable.
450     Requested file action not taken.
451     Requested action aborted. Local error in processing.
452     Requested action not taken. Insufficient storage space in system.File unavailable (e.g., file busy).
500 Series      Syntax error, command unrecognized and the requested action did not take place. This may include errors such as command line too long.
501     Syntax error in parameters or arguments.
502     Command not implemented.
503     Bad sequence of commands.
504     Command not implemented for that parameter.
530     Not logged in.
532     Need account for storing files.
550     Requested action not taken. File unavailable (e.g., file not found, no access).
551     Requested action aborted. Page type unknown.
552     Requested file action aborted. Exceeded storage allocation (for current directory or dataset).
553     Requested action not taken. File name not allowed.
600 Series      Replies regarding confidentiality and integrity
631     Integrity protected reply.
632     Confidentiality and integrity protected reply.
633     Confidentiality protected reply.
10000 Series    Common Winsock Error Codes
10054   Connection reset by peer. The connection was forcibly closed by the remote host.
10060   Cannot connect to remote server.
10061   Cannot connect to remote server. The connection is actively refused by the server.
10066   Directory not empty.
10068   Too many users, server is full.*/

