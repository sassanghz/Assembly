; Date: 2024-03-21
; Author: Sassan Ghazi
; COMP - 228: SYSTEM HARDWARE
; Assignment 2: Assembly Language Programming
; Program: Division
section .data
    dividend dd 89       ; Define dividend as a double word (32 bits) with value 89
    divisor dd 21        ; Define divisor as a double word (32 bits) with value 21
    result dd 0          ; Define result as a double word (32 bits) initialized to 0
    buffer db 0          ; Define buffer for converting result to ASCII

section .text
    global _start

_start:
    ; Load the dividend (89) into EAX
    mov eax, [dividend]
    ; Clear EDX (high 32 bits of dividend)
    xor edx, edx
    ; Load the divisor (21) into EBX
    mov ebx, [divisor]
    ; Perform unsigned division: EDX:EAX / EBX, quotient in EAX, remainder in EDX
    div ebx
    ; Store the quotient (EAX) in result
    mov [result], eax

    ; Convert the quotient to ASCII for printing
    mov ax, [result]     ; Load the quotient into AX
    add ax, '0'          ; Convert the quotient to ASCII
    mov [buffer], al     ; Store the ASCII digit in buffer

    ; Print the quotient
    mov eax, 4           ; System call number for sys_write
    mov ebx, 1           ; File descriptor for stdout (standard output)
    mov ecx, buffer      ; Address of the buffer
    mov edx, 1           ; Number of bytes to print (1 byte for the quotient)
    int 0x80             ; Invoke the kernel to perform the write operation

    ; Exit the program
    mov eax, 1           ; System call number for exit
    xor ebx, ebx         ; Return 0 status (success)
    int 0x80             ; Invoke the kernel to exit the program



