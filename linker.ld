/* https://github.com/ErwinM/kernel/blob/630f10cf4f6ef8e26b2b9c8605c9996e2487a7f3/link.ld */
ENTRY(loader) /* entry label */
OUTPUT_ARCH(i386:i386)
OUTPUT_FORMAT(elf32-i386)
SECTIONS {
    /* . = 0x500000;          the code should be loaded at 5 MB */
    . = 0x0100000;

    .text :
    {
        *(.text) 
        code = .; _code = .; __code = .;

    }

    .data  :
    {
        *(.data)
        data = .; _data = .; __data = .;

    }

    .bss : {
        *(COMMON)            /* all COMMON sections from all files */
        *(.bss)
        bss = .; _bss = .; __bss = .;

    }
    end = .; _end = .; __end = .;


    /*
    /DISCARD/ :
    {
        *(.fini_array*)
        *(.comment)
    }
    */
    
}
