export PATH=$PATH:/usr/local/i386elfgcc/bin

nasm "boot_sector_main.asm" -f bin -o "bin/boot_main.bin"
nasm "kernel_entry.asm" -f elf -o "bin/kernel_entry.o"
i386-elf-g++ -ffreestanding -m32 -g -c "kernel.cpp" -o "bin/kernel.o"
nasm "zeroes.asm" -f bin -o "bin/zeroes.bin"

i386-elf-ld -o "bin/full_kernel.bin" -Ttext 0x1000 "bin/kernel_entry.o" "bin/kernel.o" --oformat binary

cat "bin/boot_main.bin" "bin/full_kernel.bin" "bin/zeroes.bin"  > "bin/OS.bin"

qemu-system-x86_64 -drive format=raw,file="bin/OS.bin",index=0,if=ide,  -m 128M