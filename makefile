# https://www.youtube.com/watch?v=1rnA6wpF0o4&list=PLHh55M_Kq4OApWScZyPl5HhgsTJS9MZ6M&index=3
.section .text
# .extern kernelMain
.global loader

loader:
	mov $kernel_stack: %esp

stop:
	cli
	hlt
	jmp stop


.section .bss
.space 2*1024*1024


