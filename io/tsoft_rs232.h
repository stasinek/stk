//---------------------------------------------------------------------------
#ifndef tsoft_rs232_h
#define tsoft_rs232_h
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
//---------------------------------------------------------------------------
namespace ts { namespace com {
//---------------------------------------------------------------------------
#define COM_PARITY_NONE		0
#define COM_PARITY_EVEN		1
#define COM_PARITY_ODD		2
//---------------------------------------------------------------------------
extern int32_t open		(const int8_t com_num,const int32_t baud,const char parity,const char data_bits,const char stop_bits);
extern int32_t close	(const int8_t com_num);
extern int32_t send		(const int8_t com_num,void *data,const int32_t len);
extern int32_t recv		(const int8_t com_num,void *data,const int32_t len);
//---------------------------------------------------------------------------
}}
//---------------------------------------------------------------------------
#endif
