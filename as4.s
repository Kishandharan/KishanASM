.intel_syntax noprefix
.global _start

.section .text 
_start: 
  mov rax, 0
  mov rdi, 0
  mov rsi, [alp1]
  mov rdx, 1 
  syscall
  
  cmp byte ptr [alp1], 'A'
  je _isA 

  cmp byte ptr [alp1], 'B'
  je _isB

  _isA:
    mov rax, 1 
    mov rdi, 1
    lea rsi, [str1] 
    mov rdx, 4
    syscall
    jmp _exit


  _isB:
    mov rax, 1 
    mov rdi, 1
    lea rsi, [str2] 
    mov rdx, 4
    syscall
    jmp _exit
    
  _exit:
    mov rax, 60
    mov rdi, 0
    syscall


.section .data 
alp1: .byte 0x0
str1: .ascii "Is A"
str2: .ascii "Is B"
