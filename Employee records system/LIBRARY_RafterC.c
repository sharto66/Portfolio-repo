/* LIBRARY_RafterC.c:
A program to read the new library file. First it reads the header record, and prints out the record
count values. Then it reads and display all active records found in the file.
*/

#include<stdio.h>
#include<string.h>

struct {
    char ISBN[13];
    char title[30];
    char author[25];
    int no_of_copies;
    float price;
}book;

struct {
    int Total_rec_count;
    int Deleted_rec_count;
    char Filler[22];
}header;

void main()
{ 
    FILE *library;
    library = fopen("new_libfile.dat", "rb+");
    
    fread(&header, sizeof(header), 1, library);
    printf("\nTotal records: %d \nDeleted records: %d \n\n", 
    header.Total_rec_count, header.Deleted_rec_count);
    
    printf("\n \t ISBN \t \t Title \t \t Author \t Copies \t Price \n");
    printf("\t=======================================================================\n");
    
    while(fread(&book, sizeof(book), 1, library) == 1)
    {
        if(book.ISBN[0] != '*')
        {
            printf("\n \t %s \t %s \t %s \t %d \t \t %.2f \n",
            book.ISBN, book.title, book.author,
            book.no_of_copies, book.price);
        }
    }
    
    fclose(library);
}
        
    