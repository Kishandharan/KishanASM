.intel_syntax noprefix
.global _start 

.section .text 
  _start: 
    mov rax, 12 
    mov rdi, 0 
    syscall 

    mov rdi, rax 
    mov r15, rax
    add rdi, 100 
    mov rax, 12
    syscall

    mov byte ptr [r15+0], 'H'
    mov byte ptr [r15+1], 'e'
    mov byte ptr [r15+2], 'l'
    mov byte ptr [r15+3], 'l'
    mov byte ptr [r15+4], 'o'

    mov rax, 1 
    mov rdi, 1 
    mov rsi, r15 
    mov rdx, 5
    syscall

    mov rax, 60 
    mov rdi, 0 
    syscall


