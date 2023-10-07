//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#pragma hdrstop
#include "./../sockets/stk_sockets.h"
#include "./../io/stk_console.h"
#include "./../mem/stk_mem.h"
#include "stk_kop32_API.h"
//---------------------------------------------------------------------------
#include "stk_kop32_socket_server.h"
//---------------------------------------------------------------------------

int start_kop32_server(char *ip, char *port)
{
time_t czas, czas_ramki;
int x;
stk::socket::SOCKET_BUFFER_CLASS buffer;
SOCKET server = stk::socket::create_server_socket(ip,port,120);

stk::cstr::mov(buffer.send_lp,"KOP32: OK"); buffer.send_count = stk::cstr::len(buffer.send_lp);
buffer.send_done_count = 0;
do {
x = send(server,&buffer.send_lp[buffer.send_done_count],buffer.send_count-buffer.send_done_count,0);
if (x>=0) buffer.send_done_count += x;
} while(buffer.send_done_count < buffer.send_count);

do {
time(&czas);
stk::mem::set(buffer.recv_lp,0,MAX_REQUEST);
		buffer.recv_done_count = recv( server,buffer.recv_lp,buffer.recv_size,0 );
if (buffer.recv_done_count == 0 || buffer.recv_done_count == WSAECONNRESET || buffer.recv_done_count  < 0 || buffer.recv_done_count == SOCKET_ERROR)
break;
if (buffer.recv_done_count < 4) {
// BAD COMMAND
stk::cstr::mov(buffer.send_lp,"503\r\n");
buffer.send_count = stk::cstr::len(buffer.send_lp);
}
else
if (stk::cstr::pos(buffer.recv_lp,0,"NOP")==0) {
//NOP
		stk::cstr::mov(buffer.send_lp,"WILL\r\n");
		buffer.send_count = stk::cstr::len(buffer.send_lp);
}
else
if (stk::cstr::pos(buffer.recv_lp,0,"DO")==0) {
//DO
		stk::cstr::mov(buffer.send_lp,"WILL\r\n");
		buffer.send_count = stk::cstr::len(buffer.send_lp);
}
else {
//CODE Not Implemented
		stk::cstr::mov(buffer.send_lp,"502\r\n");
		buffer.send_count = stk::cstr::len(buffer.send_lp);
}
//answer to client
for (buffer.send_done_count = 0; buffer.send_done_count < buffer.send_count;) {
		 buffer.send_done_count += send( server, &buffer.send_lp[buffer.send_done_count], buffer.send_count, 0 );
}
} while (1);

stk::socket::close_socket(server);
stk::con::prints("\n");
return 0;
}

