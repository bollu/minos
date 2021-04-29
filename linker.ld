/* https://github.com/ErwinM/kernel/blob/630f10cf4f6ef8e26b2b9c8605c9996e2487a7f3/link.ld */
ENTRY(loader) /* entry label */
/* find arch from https://docs.adacore.com/live/wave/binutils-stable/html/ld/ld.html#BFD */
/* cooncretely, run `objdump -f loader.o` */
/* OUTPUT_ARCH(i386:x86-64) */
OUTPUT_ARCH(i386:i386)
/* elf64 does not boot "qemu-system-x86_64: Cannot load x86-64 image, give a 32bit one." */
OUTPUT_FORMAT(elf32-i386)
SECTIONS {
    /* . = 0x500000;          the code should be loaded at 5 MB */
    . = 1M;

    .text ALIGN(4K)  : {
        *(.text) 
        code = .; _code = .; __code = .;

    }

    .data  ALIGN(4K) : {
        *(.data)
        data = .; _data = .; __data = .;

    }

    .bss ALIGN(4K) : {
        *(COMMON)            /* all COMMON sections from all files */
        *(.bss)
        bss = .; _bss = .; __bss = .;

    }


    /*
    end = .; _end = .; __end = .;
    /DISCARD/ :
    {
        *(.fini_array*)
        *(.comment)
    }
    */
    
}
