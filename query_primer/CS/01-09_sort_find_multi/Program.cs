using System;
using System.Collections.Generic;

namespace _01_09_sort_find_multi
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);    // paiza以外の人数
            int k = int.Parse(input[1]);    // イベント数
            int p = int.Parse(input[2]);    // paizaの身長
            List<int> students = new List<int>() { p };
            // paiza 以外の身長を students に格納
            for (int i = 0; i < n; i++)
            {
                int height = int.Parse(Console.ReadLine());
                students.Add(height);
            }
            string[] requests = new string[k];
            for (int i = 0; i < k; i++)
            {
                requests[i] = Console.ReadLine();
            }

            // paiza の初期位置
            students.Sort();
            int position = students.IndexOf(p) + 1;

            // requests の先頭から順に処理
            List<int> results = new List<int>();
            foreach (string request in requests)
            {
                string[] requestParams = request.Split();
                string method = requestParams[0];
                switch (method)
                {
                    case "join":
                        int height = int.Parse(requestParams[1]);
                        if (p > height) position++;
                        break;
                    case "sorting":
                        results.Add(position);
                        break;
                }
            }

            // 出力
            Console.WriteLine(String.Join("\n", results));
        }
    }
}