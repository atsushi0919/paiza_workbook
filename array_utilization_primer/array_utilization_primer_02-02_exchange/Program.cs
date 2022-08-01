using System;

namespace array_utilization_primer_02_02_exchange
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
            string[] input = Console.ReadLine().Split();
            int x = int.Parse(input[0]);
            int y = int.Parse(input[1]);

            Swap(ref x, ref y);

            Console.WriteLine($"{x} {y}");
        }
    }
}
