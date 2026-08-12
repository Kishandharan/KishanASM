.intel_syntax noprefix
.global _start

.section .text 
  _start: 
    mov rbp, rsp 
    sub rsp, 5

    mov byte ptr [rbp-5], 'H'
    mov byte ptr [rbp-4], 'e'
    mov byte ptr [rbp-3], 'l'
    mov byte ptr [rbp-2], 'l'
    mov byte ptr [rbp-1], 'o'

    mov rax, 1 
    mov rdi, 1 
    mov rsi, rbp 
    sub rsi, 5 
    mov rdx, 5
    syscall

    add rsp, 5

    mov rax, 60 
    mov rdi, 0
    syscall
