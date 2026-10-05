.intel_syntax noprefix
.global _start

.section .text
  _start:
    mov rax, 1 
    mov rdi, 1
    lea rsi, [str1]
    mov rdx, 12
    syscall

    mov rax, 60
    mov rdi, 0
    syscall


.section .data 
  str1: .ascii "\x1b[31mRED\x1b[0m"
