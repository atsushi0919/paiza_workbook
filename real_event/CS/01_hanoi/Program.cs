using System;
using System.Collections.Generic;

namespace _01_hanoi
{
    class Program
    {
        static void Main()
        {
            int NUM_OF_TOWER = 3;
            int[,] PATTERNS = { { 2, 1, 0 }, { 1, 2, 0 } };

            // towers 初期化
            List<List<int>> towers = new List<List<int>>();
            for (int i = 0; i < NUM_OF_TOWER; i++)
            {
                towers.Add(new List<int>());
            }

            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int t = int.Parse(input[1]);

            // disk 配置の計算
            for (int i = 0; i < n; i++)
            {
                int disk = n - i;
                int k = (int)Math.Pow(2, disk - 1);
                if (t < k)
                {
                    towers[0].Add(disk);
                }
                else if (t >= (int)Math.Pow(2, n) - k)
                {
                    towers[2].Add(disk);
                }
                else
                {
                    int a = i % 2;
                    int b = (t - k) / (int)Math.Pow(2, disk) % 3;
                    towers[PATTERNS[a, b]].Add(disk);
                }
            }

            // 出力
            foreach (var tower in towers)
            {
                if (tower.Count > 0)
                {
                    Console.WriteLine(String.Join(" ", tower));
                }
                else
                {
                    Console.WriteLine("-");
                }
            }
        }
    }
}