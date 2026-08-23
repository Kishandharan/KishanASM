.intel_syntax noprefix
.global _start

.section .text
  _start:
    lea rdi, [arr1]
    lea rsi, [arr2]
    lea rbx, [arr2]

    mov rax, [rdi]
    mul rax
    mov qword ptr [rsi], rax 
    add rdi, 8
    add rsi, 8

    mov rax, [rdi]
    mul rax
    mov qword ptr [rsi], rax
    add rdi, 8
    add rsi, 8
    
.section .data
  arr1: .quad 1, 2, 3, 4
  arr2: .skip 32
