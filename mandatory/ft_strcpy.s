bits 64
section .text
global ft_strcpy

ft_strcpy:
	; prologue
	push	rbp
	mov		rbp, rsp
	xor		rcx, rcx

.loop:
	mov		al, [rsi + rcx]
	mov		[rdi + rcx], al
	or		al, al
	jz		.end
	inc		rcx
	jmp		.loop

.end:
	; epilogue
	mov		rsp, rbp
	pop		rbp
	mov		rax, rdi
	ret
