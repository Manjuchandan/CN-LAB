#include<stdio.h>
#include<stdlib.h>
#include<math.h>
 
 int sender(char b[10],int k)
 {
  int checksum,sum=0,i;
        printf("\n****SENDER****\n");
     
for(i=0;i<k;i++)
      sum+=b[i];
      //printf("SUM IS: %d",sum);
                     
    checksum=~sum;
    printf("\nSENDER's CHECKSUM IS:%d",checksum);
    return checksum;
}
 
int receiver(char c[10],int k,int scheck)
{
int checksum,sum=0,i,ch,a;
      printf("\n\n****RECEIVER****\n");
      for(i=0;i<k;i++)
      sum+=c[i];
     
         
    printf("1 : without error 2 : with error 3 : exit\n");
      printf("enter your choice\n");
      scanf("%d",&ch);

      switch(ch){
             case 1 : sum=(sum)+(scheck);
                     checksum=~sum;
                      printf("Receiver checksum is %d\n:",checksum);
           return checksum;
                         break;


              case 2 : printf("Enter the position where Error is to be inserted:");
                       scanf("%d",&a);
                         
                       sum=(sum)+(scheck)+(a);
                       checksum=~sum;
                      printf("Receiver checksum is %d\n:",checksum);
             return checksum;
                         break;
           
              case 3 : exit(0);
                       break;


}

}


 int main()
   {
      int i,m,scheck,rcheck,val;
        char a[15];
      printf("\nENTER SIZE OF THE STRING:");
      scanf("%d",&m);
      printf("\nENTER THE ELEMENTS OF THE ARRAY:");
      for(i=0;i<m;i++)
    {scanf("%s",&a[i]);}
    val = atoi(a);
    scheck=sender(a,m);
    rcheck=receiver(a,m,scheck);
    if(rcheck==0)
      printf("\n\nNO ERROR IN TRANSMISSION\n\n");
    else
      printf("\n\nERROR DETECTED");
               
}
