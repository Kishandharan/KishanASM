.intel_syntax noprefix
.global _start 

.section .text 
  _start:
    mov rdi, 1023
    lea rsi, [buf+50]
    call itoa

  itoa:
    mov byte ptr [rsi], 0
    dec rsi
    mov rax, rdi

    itoa_loop:
      xor rdx, rdx
      mov rcx, 10
      div rcx
      cmp rax, 0
      je exit
      add dl, '0'
      mov byte ptr [rsi], dl
      dec rsi
      jmp itoa_loop

    exit:
      ret

.section .data
  buf: .skip 100

