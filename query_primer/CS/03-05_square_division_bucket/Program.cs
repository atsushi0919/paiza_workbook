using System;

namespace _03_05_square_division_bucket
{
    class Program
    {
        static void Main()
        {
            // SIZE: 要素数, X: 要素数の平方根
            // DEFAULT_MAX_VALUE: 最大値の初期値
            // (-100,000 ≦ value ≦ 100,000)
            int SIZE = 10000;
            int X = 100;
            int DEFAULT_MAX_VALUE = -100001;
            int[] maxValues = new int[X];

            int maxValue = DEFAULT_MAX_VALUE;
            for (int i = 1; i <= SIZE; i++)
            {
                int value = int.Parse(Console.ReadLine());
                maxValue = Math.Max(maxValue, value);

                // X 要素ごとの最大値
                if (i % X == 0)
                {
                    int index = i / X - 1;
                    maxValues[index] = maxValue;
                    maxValue = DEFAULT_MAX_VALUE;
                }
            }

            // 出力
            Console.WriteLine(String.Join("\n", maxValues));
        }
    }
}