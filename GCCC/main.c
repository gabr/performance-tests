#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#define SIZE 100000

void add(int* to, int* from, int val)
{
    for (int i = 0; i < SIZE; i++)
        to[i] = from[i] + val;
}

int main()
{
    clock_t begin = clock();
    int from[SIZE];
    int to[SIZE];

    srand(time(NULL));

    // setup
    for (int i = 0; i < SIZE; i++)
        from[i] = rand();

    // test

    add(to, from, rand());

    clock_t end = clock();
    double time_spent = (double)(end - begin) / (CLOCKS_PER_SEC * 1000);
    printf("%lu clocks\n", (end - begin));
    printf("%f ms", time_spent);
}
