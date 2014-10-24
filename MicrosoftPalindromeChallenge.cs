using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication4
{
    class Program
    {
        static int palindrome(string str)
        {
            string pal;
            List<string> results = new List<string>();
            int count = 0;
            bool letterMatch = false;
            int k, l;

            for (int i = 0; i < str.Length-1; i++)
            {
                for (int j = 1; j < (str.Length+1)-i; j++)
                {
                    pal = str.Substring(i, j);
                    //Console.WriteLine(pal);
                    letterMatch = false;

                    if (pal.Length == 2 && pal[0] == pal[1] || pal.Length == 1)
                    {
                        letterMatch = true;
                    }
                    else if(pal.Length % 2 != 0)
                    {
                        l = pal.Length-1;
                        k = 0;
                        while(k < l / 2 && l > k)
                        {
                            if (pal[k] == pal[l])
                            {
                                letterMatch = true;
                                k++;
                                l--;
                            }
                            else
                            {
                                letterMatch = false;
                                break;
                            }
                        }
                    }
                    if(!results.Contains(pal) && letterMatch == true)
                    {
						Console.WriteLine(pal);
                        results.Add(pal);
                    }
                }//end j for
            }//end i for 
            count = results.Count;
            return count;
        }

        static void Main(string[] args)
        {
            //string fileName = System.Environment.GetEnvironmentVariable("OUTPUT_PATH");
            //TextWriter tw = new StreamWriter(@fileName, true);
            //int res;
            //string _str;
            //_str = Console.ReadLine();
            //a, aa, b, aba, aabaa
            //res = palindrome(_str);
            //tw.WriteLine(res);

            //tw.Flush();
            //tw.Close();
            string _str = Console.ReadLine();
            int res = palindrome(_str);
            Console.WriteLine(res);
            Console.ReadLine();
        }
    }
}
