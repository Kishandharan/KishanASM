.intel_syntax noprefix
.global _start

.section .text
  _start:
      // Arithmetic
      mov r8, 1
      mov r9, 2
      add r8, r9
      mov [reg1], r8

      // Syswrite
      mov rax, 1
      mov rdi, 1
      lea rsi, [reg1]
      mov rdx, 1
      syscall
      
      // Sysexit
      mov rax, 60
      mov rdi, 0
      syscall

.section .data
    reg1: .quad 0x0000000000000000
