using System;

namespace array_utilization_primer_03_03_queue
{
    class Program
    {
        static void Main()
        {
            const int SIZE = 100;
            int[] queue = new int[SIZE];
            int head = 0;
            int tail = 0;

            int n = int.Parse(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                string[] input = Console.ReadLine().Split();
                string request = input[0];

                switch (request)
                {
                    // enqueue
                    case "in":
                        int value = int.Parse(input[1]);
                        queue[tail] = value;
                        tail++;
                        break;

                    // dequeue
                    case "out":
                        if (head == tail) continue;
                        head++;
                        break;
                }
            }

            for (int i = head; i < tail; i++)
            {
                Console.WriteLine(queue[i]);
            }
        }
    }
}