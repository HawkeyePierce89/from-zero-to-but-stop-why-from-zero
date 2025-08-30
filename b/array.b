GET "libhdr"

LET start() BE
$(
    LET array = VEC 5   // массив на 5 элементов
    array!0 := 42       // присваиваем array[0] = 42
    array!2 := 100      // присваиваем array[2] = 100

    WRITEF("ARRAY(0)=%N*N", array!0)
    WRITEF("ARRAY(1)=%N*N", array!1)
    WRITEF("ARRAY(2)=%N*N", array!2)
$)
