//---------------------------------------------------------------------------
#include "__set.h"
//---------------------------------------------------------------------------
ts::__set_tree_node::__set_tree_node()
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
	 f_owner = NULL;

}
//---------------------------------------------------------------------------
ts::__set_tree_node::__set_tree_node(ts::__set_tree_node *a_owner)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
	 f_owner = a_owner;
}
//---------------------------------------------------------------------------
ts::__set_tree_node::~__set_tree_node()
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
ts::__set_tree_node *__stdcall ts::__set_tree_node::T_owner() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
return f_owner;
}
//---------------------------------------------------------------------------
uint32_t __stdcall ts::__set_tree_node::T_level() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
return f_level;
}
//---------------------------------------------------------------------------
ts::__set_tree_node *__stdcall ts::__set_tree_node::L_child() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
return f_l_child;
}
//---------------------------------------------------------------------------
ts::__set_tree_node *__stdcall ts::__set_tree_node::R_child() const
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
return f_r_child;
}
//---------------------------------------------------------------------------
void __stdcall ts::__set_tree_node::set_L_child(ts::__set_tree_node *a_node)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
f_l_child = a_node;
}
//---------------------------------------------------------------------------
void __stdcall ts::__set_tree_node::set_R_child(ts::__set_tree_node *a_node)
{
#ifdef __DEBUG_SET_TREE__
__DEBUG_FUNC_CALLED("")
#endif
f_r_child = a_node;
}
//---------------------------------------------------------------------------
