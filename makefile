# run stuff in 32 bit more for simplicity.
.PHONY: run install clean ismultiboot

run: minos.bin
	qemu-system-i386 -kernel minos.bin

install: minos.bin
	sudo cp minos.bin /boot/minos.bin

# ld get ligst of archs with ld -V
minos.bin: linker.ld loader.o kernel.o
	ld -nostdlib -melf_i386 -T linker.ld  -o minos.bin loader.o kernel.o
	# ld -nostdlib -melf_x86_64 -T linker.ld  -o minos.bin loader.o kernel.o

loader.o: loader.s
	as --32 -o loader.o loader.s
kernel.o: kernel.c
	gcc -m32 -c kernel.c -o kernel.o -fno-stack-protector  -nostdlib -fno-builtin -fno-leading-underscore -Os

# 	https://wiki.osdev.org/Multiboot
ismultiboot: minos.bin
	grub-file --is-x86-multiboot minos.bin

clean:
	rm *.o *.bin
