[org 0x7C00]


mov [boot_drive], dl

CODE_SEG equ code_descriptor - gdt_start
DATA_SEG equ data_descriptor - gdt_start

cli                     ; Disable interrupts
lgdt [gdt_descriptor]   ; Load GDT into GDTR register

mov eax, cr0            ; Get current value of CR0
or eax, 1               ; Set bit 0 of CR0 to 1
mov cr0, eax            ; Write back to CR0

jmp CODE_SEG:protected_mode         ; Jump to protected mode



; [IMP] db = 8bits  = 1byte
;       dw = 16bits = 2bytes
;       dd = 32bits = 4bytes

gdt_start:              ; This must be at the end of your real mode code
    null_descriptor:
        dd 0            ; four zeroes
        dd 0            ; + 4 = total 8 zeroes
    code_descriptor:    
        dw 0xFFFF       ; define first 16 bits of limit
        dw 0            ; 16 bits (base as well)
        db 0            ; + 8bits = total 24 bits of base
        db 10011010b    ; Present, Privilege,Type(1001) & Type Flags(1010)
        db 11001111b    ; Other flags (1100) + last 4 bits of Limit (1111)
        db 0            ; Last 8 bits of base
    data_descriptor:
        dw 0xFFFF       ; define first 16 bits of limit
        dw 0            ; 16 bits
        db 0            ; + 8bits = total 24 bits of base
        db 10010010b    ; Present,Privilege,Type(1001) & Type Flags(0010)
        db 11001111b    ; Other flags (1100) + last 4 bits of Limit (1111)
        db 0            ; Last 8 bits of base


gdt_descriptor:
    dw gdt_end - gdt_start - 1      ; size of gdt by calculating the difference between the start and end of the gdt
    dd gdt_start                    ; pointer to start of the gdt

gdt_end:



; Protected mode code
[bits 32]
protected_mode:
    ; Writing First text to screen through video memory
    mov al, [text]
    mov ah, 0x0F            ; White text on black bg (We have colors now !)
    mov [0xB8000], ax       ; Write to video memory
    jmp $

text:
    db "Hello World !", 0

boot_drive:
    db 0

times 510 - ($-$$) db 0    ; Fill the rest of the sector with 0s
dw 0xAA55                  ; Magic number for BIOS to recognize boot sector
