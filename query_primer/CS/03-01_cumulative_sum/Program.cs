using System;

namespace _03_01_cumulative_sum
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
                sum += value;
                array[i] = value;
                // 区間合計
                sectionSum[i + 1] = sum;
            }
            int[] q = new int[k];
            for (int i = 0; i < k; i++)
            {
                q[i] = int.Parse(Console.ReadLine());
            }

            // 出力
            foreach (var sectionNum in q)
            {
                Console.WriteLine(sectionSum[sectionNum]);
            }
        }
    }
}