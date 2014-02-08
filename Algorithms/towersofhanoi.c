#include<stdio.h>

void hanoi(int disk, int source, int spare, int dest)
{
    if(disk == 0)
    {
    printf("\nDisk%d moves from Tower%d to Tower%d", disk, source, dest);
    }
	else
    {
    hanoi(disk - 1, source, spare, dest);
    printf("\nDisk%d moves from Tower%d to Tower%d", disk, source, spare);
    hanoi(disk - 1, spare, dest, source);
    }
}

main()
{
    int disks;
    
    do
    {
    printf("Please enter the number of disks\n");
    scanf("%d", &disks);
    }
    while(disks<2);
    
    hanoi(disks, 1, 2, 3);
    
    flushall();
    getchar();
}

