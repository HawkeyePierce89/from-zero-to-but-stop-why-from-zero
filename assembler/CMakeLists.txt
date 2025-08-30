cmake_minimum_required(VERSION 3.20)
project(untitled ASM)

enable_language(ASM)
set(CMAKE_ASM_COMPILER clang)
set(CMAKE_ASM_FLAGS "-arch arm64")

add_executable(untitled main.s print_array.s)