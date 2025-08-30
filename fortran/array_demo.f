      PROGRAM ARRAY_DEMO
C     Массив из 3 элементов: индексы 1,2,3 (как в старом Fortran 66)
      INTEGER ARRAY(3)
      INTEGER I

C     Инициализация нулями циклом со строковой меткой
      DO 10 I = 1, 3
         ARRAY(I) = 0
   10 CONTINUE

C     «Аналог» JS: array[1]=42; array[3]=100;
      ARRAY(1) = 42
      ARRAY(3) = 100

C     Печать через формат — без list-directed ввода/вывода
      PRINT 20, ARRAY(1), ARRAY(2), ARRAY(3)
   20 FORMAT(1X,'ARRAY =',3I8)

      END