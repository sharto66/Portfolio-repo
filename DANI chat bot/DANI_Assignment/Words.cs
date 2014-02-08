using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DANI_Assignment
{
    class Words
    {
        public string word;
        public string linkWord;
        public int count;
        //constructors below
        public Words()
        {
            word = "";
            linkWord = "";
            count = 1;
        }

        public Words(string word, string linkWord, int count)
        {
            this.word = word;
            this.linkWord = linkWord;
            this.count = count;
        }

        public Words(string line, string line1)
        {
            word = line;
            linkWord = line1;
            count = 1;
        }

        //public override string ToString()
        //{
        //    return word + " " + linkWord + " " + count;
        //}
    }
}
