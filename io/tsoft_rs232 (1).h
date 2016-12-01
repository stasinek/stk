//---------------------------------------------------------------------------
#ifndef __tsoft_rs232_H__
#define __tsoft_rs232_H__
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace com {
//---------------------------------------------------------------------------
#define COM_PARITY_NONE		0
#define COM_PARITY_EVEN		1
#define COM_PARITY_ODD		2
//---------------------------------------------------------------------------
extern int32_t open		(int8_t com_num,int32_t baud,char parity,char data_bits,char stop_bits);
extern int32_t close	(int8_t com_num);
extern int32_t send		(int8_t com_num,void *data,uint32_t len);
extern int32_t recv		(int8_t com_num,void *data,uint32_t len);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
