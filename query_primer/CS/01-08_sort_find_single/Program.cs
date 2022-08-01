using System;
using System.Collections.Generic;

namespace _01_08_sort_find_single
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);    // 転校生,paiza以外の人数
            int x = int.Parse(input[1]);    // 転校生の身長
            int p = int.Parse(input[2]);    // paizaの身長
            List<int> students = new List<int>() { x, p };
            // 転校生,paiza以外の身長を students に格納
            for (int i = 0; i < n; i++)
            {
                int height = int.Parse(Console.ReadLine());
                students.Add(height);
            }

            // 身長順に並び替え
            students.Sort();
            // paiza の位置を探索する(身長の重複なし)
            int position = students.IndexOf(p) + 1;

            // 出力
            Console.WriteLine(position);
        }
    }
}