//---------------------------------------------------------------------------
#ifndef __set_set_h__
#define __set_set_h__
//---------------------------------------------------------------------------
#include "./stk_main.h"
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk {
#endif
//---------------------------------------------------------------------------
class STK_IMPEXP __set_tree_node {
public:
      __set_tree_node();
      __set_tree_node(__set_tree_node *owner);
     ~__set_tree_node();
      __set_tree_node  *__stdcall T_owner(void) const;
      uint32_t          __stdcall T_level(void) const;
      __set_tree_node  *__stdcall L_child(void) const;
      __set_tree_node  *__stdcall R_child(void) const;
      void              __stdcall set_L_child(__set_tree_node *a_node);
      void              __stdcall set_R_child(__set_tree_node *a_node);
private:
      __set_tree_node *f_owner;
      uint32_t f_level;
      __set_tree_node *f_l_child;
      __set_tree_node *f_r_child;
};
//---------------------------------------------------------------------------
struct STK_IMPEXP __set_tree {
   stk::__set_tree_node **ptrs; size_t f_ptrs_size;
__stdcall  __set_tree(uint32_t a_level);
__stdcall ~__set_tree(void);
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}
#endif
//---------------------------------------------------------------------------
#endif // __set_CLASS_H
