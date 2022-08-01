using System;
using System.Collections.Generic;

namespace _01_03_multi_search
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int q = int.Parse(input[1]);
            var hashset = new HashSet<int>();
            for (int i = 0; i < n; i++)
            {
                hashset.Add(int.Parse(Console.ReadLine()));
            }
            int[] targets = new int[q];
            for (int i = 0; i < q; i++)
            {
                targets[i] = int.Parse(Console.ReadLine());
            }

            // 検索
            var results = new List<string>();
            foreach (int target in targets)
            {
                results.Add(hashset.Overlaps(new[] { target }) ? "YES" : "NO");
            }

            // 出力
            Console.WriteLine(String.Join("\n", results));
        }
    }
}