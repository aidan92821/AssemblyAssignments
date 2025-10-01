;int main(int argc, char** argv) {
;		signed short num1 = 4660;	// use dw to declare 16-bit variable
;		signed short num2 = -292;	// use dw to declare 16-bit variable
;		signed short dif = 0; 	// use dw to declare 16-bit variable
;		dif = num1 - num2;
;		return 0;
;	}


section .data
    num1 dw  4660           ; Declare 16-bit variable num1
    num2 dw  -292           ; Declare 16-bit variable num2
    diff dw  0              ; Declare 16-bit variable diff
    SYS_exit     equ 60
    EXIT_SUCCESS equ 0

section .text
    global _start
_start:
    mov     ax, word [num1]     ; ax = num1 (16-bit)    
    sub     ax, word [num2]     ; ax = num1 - num2 (16-bit)
    mov     word [diff], ax     ; Store result in diff (16-bit)    

    mov     rax, SYS_exit       
    mov     rdi, EXIT_SUCCESS   
    syscall