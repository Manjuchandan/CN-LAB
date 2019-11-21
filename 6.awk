BEGIN {

ftp=0;
fsize=0;
cbr=0;
csize=0;
totalftp=0;
totalcbr=0;

}

{

 event=$1;
pkttype=$5;
pktsize=$6;


if(event == "r" && pkttype == "tcp")
{
  ftp++;
 fsize=pktsize;
}

if(event == "r" && pkttype == "cbr" )
{
  cbr++;
 csize=pktsize;
}

}

END {

totalftp=ftp*fsize;
totalcbr=cbr*csize;
t1=totalftp/123.0;
t2=totalcbr/124.4;
printf("through put of ftp is %d\t",t1);
printf("throughput of cbr is %d\t",t2);

}

