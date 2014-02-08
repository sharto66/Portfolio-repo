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
    library = fopen("libfile.dat", "rb+");
    
    char asterisk = '*';
    char ISBN_matched = 'n';
    char del_ISBN[13];
    long int RECSIZE;
    RECSIZE = sizeof(book);
    
    while(fread(&book, sizeof(book), 1, library) == 1)
    {
        if(book.ISBN[0] != '*')
        {
            printf("\n \t %s \t %s \t %s \t %d \t \t %.2f \n",
            book.ISBN, book.title, book.author,
            book.no_of_copies, book.price);
        }
    }
    
    printf("\n Enter ISBN for deletion:");
    scanf("%s", del_ISBN);
    fflush(stdin);
    
    fseek(library, 0, SEEK_SET);
    
    while(fread(&book, sizeof(book), 1, library) == 1)
    {
        if(strcmp(book.ISBN, del_ISBN) == 0)
        {
            fseek(library, -RECSIZE, SEEK_CUR);
            fwrite(&asterisk, 1, 1, library);
            fseek(library, 0, SEEK_END);
            printf("\n Record was successfully deleted! \n");
            ISBN_matched = 'y';
        }
    }
    
    if(ISBN_matched == 'n')
    {
        printf("\n Record was not found!");
    }
    
    fclose(library);
}
        
    