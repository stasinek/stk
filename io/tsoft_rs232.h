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
extern __int32 open		(__int8 com_num,__int32 baud,char parity,char data_bits,char stop_bits);
extern __int32 close	(__int8 com_num);
extern __int32 send		(__int8 com_num,void *data,uint32_t len);
extern __int32 recv		(__int8 com_num,void *data,uint32_t len);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
