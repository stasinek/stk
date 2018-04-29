//---------------------------------------------------------------------------
#include "stk_set.h"
//---------------------------------------------------------------------------

stk::__set_tree_node::__set_tree_node()
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
     f_owner = NULL;

}
//---------------------------------------------------------------------------

stk::__set_tree_node::__set_tree_node(stk::__set_tree_node *a_owner)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
     f_owner = a_owner;
}
//---------------------------------------------------------------------------

stk::__set_tree_node::~__set_tree_node()
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
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
__DEBUG_FUNC_CALLED("")
#endif
return f_owner;
}
//---------------------------------------------------------------------------

uint32_t __stdcall stk::__set_tree_node::T_level() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
return f_level;
}
//---------------------------------------------------------------------------

stk::__set_tree_node *__stdcall stk::__set_tree_node::L_child() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
return f_l_child;
}
//---------------------------------------------------------------------------

stk::__set_tree_node *__stdcall stk::__set_tree_node::R_child() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
return f_r_child;
}
//---------------------------------------------------------------------------

void __stdcall stk::__set_tree_node::set_L_child(stk::__set_tree_node *a_node)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
f_l_child = a_node;
}
//---------------------------------------------------------------------------

void __stdcall stk::__set_tree_node::set_R_child(stk::__set_tree_node *a_node)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
f_r_child = a_node;
}
//---------------------------------------------------------------------------
