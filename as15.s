.intel_syntax noprefix
.global _start

.section .text 
  _start: 
    lea r14, [stack]
    mov r15, 0

    jmp do_a_thing
    
  strlen:
    xor rax, rax
    strlen_loop:
      cmp byte ptr [rdi], 0
      je strlen_done 
      inc rax
      inc rdi
      jmp strlen_loop
    strlen_done: 
      mov rax, [r14-7]
      sub r14, 8
      jmp rax 

  do_a_thing

.section .data
   stack: .skip 10000
   str1: .asciz "Hello, this is custom stack memory!"
