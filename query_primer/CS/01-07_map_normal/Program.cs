using System;
using System.Collections.Generic;

namespace _01_07_map_normal
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            var dict = new Dictionary<int, string>();
            for (int i = 0; i < n; i++)
            {
                input = Console.ReadLine().Split();
                int number = int.Parse(input[0]);
                string id = input[1];
                dict.Add(number, id);
            }
            string[] requests = new string[k];
            for (int i = 0; i < k; i++)
            {
                requests[i] = Console.ReadLine();
            }

            // requests の先頭から順に処理を行う
            // join num id: 生徒番号 num , 識別ID id の生徒を追加
            // leave num  : 生徒番号 num の生徒を削除
            // call num   : 生徒番号 num の生徒の識別 ID を出力
            foreach (string request in requests)
            {
                string[] requestParams = request.Split();
                string method = requestParams[0];
                int number = int.Parse(requestParams[1]);

                switch (method)
                {
                    case "join":
                        string id = requestParams[2];
                        dict.Add(number, id);
                        break;

                    case "leave":
                        dict.Remove(number);
                        break;

                    case "call":
                        Console.WriteLine(dict[number]);
                        break;
                }
            }
        }
    }
}