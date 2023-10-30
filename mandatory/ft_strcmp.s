bits 64
section .text
global ft_strcmp

ft_strcmp:
	;prologue
	push	rbp
	mov		rbp, rsp
	xor		rax, rax
	xor		rdx, rdx
	xor		rcx, rcx

.loop:
	mov		al, [rdi + rcx]
	mov		dl, [rsi + rcx]
	cmp		al, dl
	jne		.end
	or		al, al
	jz		.end
	inc		rcx
	jmp		.loop
	
.end:
	;epilogue
	mov		rsp, rbp
	pop		rbp
	sub		eax, edx
	ret