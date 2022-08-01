using System;

namespace _03_04_two_dimensions_interval_sum
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int h = int.Parse(input[0]);
            int w = int.Parse(input[1]);
            int n = int.Parse(input[2]);
            int[,] array = new int[h, w];
            int[,] sectionSum = new int[h + 1, w + 1];
            for (int i = 0; i < h; i++)
            {
                int[] line = Array.ConvertAll(
                    Console.ReadLine().Split(), int.Parse);
                for (int j = 0; j < w; j++)
                {
                    array[i, j] = line[j];
                    // 範囲の合計
                    sectionSum[i + 1, j + 1] = line[j] +
                                               sectionSum[i, j + 1] +
                                               sectionSum[i + 1, j] -
                                               sectionSum[i, j];
                }
            }
            int[][] sections = new int[n][];
            for (int i = 0; i < n; i++)
            {
                sections[i] = Array.ConvertAll(
                    Console.ReadLine().Split(), int.Parse);
            }

            // 出力
            foreach (var section in sections)
            {
                int a = section[0];
                int b = section[1];
                int c = section[2];
                int d = section[3];
                int sum = sectionSum[c, d] +
                          sectionSum[a - 1, b - 1] -
                          sectionSum[a - 1, d] -
                          sectionSum[c, b - 1];
                Console.WriteLine(sum);
            }
        }
    }
}