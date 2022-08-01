using System;

namespace array_utilization_primer_02_06_delete
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
            int deletePoint = int.Parse(Console.ReadLine());

            for (int i = deletePoint; i < array.Length; i++)
            {
                array[i - 1] = array[i];
            }
            Array.Resize(ref array, array.Length - 1);

            Console.WriteLine(String.Join("\n", array));
        }
    }
}