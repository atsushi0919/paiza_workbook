using System;

namespace array_utilization_primer_01_08_map
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

            array = Array.ConvertAll(array, x => x + k);

            foreach (int val in array)
            {
                Console.WriteLine(val);
            }
        }
    }
}