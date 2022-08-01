using System;

namespace array_utilization_primer_03_05_line_up
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            // int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            int f = int.Parse(input[2]);

            // blueSheets 初期状態
            int[] blueSheets = new int[k];
            for (int i = 0; i < k; i++)
            {
                blueSheets[i] = int.Parse(Console.ReadLine());
            }

            // 先頭の f 枚を店が撤去(0)
            for (int i = 0; i < f; i++)
            {
                blueSheets[i] = 0;
            }

            // 同じ人のシートが複数残っている場合
            // 店に近いシートを残して残りは撤去(0)
            for (int i = f; i < k; i++)
            {
                if (blueSheets[i] == 0) continue;
                Console.WriteLine(blueSheets[i]);

                for (int j = i + 1; j < k; j++)
                {
                    if (blueSheets[i] == blueSheets[j])
                    {
                        blueSheets[j] = 0;
                    }
                }
            }
        }
    }
}