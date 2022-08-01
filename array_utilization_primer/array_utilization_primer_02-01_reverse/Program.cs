using System;
using System.Linq;

namespace array_utilization_primer_02_01_reverse
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

            int[] reversedArray = array.Reverse().ToArray();

            foreach (int val in reversedArray)
            {
                Console.WriteLine(val);
            }
        }
    }
}