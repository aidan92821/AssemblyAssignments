;===========================================================
; exam02_review.asm
; This program separates positive multiples of 3
; and negative multiples of 5 from an array of signed shorts.
;===========================================================

; C EQUIVALENT:
; short shortArr[10] = {-3012, 624, 1234, -2345, 3456, -90, 6231, -235, 12357, -7890};
; short posMul3[10];
; short negMul5[10];
; long rbx=0, rsi=0, rdi=0, rcx=10;
; do {
;     if(shortArr[rbx] > 0 && shortArr[rbx] % 3 == 0)
;         posMul3[rsi++] = shortArr[rbx];
;     else if(shortArr[rbx] < 0 && shortArr[rbx] % 5 == 0)
;         negMul5[rdi++] = shortArr[rbx];
;     rbx++;
;     rcx--;
; } while(rcx != 0);
;===========================================================

section .data
shortArr dw -3012, 624, 1234, -2345, 3456, -90, 6231, -235, 12357, -7890 ; 10 signed 16-bit values

section .bss
posMul3  resw 10    ; will hold positive multiples of 3
negMul5  resw 10    ; will hold negative multiples of 5

section .text
global _start
_start:
    mov rbx, 0      ; array index for shortArr
    mov rsi, 0      ; index for posMul3
    mov rdi, 0      ; index for negMul5
    mov rcx, 10     ; loop counter = 10 elements

;===============================
; LOOP START
;===============================
doLoop:
    cmp word [shortArr + (rbx * 2)], 0 ; compare shortArr[rbx] to 0
    jl  negative                       ; jump if less than 0 (negative number)

;===============================
; POSITIVE CASE
;===============================
positive:
    mov ax, word [shortArr + (rbx * 2)] ; load shortArr[rbx] into AX (16-bit)
    cwd                                 ; sign-extend AX → DX:AX (for signed division)
    mov r8w, 3                          ; load divisor (3) into r8w
    idiv r8w                            ; signed divide DX:AX by r8w → quotient in AX, remainder in DX
    cmp dx, 0                           ; check remainder
    jne end_if                          ; if not zero, skip (not divisible by 3)

    mov ax, word [shortArr + (rbx * 2)] ; reload value from array
    mov word [posMul3 + (rsi * 2)], ax  ; store it in posMul3[rsi]
    inc rsi                             ; increment posMul3 index

    jmp end_if                          ; skip the negative case

;===============================
; NEGATIVE CASE
;===============================
negative:
    mov ax, word [shortArr + (rbx * 2)] ; load shortArr[rbx] into AX
    cwd                                 ; sign-extend AX for division
    mov r8w, 5                          ; load divisor (5)
    idiv r8w                            ; signed divide DX:AX by 5
    cmp dx, 0                           ; check remainder
    jne end_if                          ; skip if not multiple of 5

    mov ax, word [shortArr + (rbx * 2)] ; reload value
    mov word [negMul5 + (rdi * 2)], ax  ; add value to negMul5[rdi] (initialized to 0)
    inc rdi                             ; increment negMul5 index

;===============================
; END IF (common exit point)
;===============================
end_if:
    inc rbx                             ; go to next shortArr element
    loop doLoop                         ; decrement RCX and jump if RCX != 0

;===============================
; END PROGRAM
;===============================
end_do:
    mov rax, 60     ; syscall: exit
    mov rdi, 0      ; exit status 0 (success)
    syscall
