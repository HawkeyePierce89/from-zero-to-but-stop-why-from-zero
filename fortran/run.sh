#!/bin/bash
set -e  # если ошибка — сразу выходим

rm -f array_demo

gfortran -std=legacy -ffixed-form -ffixed-line-length-none array_demo.f -o array_demo

./array_demo
