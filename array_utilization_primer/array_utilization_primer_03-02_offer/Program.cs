using System;

namespace array_utilization_primer_03_02_offer
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            int m = int.Parse(input[2]);
            int[] testResults = new int[n];
            for (int i = 0; i < n; i++)
            {
                testResults[i] = int.Parse(Console.ReadLine());
            }
            Array.Sort(testResults);
            Array.Reverse(testResults);

            int NumberOfHires = 0;
            for (int i = m; i < n; i++)
            {
                if (testResults[i] < k) break;
                NumberOfHires++;
            }
            Console.WriteLine(NumberOfHires);
        }
    }
}