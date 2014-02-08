#include<stdio.h>

int fib(int n)
{
    if(n==0)
    {
    return 0;
    }
    else if (n==1)
    {
    return 1;
    }
    else
    {
    return(fib(n-1)+fib(n-2));
    }
}

main()
{
    int terms, i, j=0;
    
    printf("Enter a number\n");
    scanf("%d", &terms);
    printf("\n");
    
    
    for (i=1; i <= terms; i++)
    {
        printf(", %d", fib(j));
        j++; 
    }
    
    flushall();
    getchar();
}