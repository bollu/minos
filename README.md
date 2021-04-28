# Step 1: adding kernel to grub CFG:



```
/boot/grub/grub.cfg

### BEGIN MYKERNEL
menuentry 'My OS'  {
    multiboot /boot/mykernel.bin
    boot
}

```
