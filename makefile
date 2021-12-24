build:
	nasm bootloader.asm -f bin -o bin/bootloader.bin
	nasm kernel/kernel.asm -f bin -o bin/kernel.bin
	cat bin/bootloader.bin bin/kernel.bin > bin/os.bin

clean:
	rm -rf bin/
	mkdir bin

run:
	qemu-system-x86_64 bin/os.bin