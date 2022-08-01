using System;

namespace array_utilization_primer_02_05_insert
{
    class Program
    {
        static void Main()
        {
            int n = int.Parse(Console.ReadLine());
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }
            string[] input = Console.ReadLine().Split();
            int insertPoint = int.Parse(input[0]);
            int b = int.Parse(input[1]);

            Array.Resize(ref array, array.Length + 1);
            for (int i = array.Length - 1; i > insertPoint; i--)
            {
                array[i] = array[i - 1];
            }
            array[insertPoint] = b;

            Console.WriteLine(String.Join("\n", array));
        }
    }
}