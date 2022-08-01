using System;

namespace array_utilization_primer_02_11_filter
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int n = int.Parse(input[0]);
            int k = int.Parse(input[1]);
            int[] array = new int[n];
            int[] selectedArray = new int[n];
            int index = 0;
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
                if (array[i] >= k)
                {
                    selectedArray[index] = array[i];
                    index++;
                }

            }
            Array.Resize(ref selectedArray, index);

            Console.WriteLine(String.Join("\n", selectedArray));
        }
    }
}