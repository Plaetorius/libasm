bits 64
section .text
global ft_strcmp

ft_strcmp:
	;prologue
	push	rbp
	mov		rbp, rsp
	xor		rax, rax
	xor		rbx, rbx
	xor		rcx, rcx

.loop:
	mov		al, [rdi + rcx]
	mov		bl, [rsi + rcx]
	cmp		al, bl
	jne		.end
	or		al, al
	jz		.end
	inc		rcx
	jmp		.loop
	
.end:
	;epilogue
	mov		rsp, rbp
	pop		rbp
	sub		eax, ebx
	ret