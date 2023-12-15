
## 11. Reading from Disk

> The BIOS can read and write to the disk using the `int 13h` interrupt. It has a number of functions, each of which is identified by a number in the `ah` register.
>
> Since the BIOS has been developed to read and write to, Hard Disk Drives, we are going to use something called a **CHS Addressing**.
>
> **CHS** refers to **Cylinder**, **Head** and **Sector**. The BIOS will read and write to the disk using these three parameters. The Cylinder is the track number, the Head is the head number and the Sector is the sector number.

> ### Now,
>
> We define our information **AFTER** the the magic boot number.<br>
> Looks like this:
> ```asm
> [org 0x7c00]
> jmp $
> times 510-($-$$) db 0
> dw 0xaa55
> db "This information is not read by the BIOS", 0
> ```
>
> So what do we need to read this information?
> - What disk we want to read from.
> - CHS Address
> - How many sectors we want to read
> - Where do we want to load them to
>
> **NOTE :** Also, the Drive number is stored in the `dl` register shortly after the BIOS loads the bootloader.
>
> The boot sector is the $1^{th}$ sector of Cylinder 0 and Head 0. So to read our information, we need to read from **Cylinder 0, Head 0, Sector 2**.
>
> Hence, here's what we have so far:
> ```asm
> mov ah, 2         ; Read from disk
> mov al, 1         ; Read 1 sector
> mov ch, 0         ; Cylinder 0
> mov cl, 2         ; Sector 2
> mov dh, 0         ; Head 0
> mov dl, [disknum] ; Drive number (es:bx = 0x7e00)
> mov es, 0
> mov bx, 0x7e00    ; Load to 0x7e00
> int 0x13
> mov ah, 0x0e      ; Print character
> mov al, [0x7E00]   ; Print the first character
> int 0x10
> ```
>
> Check out the full code in <a href="../learning-code/readdisk.asm">readdisk.asm</a>

> **Note :** The BIOS will set the `carry flag (cf)` if there is an error. So we can check for errors by checking the `carry flag`.


&nbsp;
Continued in <a href="./protectedMode.md">the next part</a>...