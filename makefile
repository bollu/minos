# run stuff in 32 bit more for simplicity.
.PHONY: install
install: mykernel.bin
	sudo cp mykernel.bin /boot/mykernel.bin

mykernel.bin: linker.ld loader.o kernel.o
	ld -melf_i386 -T linker.ld  -o mykernel.bin loader.o kernel.o

loader.o: loader.s
	as --32 -o loader.o loader.s
kernel.o: kernel.c
	gcc -m32 -c kernel.c -o kernel.o -nostdlib -fno-builtin -fno-leading-underscore
