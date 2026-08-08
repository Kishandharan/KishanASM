.intel_syntax noprefix
.global _start

.section .text 
  _start:
    mov rax, 1 
    mov rdi, 1 
    lea rsi, [prompt]
    mov rdx, 1000
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [buffer]
    mov rdx, 1000
    syscall

    mov r12, 0 # r12 is for the result
    mov r13, 1 # r13 is for the multiplier 
    mov r14, 1 # r14 is for keeping track of count
    lea r15, [buffer] # r15 is for the character
    loop:
      cmp r15, rax
      je exit

      mov rax, r13
      mov bl, [buffer + r15]
      sub bl, 48
      mul bl
      add r12, rax
      
      mov rax, 10
      mul r13
      mov r13, rax

      

    exit: 
      mov rax, 60
      mov rdi, 0 
      syscall

.section .data 
  buffer: .skip 1000
  prompt: .ascii "Enter your number: "
  len1 = . - prompt
