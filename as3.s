.intel_syntax noprefix
.global _start

.section .text 
  _start:
    mov rcx, 9
    add rcx, '0'
    mov byte ptr [mem], cl

    lea rdi, [mem]
    mov rsi, 1
    call _print

    mov rax, 60
    mov rdi, 0
    syscall
    

  _print:
    push rdi 
    push rsi
    mov rax, 1
    mov rdi, 1 
    pop rdx 
    pop rsi
    syscall
    ret

.section .data
  mem: .skip 100 
