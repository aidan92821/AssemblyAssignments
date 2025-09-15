; int main(int argc, char** argv) {
; unsigned short num1 = 65244; // use dw to declare 16-bit variable
; unsigned short num2 = 4660; // use dw to declare 16-bit variable
; unsigned int sum = 0; // use dd to declare 32-bit variable
; sum = int(num1 + num2);
; return 0;
; }

section .data
    num1 dw  65244          ; Declare 16-bit variable num1
    num2 dw  4660           ; Declare 16-bit variable num2
    sum  dd  0              ; Declare 32-bit variable sum
    SYS_exit equ 60
    EXIT_SUCCESS equ 0

section .text
    global _start
_start:
    mov ax, word[num1]      ; Load num1 into AX (16-bit)
    add ax, word[num2]      ; Add num2 to AX (16-bit)
    mov word[sum], ax       ; Store the result in sum (32-bit)
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall