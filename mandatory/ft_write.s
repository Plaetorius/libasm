bits 64
section .text
global ft_write
extern __errno_location

ft_write:
	; prologue
    push	rbp
	mov		rbp, rsp

	mov		rax, 1
    syscall

	or		rax, rax
	jl		.error_handling
	jmp		.end

.error_handling:
	push	rax
	call	__errno_location
	mov		rcx, rax
	pop		rax
	neg		rax
	mov		[rcx], rax
	mov		rax, -1

.end:
	;epilogue
	mov		rsp, rbp
	pop		rbp
    ret
