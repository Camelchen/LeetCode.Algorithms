using System;
using System.Collections.Generic;

namespace _728
{
    class Program
    {
        static void Main(string[] args)
        {
           
            foreach (var item in SelfDividingNumbers(1, 22))
            {
                Console.Write(item+",");

            }
            Console.Read();
        }

        public static IList<int> SelfDividingNumbers(int left, int right)
        {
            List<int> result = new List<int>();

            for (int i = left; i <= right; i++)
            {
                if (i.ToString().Contains("0")) { continue; }
                bool divisible = true;
                int num = i;
                while (num!=0)
                {
                    int r = num % 10;
                    if (i % r !=0) { divisible = false; break; }
                    num = num / 10;
                }
                if (divisible) { 
                    result.Add(i);
                }
            }
            return (result);

        }
    }
}
