.intel_syntax noprefix 
.global _start 

.section .text 
  _start:
    mov rbp, rsp 
    sub rsp, 5

    mov byte ptr [rbp - 1], 10 
    mov byte ptr [rbp - 2], 20
    mov byte ptr [rbp - 3], 30
    mov byte ptr [rbp - 4], 40
    
    call _addFromStack

    add rsp, 5

    mov rax, 60 
    mov rdi, 0
    syscall

  _addFromStack:
    mov al, [rbp - 1]
    mov bl, [rbp - 2]
    mov cl, [rbp - 3]
    mov dl, [rbp - 4]

    add cl, dl
    add bl, cl 
    add al, bl

    ret 

