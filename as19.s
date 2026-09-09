.intel_syntax noprefix
.global _start 

.section .text
  strlen:
    strlen_loop:
      cmp byte ptr [rdi], 0
      je strlen_exit
      inc rax
      inc rdi
    strlen_exit:
      ret

  exit:
    mov rax, 60
    mov rdi, 0
    syscall

  caseA:
    lea rdi, [caseA_string]
    call strlen
    push rax
    mov rax, 1 
    mov rdi, 1
    lea rsi, [caseA_string]
    pop rdx
    syscall
    jmp exit

  caseB:
    lea rdi, [caseB_string]
    call strlen
    push rax
    mov rax, 1 
    mov rdi, 1
    lea rsi, [caseB_string]
    pop rdx
    syscall
    jmp exit

  caseC:
    lea rdi, [caseC_string]
    call strlen
    push rax
    mov rax, 1 
    mov rdi, 1
    lea rsi, [caseC_string]
    pop rdx
    syscall
    jmp exit

  _start:
    lea rdi, [prompt]
    call strlen

    push rax
    mov rax, 1
    mov rdi, 1
    lea rsi, [prompt]
    pop rdx
    syscall

    mov rax, 0 
    mov rdi, 0 
    lea rsi, [buf]
    mov rdx, 1
    syscall

    mov al, [buf]
    lea rbx, [cmd_table]
    cmp_loop:
      cmp byte ptr [rbx], 0
      je exit
      cmp byte ptr [rbx], al
      mov rdi, rbx
      add rdi, 1
      je rdi 
      add rbx, 9
      jmp cmp_loop

.section .data
  buf: .skip 1
  caseA_string: .asciz "You entered a"
  caseB_string: .asciz "You entered b"
  caseC_string: .asciz "You entered c"
  cmd_table:
    .byte 'a', caseA
    .byte 'b', caseB
    .byte 'c', caseC
    .byte 0x0
  prompt: .asciz "Enter a letter: "
