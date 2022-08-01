using System;

namespace array_utilization_primer_02_03_swap
{
    class Program
    {
        static void Swap<T>(ref T x, ref T y)
        {
            var t = x;
            x = y;
            y = t;
        }
        static void Main()
        {
            int n = int.Parse(Console.ReadLine());
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }
            string[] input = Console.ReadLine().Split();
            int x = int.Parse(input[0]);
            int y = int.Parse(input[1]);

            Swap(ref array[x - 1], ref array[y - 1]);

            Console.WriteLine(string.Join("\n", array));
        }
    }
}