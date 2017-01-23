#include<string>
using namespace std;
class Depen
{
private:
	string left;
	string right;
public:
	Depen();
	Depen(string& a,string& b);
	//Depen operator=(Depen&);
	void Display();
	string DisL();
	string DisR();
};

Depen::Depen()
{
	left="";
	right="";
}

Depen::Depen(string& a,string& b)
{
	left=a;
	right=b;
}

void Depen::Display()
{
	cout<<left<<"->"<<right<<endl;
}

string Depen::DisL()
{
	return left;
}

string Depen::DisR()
{
	return right;
}