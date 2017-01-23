#include<stdio.h>
#include<math.h>

int A[21]={14,3,9,44,11,100,23,65,25,34,1,7,3,55,13,61,42,2,10,99};
void SELECT(int A[],int n, int k);
void PARTITION(int m,int& p);
void INTERCHANGE(int& a,int& b);

void main()
{
	
	int n=20,k,i;
	//SELECT(a,n,k);
	for(i=0;i<n;i++)
	{
		printf("%5d",A[i]);
		if((i+1)%10==0)
			printf("\n");
	}
	if(i%10!=0)
		printf("\n");

	//PARTITION(a,0,20);
	printf("Please enter an integer k if you want to know \nthe k-th smallest number in the array A[20](1<=k<=20)\n");
	scanf("%d",&k);
	SELECT(A,n,k-1);
	for(i=0;i<n;i++)
	{
		printf("%5d",A[i]);
		if((i+1)%10==0)
			printf("\n");
	}
	if(i%10!=0)
		printf("\n");
}

void SELECT(int A[],int n, int k)
{
	int m,r,j;
	m=0;
	r=n;
	A[n]=(int)pow(2.0,20);//ÕýÎÞÇî
	while((0<=m)&&(m<=k)&&(k<=r)&&(r<=n))
	{
		j=r;
		PARTITION(m,j);
		if(k==j)
			return;
		else if(k<j)
			r=j;
		else
			m=j+1;
	}
}

void PARTITION(int m,int& p)
{
	int i,v,j;
	v=A[m];
	i=m;
	while(1)
	{
		while(1)
		{
			i=i+1;
			if(A[i]>=v)
				break;
		}

		while(1)
		{
			p=p-1;
			if(A[p]<=v)
				break;
		}
		
		if(i<p)
			INTERCHANGE(A[i],A[p]);
		else
			break;

		
	}
	A[m]=A[p];
	A[p]=v;
}

void INTERCHANGE(int& a,int& b)
{
	int temp;
	temp=a;
	a=b;
	b=temp;
}