    global _start

    section .data
message: db "Hello, World!", 10 ; Message; 10 is the newline character not the length

    section .text
_start: mov     rax, 1          ; 1 is the syscall for write
        mov     rdi, 1          ; fd 1 is stdout
        mov     rsi, message    ; address of the string to output
        mov     rdx, 14         ; number of BYTES
        syscall                 ; invoke os to write
        mov     rax, 60         ; 60 is the syscall for exit
        xor     rdi, rdi        ; 
        syscall                 ;
