#include <stdio.h>
#define infinity 999

void dij(int n,int v,int cost[10][10],int dist[10])
{
 int i,u,count,w,flag[10],min,j;
 for(i=1;i<=n;i++)
  flag[i]=0,dist[i]=cost[v][i];
 count=2;
 while(count<=n)
 {
  min=999;
  for(w=1;w<=n;w++)
   if(dist[w]<min && !flag[w])
    min=dist[w],u=w;
  flag[u]=1;
  count++;
  for(w=1;w<=n;w++)
   if((dist[u]+cost[u][w]<dist[w]) && !flag[w])
    dist[w]=dist[u]+cost[u][w];
     
 }
}

void main()
{
 int n,v,i,j,cost[10][10],dist[10];
 
 printf(" Enter the number of nodes:");
 scanf("%d",&n);
 printf(" Enter the cost matrix:");
 for(i=1;i<=n;i++)
  for(j=1;j<=n;j++)
  {
   scanf("%d",&cost[i][j]);
   if(cost[i][j]==0)
    cost[i][j]=infinity;
  }
 printf(" Enter the source vertex:");
 scanf("%d",&v);                              //v=source vertex i= other vertices
 dij(n,v,cost,dist);

 printf("Shortest path:");
 for(i=1;i<=n;i++)
  if(i!=v)
   printf("%d->%d ,cost=%d\t",v,i,dist[i]);
 
}
