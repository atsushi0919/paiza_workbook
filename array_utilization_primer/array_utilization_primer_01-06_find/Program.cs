using System;

namespace array_utilization_primer_01_06_find
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }

            int index = Array.IndexOf(array, k);
            if (index > -1) index++;

            Console.WriteLine(index);
        }
    }
}