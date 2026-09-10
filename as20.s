.intel_syntax noprefix
.global _start

.section .text 
  strlen: 
    strlen_loop:
      cmp byte ptr [rdi], 0
      je strlen_exit
      inc rdi 
      inc rax
      jmp strlen_loop
    strlen_exit:
      ret

  exit:
    mov rax, 60
    mov rdi, 0
    syscall

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

    lea rdi, [cmd_table]
    push rdi
    add rdi, 1
    call strlen
    mov r14, rax
    pop rdi

    cmp_loop:
      mov bl, [rdi]
      cmp bl, 0
      je exit

      cmp byte ptr [buf], bl
      je handle_char
      add rdi, 9
      jmp cmp_loop

    handle_char:
      push rdi
      mov rax, 1 
      mov rdi, 1 
      pop rsi
      add rsi, 1
      mov rdx, r14
      syscall
      jmp exit

.section .data
  buf: .skip 1 
  cmd_table:
    .byte 'A' 
    .asciz "You have entered A"
    .byte 'B' 
    .asciz "You have entered B"
    .byte 'C' 
    .asciz "You have entered C"
    .byte 'D' 
    .asciz "You have entered D"
    .byte 0x0
  prompt: .asciz "Enter a letter: "
