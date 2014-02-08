/*Program: An Employee Database that allows users to add, list, delete and compact employee records
   Author: Sean Hartnett
   Class: DT228-1,  Programming with Persisitent data,  Group B*/

#include<stdio.h>
#include<string.h>

void AddEmployee();
void DeleteEmployee();  //function prototypes declared
void ListEmployee();
void CompactRecords();

struct
{
    int TotalRecords;
    int NumDeletedRecords;
    char filler[16];
}HeaderRecord; //header record struct

struct  
{
    char employee_number[6];
    char last_name[16];
    char first_name[16];
    char address[26];
    char department_code[10];
    char duration[2];
}employee;  //struct variable delared

main()
{
    int exit = 1;
    char option;
    
    printf("\n\n\t\t\tWelcome to Employee Database v. 1.0\n\n");
    
    while(exit == 1)//menu contained in while loop
    {
        fflush(stdin);
        printf("\n\n\t\tPlease select an option with 1 - 5\n");
        printf("\n 1.Add Employees\n 2.Delete Employees\n 3.List Employees\n 4.Compact Records\n 5.Exit\n");
        scanf("%c", &option);
        
        switch(option)
        {
            case '1':
                AddEmployee();
                break;
            case '2':
                DeleteEmployee();
                break;
            case '3':
                ListEmployee();
                break;
            case '4':
                CompactRecords();
                break;
            case '5':
                exit=0; //this ends the while loop, thus ending the program
                break;
            default:
                printf("\nPlease choose a valid option\n");
                break;
        }
    }
    
}//end main
void AddEmployee()  //this function allows user to add employees to the file
{
    FILE *record_add;
    record_add = fopen("employees.dat", "ab+"); //ab+ mode allows user to update, append a file
    
    char choice = 'y';
    char number_test[6];
    char match;
    
    if(record_add == NULL)
    {
        printf("\nERROR: Failed to open file\n");   //error checking
    }
    else
    {
        while(choice == 'y' || choice == 'Y')
        {
            do  //do while loop checks if employee number has been entered previously
            {
                fflush(stdin);
                printf("\nEnter Employee number: ");
                scanf("%s", number_test);
                fflush(stdin);
                match = 'y';
                fseek(record_add, 0, SEEK_SET);
                
                while(fread(&employee, sizeof(employee), 1, record_add) == 1)
                {
                    if(strcmp(employee.employee_number, number_test) == 0)
                    {
                        match = 'n';
                        fseek(record_add, 0, SEEK_END);
                        printf("\nEmployee Number %s already present\n", number_test);
                    }
                }
                
            }while(match == 'n');
            
            //employee details are read in below
            strcpy(employee.employee_number, number_test);
            printf("\nEnter surname: ");
            scanf("%s", employee.last_name);
            fflush(stdin);
            printf("\nEnter first name: ");
            gets(employee.first_name);
            fflush(stdin);
            printf("\nEnter address: ");
            gets(employee.address);
            fflush(stdin);
            printf("\nEnter deprtment code: ");
            gets(employee.department_code);
            fflush(stdin);
            printf("\nEnter duration of employment (years): ");
            gets(employee.duration);
            fflush(stdin);
            
            fwrite(&employee, sizeof(employee), 1, record_add);
            
            printf("\n Add another employee (y/n): ");  //allows user to enter another employee
            scanf("%s", &choice);
            
            //HeaderRecord.TotalRecords = HeaderRecord.TotalRecords + 1;    //attempt to get header records working
            //fwrite(&HeaderRecord, sizeof(HeaderRecord), 1, record_add);
        }
    }
    
    fclose(record_add);
}// end AddEmployee
void DeleteEmployee()   //this function allows user to mark employees for deletion from the file
{
    FILE *record_delete;
    record_delete = fopen("employees.dat", "rb+"); //rb+ mode opens binary files for both reading and writingfseek(record_add, 0, SEEK_SET);
    
    char asterisk = '*';
    char match = 'n';
    char deleted[6];
    int record_size;
    record_size = sizeof(employee);
    
    if(record_delete == NULL)
    {
        printf("\nERROR: Failed to open file\n");   //error checking
    }
    else
    {
        printf("\n Employee No.\tSurname\tFirst Name\tAddress \tDepartment code\tDuration \n");
        printf("===============================================================================\n");
        
        while(fread(&employee, sizeof(employee), 1, record_delete) == 1)
        {
            if(employee.employee_number[0] != '*')  //checks to see if employee has been marked as deleted
            {
                printf("\n\t%s\t%s\t%s\t%s\t%s\t  %s\n", employee.employee_number, employee.last_name, employee.first_name, employee.address, employee.department_code, employee.duration);
            }
        }
        
        printf("\nEnter Employee Number to be deleted: ");
        scanf("%s", deleted);
        fflush(stdin);
        
        fseek(record_delete, 0, SEEK_SET);
        
        while(fread(&employee, sizeof(employee), 1, record_delete) == 1)
        {
            if(strcmp(employee.employee_number, deleted) == 0)
            {
                fseek(record_delete, -record_size, SEEK_CUR);
                fwrite(&asterisk, 1, 1, record_delete); //files the user wishes to delete have the first digit of the employee number replaced with an asterisk
                fseek(record_delete, 0, SEEK_END);
                printf("\nRecord deleted\n");
                match = 'y';
                //HeaderRecord.NumDeletedRecords++; //adds +1 to the deleted records header
                //fwrite(&HeaderRecord, sizeof(HeaderRecord), 1, record_delete);
            }
        }
        
        if(match == 'n')
        {
            printf("\nERROR: Employee Number %s not found\n", deleted);
        }
    }
    
    fclose(record_delete);
}//end DeleteEmployee
void ListEmployee()     //this function allows the user to view and search the list of employees
{
    int exit = 1;
    char choice;
    char view[8];
    
    FILE *record_list;
    record_list = fopen("employees.dat", "rb+");    //rb+ mode opens binary files for both reading and writing
    
    if(record_list == NULL)
    {
        printf("\nERROR: Failed to open file\n");
    }
    else
    {
        printf("\n Employee No.\tSurname\t First Name\tAddress\tDepartment code\tDuration \n");
        printf("===============================================================================\n");
        
        while(fread(&employee, sizeof(employee), 1, record_list) == 1)
        {
            if(employee.employee_number[0] != '*')  //checks to see if employee has been marked as deleted
            {
                printf("\n\t%s\t%s\t%s\t%s \t%s\t%s\n", employee.employee_number, employee.last_name, employee.first_name, employee.address, employee.department_code, employee.duration);
            }
        }
        
        fread(&HeaderRecord, sizeof(HeaderRecord), 1, record_list);  //displays the header records
        printf("\n\nTotal records: %d\tDeleted records: %d\n\n", HeaderRecord.TotalRecords, HeaderRecord.NumDeletedRecords);
        
        while(exit == 1)
        {
            flushall();
            printf("\nPlease select an option with 1 - 3:\n\n");
            printf(" 1.View by Department Code\n 2.View by Duration\n 3.Exit\n");
            scanf("%c", &choice);
            
            switch(choice)
            {
                case '1':   //allows user to list by department code
                    printf("\nEnter Department Code: \n");
                    scanf("%s", view);
                    
                    printf("\n Employee No.\tSurname\t First Name\t  Address \tDepartment code\tDuration \n");
                    printf("===============================================================================\n");
                    
                    while(fread(&employee, sizeof(employee), 1, record_list) == 1)
                    {
                        if(strcmp(employee.department_code, view) == 0)
                        {
                            printf("\n   %s\t%s\t%s\t%s\t\t%s\t%s\n", employee.employee_number, employee.last_name, employee.first_name, employee.address, employee.department_code, employee.duration);
                        }
                    }
                    break;
                case '2':   //allows user to list by depatment code
                    printf("\nEnter Duration: \n");
                    scanf("%s", view);
                    
                    printf("\n Employee No.\tSurname\t First Name\t  Address \tDepartment code\tDuration \n");
                    printf("===============================================================================\n");
                    
                    while(fread(&employee, sizeof(employee), 1, record_list) == 1)
                    {
                        if(strcmp(employee.duration, view) == 0)
                        {
                            printf("\n   %s\t%s\t%s\t%s\t%s\t%s\n", employee.employee_number, employee.last_name, employee.first_name, employee.address, employee.department_code, employee.duration);
                        }
                    }
                    break;
                case '3':
                    exit=0;
                    break;
                default:
                    printf("\nPlease choose a valid option\n");
                    break;
            }
        }
    }
    
    fclose(record_list);
}//end List Employee
void CompactRecords()   //this function allows the user to compact the files contents to a new file
{
    
    FILE *compact, *new_file;
    compact = fopen("employees.dat", "rb+");
    new_file = fopen("new_employees.dat", "wb+");
    
    //int records = 0;
    
    //HeaderRecord.TotalRecords = 0;
    //fwrite(&HeaderRecord, sizeof(HeaderRecord), 1, compact);
    
    while(fread(&employee, sizeof(employee), 1, compact) == 1)
    {
        if(employee.employee_number[0] != '*')
        {
            fwrite(&employee, sizeof(employee), 1, new_file);
            //records++;
        }
    }
    
    //HeaderRecord.TotalRecords = records;
    //fseek(new_file, 0, SEEK_SET);
    //fwrite(&HeaderRecord, sizeof(HeaderRecord), 1, new_file);
    
    printf("\nRecords Compacted to new file\n\n");
    
    fclose(new_file);
    fclose(compact);
}//end CompactRecords