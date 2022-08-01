using System;

namespace array_utilization_primer_02_10_unique
{
    class Program
    {
        static void Main()
        {
            int n = int.Parse(Console.ReadLine());
            int[] array = new int[n];
            int[] uniqueArray = new int[n];
            int uniqueIndex = 0;
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
                if (n == 1)
                {
                    uniqueArray[uniqueIndex] = array[i];
                    uniqueIndex++;
                    break;
                }

                bool unique = true;
                for (int j = 0; j < i; j++)
                {
                    if (array[i] == array[j])
                    {
                        unique = false;
                        break;
                    }
                }
                if (unique)
                {
                    uniqueArray[uniqueIndex] = array[i];
                    uniqueIndex++;
                }

            }
            Array.Resize(ref uniqueArray, uniqueIndex);

            Console.WriteLine(String.Join("\n", uniqueArray));
        }
    }
}