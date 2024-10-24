bin/myos.iso:
	nasm -felf32 src/boot.asm -o bin/boot.o
	nasm -felf32 src/kernel.asm -o bin/kernel.o
	i686-elf-gcc -T linker.ld -o bin/myos.bin -ffreestanding -O2 -nostdlib bin/boot.o bin/kernel.o -lgcc
	mkdir -p isodir/boot/grub
	cp bin/myos.bin isodir/boot/myos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub2-mkrescue -o bin/myos.iso isodir