; lcm3.asm
; int arr1[3] = {3,6,40};
; int arr2[3] = {4,8,60};
; int lcm[3];
; rcx = 0;
; do {
;   ebx = arr1[rcx];
;   do {
;     if (ebx % arr2[rcx] == 0) goto found;
;     ebx = ebx + arr1[rcx];
;   } while (ebx <= arr1[rcx] * arr2[rcx]);
; found:
;   lcm[rcx] = ebx;
;   rcx++;
; } while (rcx <= 2);
; return 0;

section .data
    arr1    dd  3, 6, 40
    arr2    dd  4, 8, 60

section .bss
    lcm     resd 3

section .text
    global _start
_start:
    mov     rcx, 0              

outer_loop:
    mov     ebx, dword [arr1 + rcx*4]

inner_loop:
    mov     eax, ebx
    cdq
    mov     r8d, dword [arr2 + rcx*4]
    idiv    r8d
    cmp     edx, 0
    je      found                   
    add     ebx, dword [arr1 + rcx*4]
    mov     eax, dword [arr1 + rcx*4]
    imul    eax, dword [arr2 + rcx*4]
    cmp     ebx, eax
    jle     inner_loop

found:
    mov     dword [lcm + rcx*4], ebx
    inc     rcx
    cmp     rcx, 2
    jle     outer_loop

    mov     rax, 60          
    mov     rdi, 0                
    syscall
