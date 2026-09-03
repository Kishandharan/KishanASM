.intel_syntax noprefix
.global _start

.section .text 
  _start:
    mov rax, 0
    mov rdi, 0
    lea rsi, [inputBuf]
    mov rdx, 1000
    syscall
    # Let's say the input is "Hello world"

    lea rdi, [inputBuf]
    mov sil, ' '
    call tstrlen_loop

    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    lea rsi, [inputBuf]
    syscall
     
    mov rax, 60
    mov rdi, 0
    syscall

  tstrlen:
    # Target character is inside sil 
    # String address is inside rdi 
    
    tstrlen_loop:
      cmp byte ptr [rdi], sil
      je tstrlen_exit
      inc rax 
      inc rdi 
      jmp tstrlen_loop

    tstrlen_exit: 
      ret
      
.section .data
  inputBuf: .skip 1000
