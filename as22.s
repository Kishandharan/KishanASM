.intel_syntax noprefix
.global _start

.section .text 
  _start:
    // Just a small test to recap ASM
    mov rax, [val1]
    lea rbx, [val1]

    mov rax, 60
    mov rdi, 0 
    syscall
    
.section .data 
  val1: .quad 100
