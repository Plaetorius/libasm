bits 64
section .text
global strcmp

ft_strcmp:
	;prologue
	push	rbp
	mov		rbp, rsp
	xor		rcx, rcx

.loop:
	

.end:
	sub	[rdi + rcx], [rsi + rcx]