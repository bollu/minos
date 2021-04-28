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
