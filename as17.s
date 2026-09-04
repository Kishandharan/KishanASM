.intel_syntax noprefix
.global _start

.section .text
  _start:
    # Heap initialization
    mov rax, 12
    mov rdi, 0
    syscall

    mov [heap_ptr], rax
    mov rdi, rax
    add rdi, 0x1000
    mov rax, 12
    syscall
    # -----

    mov rdi, 5
    call malloc
    
    mov byte ptr [rax+0], 'H'
    mov byte ptr [rax+1], 'e'
    mov byte ptr [rax+2], 'l'
    mov byte ptr [rax+3], 'l'
    mov byte ptr [rax+4], 'o'

    mov rbx, rax # Preserving rax for passing to free

    lea rsi, [rax]
    mov rax, 1 
    mov rdi, 1 
    mov rdx, 5
    syscall

    mov rdi, rbx
    call free
    
    mov rax, 60 
    mov rdi, 0 
    syscall
    
  malloc:
    mov rax, [heap_ptr]
    add qword ptr [heap_ptr], rdi
    ret

  free:
    mov qword ptr [heap_ptr], rdi
    ret

.section .data
  heap_ptr: .quad 0x0
