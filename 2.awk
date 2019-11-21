BEGIN {

tcp1=0;
size1=0;
tcp2=0;
size2=0;
totaltcp1=0;
totaltcp2=0;

}

{

 event=$1;
pkttype=$5;
pktsize=$6;
fromnode=$9
tonode=$10;

if(event== "r" && pkttype== "tcp" && fromnode== "0.0" && tonode== "3.0")
{
  tcp1++;
 size1=pktsize;
}

if(event== "r" && pkttype== "tcp" && fromnode== "1.0" && tonode== "3.1")
{
  tcp2++;
 size2=pktsize;
}

}

END {

totaltcp1=tcp1*size1*8;
totaltcp2=tcp2*size2*8;
t1=totaltcp1/24;
t2=totaltcp2/24;
printf("through put of ftp is %d\t",t1);
printf("throughput of telent is %d\t",t2);

}
