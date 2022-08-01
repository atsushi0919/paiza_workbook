using System;

namespace array_utilization_primer_02_07_reduse_easy
{
    class Program
    {
        static void Main()
        {
            const int MAX_NUM = 9;
            int[][] timesTables = new int[MAX_NUM][];
            for (int i = 1; i <= MAX_NUM; i++)
            {
                timesTables[i - 1] = new int[MAX_NUM];
                for (int j = 1; j <= MAX_NUM; j++)
                {
                    timesTables[i - 1][j - 1] = i * j;
                }
            }

            foreach (int[] row in timesTables)
            {
                Console.WriteLine(String.Join(" ", row));
            }
        }
    }
}