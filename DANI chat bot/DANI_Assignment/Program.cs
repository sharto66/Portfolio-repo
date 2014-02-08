//Program: Dynamic Artifiical Non-intelligence (DANI)
//Author: Sean Hartnett
//Date to be demoed: 03/12/13
//Description:
//DANI is a chatbot that appears to learn to speak the more you talk to it. It works by randomly selecting a random word 
//from the users input sentence and then checking its list of words for that are the same and then randomly
//chooses one of their link words, with the word that has the higher count having a higher chance of being chosen.
//Additional functionality includes Text-to-Speech, Reading text files into the word list, and saving the current word list 
//to file and reloading it in the next session.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Speech.Synthesis;

namespace DANI_Assignment
{
    class Program
    {
        static List<Words> words = new List<Words>();

        static void ParseWords(string input)
        {
            string[] line = input.Split(' ', '\t', '.', ',', ';', '?', '!');
            for (int i = 0; i < line.Length-1; i++)
            {
                words.Add(new Words(line[i], line[i + 1]));
            }
            for (int i = 0; i < words.Count; i++)
            {//this double for loop checks if any entries on the list match, if they do it increments the count and the deletes the other
                for (int j = i+1; j < words.Count; j++)
                {
                    if (words[i].word == words[j].word && words[i].linkWord == words[j].linkWord)
                    {
                        words[i].count++;
                        words.RemoveAt(j);
                    }
                }
            }
        }

        static string Response(string input)//this method is the "brain" of the program. Its algorithim generates the response.
        {
            var r = new Random();
            int random = r.Next(5, 9);
            int counter = 0;
            string[] output = new string[random];

            string[] line = input.Split(' ');
            string select = line[r.Next(line.Length - 1)];
            output[counter] = select;

            while (random > counter+1)
            {
                bool found = false;
                int length = 0;
                int choose = 0;

                for (int i = 0; i < words.Count; i++)
                {
                    if(output[counter] == words[i].word)
                    {
                        choose = choose + words[i].count;
                        length = length + 1;
                    }
                }//end for
                string[] link = new string[length];
                int[] choice = new int[length];

                for (int i = 0; i < length; i++)
                {
                    for (int j = 0; j < words.Count; j++)
                    {
                        if (output[counter] == words[j].word)
                        {
                            link[i] = words[j].linkWord;
                            choice[i] = words[j].count * i;
                            break;
                        }
                    }
                }//end double for
                int randomChoice = r.Next(choose * length);

                for (int i = 0; i < length; i++)
                {
                    for (int j = 0; j < length; j++)
                    {
                        if (randomChoice <= choice[i] && randomChoice > choice[j])
                        {
                            counter = counter + 1;
                            if (counter > output.Length)
                            {
                                found = true;
                                break;
                            }
                            else
                            {
                                output[counter] = link[i];
                                found = true;
                                break;
                            }
                        }
                    }
                }//end double for
                if (found == false)
                {//this if statement is used if there are no available link words
                    counter = counter + 1;
                    int Ran = r.Next(words.Count);
                    int linkRan = r.Next(link.Length);
                    if (link.Length < 1)
                    {
                        output[counter] = words[Ran].linkWord;
                    }
                    else if (link.Length >= 2)
                    {
                        output[counter] = link[linkRan];
                    }
                }

            }//end while
            string response = string.Join(" ", output);
            return response;
        }

        static void Memory(int option)
        {
            if (option == 1)//this code writes the file
            {
                string[] lines = new string[words.Count];

                for (int i = 0; i < words.Count; i++)
                {
                    lines[i] = words[i].word + " " + words[i].linkWord + " " + words[i].count;
                }
                System.IO.File.WriteAllLines("DANISBRAIN.txt", lines);
            }
            else if (option == 0)//this code loads the file
            {
                string input = System.IO.File.ReadAllText("DANISBRAIN.txt");
                string[] lines = input.Split(' ', '\r', '\n');
                int ind = 0;
                while (ind < lines.Length - 2)
                {
                    words.Add(new Words(lines[ind], lines[ind + 1]));
                    ind = ind + 4;
                }
                int index = 0;
                while (index < lines.Length-2)
                {
                    for (int j = 0; j < words.Count; j++)
                    {
                        if (lines[index] == words[j].word && lines[index + 1] == words[j].linkWord)
                        {
                            string num = lines[index + 2];
                            words[j].count += int.Parse(num);
                            index += 4;
                        }
                    }
                }
                Console.WriteLine("\nI remember now!\n");
            }
        }

        static void Read()
        {
            Console.WriteLine("Enter the name of the text file you want DANI to read");
            string fileName = Console.ReadLine();
            if (File.Exists(fileName))
            {
                string[] lines = System.IO.File.ReadAllLines(fileName);
                for (int i = 0; i < lines.Length; i++)
                {
                    ParseWords(lines[i].ToUpper());
                }
                Console.WriteLine("DANI enjoyed reading that!\n");
            }
            else
            {
                Console.WriteLine("File not found\n");
            }
        }

        static void Talk()
        {
            SpeechSynthesizer reader = new SpeechSynthesizer();
            Console.WriteLine("(Enter EXIT to quit)\n");
            Console.WriteLine("DANI: Hello!\n");
            while (true)
            {
                Console.Write("\nUSER: ");
                string sentence = Console.ReadLine().ToUpper();
                if (sentence == "EXIT")
                {
                    Console.WriteLine("\nDANI: Bye!\n");
                    break;
                }
                else
                {
                    ParseWords(sentence);
                    Console.WriteLine("\nDANI: " + Response(sentence) + "\n");
                    reader.Speak(Response(sentence));
                }
            }
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to DANI\n");

            while (true)
            {
                Console.WriteLine("Press 1 to talk to DANI");
                Console.WriteLine("Press 2 to read DANI books");
                Console.WriteLine("Press 3 to load DANI's memory");
                Console.WriteLine("Press 4 to quit");

                string option = Console.ReadLine();
                if (option == "1")
                {
                    Talk();//Input words and recieve a response
                }
                else if (option == "2")
                {
                    Read();//Reads files into memory
                }
                else if (option == "3")
                {
                    Memory(0);//load list of words from a previous session
                }
                else if (option == "4")
                {
                    Memory(1);//writes the contents of the words list to file DANISBRAIN.txt
                    break;//ends the program
                }

            }
        }

    }
}