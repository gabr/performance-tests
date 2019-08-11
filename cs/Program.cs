using System;

namespace cs
{
    class Program
    {
        const Int32 SIZE = 100000000;

        static void Add(Int64[] to, Int64[] from, Int64 value)
        {
            for (Int64 i = 0; i < SIZE; i++)
                to[i] = from[i] + value;
        }

        /*
         * C# był początkowo najszybszy co mnie nieco zdziwiło.
         * C nie potrafiłem przetestować na tak dużych tablicach,
         * ale Common Lisp dawał radę ale był tak ze trzy razy
         * wolniejszy od C# co mnie dziwiło.
         *
         * C# miał wyniki rzędu 200 ms a CL 600 ms
         *
         * Po dekompilacji C# na ILa okazało się, że on używa
         * Int32, a CL używał cały czas inta 64 bitowego.
         *
         * Po zmianie na Int64 wydajność zarówno C# jak i CL
         * jest taka sama.
         */

        static void Main(string[] args)
        {
            var rand = new Random();

            Int64[] from = new Int64[SIZE];
            Int64[] to = new Int64[SIZE];

            for (Int64 i = 0; i < SIZE; i++)
                from[i] = rand.Next(SIZE);

            var watch = System.Diagnostics.Stopwatch.StartNew();

            Add(to, from, rand.Next(SIZE));

            watch.Stop();

            Console.WriteLine(to[rand.Next(SIZE - 1)]);
            Console.WriteLine($"{watch.ElapsedTicks} tics");
            Console.WriteLine($"{watch.ElapsedMilliseconds} ms");
        }
    }
}
