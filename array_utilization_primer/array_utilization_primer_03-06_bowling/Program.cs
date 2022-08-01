using System;

namespace array_utilization_primer_03_06_bowling
{
    using System;

    class Program
    {
        static void Main()
        {
            const int NUMBER_OF_PINS = 10;

            int numOfStandingPins = 0;
            int targetPinNumber = 0;
            int pinNumber = NUMBER_OF_PINS;
            while (pinNumber > 0)
            {
                int[] rowOfPins = Array.ConvertAll(
                    Console.ReadLine().Split(), int.Parse);

                foreach (int pin in rowOfPins)
                {
                    if (pin == 1)
                    {
                        numOfStandingPins++;
                        targetPinNumber = pinNumber;
                    }
                    pinNumber--;
                }
            }
            Console.WriteLine(targetPinNumber);
            Console.WriteLine(numOfStandingPins);
        }
    }
}
