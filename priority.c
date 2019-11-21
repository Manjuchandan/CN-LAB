#include<stdio.h>
#include<stdlib.h>

#define SIZE 9
char quene[SIZE];
int front=-1,rear=-1,item;

void insert()

{
	printf("enter the item to be inserted");
	scanf("%d",&item);

      	if(rear==SIZE-1)
  	 printf("quene is full");
else 
{
      if(front==-1) front=0;

    rear=rear+1;
    quene[rear]=item;
      sort();
 
}
}
   void delete()
{
    if(front==-1||front>rear)
    printf("quene is empty");
else
{
   item=quene[front];
   front=front+1;
}
   }

 void display()
{
   if(front==-1||front>rear)
    printf("quene is empty");
else
    printf("quene elements are:");

  {
       for(int i=front;i<=rear;i++)
	printf("%d",quene[i]);
  }
}

void sort()
{
   int i,j,temp;

for(i=front;i<=rear;i++)
{
  for(j=front;j<=rear-1;j++)
    {
        if(quene[j]<quene[j+1])
          {
                 temp=quene[j];
		quene[j]=quene[j+1];
		quene[j+1]=temp;
            }
      }

 }

}



 void main()
{
   int choice;
for(;;){
 printf("1:insert,2:delete,3:display,4:exit\n");
  printf("enter the choice");
  scanf("%d", &choice);
  switch(choice){

    case 1:
	     
	     insert();
	      break;
    case 2:  
	    
	       delete();
	       break;
   case 3:   display();
	      break;
   case 4:  exit(0);
	    break;
   default:printf("invalid choice");
 }
 }
 }

