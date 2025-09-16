; int main(int argc, char** argv) {
; unsigned short num1 = 65244; // use dw to declare 16-bit variable
; unsigned short num2 = 4660; // use dw to declare 16-bit variable
; unsigned int sum = 0; // use dd to declare 32-bit variable
; sum = int(num1 + num2);
; return 0;
; }

section .data
    SYS_exit        equ 60
    EXIT_SUCCESS    equ 0
    num1            dw  65244            ; Declare 16-bit variable
    num2            dw  4660             ; Declare 16-bit variable
    sum             dd  0                ; Declare 32-bit variable

section .text
    global _start
_start:
    mov     dx, 0               ; DX = high 16 bit sum start at 0

    ; Low 16-bit add
    mov     ax, word[num1]         ; AX = low 16 bit num1
    add     ax, word[num2]          ; AX = low16 bit sum 

    ; High 16 bits carry
    adc     dx, 0               ; DX += CF 

    ; Store 32-bit sum
    mov     word[sum],   ax         ; low  16 bit
    mov     word[sum+2], dx         ; high 16 bit

    ; exit
    mov     rax, SYS_exit
    mov     rdi, EXIT_SUCCESS
    syscall
