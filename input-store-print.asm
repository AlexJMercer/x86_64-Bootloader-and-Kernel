[org 0x7C00]

mov ah, 0x0E            ; BIOS teletype
mov bx, prompt          ; prompt string

print_prompt:
    mov al, [bx]        ; load string pointer
    cmp al, 0           ; check for null terminator
    je get_name
    int 0x10            ; print character
    inc bx              ; increment string pointer
    jmp print_prompt    ; loop again

get_name:
    mov bx, var          ; load variable pointer
    input_name:
        mov ah, 0        ; BIOS keyboard input
        int 0x16         ; wait for keypress
        cmp al, 0x0D     ; check for enter key
        je newline       ; jump if enter key pressed
        mov [bx], al     ; store character in variable
        inc bx           ; increment variable pointer
        jmp input_name   ; loop again

newline:
    mov ah, 0x0E         ; BIOS teletype
    mov al, 0x0A         ; newline character
    int 0x10             ; print newline
    mov al, 0x0D         ; carriage return character
    int 0x10             ; print carriage return

print_hello:
    mov bx, hello
    hi_loop:
        mov al, [bx]
        cmp al, 0
        je print_var
        int 0x10
        inc bx
        jmp hi_loop

print_var:
    mov bx, var
    var_loop:
        mov al, [bx]
        cmp al, 0
        je end
        int 0x10
        inc bx
        jmp var_loop

end:
    jmp $

prompt:
    db "Welcome to the void. Your name ?", 0

var:
    times 10 db 0

hello:
    db "Hi ", 0

times 510-($-$$) db 0
dw 0xAA55