arr:
        .int 63, 12, 130, 11923, 93, 29, 131, 222, 3352, 543234
        .globl _start
_start:
        movl $arr, %ecx            # загрузка адреса массива в ecx
        movl $10, %edx             # загрузка размера массива в edx
        movl $0, %ebx              # размер элемента массива
loop:
        cmpl $0, %edx              # проверка на конец массива
        jz end_loop                # переход, если конец массива
        movl (%ecx), %eax          # загрузка значения элемента массива в eax
        testb $0x80, %al           # проверка 7-го бита
        jz skip_shift              # переход, если 7-й бит не установлен
        shr %eax                   # сдвиг вправо на 1 разряд
skip_shift:
        addl %eax, %ebx            # добавление значения элемента массива к сумме
        addl $4, %ecx              # переход к следующему элементу массива
        subl $1, %edx              # уменьшение счетчика цикла на 1
        jmp loop                   # переход к началу цикла
end_loop:
        pushl %ebx                 # сохранение значения суммы в стеке
        pushl $output_msg          # загрузка адреса строки вывода в стек
        call printf                # вызов функции printf
        addl $8, %esp              # очистка стека
        movl $1, %eax              # код возврата
        xorl %ebx, %ebx            # очистка ebx
        int $0x80                  # системный вызов exit

output_msg:
        .string "Сумма элементов массива: %d\n"