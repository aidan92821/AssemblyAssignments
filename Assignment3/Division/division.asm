; division.asm
; unsigned long num1 = 50,000,000,000;
; unsigned int  num2 = 3,333,333;
; unsigned int  quotient = 0, remainder = 0;
; quotient = num1 / num2;
; remainder = num1 % num2;

section .data
    SYS_exit        equ 60
    EXIT_SUCCESS    equ 0

    num1            dq 50000000000      ; 0x0000000B A43B7400
    num2            dd 3333333          ; 0x0032DCD5
    quot            dd 0                ; 32-bit quotient
    remd            dd 0                ; 32-bit remainder

section .text
    global _start
_start:
    mov     eax, dword [num1]       ; low  dword
    mov     edx, dword [num1+4]     ; high dword
    div     dword [num2]            ; edx:eax / [num2]
                                    ; eax = quotient, edx = remainder
    mov     dword [quot], eax
    mov     dword [remd], edx

    ; exit
    mov     rax, SYS_exit
    mov     rdi, EXIT_SUCCESS
    syscall
