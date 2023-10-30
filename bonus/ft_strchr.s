bits 64

section .text
global ft_strchr

ft_strchr:
    ; prologue
    push    rbp
    mov     rbp, rsp
    mov     al, sil

.loop:
    cmp     [rdi], al
    jz      .end
    cmp     byte [rdi], 0
    jz      .not_found
    inc     rdi
    jmp     .loop

.not_found:
    xor     rax, rax
    jmp     .cleanup

.end:
    mov     rax, rdi

.cleanup:
    ; epilogue
    mov     rsp, rbp
    pop     rbp
    ret
