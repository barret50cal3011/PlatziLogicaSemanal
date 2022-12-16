;compile in windos:
;nasm -f win32 .\helloworld.asm -o test.obj
;gcc .\test.obj -o test.exe
;.\test.exe

global _main
extern _printf
extern _scanf

segment .data

    msg1: db "Enter the first number", 0xA, 0xD, 0  ; note the null terminator.
    msg2: db "Enter the second number", 0xA, 0xD, 0

    nl: db 0xA, 0xD, 0

    ; formats 
    digit_format: db "%d", 0 
segment .bss
    num1 resb 4
    num2 resb 4
    result resb 4

segment .text

;prints a \n on the terminal
_endl:
    push nl
    call _printf
    add esp, 4

    ret

;asumes eax is the first number and ebx the second
_print_num:
    mov eax, [num1]
    push eax
    push digit_format
    call _printf
    add esp, 8

    call _endl

    mov eax, [num2]
    push eax
    push digit_format
    call _printf
    add esp, 8

    call _endl

    ret

;prints the result
_print_result:
    mov eax, [result]
    push eax
    push digit_format
    call _printf
    add esp, 8

    ret

;solution to the identifica operacion problem
_solution:
    mov eax, [num1]
    mov ebx, [num2]

    mov edx, ebx    ; temp = num2 
    neg ebx         ; num2 *= -1

    add ebx, eax    ; num2 = num1 + num2 // num2 is negative
    add eax, edx    ; num1 = temp + num1

    ;eax is now the sum and ebx is now the subtraction
    mov ecx, eax    ;ecx = sum edit

    push eax
    for:
    cmp eax, 1
    jl end_loop     ; while (i >= 1)
        mov edx, 10
        mov eax, ebx;eax = sub
        mul edx
        mov ebx, eax;ebx = new sub

        xor edx, edx
        mov eax, ecx;eax = sum edit
        mov ecx, 10
        div ecx     ; i / 10
        mov ecx, eax;ecx = sum edit
    jmp for
    end_loop:
    pop eax

    add eax, ebx
    mov [result], eax

    ret
_main:
    push msg1
    call _printf
    add esp, 4

    push num1
    push digit_format
    call _scanf
    add esp, 8

    push msg2
    call _printf
    add esp, 4 

    push num2
    push digit_format
    call _scanf
    add esp, 8

    call _endl
    call _print_num
    call _solution
    call _print_result

    ret 