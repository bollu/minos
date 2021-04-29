# https://wiki.osdev.org/Bare_Bones
# run stuff in 32 bit more for simplicity.
.PHONY: run install clean iso

# https://wiki.osdev.org/Bare_Bones -- booting a cdrom image
iso: minos.bin
	-rm -r ./isodir/
	mkdir -p isodir/boot/grub
	cp minos.bin isodir/boot/minos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o minos.iso isodir
	qemu-system-x86_64 -cdrom minos.iso
	# qemu-system-i386 -cdrom minos.iso

run: minos.bin
	qemu-system-x86_64 -kernel minos.bin
	# qemu-system-i386 -kernel minos.bin

install: minos.bin
	sudo cp minos.bin /boot/minos.bin

# ld get ligst of archs with ld -V
# # ld order matters, want loader to be first!
minos.bin: linker.ld loader.o kernel.o
	ld -melf_i386 -T linker.ld  -o minos.bin loader.o kernel.o -z max-page-size=0x1000
	grub-file --is-x86-multiboot minos.bin

loader.o: loader.s
	as --32 -o loader.o loader.s
kernel.o: kernel.c
	gcc -m32 -c kernel.c -o kernel.o -ffreestanding -nostdlib -fno-builtin -fno-leading-underscore

clean:
	rm *.o *.bin *.iso



