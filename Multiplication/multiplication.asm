; Date: 2024-03-21
; Author: Sassan Ghazi
; COMP - 228: SYSTEM HARDWARE
; Assignment 2: Assembly Language Programming
; Program: Multiply two numbers (89 and 21) and display the result
;--------------------------------------------------------------
section .data
    num1 dw 21        ; Define num1 as a word (16 bits) with value 21
    num2 dw 89        ; Define num2 as a word (16 bits) with value 89
    result dw 0       ; Define result as a word (16 bits) initialized to 0
    buffer db 0       ; Define buffer for converting result to ASCII

section .text
    global _start

_start:
    mov ax, [num1]    ; Load num1 into AX register
    mul word [num2]   ; Multiply AX by num2, result in DX:AX
    mov [result], ax  ; Store the lower 16 bits of the result in result

    ; Convert the result to ASCII for printing
    mov ax, [result]  ; Load the result into AX
    mov bx, 10        ; Divisor for conversion to ASCII
    mov ecx, buffer   ; Set ECX to point to the buffer

convert_loop:
    xor dx, dx        ; Clear DX for division
    div bx            ; Divide AX by 10 (DX:AX / BX -> AX = Quotient, DX = Remainder)
    add dl, '0'       ; Convert the remainder to ASCII digit
    dec ecx           ; Move buffer pointer back
    mov [ecx], dl     ; Store the ASCII digit in buffer
    test ax, ax       ; Check if quotient is zero (end of conversion)
    jnz convert_loop  ; If not zero, continue conversion

    ; Print the result
    mov eax, 4        ; System call number for sys_write
    mov ebx, 1        ; File descriptor for stdout (standard output)
    mov edx, buffer   ; Address of the buffer
    sub edx, ecx      ; Calculate the length of the ASCII representation
    inc edx           ; Include the null terminator in the length
    int 0x80          ; Invoke the kernel to perform the write operation

    ; Exit the program
    mov eax, 1        ; System call number for exit
    xor ebx, ebx      ; Return 0 status (success)
    int 0x80          ; Invoke the kernel to exit the program
