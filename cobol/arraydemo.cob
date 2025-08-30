       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAYDEMO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ARRAY.
           05  ELEM           OCCURS 3 TIMES PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.
           MOVE 42  TO ELEM (1).
           MOVE 100 TO ELEM (3).

           DISPLAY "ARRAY(0)=" ELEM (1).
           DISPLAY "ARRAY(1)=" ELEM (2).
           DISPLAY "ARRAY(2)=" ELEM (3).

           STOP RUN.
