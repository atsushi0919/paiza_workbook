using System;

namespace _01_02_single_search
{
    class Program
    {
        static void Main()
        {
            // 入力
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }

            // 検索
            bool find = false;
            foreach (int value in array)
            {
                if (value == k)
                {
                    find = true;
                    break;
                }
            }

            // 出力
            Console.WriteLine(find ? "YES" : "NO");
        }
    }
}
