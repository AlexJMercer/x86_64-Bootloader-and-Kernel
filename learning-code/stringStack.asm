[org 0x7C00]

_begin:
    xor ax, ax
    mov ds, ax

    mov bp, 0x8000      ; Set base pointer to 0x8000
    mov sp, bp          ; Set stack pointer to 0x8000
    
    mov si, buffer      ; Set source index to buffer

read_input:
    mov ah, 0x00        ; BIOS keyboard input without echo
    int 0x16            ; BIOS interrupt for keyboard input

    cmp al, 0x0D        ; Enter key
    je print_output

    int 0x10            ; BIOS video output
    push ax             ; Push character to stack
    jmp read_input

print_output:
    mov si, buffer      ; Reset source index to buffer

display_loop:
    pop ax              ; Pop character from stack

    cmp ax, 0           ; Check if character is null (null terminator)
    je exit

    mov ah, 0x0E        ; BIOS teletype
    int 0x10            ; BIOS video output
    jmp display_loop     

buffer:
    times 20 db 0

exit:
    jmp $

times 510 - ($-$$) db 0
dw 0xAA55
