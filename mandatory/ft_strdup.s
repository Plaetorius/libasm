bits 64

section	.text
global	ft_strdup
extern	ft_strlen
extern	ft_strcpy
extern __errno_location
extern	malloc

ft_strdup:
	; prologue
	push	rbp
	mov		rbp, rsp
	
	push 	rdi		
	call	ft_strlen		
	mov		rdi, rax		
	inc		rdi					
	call	malloc
				
	test	rax, rax
	jnz		.copy_string
	call	__errno_location
	mov		dword [rax], 12		; setting errno to 12
	xor		rax, rax
	jmp		.end

.copy_string:
	mov		rdi, rax
	pop		rsi
	call	ft_strcpy

.end:
	; epilogue
	mov		rsp, rbp
	pop		rbp
	ret

