GRUB_MAGIC_NUMBER equ 0x1BADB002     ; define the magic number constant
GRUB_FLAGS        equ 0x0            ; multiboot flags
GRUB_CHECKSUM     equ -GRUB_MAGIC_NUMBER  ; calculate the checksum
                                ; (magic number + checksum + flags should equal 0)
KERNEL_STACK_SIZE equ 4096


global mboot	                  ; Make 'mboot' accessible from C.
EXTERN code		                  ; Start of the '.text' section.
EXTERN bss    	                ; Start of the .bss section.
EXTERN end                      ; End of the last loadable section.

section .text

mboot:
    dd  GRUB_MAGIC_NUMBER				; GRUB will search for this value on each
                                ; 4-byte boundary in your kernel file
    dd  GRUB_FLAGS				      ; How GRUB should load your file / settings
    dd  GRUB_CHECKSUM	          ; To ensure that the above values are correct

    dd  mboot                   ; Location of this descriptor
    dd  code                    ; Start of kernel '.text' (code) section.
    dd  bss                     ; End of kernel '.data' section.
    dd  end                     ; End of kernel.
    dd  loader                  ; Kernel entry point (initial EIP).


global loader                   ; the entry symbol for ELF
extern kmain
loader:                         ; the loader label (defined as entry point in linker script)
    mov esp, kernel_stack + KERNEL_STACK_SIZE
		push ebx
		;xchg bx, bx

    call kmain

.loop:
		;xchg	bx, bx								; Enter debug through magic Bochs breakpoint
    jmp .loop                   ; loop forever

section .bss:
align 4
kernel_stack:                   ; label points to beginning of memory
  resb KERNEL_STACK_SIZE        ; reserve stack for the kernel
