using System;
using System.Collections.Generic;

namespace _01_06_map_easy
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            var studentTable = new Dictionary<int, string>();
            for (int i = 0; i < n; i++)
            {
                input = Console.ReadLine().Split();
                int number = int.Parse(input[0]);
                string id = input[1];
                studentTable.Add(number, id);
            }
            int[] numbers = new int[k];
            for (int i = 0; i < k; i++)
            {
                numbers[i] = int.Parse(Console.ReadLine());
            }

            // numbers の先頭から順に処理を行う
            foreach (int number in numbers)
            {
                // number に対応する id を表示する
                Console.WriteLine(studentTable[number]);
            }
        }
    }
}