//---------------------------------------------------------------------------
#ifndef __stk_bbtree_h__
#define __stk_bbtree_h__
//---------------------------------------------------------------------------
struct bt_node
{
 	unsigned index;
	void *value;
    char *name;
	long left;
	long right;
	unsigned depth;
    long parent;
};
struct bt_tree
{
 	unsigned n;
	unsigned buffer;
	long current_root;
	struct bt_node* node;
	int freeslots;
};
//---------------------------------------------------------------------------
long __stdcall add_if_not_exists(struct bt_tree* bt, char *name, void* value);
long __stdcall add(struct bt_tree* bt, unsigned long root, unsigned long newitemix);
long __stdcall add(struct bt_tree* bt, unsigned long newitemix);
void __stdcall propagate_depth(struct bt_tree* bt, unsigned long newitemix);
void __stdcall bubble(struct bt_tree* bt, unsigned long index);
long __stdcall rotate(struct bt_tree* bt, unsigned long ix);
void* __stdcall find(struct bt_tree* bt, char *key);
void  __stdcall fill_ratio(struct bt_tree* bt);
//---------------------------------------------------------------------------
#endif
