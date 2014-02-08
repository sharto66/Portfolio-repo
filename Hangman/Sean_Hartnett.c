/*
Program: A Hangman game
Author: Sean Hartnett, DT228-1/B
Date started: 08/11/12
Date concluded: 22/11/12
*/
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define W1 6
#define W2 5
#define W3 6
#define W4 5
#define W5 5
#define BLANK 6
#define SIZE 6
main()
{
    int end, start;
    
    printf("\n\t\t\tWELCOME TO HANGMAN\n");
    printf("\n\t\tEnter 0 to play or any key to quit\n");       //This is the start up menu
    scanf("%d", &start);
    
    if(start==0)
    
do      //Begining of the do while loop, used to restart the program
{
    char word1[W1]={'L', 'I', 'T', 'T', 'E', 'R'};  //LITTER
    char word2[W2]={'M', 'O', 'I', 'S', 'T'};       //MOIST
    char word3[W3]={'N', 'U', 'G', 'G', 'E', 'T'};  //NUGGET
    char word4[W4]={'A', 'L', 'P', 'H', 'A'};       //ALPHA
    char word5[W5]={'O', 'B', 'E', 'S', 'E'};       //OBESE
    
    char blank[BLANK]={'_', '_', '_', '_', '_', '_'};   //The blank variables represent the spaces underscores which will be replaced by correct letters
    
    char letter_guessed[SIZE]={' '};
    
    int i, j=0;                 //i and j are the index variables used in the for loop to display the letters entered
    
    int lives=6;                //The lives variable represents the number of lives the player has. Obviously.
    
    srand(time(NULL));
    int randomword=rand()%5+1;  //The pseudo-random function here. It is initialised by the time.
    
    if(randomword==1)           //Word is LITTER

    while(lives!=0 && lives!=7)
    {
        //The main menu and switch statement below. It is repeated below for each different word to be guessed.
        
        printf("\n\n\nLives: %d\n", lives);
        printf("Word: %c %c %c %c %c %c\n", blank[0], blank[1], blank[2], blank[3], blank[4], blank[5]);
        printf("Letters Guessed: \n");
        for(i=0; i<j; i++)
        {
        printf("%c ", letter_guessed[i]);
        }
        printf("\nGuess a letter\n");
        scanf("%1s", &letter_guessed[i]);
        
        switch(letter_guessed[i])
        {
            case'L':
            case'l':
                blank[0]=word1[0];
                break;
            case'I':
            case'i':
                blank[1]=word1[1];
                break;
            case'T':
            case't':
                blank[2]=word1[2];
                blank[3]=word1[3];
                break;
            case'E':
            case'e':
                blank[4]=word1[4];
                break;
            case'R':
            case'r':
                blank[5]=word1[5];
                break;
            default:
                lives=lives-1;                                  //if the player inputs any characters other than the letters in the word they lose a life
                printf("\n\nYou lost a life\n\n");
                j++;
                break;
        }//end switch
        
        if(blank[0]==word1[0] && blank[1]==word1[1] && blank[2]==word1[2] && blank[3]==word1[3] && blank[4]==word1[4] && blank[5]==word1[5])
        {
        lives=7;
        }//end if
        
    }//end while loop
    
    if(randomword==2)   //Word is MOIST
    
    while(lives!=0 && lives!=7)
    {
        
        printf("\n\n\nLives: %d\n", lives);
        printf("Word: %c %c %c %c %c\n", blank[0], blank[1], blank[2], blank[3], blank[4]);
         printf("Letters Guessed: \n");
        for(i=0; i<j; i++)
        {
        printf(" %c", letter_guessed[i]);
        }
        printf("\nGuess a letter\n");
        scanf("%1s", &letter_guessed[i]);
        
        switch(letter_guessed[i])
        {
            case'M':
            case'm':
                blank[0]=word2[0];
                break;
            case'O':
            case'o':
                blank[1]=word2[1];
                break;
            case'I':
            case'i':
                blank[2]=word2[2];
                break;
            case'S':
            case's':
                blank[3]=word2[3];
                break;
            case'T':
            case't':
                blank[4]=word2[4];
                break;
            default:
                lives=lives-1;
                printf("\n\nYou lost a life\n\n");
                j++;
                break;
        }//end switch
        if(blank[0]==word2[0] && blank[1]==word2[1] && blank[2]==word2[2] && blank[3]==word2[3] && blank[4]==word2[4])
        {
        lives=7;
        }//end if
        
    }//end while loop
    
    if(randomword==3)   //Word is NUGGET

    while(lives!=0 && lives!=7)
    {
        
        printf("\n\n\nLives: %d\n", lives);
        printf("Word: %c %c %c %c %c %c\n", blank[0], blank[1], blank[2], blank[3], blank[4], blank[5]);
        printf("Letters Guessed: \n");
        for(i=0; i<j; i++)
        {
        printf(" %c", letter_guessed[i]);
        }
        printf("\nGuess a letter\n");
        scanf("%1s", &letter_guessed[i]);
        
        switch(letter_guessed[i])
        {
            case'N':
            case'n':
                blank[0]=word3[0];
                break;
            case'U':
            case'u':
                blank[1]=word3[1];
                break;
            case'G':
            case'g':
                blank[2]=word3[2];
                blank[3]=word3[3];
                break;
            case'E':
            case'e':
                blank[4]=word3[4];
                break;
            case'T':
            case't':
                blank[5]=word3[5];
                break;
            default:
                lives=lives-1;
                printf("\n\nYou lost a life\n\n");
                j++;
                break;
        }//end switch
        if(blank[0]==word3[0] && blank[1]==word3[1] && blank[2]==word3[2] && blank[3]==word3[3] && blank[4]==word3[4] && blank[5]==word3[5])
        {
        lives=7;
        }//end if
        
    }//end while loop
    
    if(randomword==4)   //Word is ALPHA
    
    while(lives!=0 && lives!=7)
    {
        
        printf("\n\n\nLives: %d\n", lives);
        printf("Word: %c %c %c %c %c\n", blank[0], blank[1], blank[2], blank[3], blank[4]);
        for(i=0; i<j; i++)
        {
        printf(" %c", letter_guessed[i]);
        }
        printf("\nGuess a letter\n");
        scanf("%1s", &letter_guessed[i]);
        
        switch(letter_guessed[i])
        {
            case'A':
            case'a':
                blank[0]=word4[0];
                blank[4]=word4[4];
                break;
            case'L':
            case'l':
                blank[1]=word4[1];
                break;
            case'P':
            case'p':
                blank[2]=word4[2];
                break;
            case'H':
            case'h':
                blank[3]=word4[3];
                break;
            default:
                lives=lives-1;
                printf("\n\nYou lost a life\n\n");
                j++;
                break;
        }//end switch
        if(blank[0]==word4[0] && blank[1]==word4[1] && blank[2]==word4[2] && blank[3]==word4[3] && blank[4]==word4[4])
        {
        lives=7;
        }//end if
        
    }//end while loop
    
    if(randomword==5)   //Word is OBESE
    
    while(lives!=0 && lives!=7)
    {
        
        printf("\n\n\nLives: %d\n", lives);
        printf("Word: %c %c %c %c %c\n", blank[0], blank[1], blank[2], blank[3], blank[4]);
        for(i=0; i<j; i++)
        {
        printf(" %c", letter_guessed[i]);
        }
        printf("\nGuess a letter\n");
        scanf("%1s", &letter_guessed[i]);
        
        switch(letter_guessed[i])
        {
            case'O':
            case'o':
                blank[0]=word5[0];
                break;
            case'B':
            case'b':
                blank[1]=word5[1];
                break;
            case'E':
            case'e':
                blank[2]=word5[2];
                blank[4]=word5[4];
                break;
            case'S':
            case's':
                blank[3]=word5[3];
                break;
            default:
                lives=lives-1;
                printf("\n\nYou lost a life\n\n");
                j++;
                break;
        }//end switch
        if(blank[0]==word5[0] && blank[1]==word5[1] && blank[2]==word5[2] && blank[3]==word5[3] && blank[4]==word5[4])
        {
        lives=7;
        }//end if
        
    }//end while loop
    
    //Below is the menu displayed when the player runs out of lives. It changes depending on which word the player was trying to guess.
    // i.e. it displays the word the player was trying to guess 
    
    if(lives==0)
    {
    printf("\n\n\nLives: %d\n", lives);
    printf("\nWord: %c %c %c %c %c %c\n\n", blank[0], blank[1], blank[2], blank[3], blank[4], blank[5]);
    
    if(randomword==1)//LITTER
    {
    printf("Your word was:\n%c %c %c %c %c %c\n", word1[0], word1[1], word1[2], word1[3], word1[4], word1[5]);
    }
    if(randomword==2)//MOIST
    {
    printf("Your word was:\n%c %c %c %c %c\n", word2[0], word2[1], word2[2], word2[3], word2[4]);
    }
    if(randomword==3)//NUGGET
    {
    printf("Your word was:\n%c %c %c %c %c %c\n", word3[0], word3[1], word3[2], word3[3], word3[4], word3[5]);
    }
    if(randomword==4)//ALPHA
    {
    printf("Your word was:\n%c %c %c %c %c\n", word4[0], word4[1], word4[2], word4[3], word4[4]);
    }
    if(randomword==5)//OBESE
    {
    printf("Your word was:\n%c %c %c %c %c\n", word5[0], word5[1], word5[2], word5[3], word5[4]);
    }
    
    printf("\nSorry you lost\n\nEnter 0 to quit or Any key to play again\n");
    printf("\n(please note that the character you enter will be your first guess)\n\n");
    scanf("%d", &end);
    }//end if
    
    if(lives==7)        //Below is the menu displayed when the player guesses all letters correct
    {
    printf("\n\nThe word was %c %c %c %c %c %c\n", blank[0], blank[1], blank[2], blank[3], blank[4], blank[5]);
    printf("\nCongradulations on your victory!\n");
    printf("\nEnter 0 to quit or Any key to play again\n");
    printf("\n(please note that the character you enter will be your first guess)\n\n");
    scanf("%d", &end);
    }//end if
    
}
while(end!=0);      //The condition of the do while loop here. If the variable end does not equal 0, it will loop the program.
    
}//end main