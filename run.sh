nasm -f elf32 bootloader/kernel.asm -o boot.bin
gcc -fno-stack-protector -m32 -c bootloader/kernel.c -o kernel.o
ld -m elf_i386 -T bootloader/linker.ld -o reedyOS.bin boot.bin kernel.o
qemu-system-i386 -kernel reedyOS.bin