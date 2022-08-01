using System;

namespace array_utilization_primer_02_04_push_back
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
            int b = int.Parse(Console.ReadLine());

            Array.Resize(ref array, array.Length + 1);
            // paiza 提出用
            // array[array.Length - 1] = b;
            // C# 8.0 以降の書き方
            array[^1] = b;

            Console.WriteLine(String.Join("\n", array));
        }
    }
}