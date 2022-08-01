using System;

namespace array_utilization_primer_02_09_resize
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int n1 = int.Parse(input[0]);
            int n2 = int.Parse(input[1]);
            int[] array = new int[n1];
            for (int i = 0; i < n1; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }

            Array.Resize(ref array, n2);

            Console.WriteLine(String.Join("\n", array));
        }
    }
}