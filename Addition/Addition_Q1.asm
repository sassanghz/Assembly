; DATE: 2024/03/23
; AUTHOR: Sassan Ghazi
; COMP - 228: SYSTEM HARDWARE
; Assignment 2: Assembly Language Programming
; DESCRIPTION: This program adds two numbers (21 and 89) and prints the result to the console using the sys_write system call. The program uses the following instructions:
section .data
    num1 db 21     ; Define num1 as a byte (8 bits) with value 21
    num2 db 89     ; Define num2 as a byte (8 bits) with value 89
    sum db 0       ; Define sum as a byte (8 bits) initialized to 0
    newline db 10  ; ASCII code for newline character

section .text
    global _start

_start:
    mov al, [num1]    ; Move the value of num1 into AL register
    add al, [num2]    ; Add the value of num2 to AL
    mov [sum], al     ; Move the result (sum) back to memory

    ; Print the result
    mov eax, 4        ; System call number for sys_write
    mov ebx, 1        ; File descriptor for stdout (standard output)
    mov ecx, sum      ; Address of the sum to print
    mov edx, 1        ; Number of bytes to print (1 byte for the sum)
    int 0x80          ; Invoke the kernel to perform the write operation

    ; Print newline
    mov eax, 4        ; System call number for sys_write
    mov ecx, newline  ; Address of the newline character
    mov edx, 1        ; Number of bytes to print (1 byte for the newline)
    int 0x80          ; Invoke the kernel to perform the write operation

    ; Exit the program
    mov eax, 1        ; System call number for exit
    xor ebx, ebx      ; Return 0 status (success)
    int 0x80          ; Invoke the kernel to exit the program


