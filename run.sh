# Compile asm
nasm -f bin boot.asm -o hellOS.bin
# Execute os
qemu-system-x86_64 hellOS.bin