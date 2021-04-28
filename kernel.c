// two bytes: |color|ASCII|. We make sure to not overwrite color.
volatile unsigned char *videoMemory = (unsigned char*)0xb8000;
void print(const char *s) {
    for(int i = 0; s[i] != 0; ++i) {
        videoMemory[1 + 2*i] = s[i];
    }
}
extern void kernelMain(void *multiboot, unsigned int magic) {
    print("Hello world!");
    while(1) {};
}
