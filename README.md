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

# Tutorials

- [Write an OS](https://www.youtube.com/watch?v=1rnA6wpF0o4&list=PLHh55M_Kq4OApWScZyPl5HhgsTJS9MZ6M&index=3)
- [OSdev page on multiboot](https://wiki.osdev.org/Multiboot)
- [GNU page on multiboot](https://www.gnu.org/software/grub/manual/multiboot2/multiboot.html)
- [`ErwinM/kernel` on github](https://github.com/ErwinM/kernel/)
- http://www.osdever.net/bkerndev/index.php: longform tutorial.
- https://www.cs.vu.nl/~herbertb/misc/writingkernels.txt: mini tutorial.
