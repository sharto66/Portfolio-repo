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
    char choice = 'y';
    char ISBN_found = 'n';
    char test_ISBN[13];
    library = fopen("libfile.dat", "ab+");
    
    while(choice == 'y' || choice == 'Y')
    {
        do{
            printf("\n Enter ISBN:"); 
            scanf("%s", test_ISBN);
            fflush(stdin);
            ISBN_found = 'n';
            fseek(library, 0, SEEK_SET);
            
            while(fread(&book, sizeof(book), 1, library) == 1)
            {
                if(strcmp(book.ISBN, test_ISBN) == 0)
                {
                    ISBN_found = 'y';
                    fseek(library, 0, SEEK_END);
                    printf("\n ISBN already exists, try again...");
                }
            }
        }while(ISBN_found == 'y');
        
        strcpy(book.ISBN, test_ISBN);
        printf("\n Enter book titel:");
        gets(book.title);
        fflush(stdin);
        printf("\n Enter book author:");
        gets(book.author);
        fflush(stdin);
        printf("\n Enter number of copies:");
        scanf("%d", &book.no_of_copies);
        fflush(stdin);
        printf("\n Enter book price:");
        scanf("%f", &book.price);
        fflush(stdin);
        
        fwrite(&book, sizeof(book), 1, library);
        
        printf("\n Add another record (y/n):");
        scanf("%s", &choice);
        fflush(stdin);
    }
    
    fclose(library);
}
        
        
        
            
            