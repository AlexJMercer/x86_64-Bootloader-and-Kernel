mov ah, 0x0e
mov al, 'A'

loop:
    int 0x10
    cmp al, 'Z'
    jg lower
    add al, 32
    jmp next
lower:
    sub al, 32
next:
    cmp al, 'z'
    je exit
    inc al
    jmp loop
exit:
    jmp $

times 510 - ($ - $$) db 0
db 0x55, 0xaa