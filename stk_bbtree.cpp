//---------------------------------------------------------------------------
#pragma hdrstop
#include "stk_bbtree.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
struct bt_node
{
 	unsigned index;
	void *value;
	long left;
	long right;
	unsigned depth;
};
struct bt_tree
{
 	unsigned n;
	unsigned buffer;
	long current_root;
	struct bt_node* nodes;
	int freeslots;
};
//---------------------------------------------------------------------------
// the function add() is the same for each case, and data type, it works just
//with slots and returns the index of the new value if inserted
// otherwise the index of the existing value. The handling of the "error" or whatelse
// get done from the add_if_not_exists or other interface function (in my version I add also a pointer to function, one
//for compare, for simplicity I don't put it here)
long add(struct bt_tree*bt, unsigned root, unsigned newitemix);
// the function below save first the data in a new slot. this get done
//because I would generalize the function of the tree. So, when found, it
//finds all the information in the proper slot. Without to modify the
//parameter list of the core functions. So with different data type I just have to modify my
//interface function.
//---------------------------------------------------------------------------

unsigned add_if_not_exists(struct bt_tree* bt, char *name, void*value)
{
	//the function get_new_slot() pop a value from freeslots, if it has
	// otherwise increase the counter of the tree, check if the buffer
	//can satisfy the new request, otherwise realloc() the vector
	res = get_new_slot(bt->freeslots);
	unsigned tmp=add(bt, cur,res);
	bt->node[res].name=name; //I just paste the address of the name
				    //i don't duplicate yet
	bt->node[res].value=value;
	if (tmp==cur)	//successfully inserted
	{
		bt->node[res].name=strdup(name);
		bt->node[res].value=value;

	}
	else
	{  //already existing
		stack_push(bt->freeslots,res);
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

long add(struct bt_tree*bt,  unsigned newitemix)
{
	int cmp;
	long root=bt->cuurent_root;
	while (root>0)
	{
		if ((cmp=strcmp(bt->nodes[root].name,bt->nodes[newitemix].name)==0)
		{
			return root;
		}else if(cmp<0)
		{
			if(bt->nodes[root].right<0)
			{
				bt->nodes[root].right=newitemix;
				bt->nodes[newitemix].parent=root;
				break;
			}
			else
				root=bt->nodes[root].right;
		}
		else
		{
			if(bt->nodes[root].left<0)
			{
				bt->nodes[root].left=newitemix;
				bt->nodes[newitemix].parent=root;
				break;
			}
			else
				root=bt->nodes[root].left;
		}

	}

	propagate_depth(bt,newitemix);
	bubble(bt, newitemix);
	return newitemix;
}
//---------------------------------------------------------------------------

void propagate_depth(bt,newitemix)
{
   assert(newitemix>=0);
   unsigned i, depth;
   for(i=newitemix;i>=0;i=bt->nodes[i].parent)
   {
          depth=bt->nodes[i].right<0?0:bt->nodes[bt->nodes[i].right].depth;
          depth=bt->nodes[i].left<0?depth:max(depth,bt->nodes[bt->nodes[i].left].depth);
          depth++;
          bt->nodes[i].depth=depth;
   }
}
//---------------------------------------------------------------------------

void bubble(struct bt_tree*bt, unsigned index)
{
	unsigned parent=bt->nodes[index].parent;
	struct bt_node*right,*left;
	while (parent>=0)
	{	right=bt->nodes[index].right<0?NULL:&bt->nodes[bt->nodes[index].right];
		left=bt->nodes[index].left<0?NULL:&bt->nodes[bt->nodes[index].left];
		if ((!left && right && right->depth>1)||
		   (!right &&  left && left->depth>1)||
		(left && right && abs(right->depth-left->depth)>1))
			rotate(bt,index);
		index=parent;
		parent=bt->nodes[index].parent;
	}
}
//---------------------------------------------------------------------------

unsigned rotate(struct bt_tree*bt,unsigned ix)
{  //we save first all the neighborhood in some comfortable variables
	asser (ix>=0 && ix<bt->n);
   struct bt_node *me,*parent,*left,*right;
  char side; //and defines comfortable which side my parent keeps me
  me=&bt->nodes[ix];
  parent=me->parent<0?NULL:&bt->nodes[me->parent];
  left=me->left<0?NULL:&bt->nodes[me->left];
  right=me->right<0?NULL:&bt->nodes[me->right];
   assert(left || right);
  if (parent)
   side=parent->left==me->index?'l':'r';
  else
   side =0;
   if (!right || (left && left->depth>right->depth)
   {
     me->parent=left->index;
     me->left=left->right;
     left->right=me->index;
     if (me->left>=0)
        bt->nodes[me->left].parent=me->index;
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

void* find(struct bt_tree*bt,char *key)
{
	long current_root=bt->current_root;
	int cmp;
	while (current_root>=0)
	{	if ( (cmp=strcmp(bt->nodes[current_root].name,key)==0)
			return bt->nodes[current_root].value;
		else if (cmp<0)
			current_root=bt->nodes[current_root].right;
		else
			current_root=bt->nodes[current_root].left;

	}
	printf ("item %s not present in the tree\n",key);
	return NULL;
}
//---------------------------------------------------------------------------

void  fill_ratio(struct bt_tree*bt)
{
	unsigned depth=0:
	long i,n,buf, fix;
	buf=max(bt->n/10,100);
	n=0;
	 long long *reg= (long long*)calloc(buf,sizeof(long long));
	reg[n++]=bt->current_root;
	while (n>0)
	{
		depth ++;
		printf ("depth %d count %d fillratio %g\n",depth, n, (double)n/
      for (i=0;i<fix;i++)
     {
        if (bt<<depth-1)); fix="n;" for="">nodes[reg[i]].left<0 && bt->nodes[reg[i]].right<0)
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
		else if (i<n) reg="">nodes[reg[i]].left<0 && bt->nodes[reg[i]].right>0)
				reg [i]=bt->nodes[reg[i]].right;
			else if (bt->nodes[reg[i]].left>=0 && bt->nodes[reg[i]].right<0)
				reg [i]=bt->nodes[reg[i]].left;
			else
			{
				n++;
				if (n>=buf)
				{
					buf+=buf;
					reg=(long long*)realloc(reg, buf*sizeof(long long));
				}
				reg [i]=bt->nodes[reg[i]].right;
				reg [n]=bt->nodes[reg[i]].left;
			}
		}
	}
}
//---------------------------------------------------------------------------

