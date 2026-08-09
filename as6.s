.intel_syntax noprefix
.global _start

.section .text
  _start:
    mov rax, 12
    mov rdi, 0
    syscall

    mov r15, rax 
    mov r14, rax
    add r15, 100

    mov rax, 12 
    mov rdi, r15 
    syscall
    
    mov rdx, 400
    mov [r14], rdx
    mov r12, [r14]


