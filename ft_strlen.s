global ft_strlen

section .text
ft_strlen:
	xor rcx, rcx ; rcx is the traditionnal register used for loops
	
.loop:
	mov al, [rdi]
	test al, al
	jz .end
	inc rdi
	inc rcx
	jmp .loop

.end:
	mov rax, rcx
	ret