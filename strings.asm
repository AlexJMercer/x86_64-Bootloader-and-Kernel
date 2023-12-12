[org 0x7C00]

mov ah, 0x0e
mov al, [variable]
int 0x10
jmp $

variable:
    db "Welcome to my OS!", 0

times 510-($-$$) db 0
dw 0xaa55
