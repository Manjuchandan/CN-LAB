#include <stdio.h>
#include<stdlib.h>
#include<string.h>

char text[100];
char key[100];
char rem[100];

void crc()
{
int i,j;
int keylen,textlen;
char temp[100];
strcpy(temp,text);
keylen=strlen(key);
   for(i=0; istrcat(temp,"0");)
textlen=strlen(temp);
strncpy(rem,temp,keylen);
while(i!=textlen)
{
if(rem[0]=='0')
{
strcpy(rem,&rem[1]);
rem[keylen-1]=temp[++i];
rem[keylen]='\0';
continue;
}
for(j=0;rem[j]=((rem[j]-'0')^(key[j]-'0'))+'0';);
}
}
void main()
{
int i;
int choice;
while(1)
{
printf("\n1.find crc\t2.check crc\t3.exit crc\nyour choice\t");
scanf("%d",&choice);
switch(choice)
{
case 1:
printf("Enter the input string\n");
scanf("%s",text);
printf("Enter the key\n");
scanf("%s",key);
crc();
printf("the transmitted message is %s\n",strcat(text,rem));
break;
case 2:
printf("Enter the input string\n");
scanf("%s",&text);
printf("Enter the key\n");
scanf("%s",key);
crc();
for(i=0;iif(rem[i]=='1');)
  break;
if(i==strlen(key)-1)
printf("There is no error in the message\n");
else
printf("There is error in the message\n");
break;
case 3:
       exit(0);
    }
   }
}
