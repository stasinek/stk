//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#pragma hdrstop
#include "./mem/stk_mem.h"
//---------------------------------------------------------------------------
#include "stk_set.h"
//---------------------------------------------------------------------------
stk::__set_tree::__set_tree(uint32_t a_level)
{
for (uint32_t c = 1; c <= a_level; c++) {
     f_ptrs_size = f_ptrs_size * 256;
    }
ptrs = static_cast<__set_tree_node**>(stk::mem::alloc(f_ptrs_size*sizeof(stk::__set_tree_node*)));
for (uint32_t i = 0; i < f_ptrs_size; i++) {
     ptrs[i] = new stk::__set_tree_node(NULL);
    }
}
//---------------------------------------------------------------------------

stk::__set_tree::~__set_tree(void)
{
for (uint32_t i = 0; i < f_ptrs_size; i++) {
     delete ptrs[i];
    }
delete ptrs;
f_ptrs_size = 0;
}
//---------------------------------------------------------------------------

stk::__set_tree_node::__set_tree_node()
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
     f_owner = NULL;

}
//---------------------------------------------------------------------------

stk::__set_tree_node::__set_tree_node(stk::__set_tree_node *a_owner)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
     f_owner = a_owner;
}
//---------------------------------------------------------------------------

stk::__set_tree_node::~__set_tree_node()
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
     if (f_owner!=NULL) {
         f_owner->set_L_child(NULL);
         f_owner->set_R_child(NULL);
         f_owner = NULL;
     }
}
//---------------------------------------------------------------------------

stk::__set_tree_node *__stdcall stk::__set_tree_node::T_owner() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
return f_owner;
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__set_tree_node::T_level() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
return f_level;
}
//---------------------------------------------------------------------------

stk::__set_tree_node *__stdcall stk::__set_tree_node::L_child() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
return f_l_child;
}
//---------------------------------------------------------------------------

stk::__set_tree_node *__stdcall stk::__set_tree_node::R_child() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
return f_r_child;
}
//---------------------------------------------------------------------------

void __stdcall stk::__set_tree_node::set_L_child(stk::__set_tree_node *a_node)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
f_l_child = a_node;
}
//---------------------------------------------------------------------------

void __stdcall stk::__set_tree_node::set_R_child(stk::__set_tree_node *a_node)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_CALLED("")
#endif
f_r_child = a_node;
}
//---------------------------------------------------------------------------
