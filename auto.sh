nasm -f bin boot_sect_simple.asm -o boot_simp.bin

qemu-system-x86_64 boot_simp.bin