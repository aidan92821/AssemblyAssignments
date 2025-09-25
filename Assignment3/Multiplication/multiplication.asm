; multiplication.asm
; unsigned int num1 = 300000, num2 = 400000
; unsigned long product = 0
; product = long (num1 * num2)

section .data
    SYS_exit        equ 60
    EXIT_SUCCESS    equ 0

    num1            dd 300000          ; 0x000493E0
    num2            dd 400000          ; 0x00061A80
    product         dq 0               ; 64-bit product

section .text
    global _start
_start:
    ; edx:eax = eax * [num2]  (unsigned 32 x 32 -> 64)
    mov     edx, 0                     ; Clear edx before multiplication
    mov     eax, dword [num1]          ; eax = num1
    mul     dword [num2]               ; edx:eax = eax * [num2]

    mov     dword [product], eax       ; low  32 bits 
    mov     dword [product+4], edx     ; high 32 bits

    ; exit
    mov     rax, SYS_exit
    mov     rdi, EXIT_SUCCESS
    syscall
