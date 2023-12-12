mov ah, 0x0e
mov al, 'A'

print_loop:
    int 0x10        ; print the character in AL

    cmp al, 'Z'     ; check if it's an uppercase letter
    jg exit         ; if greater than 'Z', end the loop

    add al, 33      ; increment to the next character
    int 0x10        ; print the lowercase letter in AL

    cmp al, 'Z' + 1 ; check for end of uppercase letters
    je exit

    sub al, 31      ; toggle between uppercase and lowercase

    jmp print_loop
exit:
    jmp $

times 510 - ($ - $$) db 0
db 0x55, 0xaa