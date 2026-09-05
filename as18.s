.intel_syntax noprefix
.global _start

.section .text 
  _start:
    mov rax, 1 
    mov rdi, 1
    lea rsi, [color_string]
    mov rdx, 20 
    syscall

    mov rax, 60
    mov rdi, 0 
    syscall

.section .data
  color_string: .ascii "\033[34mHello, blue\033[0m\n"
