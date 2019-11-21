BEGIN {

dcount=0;
rcount=0;

}

{

 event = $1;

if(event == "d")
{
   dcount++;

}

if(event == "r")
{

  rcount++;

 }

}

END {
 printf("The no of packet dropped:%d\n",dcount);
 printf("The no of packet received:%d\n",rcount);
 }
