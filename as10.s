.intel_syntax noprefix
.global _start 

.section .text
  _start:
    lea rdi, [dst]
    lea rsi, [src]
    mov dl, 'A'
    call cfmt

    mov rax, 1 
    mov rdi, 1
    lea rsi, [dst]
    mov rdx, 14
    syscall
    
    jmp exit

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
      jmp cfmt_loop

    cfmt_handle_percent:
      mov [rdi], dl 
      inc rsi 
      inc rdi
      jmp cfmt_loop 

    cfmt_ret: 
      ret 

exit: 
  mov rax, 60
  xor rdi, rdi
  syscall

.section .data 
  dst: .skip 100
  src: .string "Hello, % and %"
