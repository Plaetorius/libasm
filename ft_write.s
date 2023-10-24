global ft_write
section .text
ft_write:
    mov al, 1
    syscall
    ret
