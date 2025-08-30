#!/bin/bash
set -e  # если ошибка — сразу выходим

rm -f main.o print_array.o prog

clang -arch arm64 -c main.s -o main.o
clang -arch arm64 -c print_array.s -o print_array.o

clang -arch arm64 main.o print_array.o -o prog

./prog