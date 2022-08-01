using System;

namespace _01_01_single_insertion
{
    class Program
    {
        static void Main()
        {
            // 入力
            int[] input = Array.ConvertAll(
                Console.ReadLine().Split(), int.Parse);
            int n = input[0];
            int k = input[1];
            int q = input[2];
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }

            // 挿入
            Array.Resize(ref array, ++n);
            for (int i = n - 1; i > k; i--)
            {
                array[i] = array[i - 1];
            }
            array[k] = q;

            // 出力
            Console.WriteLine(String.Join("\n", array));
        }
    }
}
