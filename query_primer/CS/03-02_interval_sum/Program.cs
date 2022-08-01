using System;

namespace _03_02_interval_sum
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            int[] array = new int[n];
            int[] sectionSum = new int[n + 1];
            int sum = 0;
            for (int i = 0; i < n; i++)
            {
                int value = int.Parse(Console.ReadLine());
                array[i] = value;
                sum += value;
                sectionSum[i + 1] = sum;
            }
            int[][] sections = new int[k][];
            for (int i = 0; i < k; i++)
            {
                sections[i] = Array.ConvertAll(
                    Console.ReadLine().Split(), int.Parse);
            }

            // 出力
            foreach (var section in sections)
            {
                int l = section[0];
                int r = section[1];
                Console.WriteLine(sectionSum[r] - sectionSum[l - 1]);
            }
        }
    }
}