; char flexStr[30] = "Welcome to Ubuntu 22.04.6 LTS";	//8-bit character array
; char toUpper[30];		//8-bit non-initial array
; char toLower[30];		//8-bit non-initial array
; register long rsi = 0		//64-bit register
; register long rcx = 30		//64-bit register
; do {
; 	if(flexStr[rsi] >= 'A' && flexStr[rsi] <= 'Z') { 	//if it is uppercase
; 		toUpper[rsi] = flexStr[rsi]		//no conversion required
; 		toLower[rsi] = flexStr[rsi] + 0x20		//convert to lowercase 
; 	} 
; 	else if(flexStr[rsi] >= 'a' && flexStr[rsi] <= 'z') { 	//if it is lowercase
; 		toUpper[rsi] = flexStr[rsi] - 0x20		//convert to uppercase
; 		toLower[rsi] = flexStr[rsi]		//no conversion required
; 	} 
; 	else {			//if it is other
; 		toUpper[rsi] = flexStr[rsi]		//no conversion required
; 		toLower[rsi] = flexStr[rsi]		//no conversion required
; 	}
; 	rsi++;			//rsi = rsi + 1
; 	rcx--;			//rcx = rcx - 1
; } while(rcx != 0);		//if rcx != 0 do loop again

section .data
    SYS_exit     equ 60
    EXIT_SUCCESS equ 0
    LF           equ 10

    flexStr db "Welcome to Ubuntu 22.04.6 LTS", LF, 0  

section .bss
    toUpper resb 30
    toLower resb 30

section .text
    global _start
_start:
    mov rsi, 0              ; index = 0
    mov rcx, 30             ; counter = 30

doloop:
    mov al, [flexStr + rsi] ; load current char

    ; if ('A' <= al <= 'Z')
    cmp al, 'A'
    jb check_lower
    cmp al, 'Z'
    ja check_lower
    ; uppercase letter
    mov [toUpper + rsi], al
    mov bl, al
    add bl, 0x20
    mov [toLower + rsi], bl
    jmp step_next

check_lower:
    ; else if ('a' <= al <= 'z')
    cmp al, 'a'
    jb other_char
    cmp al, 'z'
    ja other_char
    ; lowercase letter
    mov bl, al
    sub bl, 0x20
    mov [toUpper + rsi], bl
    mov [toLower + rsi], al
    jmp step_next

other_char:
    ; non-alphabetic
    mov [toUpper + rsi], al
    mov [toLower + rsi], al

step_next:
    inc rsi
    dec rcx
    jne doloop

    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall
