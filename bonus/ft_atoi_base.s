bits 64

section .text
extern	ft_strlen
extern	ft_strchr
global	ft_atoi_base

; ft_atoi_base(char *str, char *base)
ft_atoi_base:
	; prologue
	push	rbp
	mov 	rbp, rsp
	; saving string and putting base as first argument
	push	rdi
	mov		rdi, rsi
	; check if base is big enough
	call	ft_strlen
	cmp		rax, 1
	jle		.base_error
	; check if base doesn't contain bad characters (+, -, space, tab, \n, \v, \f, \r)
	mov 	rsi, 45 ; -
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	mov 	rsi, 43 ; +
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	mov 	rsi, 32 ; space
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	mov 	rsi, 9 ; \t
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	mov 	rsi, 10 ; \n
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	mov 	rsi, 11 ; \v
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	mov 	rsi, 12 ; \f
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	mov 	rsi, 13 ; \r
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error

	; check if base doesn't contain duplicates
	xor		rcx, rcx

.loop:
	mov		rsi, [rdi + rcx]
	or		rsi, rsi
	jz		.convert
	call	ft_strchr
	cmp		rax, 0
	jne		.base_error
	inc		rcx
	jmp		.loop

.convert:


.base_error:
	mov		rdi, rsi
	pop		rdi
	mov		rax, 0
	; epilogue
	pop		rbp
	ret
