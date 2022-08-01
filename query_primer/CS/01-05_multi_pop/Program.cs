using System;
using System.Collections.Generic;

namespace _01_05_multi_pop
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            Queue<int> queue = new Queue<int>();
            for (int i = 0; i < n; i++)
            {
                queue.Enqueue(int.Parse(Console.ReadLine()));
            }
            string[] requests = new string[k];
            for (int i = 0; i < k; i++)
            {
                requests[i] = Console.ReadLine();
            }

            // requests の先頭から順に命令実行
            // pop  : Dequeue
            // show : queueの要素を改行で連結して表示
            foreach (string request in requests)
            {
                switch (request)
                {
                    case "pop":
                        queue.Dequeue();
                        break;
                    case "show":
                        Console.WriteLine(String.Join("\n", queue));
                        break;
                }
            }
        }
    }
}