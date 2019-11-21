BEGIN {
dcount=0;
}

{


event=$1;

if(event=="d")
{

 dcount++;

}

}

END {

 printf("dropped %d\t",dcount);

}
