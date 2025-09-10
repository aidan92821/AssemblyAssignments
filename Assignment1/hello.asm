; ex_hello.asm
; char text[] = "Hello, World!\n"
; cout << text;
section .data
LF equ 10
NULL equ 0
SYS_exit equ 60
EXIT_SUCCESS equ 0
text db "Hello, World!", LF, NULL
section .text
global _start
_start:
mov rax, 1 ;sys_write
mov rdi, 1 ;std_output
mov rsi, text ;address of text
mov rdx, 14 ;number of char.
syscall
mov rax, SYS_exit
mov rdi, EXIT_SUCCESS