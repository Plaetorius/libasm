bits 64
section .text
global ft_read
extern __errno_location

ft_read:
	; prologue
    push	rbp
	mov		rbp, rsp

	xor		rax, rax ; faster than mov rax, 0
    syscall

	or		rax, rax
	jl .error_handling
	jmp .end

.error_handling:
	push	rax
	call	__errno_location
	mov		rbx, rax
	pop		rax
	neg		rax
	mov		[rbx], rax
	mov		rax, -1

.end:
	;epilogue
	mov		rsp, rbp
	pop		rbp

    ret
