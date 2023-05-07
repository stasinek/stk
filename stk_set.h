//---------------------------------------------------------------------------
#ifndef __set_set_h__
#define __set_set_h__
//---------------------------------------------------------------------------
#include "./stk_main.h"
#include "./mem/stk_mem.h"
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
     __set_tree(uint32_t a_level) {
    for (uint32_t c = 1; c <= a_level; c++) {
         f_ptrs_size = f_ptrs_size * 256;
        }
    ptrs = static_cast<__set_tree_node**>(stk::mem::alloc(f_ptrs_size*sizeof(stk::__set_tree_node*)));
    for (uint32_t i = 0; i < f_ptrs_size; i++) {
         ptrs[i] = new stk::__set_tree_node(NULL);
        }
    }
~__set_tree(void) {
    for (uint32_t i = 0; i < f_ptrs_size; i++) {
         delete ptrs[i];
        }
    delete ptrs;
    f_ptrs_size = 0;
    }
};
//---------------------------------------------------------------------------
#ifdef __cplusplus
}
#endif
//---------------------------------------------------------------------------
#endif // __set_CLASS_H
