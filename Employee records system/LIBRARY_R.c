#include<stdio.h>
#include<string.h>

struct {
    char ISBN[13];
    char title[30];
    char author[25];
    int no_of_copies;
    float price;
}book;

void main()
{ 
    FILE *library;
    library = fopen("libfile.dat", "rb");
    float total_value = 0;
    
    printf("\n \t ISBN \t \t Title \t \t Author \t Copies \t Price \n");
    printf("\t=======================================================================\n");
    
    while(fread(&book, sizeof(book), 1, library)==1)
    {
        printf("\n \t %s \t %s \t %s \t %d \t \t %.2f \n",
        book.ISBN, book.title, book.author,
        book.no_of_copies, book.price);
        
        total_value = total_value + (book.no_of_copies*book.price);
    }
    
    fclose(library);
    
    printf("\n \n \t Total stock value: %.2f", total_value);
    
    flushall();
    getchar();
}    