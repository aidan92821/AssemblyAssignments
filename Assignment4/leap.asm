; leap.asm
; int main(void) {
;   unsigned short year = 2025;
;   unsigned short yLeap = 0, nLeap = 0;
;   if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))) yLeap++;
;   else nLeap++;
;   return 0;
; }

section .data
    SYS_exit      equ 60
    EXIT_SUCCESS  equ 0

    year   dw 1900
    yLeap  dw 0
    nLeap  dw 0

    C400   dw 400
    C100   dw 100
    C4     dw 4

section .text
    global _start
_start:
    ; if (year % 400 == 0) go to leap
    mov     ax, word[year]
    xor     dx, dx           ; clear the upper 16 bits for remainder
    mov     bx, word[C400]
    div     bx               ; ax = quotient, dx = remainder
    cmp     dx, 0
    je      leap             ; divisible by 400 go to leap

    ; if (year % 4 != 0) goto not_leap
    mov     ax, word[year]
    xor     dx, dx
    mov     bx, word[C4]
    div     bx
    cmp     dx, 0
    jne     not_leap         ; not divisible by 4 -> not leap

    ; if (year % 100 == 0) goto not_leap
    mov     ax, word[year]
    xor     dx, dx
    mov     bx, word[C100]
    div     bx
    cmp     dx, 0
    je      not_leap         ; divisible by 100 (and not by 400) go to not leap

leap:
    inc     word[yLeap]
    jmp     done

not_leap:
    inc     word[nLeap]

done:
    mov     rax, SYS_exit
    mov     rdi, EXIT_SUCCESS
    syscall
