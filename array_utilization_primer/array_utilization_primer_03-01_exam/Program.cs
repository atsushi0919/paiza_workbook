using System;

namespace array_utilization_primer_03_01_exam
{
    class Program
    {
        static void Main()
        {
            const int NUMBER_OF_SUBJECTS = 5;
            int n = int.Parse(Console.ReadLine());
            int[] weights = Array.ConvertAll(
                Console.ReadLine().Split(), int.Parse);

            int highestScore = -1;
            for (int i = 0; i < n; i++)
            {
                int[] testResults = Array.ConvertAll(
                    Console.ReadLine().Split(), int.Parse);
                int score = 0;
                for (int j = 0; j < NUMBER_OF_SUBJECTS; j++)
                {
                    score += weights[j] * testResults[j];
                }
                highestScore = Math.Max(highestScore, score);
            }
            Console.WriteLine(highestScore);
        }
    }
}