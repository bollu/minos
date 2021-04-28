// two bytes: |color|ASCII|. We make sure to not overwrite color.
void print(const char *s) {
    volatile unsigned char *videoMemory = (unsigned char*)0xb8000;
    for(int i = 0; s[i] != 0; ++i) {
        videoMemory[2*i] = s[i];
    }
}
extern void kernelMain(void *multiboot, unsigned int magic) {
    print("Hello world! I am very happy to see you XXXXX");
    while(1) {};
}
