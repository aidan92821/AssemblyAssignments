;int main(int argc, char** argv) {
;		signed short num1 = 4660;	// use dw to declare 16-bit variable
;		signed short num2 = -292;	// use dw to declare 16-bit variable
;		signed short dif = 0; 	// use dw to declare 16-bit variable
;		dif = num1 - num2;
;		return 0;
;	}


;subtraction.asm
; signed short num1 = 4660;
; signed short num2 = -292;
; signed short dif = 0;
; dif = num1 - num2;

section .data
    num1    dw   4660   ;num1 = 0x1234
    num2    dw   -292   ;num2 = 0xFEDC
    dif     dw   0      ;dif = 0

section .text
    global _start

_start:
    mov     ax, word[num1]  ;ax = num1
    sub     ax, word[num2]  ;ax = ax - num2
    mov     word[dif], ax   ;dif = ax
    
    mov     rax, 60         ;terminate excuting process
    mov     rdi, 0          ;exit status
    syscall                 ;calling system services