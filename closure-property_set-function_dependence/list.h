enum Error_code{success,fail,overflow,underflow,Range_error};

template<class Node_entry>
struct Node
{
	Node_entry entry;
	Node<Node_entry>* next;
	Node();
	Node(Node_entry x,Node<Node_entry>* link=NULL);
};

template<class List_entry>
class List
{
public:
	List();
	bool full()const;
	int size()const;
	bool empty()const;
	void clear();
	void traverse(void(* visit)(List_entry&));
	Error_code retrieve(int position,List_entry&)const;
	Error_code replace(int position,const List_entry&x);
	Error_code remove(int position,List_entry&x);
	Error_code insert(int position,const List_entry&x);
	//safe guards
	~List();
	List(const List<List_entry>& copy);
	void operator=(const List<List_entry>& copy);
protected:
	int count;
	Node<List_entry>* head;
	Node<List_entry>* set_position(int position)const;
};

template<class Node_entry>
Node<Node_entry>::Node()
{
	next=NULL;
}

template<class Node_entry>
Node<Node_entry>::Node(Node_entry x,Node<Node_entry>* link=NULL)
{
	entry=x;
	next=link;
}

template<class List_entry>
List<List_entry>::List()
{
	count=0;
	head=NULL;
}

template<class List_entry>
bool  List<List_entry>::full()const
{
	return false;
}

template<class List_entry>
int List<List_entry>::size()const
{
	return count;
}

template<class List_entry>
bool List<List_entry>::empty()const
{
	return  head==NULL;
}

template<class List_entry>
void List<List_entry>::clear()
{
	Node<List_entry>*p,*q;
	for(p=head;p;p=q)
	{
		q=p->next;
		delete p;
	}
	count=0;
	head=NULL;
}

template<class List_entry>
void List<List_entry>::traverse(void(*visit)(List_entry&))
{
	for(int i=0;i<count;i++)
		(*visit)(entry[i]);
}

template<class List_entry>
Error_code List<List_entry>::retrieve(int position,List_entry&x)const
{
	Node<List_entry>*current;
	if(position<0||position>count)
		return Range_error;
	current=set_position(position);
	x=current->entry;
	return success;
}

template<class List_entry>
Error_code  List<List_entry>::replace(int position,const List_entry&x)
{
	Node<List_entry>*current;
	if(position<0||position>count)
		return range_error;
	current=set_position(position);
	current->entry=x;
	return success;
}

template<class List_entry>
Error_code List<List_entry>::remove(int position,List_entry&x)
{
	Node<List_entry>*current,old_node,*neighbor;
	if(count==0)
		return fail;
	if(position<0||position>=count)
		return range_error;
	if(position==0)
	{
		old_node=set_position(position);
		head->next=old_node->next;
	}
	else
	{
		neighbor=set_position(position-1);
		old_node=neighbor->next;
		neighbor->next=old_node->next;
	}
	x=old_node->entry;
	delete old_node;
	count--;
	return success;
}

template<class List_entry>
Error_code  List<List_entry>::insert(int position,const List_entry&x)
{
	if(position<0||position>count)
		return Range_error;
	Node<List_entry>*new_node,*previous,*following;
	if(position>0)
	{
		previous=set_position(position-1);
		following=previous->next;
	}
	else following=head;
	new_node=new Node<List_entry>(x,following);
	if(new_node==NULL)
		return overflow;
	if(position==0)
		head=new_node;
	else
		previous->next=new_node;
	count++;
	return success;
}

template<class List_entry>
List<List_entry>::~List()
{
	clear();
}

template<class List_entry>
List<List_entry>::List(const List<List_entry>&copy)
{
	count=copy.count;
	Node<List_entry>*new_node,*old_node=copy.head;
	if(old_node==NULL)
		head=NULL;
	else
	{
		new_node=head=new Node<List_entry>(old_node->entry);
		while(old_node->next!=NULL)
		{
			old_node=old_node->next;
			new_node->next=new Node<List_entry>(old_node->entry);
			new_node=new_node->next;
		}
	}
}

template<class List_entry>
void List<List_entry>::operator=(const List<List_entry>&copy)
{
	count=copy.count;
	Node<List_entry>*new_head,*new_copy,*old_node=copy.head;
	if(old_node==NULL)
		new_head=NULL;
	else
	{
		new_copy=new_head=new Node<List_entry>(old_node->entry);
		while(old_node->next!=NULL)
		{
			old_node=old_node->next;
			new_copy->next=new Node<List_entry>(old_node->entry);
			new_copy=new_copy->next;
		}
	}
   while(!empty()) clear();
   head=new_head;
}

template<class List_entry>
Node<List_entry>*  List<List_entry>::set_position(int position)const
{
	Node<List_entry>*q=head;
	for(int i=0;i<position;i++)
		q=q->next;
	return q;
}