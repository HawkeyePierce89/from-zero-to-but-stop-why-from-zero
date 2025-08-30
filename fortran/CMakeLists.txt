cmake_minimum_required(VERSION 3.22)

# Включаем Fortran
project(oldfortran LANGUAGES Fortran)

# Явно укажем компилятор gfortran из Homebrew (Apple Silicon)
# Если у тебя путь другой, поправь строку ниже.
set(CMAKE_Fortran_COMPILER /opt/homebrew/bin/gfortran)

# Флаги для «наследия» и фикс-формы
# -std=legacy: разрешает старые конструкции
# -ffixed-form: фиксированная форма исходников (как у .f)
# -ffixed-line-length-none: не ограничивать длину строки по 72/80 колонкам
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -std=legacy -ffixed-form -ffixed-line-length-none")

add_executable(array_demo array_demo.f)