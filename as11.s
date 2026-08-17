.intel_syntax noprefix 
.global _start 

.section .text 
  _start: 
    lea rdi, [dst]
    lea rsi, [src]
    mov dl, 'A'
    call cfmt
    
    push rax
    mov rax, 1 
    mov rdi, 1 
    lea rsi, [dst]
    pop rdx
    syscall
    
    call exit

.section .data
  dst: .skip 1000
  src: .asciz "Hello%"

