;letterCase.asm
;char flexStr[30] = "Welcome to Ubuntu 22.04.6 LTS"; //8-bit character array
;char toUpper[30]; //8-bit non-initial array
;char toLower[30]; //8-bit non-initial array
;register long rsi = 0 //64-bit register
;register long rcx = 30 //64-bit register
;do {
;       if(flexStr[rsi] >= 'A' && flexStr[rsi] <= 'Z') { //if it is uppercase
;       toUpper[rsi] = flexStr[rsi] //no conversion required
;       toLower[rsi] = flexStr[rsi] + 0x20 //convert to lowercase
;       }
;       else if(flexStr[rsi] >= 'a' && flexStr[rsi] <= 'z') { //if it is lowercase
;       toUpper[rsi] = flexStr[rsi] - 0x20 //convert to uppercase
;       toLower[rsi] = flexStr[rsi] //no conversion required
;       }
;       else { //if it is other
;       toUpper[rsi] = flexStr[rsi] //no conversion required
;       toLower[rsi] = flexStr[rsi] //no conversion required
;       }
;   rsi++; //rsi = rsi + 1
;   rcx--; //rcx = rcx - 1
;   } while(rcx != 0); //if rcx != 0 do loop again

section .data
    NULL    equ 0
    flexStr db "Welcome to Ubuntu 22.04.6 LTS", NULL

section .bss
    toUpper resb 30
    toLower resb 30

section .text
    global _start
_start:
    mov     rsi, 0
    mov     rcx, 30
uppercase:
    mov     al, byte[flexStr+rsi]
    cmp     al, 'A'
    jb      lowercase
    cmp     al, 'Z'
    ja      lowercase
    mov     toUpper[rsi], al
    add     al, 0x20
    mov     toLower[rsi], al
    jmp     end_if
lowercase:
    cmp     al, 'a'
    jb      others
    cmp     al, 'z'
    ja      others
    mov     toLower[rsi], al
    sub     al, 0x20
    mov     toUpper[rsi], al
    jmp     end_if
others:
    mov     toUpper[rsi], al
    mov     toLower[rsi], al
end_if:
    inc     rsi
    loop    uppercase
_stop:
mov     rax, 60
mov     rdi, 0
syscall