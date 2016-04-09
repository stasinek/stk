//---------------------------------------------------------------------------
//----------------- "tsoft, where?" 2001-2002 -------------------------------
//---------------------------------------------------------------------------
#ifndef __tsoft_rs232_H__
#define __tsoft_rs232_H__
//---------------------------------------------------------------------------
namespace ts { namespace com {
//---------------------------------------------------------------------------
#define COM_PARITY_NONE		0
#define COM_PARITY_EVEN		1
#define COM_PARITY_ODD		2
//---------------------------------------------------------------------------
extern int open(int com_num,int baud,int parity,int data_bits,int stop_bits);
extern int close(int com_num);
extern int send(int com_num,void *data,unsigned long int len);
extern int recv(int com_num,void *data,unsigned long int len);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
