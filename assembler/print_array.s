        .text
        .globl _print_array
        .extern _printf
        .extern _exit

// void print_array(long* ptr, int count)
_print_array:
        // Пролог (сохраняем регистры по ABI)
        stp     x29, x30, [sp, #-48]!
        mov     x29, sp
        stp     x19, x20, [sp, #16]
        str     x21, [sp, #32]

        // x0 = ptr, w1 = count
        mov     x19, x0            // x19 = ptr
        mov     w20, w1            // w20 = count

        // Печатаем "["
        adrp    x0, LBRACK@PAGE
        add     x0, x0, LBRACK@PAGEOFF
        bl      _printf            // printf("[")

        // Пустой массив?
        cbz     w20, .close

        // i = 0
        mov     w21, #0
.loop:
        // Сначала загружаем значение элемента
        sxtw    x3, w21            // x3 = sign-extend i to 64-bit  
        lsl     x3, x3, #3         // x3 = i * 8
        ldr     x8, [x19, x3]      // x8 = *(ptr + i*8)
        
        // Выбор формата: первый элемент "%ld", остальные ",%ld"
        cbz     w21, .first
        
        // Печатаем с запятой
        sub     sp, sp, #16
        str     x8, [sp]           // Кладем значение на стек для printf
        adrp    x0, COMMA_D@PAGE
        add     x0, x0, COMMA_D@PAGEOFF
        bl      _printf            // printf(",%ld", значение на стеке)
        add     sp, sp, #16
        b       .next
        
.first:
        // Печатаем без запятой
        sub     sp, sp, #16
        str     x8, [sp]           // Кладем значение на стек для printf
        adrp    x0, DONLY@PAGE
        add     x0, x0, DONLY@PAGEOFF
        bl      _printf            // printf("%ld", значение на стеке)
        add     sp, sp, #16
        
.next:

        add     w21, w21, #1
        cmp     w21, w20
        blt     .loop

.close:
        // Печатаем "]\n"
        adrp    x0, RBRACK_N@PAGE
        add     x0, x0, RBRACK_N@PAGEOFF
        bl      _printf

        // Эпилог и выход
        ldr     x21, [sp, #32]
        ldp     x19, x20, [sp, #16]
        ldp     x29, x30, [sp], #48
        mov     x0, #0
        bl      _exit

        // Строковые литералы (в сегменте __TEXT,__cstring)
        .section __TEXT,__cstring,cstring_literals
LBRACK:   .asciz "["
DONLY:    .asciz "%ld"
COMMA_D:  .asciz ",%ld"
RBRACK_N: .asciz "]\n"