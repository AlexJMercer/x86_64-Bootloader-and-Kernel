[org 0x7C00]
mov [disknum], dl ; Save the drive number

xor ax, ax        ; Set up segments
mov es, ax
mov ds, ax
mov bp, 0x8000    ; Set up stack
mov sp, bp
mov bx, 0x7E00

mov ah, 2         ; Read from disk
mov al, 1         ; Read 1 sector
mov ch, 0         ; Cylinder 0
mov cl, 2         ; Sector 2
mov dh, 0         ; Head 0
mov dl, [disknum] ; Drive number (es:bx = 0x7e00)
mov bx, 0x7e00    ; Load to 0x7e00
int 0x13

print_info:
    mov ah, 0x0e        ; Print character
    mov al, [bx]        ; Print the first character

    cmp al, 0           ; Check for null terminator
    je exit
    
    int 0x10            ; Print the character
    inc bx              ; Increment the pointer
    jmp print_info      ; back to loop ¯\_(ツ)_/¯

exit:
    jmp $

disknum:
    db 0

times 510-($-$$) db 0
dw 0xaa55
db "This information is outside the boot sector lol", 0