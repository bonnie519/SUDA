#include<iostream>
#include<vector>
#include"Depen.h"
#include"list.h"
using namespace std;

/*
（1）根据求属性集闭包的算法，用你熟悉的语言编写程序，要求如下：
1.	由用户输入函数依赖，当用户输入End时，表示所有依赖都输入完毕。(即函数依赖是由用户自己定的，程序中不能假定某个具体的依赖)。
2.	函数依赖的形式是AB->C, A->BE这样的形式，为了简单起见，我们假定所有的属性都是用英文的大写字母表示，由A到Z。（提示，你可以让
用户先输入依赖左边的属性，然后再输入依赖右边的属性，用来表示A->B这样的形式）
3.	用户输入完毕所有的依赖后，显示“请输入属性集求闭包”的提示，当用户输入1个或者多个属性时，求出对应的闭包。（如，用户输入A，
则显示A+的值， 用户输入AB则求出AB+的值。显示完毕后，再次显示“请输入属性集求闭包”，让用户继续输入属性，直到用户输入END后程序结束。

（2）在上面求属性集闭包的算法的基础上，根据求函数依赖闭包的算法，显示用户输入的函数依赖的闭包F+。
*/

string Result;
void InputF_D(List<Depen>& x);
void ADepen(string& a,List<Depen>&x);
bool Quiry(string&com,List<Depen>&x);
int TotalA(List<Depen>& x);
void Combination(char* str ,int number ,string &t,List<Depen>&x);
void Delete(string& str);
void Sort(string& str);

void main()
{
	string l,r,a;
	List<Depen> x;
	//-----------------
	InputF_D(x);
	//------------
	cout<<"请输入属性及求闭包"<<endl<<"输入End时，表示所有依赖都输入完毕"<<endl;
	cin>>a;
	while(a!="END"&&(a!="End"))
	{
		//调用求闭包函数
		/*while(! Quiry(a,x))
		{
			cout<<"输入的属性有不在函数依赖中的！请重新输入："<<endl;
			cin>>a;
		}*/
		ADepen(a,x);
		//排序
		Sort(Result);

		cout<<a<<"+="<<Result<<endl;
		cout<<"排序后:"<<Result<<endl;
		cout<<"请输入属性及求闭包"<<endl;
		cin>>a;
	}
	//------------
	//调用求依赖闭包函数
	cout<<"F+="<<   endl;
	
}

void InputF_D(List<Depen>&x)
{
	int i=0;
	string l,r;
	Depen temp;

	cout<<"请输入函数依赖"<<endl<<"输入End时，表示所有依赖都输入完毕"<<endl;
	cin>>l;
	//
	while(l!="End")
	{
		cin>>r;
		while(r=="End")
		{	
			cout<<"请输入一对依赖！"<<endl;
			cin>>r;
		}
		Depen temp(l,r);
		x.insert(i,temp);
		temp.Display();
		i++;
		cout<<"请输入函数依赖:"<<endl;
		cin>>l;
	}
}

void Combination(char* str ,int number ,string& t,List<Depen>&x)  
{  
	//assert(str != NULL);  
	Delete(t);
	if(number == 0)  
	{  
	   static int num = 1;  
	   cout<<"第"<<num++<<"个组合\t"; 
	   string::iterator iter = t.begin();  
	   for( ; iter != t.end() ; ++iter)  
		   cout<<*iter;
	   Quiry(t,x);
	   Delete(Result); 
	   cout<<endl;
	   return;  
	}  
	if(*str == '\0')  
	  return ;  
	
	t.push_back(*str);  
	Combination(str + 1 , number - 1 , t,x);  
	t.pop_back();  
	Combination(str + 1 , number , t,x);  
}  

bool Quiry(string&com,List<Depen>&x)
{
	int i;
	bool flag=false;
	Depen t;
	string l,r;
	for(i=0;i<x.size();i++)
	{
		x.retrieve(i,t);
		l=t.DisL();
		r=t.DisR();
		if(com==l)
		{
			cout<<l<<"--"<<r<<endl;
			Result+=r;
			flag=true;
		}		
	}
	return flag;
}

void ADepen(string& a,List<Depen>&x)
{
	int i,n,s=x.size();
	Depen temp;
	string l,r,old,com;

	n=TotalA(x);
	Result=a;//初始闭包为所求属性（组）
	while(1)
	{
		old=Result;
		for(i=1;i<=(int)Result.length();++i)  
		{	
			Combination((char*)Result.c_str(),i,com,x);
			cout<<i<<":"<<Result<<endl;
			Delete(Result);
		}
		if(old==Result||(Result.length()==n))break;
		//a+(n)=a+(n+1)或a+=U结束
	}
}
/*
bool Judge(List<Depen>& x,string &a)
{
	int i,s=x.size();
	Depen temp;
	string l,r,t;

	for(i=0;i<s;i++)
	{
		x.retrieve(i,temp);
		l=temp.DisL();
		r=temp.DisR();
		t+=l+r;
	}
	Delete(t);
}*/

int TotalA(List<Depen>& x)
{
	int i,s=x.size();
	Depen temp;
	string l,r,t;

	for(i=0;i<s;i++)
	{
		x.retrieve(i,temp);
		l=temp.DisL();
		r=temp.DisR();
		t+=l+r;
	}
	Delete(t);

	return t.length();
}//计算函数依赖中总共涉及的属性个数

void Delete(string& str)
{
	int i,j;

	for(i=0;i<(int)str.length();i++)
	{
		for(j=i+1;j<(int)str.length();j++)
		{
			if(str[j]==str[i])
			{
				str.erase(j,1);
				j--;//由于删除了一个，原下标处有新元素，减1
			}
		}
	}
}//删除字符串中重复元素（属性）

void Sort(string& str )
{
	int i,j;
	char c;

	for(i=0;i<(int)str.length();i++)
	{
		for(j=0;j<(int)str.length()-1;j++)
		if(str[j]>str[j+1])
		{
			c=str[j];
			str[j]=str[j+1];
			str[j+1]=c;
		}
	}
}//冒泡排序，将属性按字典顺序非递减排列