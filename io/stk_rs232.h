//---------------------------------------------------------------------------
#ifndef __stk_rs232_H__
#define __stk_rs232_H__
//---------------------------------------------------------------------------
#include "./../stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace com {
#endif
//---------------------------------------------------------------------------
#define COM_PARITY_NONE		0
#define COM_PARITY_EVEN		1
#define COM_PARITY_ODD		2
//---------------------------------------------------------------------------
extern STK_IMPEXP int32_t __stdcall open	(const int8_t com_num,const int32_t baud,const char parity,const char data_bits,const char stop_bits);
extern STK_IMPEXP int32_t __stdcall close	(const int8_t com_num);
extern STK_IMPEXP int32_t __stdcall send	(const int8_t com_num,void *data,const int32_t len);
extern STK_IMPEXP int32_t __stdcall recv	(const int8_t com_num,void *data,const int32_t len);
//---------------------------------------------------------------------------
#ifdef __cplusplus
}} //namespace stk,com
#endif
//---------------------------------------------------------------------------
#endif
