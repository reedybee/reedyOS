all: reedyOS.bin

reedyOS.bin: boot.bin kernel.o
	ld -m elf_i386 -T bootloader/linker.ld -o reedyOS.bin boot.bin kernel.o

boot.bin: bootloader/kernel.asm
	nasm -f elf32 bootloader/kernel.asm -o boot.bin

kernel.o: bootloader/kernel.c
	gcc -fno-stack-protector -m32 -c bootloader/kernel.c -o kernel.o

run: reedyOS.bin
	qemu-system-i386 -kernel reedyOS.bin

clean:
	rm -f *.bin *.o reedyOS.bin