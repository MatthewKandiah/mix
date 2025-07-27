format ELF64 executable 3

segment readable executable

;; write to stdout
mov rax, 1
mov rdi, 1
mov rsi, hello
mov rdx, hello_size
syscall

;; exit with code 0
mov rax, 60
mov rdi, 0
syscall

segment readable writeable

newline = 10
hello db "Hello World", newline
hello_size = $-hello

