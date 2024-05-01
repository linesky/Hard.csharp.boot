printf "\x1bc\x1b[43;37m give me a .cs file to compile ? "
read ai
nasm -o /tmp/boot.bin boot.asm
nasm -f elf32 -o /tmp/boot.o code.s
cp "$ai" /tmp/kernel.cs
mcs -unsafe   /tmp/kernel.cs -out:/tmp/kernel.exe
mono --aot=asmonly /tmp/kernel.exe
sed 's/local os_oss_kernel_main/globl os_oss_kernel_main/g' /tmp/kernel.exe.s > /tmp/kernel.s.s
as /tmp/kernel.s.s -o /tmp/kernel.o
ld -T link.ld /tmp/boot.o /tmp/kernel.o -o /tmp/hello.com -nostdlib
objcopy -O binary  /tmp/hello.com  /tmp/hellos.com
dd if=/tmp/hellos.com of=/tmp/boot.bin seek=1 conv=notrunc
cp -f /tmp/boot.bin ./
/usr/bin/qemu-system-x86_64 -boot c -hda boot.bin
