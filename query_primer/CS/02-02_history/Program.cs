using System;
using System.Collections.Generic;

namespace _02_02_history
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]); // 人数
            int k = int.Parse(input[1]); // 記事の数
            for (int i = 0; i < n; i++)
            {
                Console.ReadLine();
            }

            // articleTable: 年号と作成者の組み合わせを格納
            // key:   int year(年号)
            // value: SortedSet<string> author(作成者) 
            var articleTable = new SortedDictionary<int, SortedSet<string>>();
            for (int i = 0; i < k; i++)
            {
                input = Console.ReadLine().Split();
                int year = int.Parse(input[0]);
                string author = input[1];
                if (articleTable.ContainsKey(year))
                {
                    articleTable[year].Add(author);

                }
                else
                {
                    articleTable[year] = new SortedSet<string>() { author };
                }
            }

            // 出力
            foreach (var article in articleTable)
            {
                Console.WriteLine(String.Join("\n", article.Value));
            }
        }
    }
}