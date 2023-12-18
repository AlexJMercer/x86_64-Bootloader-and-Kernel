[org 0x7C00]

KERNEL_LOCATION equ 0x1000

mov [BOOT_DRIVE], dl


xor ax, ax
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp

mov bx, KERNEL_LOCATION
mov dh, 20

mov ah, 0x02
mov al, dh
mov ch, 0x00
mov dh, 0x00
mov cl, 0x02
mov dl, [BOOT_DRIVE]
int 0x13


mov ah, 0
mov al, 0x03
int 0x10                            ; Here it enters into text mode and clears screen



CODE_SEG equ code_descriptor - gdt_start
DATA_SEG equ data_descriptor - gdt_start

cli
lgdt [gdt_descriptor]


mov eax, cr0
or eax, 1
mov cr0, eax


jmp CODE_SEG:init_pm

jmp $

BOOT_DRIVE:
    db 0



gdt_start:
    gdt_null:
        dd 0x0
        dd 0x0

    code_descriptor:
        dw 0xFFFF
        dw 0
        db 0
        db 0b10011010
        db 0b11001111
        db 0

    data_descriptor:
        dw 0xFFFF
        dw 0
        db 0
        db 0b10010010
        db 0b11001111
        db 0

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

gdt_end:



[bits 32]
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    jmp KERNEL_LOCATION



times 510-($-$$) db 0
dw 0xAA55