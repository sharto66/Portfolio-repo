//TREE drawing code
#include<stdio.h>
main()
{
    int height, i, j=0, k=0, l, trunk;
    
    printf("Please enter the height of tree\n");
    scanf("%d", &height);
    
    if(height<3)
    {
    height=3;
    }
    
    i=height;
    trunk=height;
    
    do
    {
        for(j=0; j<i; j++)
        {
            printf(" ");
        }
        
        i--;
        k++;
        
        for(l=0; l<k; l++)
        {
            printf("*");
        }
        
        k++;
        printf("\n");
        height--;
    }
    while(height>0);
        
    for(j=0; j<trunk; j++)
    {
        printf(" ");
    }
    printf("*");
    
    flushall();
    getchar();
}