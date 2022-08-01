using System;

namespace array_utilization_primer_03_07_group_move
{
    class Program
    {
        static void Swap<T>(ref T a, ref T b)
        {
            var t = a;
            a = b;
            b = t;
        }
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int q = int.Parse(input[1]);

            // array 初期化
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = i + 1;
            }

            // 指示実行
            for (int i = 0; i < q; i++)
            {
                input = Console.ReadLine().Split();
                string order = input[0];
                switch (order)
                {
                    case "swap":
                        int a = int.Parse(input[1]);
                        int b = int.Parse(input[2]);
                        Swap(ref array[a - 1], ref array[b - 1]);
                        break;

                    case "reverse":
                        Array.Reverse(array);
                        break;

                    case "resize":
                        int size = int.Parse(input[1]);
                        if (array.Length > size)
                        {
                            Array.Resize(ref array, size);
                        }
                        break;
                }
            }

            // 表示
            Console.WriteLine(String.Join("\n", array));
        }
    }
}