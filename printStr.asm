[org 0x7C00]

mov ah, 0x0e
mov bx, variable

print:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print
end:

jmp $

variable:
    db "Welcome to my OS!", 0


times 510-($-$$) db 0
dw 0xaa55
