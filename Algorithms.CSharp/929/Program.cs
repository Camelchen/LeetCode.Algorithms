using System;
using System.Collections;

namespace _929
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] emails = new string[] {"test.email+alex@leetcode.com", "test.e.mail+bob.cathy@leetcode.com", "testemail+david@lee.tcode.com"};
            Console.WriteLine(NumUniqueEmails(emails));
            Console.Read();
        }

        public static int NumUniqueEmails(string[] emails)
        {
            Hashtable uniqEmails = new Hashtable();

            foreach (string email in emails)
            {
                string uniqEmail = email.Split("@")[0].Split("+")[0].Replace(".", "") + email.Split("@")[1];
                if (!uniqEmails.Contains(uniqEmail))
                {
                    uniqEmails.Add(uniqEmail,1);
                }
            }

            return uniqEmails.Count;
        }
    }
}
