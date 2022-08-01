using System;
using System.Collections.Generic;

namespace _02_01_idle_group
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            SortedSet<string> names = new SortedSet<string>();
            for (int i = 0; i < n; i++)
            {
                names.Add(Console.ReadLine());
            }
            string[] requests = new string[k];
            for (int i = 0; i < k; i++)
            {
                requests[i] = Console.ReadLine();
            }

            // requests の先頭から順に処理
            List<string> results = new List<string>();
            foreach (string request in requests)
            {
                string[] requestParams = request.Split();
                string method = requestParams[0];

                if (method == "handshake")
                {
                    if (names.Count == 0) continue;
                    results.Add(String.Join("\n", names));
                    continue;
                }

                string name = requestParams[1];
                switch (method)
                {
                    case "join":
                        names.Add(name);
                        break;
                    case "leave":
                        names.Remove(name);
                        break;
                }
            }

            // 出力
            Console.WriteLine(String.Join("\n", results));
        }
    }
}