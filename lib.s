.intel_syntax noprefix
.global cfmt 
.global exit 

.section .text
    # lea rdi, [dst]
    # lea rsi, [src]
    # mov dl, 'A'
cfmt:
  cfmt_loop:
    mov al, [rsi]
    cmp al, '%'
    je cfmt_handle_percent

    cmp al, 0
    je cfmt_ret

    mov [rdi], al

    inc rsi 
    inc rdi 
    inc rcx
    jmp cfmt_loop

  cfmt_handle_percent:
    mov [rdi], dl 
    inc rsi 
    inc rdi
    inc rcx
    jmp cfmt_loop 

  cfmt_ret: 
    mov rax, rcx
    ret 

exit: 
  mov rax, 60
  xor rdi, rdi
  syscall

