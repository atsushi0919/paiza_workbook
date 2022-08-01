using System;

namespace array_utilization_primer_03_04_find_pair
{
    class Program
    {
        static void Main()
        {
            const int MIN = 100;
            const int MAX = 200;
            int n = int.Parse(Console.ReadLine());
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }

            Array.Sort(array);
            int minDiff = MAX - MIN;
            int minIndex = -1;
            for (int i = 0; i < n - 1; i++)
            {
                int diff = array[i + 1] - array[i];
                if (diff < minDiff)
                {
                    minDiff = diff;
                    minIndex = i;
                }
            }

            Console.WriteLine(array[minIndex]);
            Console.WriteLine(array[minIndex + 1]);
        }
    }
}