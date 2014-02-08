/* LIBRARY_C.c:
A compation program. This creates a new library file, adds an initialised header record, 
followed by adding all active records found in the original library file. On completion, 
it returns to the start of the new file to overwrite the header record with the correct record count values.
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
    int rec_count = 0;
    
    FILE *library, *new_library;
    library = fopen("libfile.dat", "rb+");
    new_library = fopen("new_libfile.dat", "wb+");
    
    header.Total_rec_count = 0;
    header.Deleted_rec_count = 0;
    
    //Write out the header record initialised with a ‘0’ record count values to the new library file
    fwrite(&header, sizeof(header), 1, new_library);
    
    //Write all active records from the old library file to the new library file
    while(fread(&book, sizeof(book), 1, library) == 1)
    {
        if(book.ISBN[0] != '*')
        {
            fwrite(&book, sizeof(book), 1, new_library);
            rec_count++;
        }
    }
    
    //When complete the transfer of active records, go back to the header record and re-write the correct record count
    header.Total_rec_count = rec_count;
    fseek(new_library, 0, SEEK_SET);
    fwrite(&header, sizeof(header), 1, new_library);
    
    fclose(library);
    fclose(new_library);
}
        
    