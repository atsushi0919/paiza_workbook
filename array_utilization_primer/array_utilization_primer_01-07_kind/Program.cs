using System;
using System.Linq;

namespace array_utilization_primer_01_07_kind
{
    class Program
    {
        static void Main()
        {
            const int ARRAY_SIZE = 101;
            int n = int.Parse(Console.ReadLine());
            int[] array = new int[ARRAY_SIZE];
            for (int i = 0; i < n; i++)
            {
                array[int.Parse(Console.ReadLine())]++;
            }

            Console.WriteLine(array.Count(x => x > 0));
        }
    }
}