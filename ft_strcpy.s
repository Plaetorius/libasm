bits 64
section .text
global ft_strcpy

ft_strcpy:
	; prologue
	push	rbp
	mov		rbp, rsp
	xor		rcx, rcx

.loop:
	mov		bl, [rsi + rcx]
	mov		[rdi + rcx], bl
	or		bl, bl
	jz		.end
	inc		rcx
	jmp		.loop

.end:
	; epilogue
	mov		rsp, rbp
	pop		rbp
	ret
