        .text
        .globl _main
        .extern _print_array

// main: кладём 42 в ARRAY[0], 100 в ARRAY[2], зовём print_array(ARRAY,5)
_main:
        // Создаем массив на стеке (более надежно для macOS)
        sub     sp, sp, #48        // 5 * 8 байт + выравнивание
        
        // Инициализируем массив нулями
        str     xzr, [sp]
        str     xzr, [sp, #8]
        str     xzr, [sp, #16]
        str     xzr, [sp, #24]
        str     xzr, [sp, #32]
        
        // ARRAY[0] = 42
        mov     x1, #42
        str     x1, [sp]

        // ARRAY[2] = 100
        mov     x1, #100
        str     x1, [sp, #16]

        // print_array(sp, 5)
        mov     x0, sp             // x0 = адрес массива на стеке
        mov     w1, #5             // w1 = количество элементов
        bl      _print_array

        // print_array делает exit, но на всякий случай
        add     sp, sp, #48
        ret