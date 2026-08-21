.intel_syntax noprefix 
.global _start 

.section .text 
  _start: 
    mov rax, 1
    mov rdi, 1
    mov rsi, [rsp-16]
    mov rdx, 2
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

.section .data 
  firstArg: .skip 8
