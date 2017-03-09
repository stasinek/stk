//---------------------------------------------------------------------------
#ifndef __set_CLASS_H
#define __set_CLASS_H
//---------------------------------------------------------------------------
#include "./tsoft_main.h"
#include "./mem/tsoft_mem.h"
//---------------------------------------------------------------------------
namespace ts {
//---------------------------------------------------------------------------
class __set_tree_node
{
public:
	  __set_tree_node();
	  __set_tree_node(__set_tree_node *owner);
	 ~__set_tree_node();
	  __set_tree_node *__stdcall T_owner() const;
	  uint32_t	__stdcall T_level() const;
	  __set_tree_node *__stdcall L_child() const;
	  __set_tree_node *__stdcall R_child() const;
	  void __stdcall set_L_child(__set_tree_node *a_node);
	  void __stdcall set_R_child(__set_tree_node *a_node);
private:
	  __set_tree_node *f_owner;
	  uint32_t f_level;
	  __set_tree_node *f_l_child;
	  __set_tree_node *f_r_child;
};
//---------------------------------------------------------------------------
struct __set_tree {
   ts::__set_tree_node **ptrs; size_t f_ptrs_size;
	 __set_tree(uint32_t a_level) {
	for (uint32_t c = 1; c <= a_level; c++) {
		 f_ptrs_size = f_ptrs_size * 256;
		}
	ptrs = (__set_tree_node**)ts::mem::alloc(f_ptrs_size*sizeof(ts::__set_tree_node*));
	for (uint32_t i = 0; i < f_ptrs_size; i++) {
		 ptrs[i] = new ts::__set_tree_node(NULL);
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
}
//---------------------------------------------------------------------------
#endif // __set_CLASS_H
