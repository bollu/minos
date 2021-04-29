# Minos

![minos](./minos.jpg)

> The name mwi-nu (Minos) is expected to mean 'ascetic'
> as Sanskrit muni, and fits this explanation to the legend about Minos
> sometimes living in caves on Crete.




# Step 1: adding kernel to grub CFG:


```
/boot/grub/grub.cfg

### BEGIN MYKERNEL
menuentry 'My OS'  {
    multiboot /boot/mykernel.bin
    boot
}

```

# Step 2: How do I get this booting on the physical machine?!

- https://forum.osdev.org/viewtopic.php?f=1&t=32829
- https://forum.osdev.org/viewtopic.php?f=1&t=21980
- https://github.com/stevej/osdev/blob/master/image-builder/boot/grub/grub.cfg

I keep getting the error ["warning: no console available for OS"](https://forum.osdev.org/viewtopic.php?f=1&t=36300)
when I try to boot physically on my MacBook from a USB.  OK, so by my current understanding, I need to
load my kernel in VGA mode and write pixels. Anything else is bunk, since macs
literally don't have BIOS, and thus literally (?) can't boot into text mode (!)
Can follow the [OSDev UEFI bare bones
tutorial](https://wiki.osdev.org/User:Jnc100/UEFI_Bare_Bones).  Very
interesting how practically every resource available has firmly departed from
ground reality (GRUB2, UEFI,...). Seems like [This forum thread on OSDev](https://forum.osdev.org/viewtopic.php?f=1&t=37223)
has useful links to [PC screen fonts](https://wiki.osdev.org/PC_Screen_Font) and [drawing in protected mode](https://wiki.osdev.org/Drawing_In_Protected_Mode).
Also, [`OpenCoreShell` has a `legacy-switch-to-text.diff](https://github.com/acidanthera/OpenCoreShell/blob/ef7f4d83d5fc35a2397cd3df5388712bf1113325/Patches/legacy-switch-to-text.diff) which explains how to enable text mode in Mac UEFI.

> [OSDev thread about ditching BIOS](https://forum.osdev.org/viewtopic.php?f=15&t=30610&start=0)
> If you use the BIOS for booting that way, you set a graphics mode using VESA,
> then go to protected mode to set up the kernel after which you can't sanely
> return to set a different graphics mode.
> If you use UEFI for booting that way, you set a graphics mode using the GOP
> interface, then exit boot services to set up the kernel after which you can't
> sanely return to set a different graphics mode.

The main difference in practice is that VESA allows more modes and is more forgiving to hacks. :wink:

Additionally, if you use GRUB you can get both platforms and a graphics mode pre-set for free.

```
https://wiki.osdev.org/Stivale_Bare_Bones
B00byedge, the chaddest: Use limine :meme:
7:01 PM] 3DNow! in Ring 2: search for framebuffer in the multiboot1/multiboot2 spec
[7:01 PM] 3DNow! in Ring 2: keep in mind that it doesn't work in qemu by default (with -kernel)
[7:02 PM] 3DNow! in Ring 2: you need to create a script that installs grub in an image and runs it in qemu, but at that point i'd just use a (usually) better bootloader like limine
[7:24 PM] B00byedge, the chaddest: yeah you can get a framebuffer from multiboot but not qemu
[7:24 PM] B00byedge, the chaddest: qemu just pretends like you didn't ask for it
[7:24 PM] B00byedge, the chaddest: which honestly is kinda strange, would probably be pretty useful if it did
```



# Tutorials

- [Write an OS](https://www.youtube.com/watch?v=1rnA6wpF0o4&list=PLHh55M_Kq4OApWScZyPl5HhgsTJS9MZ6M&index=3)
- [OSdev page on multiboot](https://wiki.osdev.org/Multiboot)
- [GNU page on multiboot](https://www.gnu.org/software/grub/manual/multiboot2/multiboot.html)
- [`ErwinM/kernel` on github](https://github.com/ErwinM/kernel/)
- http://www.osdever.net/bkerndev/index.php: longform tutorial.
- https://www.cs.vu.nl/~herbertb/misc/writingkernels.txt: mini tutorial.
- Little OS book: http://littleosbook.github.io/#booting
