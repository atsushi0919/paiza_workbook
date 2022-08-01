using System;
using System.Collections.Generic;

namespace _02_04_accounting
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] intput = Console.ReadLine().Split();
            int n = int.Parse(intput[0]);
            int k = int.Parse(intput[1]);
            var purchaseHistoryTable =
                new Dictionary<string, List<Tuple<string, int>>>();
            string[] departments = new string[n];
            for (int i = 0; i < n; i++)
            {
                string deptName = Console.ReadLine();
                departments[i] = deptName;
                // 購買履歴初期化
                purchaseHistoryTable[deptName] =
                    new List<Tuple<string, int>>();
            }
            string[] requests = new string[k];
            for (int i = 0; i < k; i++)
            {
                requests[i] = Console.ReadLine();
            }

            //requests 処理
            foreach (var request in requests)
            {
                string[] requestParams = request.Split();
                string deptName = requestParams[0];
                string orderNumber = requestParams[1];
                int price = int.Parse(requestParams[2]);
                purchaseHistoryTable[deptName]
                    .Add(new Tuple<string, int>(orderNumber, price));
            }

            // 出力
            foreach (var deptName in departments)
            {
                Console.WriteLine(deptName);
                foreach (var record in purchaseHistoryTable[deptName])
                {
                    Console.WriteLine($"{record.Item1} {record.Item2}");
                }
                Console.WriteLine("-----");
            }
        }
    }
}