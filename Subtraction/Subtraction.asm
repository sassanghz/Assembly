; Date: 2024-03-21
; Author: Sassan Ghazi
; COMP - 228: SYSTEM HARDWARE
; Assignment 2: Assembly Language Programming
; Program: Subtract two numbers and print the result

section .data
   num1 db 89      ; Define the first number as 89
   num2 db 21     ; Define the second number as 21
   sum db 0      ; Define a variable to store the sum
   newline db 10  ; Define a newline character
   
section .text
   global _start    ; Must be declared for using gcc

_start:             ; Tell linker entry point
   mov al, [num1]     ; Move the ASCII value of '9' into eax
   sub al, [num2]     ; Convert the ASCII value of '9' to its decimal equivalent (57 - 48 = 9)
   mov [sum], al  ;Store the result in the sum variable

   ; Print the result
   mov eax, 4     ; Load the sys_exit system call number into the EAX register
   mov ebx, 1     ; Load the file descriptor for stdout into the EBX register
   mov ecx, sum   ; Load the address of the sum variable into the ECX register
   mov edx, 1     ; Load the length of the sum variable into the EDX register
   int 0x80       ; Call the kernel to perform the write operation
   
   ; Print the message
   mov eax, 4     ; Load the sys_exit system call number into the EAX register
   mov ecx, newline ; Load the address of the newline variable into the ECX register
   mov edx, 1     ; Load the length of the newline variable into the EDX register
   int 0x80       ; Call the kernel to perform the write operation

   ; Exit the program
   mov eax, 1     ; Load the sys_exit system call number into the EAX register
   xor ebx, ebx   ; Clear the EBX register
   int 0x80       ; Call the kernel to perform the exit operation




