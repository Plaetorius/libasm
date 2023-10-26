bits 64
section .text
global ft_strlen

ft_strlen:
	; prologue
	push	rbp
	mov		rbp, rsp

	xor		rcx, rcx ; rcx is the traditionnal register used for loops
	
.loop:
	mov		al, [rdi + rcx]
	test	al, al
	jz		.end
	inc		rcx
	jmp		.loop

.end:
	; epilogue
	mov		rsp, rbp
	pop		rbp
	
	mov		rax, rcx
	ret