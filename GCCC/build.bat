@echo off

gcc  main.c         ^
    -std=c99        ^
    -o bin\main.exe ^
    -Wall           ^
    -Wextra         ^
    -Werror         ^
    -fmax-errors=5

