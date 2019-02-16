using System;
using System.Collections;

namespace _771
{
    class Program
    {
        static void Main(string[] args)
        {
            int result = NumJewelsInStones("aA", "aAAbbbb");
            Console.WriteLine(result);
            
        }

        public static int NumJewelsInStones(string J, string S)
        {
            int numJ = 0;

            for (int s = 0; s < S.Length; s++)
            {
                for (int j = 0; j < J.Length; j++)
                {
                    if (S[s] == J[j])
                    {
                        numJ++;
                        break;
                    }

                }
            }
            return numJ;
        }
    }
}
