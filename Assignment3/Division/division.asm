section .data
    SYS_exit        equ 60
    EXIT_SUCCESS    equ 0
    num1            dq  50000000000           ; Declare 16-bit variable
    num2            dd  3333333            ; Declare 16-bit variable
    quot            dd  0                ; Declare 16-bit variable
    remd            dd  0                ; Declare 16-bit variable


section .text
    global _start
_start:
    mov     edx, 0
    mov     eax, dword[num1]
    mov     edx, dword[num1+4]
    div     dword[num2]
    mov     dword[quot], eax
    mov     dword[remd], edx
_stop:
    mov     rax, SYS_exit       ; Terminate executing process
    mov     rdi, EXIT_SUCCESS   ; Exit status
    syscall                     ; Invoke exit