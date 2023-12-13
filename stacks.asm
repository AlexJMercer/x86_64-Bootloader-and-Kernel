mov bp, 0x8000      ; Initialize stack pointer
mov sp, bp          ; Set stack pointer to 0x8000

mov bh, 'A'         ; Set bh to 'A'
push bx             ; Push bx onto stack

pop bx


mov ah, 0x0e        ; BIOS tty command
int 0x10            ; Print character in bl


