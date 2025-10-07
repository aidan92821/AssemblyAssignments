;exam1_5.asm
;signed int num1 = -2100000000;
;signed int num2 = -50000;
;signed int num3 = +2100000000;
;signed int quotient = 0;
;signed long sum = 0
;quotient = num1 / num2;
;sum = long(quotient + num3);

section .data
    num1        dd  -2100000000     ;[num1] = 0x82D4 8B00
    num2        dd  -50000          ;[num2] = 0xFFFF 3CB0
    num3        dd  +2100000000     ;[num3] = 0x7D2B 7500
    quotient    dd  0               ;[quotient] = 0x0000 0000
    sum         dq  0               ;[sum] = 0x0000 0000 0000 0000

section .text
    global _start
_start:
    mov     eax, dword[num1]        ;eax = [num1] = 0x82D4 8B00
    cdq                             ;edx = 0xFFFF FFFF, eax = FFFF 3CB0
    idiv    dword[num2]             ;eax=edx:eax/[num2]=0x0000 A410
    mov     dword[quotient], eax    ;[quotient] = eax = 0x0000 A410
    add     eax, dword[num3]        ;eax = 0x0000 A410 + 7D2B 7500
    adc     edx, 0                  ;edx = 0 + 0 + CF = 0 + 0 + 0 = 0
    mov     dword[sum], eax         ;[sum] = eax = 0x7D2C 1910
    mov     dword[sum+4], edx       ;[sum+4] = edx = 0x0000 0000
_stop:
    mov         rax, 60     ;terminate executing process
    mov         rdi, 0      ;exit status
    syscall                 ;calling system services