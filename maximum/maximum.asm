format ELF64 executable 3

macro print ptr,len {
	mov rax, 1
	mov rdi, 1
	mov rsi, ptr
	mov rdx, len
	syscall
}

segment readable executable

main:
  print hello, hello_size

	mov r9, numbers_count
  call maximum

  print bye, bye_size

  ;;int3 ;; useful for debugging

  mov rax, 60
  mov rdi, 0
  syscall

;; r8:  m - maximum value (return value)
;; r9:  n - number of elements
;; r10: j - highest index where X[j] = m (return value)
maximum:
  .initialise:
  mov r11, r9 ;; set counter
  dec r11 ;; make counter work as zero-indexed index
  jmp .changem

	.do_comparison:
    ;; if current value is less than or equal to m, skip to next loop cycle
  	cmp [numbers + r11], r8b
  	jle .dec
  .changem:
    ;; if current value is greater than m, update m and j
  	mov r10, r11
  	mov r8b, [numbers + r11]
  .dec:
    dec r11
    cmp r11, 0
    jge .do_comparison
  ret

segment readable writeable

hello db "Hello", 10
hello_size = $-hello

bye db "Goodbye", 10
bye_size = $-bye

numbers db 0x7, 0x22, 0x3
numbers_size = $-numbers
numbers_count = 3

