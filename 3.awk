BEGIN {

cudp=0;
ctcp=0;

}

{

pkttype=$5;

if(pkttype== "cbr")
{
   cudp++;
}

if(pkttype== "tcp")
{
  ctcp++;
}

}

END {

 printf("packet sent by Tcp: %d\t and by UDP is %d\t",ctcp,cudp);

}
