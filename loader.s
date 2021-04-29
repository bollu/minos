# https://stackoverflow.com/tags/att/info
# https://github.com/ErwinM/kernel/blob/630f10cf4f6ef8e26b2b9c8605c9996e2487a7f3/loader.s
# https://www.youtube.com/watch?v=1rnA6wpF0o4&list=PLHh55M_Kq4OApWScZyPl5HhgsTJS9MZ6M&index=3
# https://wiki.osdev.org/Multiboot#:~:text=The%20original%20Multiboot%20specification%20was,themselves%20with%20magic%20number%200x2BADB002.
# https://www.gnu.org/software/grub/manual/multiboot2/multiboot.html
.set MAGIC, 0x1BADB002
.set FLAGS, (1<<0|1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
  .align 4
  .long MAGIC
  .long FLAGS
  .long CHECKSUM

.section .text
.extern kernelMain 
.global loader

loader:
  cli
  mov $stack_top, %esp
  mov 0, %ebp
  call kernelMain
stop:
  cli
  hlt
  jmp stop

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

