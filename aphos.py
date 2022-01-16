import os, sys, shutil
if len(sys.argv) > 1:
    if sys.argv[1] == 'build':
        print('building aphos...')
        ## asseble code into bin
        os.system('nasm bootloader.asm -f bin -o bin/bootloader.bin')
        os.system('nasm kernel/kernel.asm -f bin -o bin/kernel.bin')
        ## Read bootloader and kernel as bianary files, concatinate into os.bin
        with open("bin/bootloader.bin","rb") as bootloader:
            bootloader_data = bootloader.read()
        with open("bin/kernel.bin","rb") as kernel:
            kernel_data = kernel.read()
        os_data = bootloader_data + kernel_data
        with open("bin/os.bin", "wb") as binary_file:
            binary_file.write(os_data)
        print('build complete!')
    elif sys.argv[1] == 'run':
        print('running aphos...')
        if len(sys.argv) > 2:
            os.system('qemu-system-x86_64 -drive file=bin/os.bin,format=raw,index=0,media=disk ' + sys.argv[2])
        else:
            os.system('qemu-system-x86_64 -drive file=bin/os.bin,format=raw,index=0,media=disk')
        print('qemu terminated')
    elif sys.argv[1] == 'clean':
        try:
            shutil.rmtree('bin/')
        except:
            print('bin/ does not exist. creating bin/ ...')
        os.mkdir('bin/')
        print('bin/ cleared!')
    else:
        print('Unknown Arg: ' + sys.argv[1])
else:
    print('Insufficient Args Recieved. Expected >1, Recieved ' + str(len(sys.argv)))