.intel_syntax noprefix
.global _start

.section .text
  _start: 
    mov rax, 0
    mov rdi, 0
    lea rsi, [buffer]
    mov rdx, 20
    syscall
    # 1234

    lea r11, [buffer]
    mov r12, rax 
    mov r13, 1 # Number
    mov r14, 1 # Multiplier
    mov r15, 0 # Result
    mov rcx, 0

    loop:
      cmp r12, r13 
      je exit 
      mov cl, [r11]
      sub cl, '0'
      mov rax, rcx
      mul r14
      add r15, rax
      inc r13
      inc r11
      mov rax, 10
      mul r14
      mov r14, rax
      jmp loop

      
    exit:
      mov rax, 60 
      mov rdi, 0 
      syscall

.section .data 
  buffer: .skip 20
