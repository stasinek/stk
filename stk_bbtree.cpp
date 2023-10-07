//---------------------------------------------------------------------------
#include <assert.h>
#pragma hdrstop
#include "stk_bbtree.h"
#include <stk_cstr_utils.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
// the function add() is the same for each case, and data type, it works just
//with slots and returns the index of the new value if inserted
// otherwise the index of the existing value. The handling of the "error" or whatelse
// get done from the add_if_not_exists or other interface function (in my version I add also a pointer to function, one
//for compare, for simplicity I don't put it here)

// the function below save first the data in a new slot. this get done
//because I would generalize the function of the tree. So, when found, it
//finds all the information in the proper slot. Without to modify the
//parameter list of the core functions. So with different data type I just have to modify my
//interface function.
//---------------------------------------------------------------------------

long __stdcall add_if_not_exists(struct bt_tree* bt, char *name, void*value)
{
	//the function get_new_slot() pop a value from freeslots, if it has
	// otherwise increase the counter of the tree, check if the buffer
	//can satisfy the new request, otherwise realloc() the vector
    //TODO: create missing get_new_slot function!
    //long res = get_new_slot(bt->freeslots);
    long cur,res;
	unsigned long tmp = add(bt,cur,res);
	bt->node[res].name=name; //I just paste the address of the name
				    //i don't duplicate yet
	bt->node[res].value = value;
	if (tmp==cur)	//successfully inserted
	{
		bt->node[res].name=stk::cstr::dup(name);
		bt->node[res].value=value;

	}
	else
	{  //already existing
		// TODO: missing stack_push
        //stac_push(bt->freeslots,res);
		bt->node[res].name=NULL;
		bt->node[res].value=NULL;
	}
	return tmp;
}
//---------------------------------------------------------------------------
//this is a core function, it returns "newitemix"
//if successfully inserted otherwise the index of the existing item
//with the same key. What do with it is a matter of interface function (if raise an exception or
//sum, or just add_if_not_exists)

long __stdcall add(struct bt_tree *bt, unsigned long newitemix)
{
	int cmp;
	///long root=bt->cuurent_root;
long root;
	while (root>0)
	{
		if ((cmp=stk::cstr::cmp(bt->node[root].name,bt->node[newitemix].name))==0)
		{
			return root;
		}else if(cmp<0)
		{
			if(bt->node[root].right<0)
			{
				bt->node[root].right=newitemix;
				bt->node[newitemix].parent=root;
				break;
			}
			else
				root=bt->node[root].right;
		}
		else
		{
			if(bt->node[root].left<0)
			{
				bt->node[root].left=newitemix;
				bt->node[newitemix].parent=root;
				break;
			}
			else
				root=bt->node[root].left;
		}

	}

	propagate_depth(bt,newitemix);
	bubble(bt, newitemix);
	return newitemix;
}
//---------------------------------------------------------------------------

void __stdcall propagate_depth(struct bt_tree *bt, unsigned long newitemix)
{
   assert(newitemix>=0);
   unsigned i, depth;
   for(i=newitemix;i>=0;i=bt->node[i].parent)
   {
          depth=bt->node[i].right<0?0:bt->node[bt->node[i].right].depth;
          depth=bt->node[i].left<0?depth:max(depth,bt->node[bt->node[i].left].depth);
          depth++;
          bt->node[i].depth=depth;
   }
}
//---------------------------------------------------------------------------

void __stdcall bubble(struct bt_tree*bt, unsigned index)
{
	unsigned parent=bt->node[index].parent;
	struct bt_node*right,*left;
	while (parent>=0)
	{	right=bt->node[index].right<0?NULL:&bt->node[bt->node[index].right];
		left=bt->node[index].left<0?NULL:&bt->node[bt->node[index].left];
		if ((!left && right && right->depth>1)||
		   (!right &&  left && left->depth>1)||
		(left && right && abs(right->depth-left->depth)>1))
			rotate(bt,index);
		index=parent;
		parent=bt->node[index].parent;
	}
}
//---------------------------------------------------------------------------

long __stdcall rotate(struct bt_tree*bt,unsigned long ix)
{  //we save first all the neighborhood in some comfortable variables
	assert(ix>=0 && ix<bt->n);
   struct bt_node *me,*parent,*left,*right;
  char side; //and defines comfortable which side my parent keeps me
  me=&bt->node[ix];
  parent=me->parent<0?NULL:&bt->node[me->parent];
  left=me->left<0?NULL:&bt->node[me->left];
  right=me->right<0?NULL:&bt->node[me->right];
   assert(left || right);
  if (parent)
   side=parent->left==me->index?'l':'r';
  else
   side =0;
   if (!right || (left && left->depth>right->depth))
   {
     me->parent=left->index;
     me->left=left->right;
     left->right=me->index;
     if (me->left>=0)
        bt->node[me->left].parent=me->index;
     if (side='l')
        parent->left=left->index;
     else if(side='r')
        parent->right=left->index;
     else
        bt->current_root=left->index;
     propagate_depth(bt, me->index);
    }
    else
   {
      //mirror routine

   }
}
//---------------------------------------------------------------------------

void* __stdcall find(struct bt_tree*bt,char *key)
{
	long current_root=bt->current_root;
	int cmp;
	while (current_root>=0)
	{	if ( (cmp=strcmp(bt->node[current_root].name,key))==0)
			return bt->node[current_root].value;
		else if (cmp<0)
			current_root=bt->node[current_root].right;
		else
			current_root=bt->node[current_root].left;

	}
	printf ("item %s not present in the tree\n",key);
	return NULL;
}
//---------------------------------------------------------------------------

void __stdcall fill_ratio(struct bt_tree *bt)
{
	unsigned long depth = 0;
	long i, n , buf, fix;
	buf=max(bt->n/10,100);
	n=0;
	 __int64 *reg= (__int64*)calloc(buf,sizeof(__int64));
	reg[n++]=bt->current_root;
	while (n>0)
	{
		depth ++;
		printf ("depth %d count %d fillratio %g\n",depth, n, (double)n);
      for (i=0;i<fix;i++)
     {
        if (1) //bt<<(depth-1)) // fix="n;" for="">node[reg[i]].left<0 && bt->node[reg[i]].right<0)
			{
               if (fix<n)
               {
                 reg[i--]=reg[--fix];
                 reg[fix]=reg[--n];
               }
               else
               {
                 reg[i--]=reg[--fix];
                 n--;
                }
				n--;
        }
		else if (i<n) //reg="";node[reg[i]].left<0 && bt->node[reg[i]].right>0)
				reg [i]=bt->node[reg[i]].right;
			else if (bt->node[reg[i]].left>=0 && bt->node[reg[i]].right<0)
				reg [i]=bt->node[reg[i]].left;
			else
			{
				n++;
				if (n>=buf)
				{
					buf+=buf;
					reg=(__int64*)realloc(reg, buf*sizeof(__int64));
				}
				reg [i]=bt->node[reg[i]].right;
				reg [n]=bt->node[reg[i]].left;
			}
		}
	}
}
//---------------------------------------------------------------------------

