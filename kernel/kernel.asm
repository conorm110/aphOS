[org 0x7e00]
call os_main
jmp $
%include "os/os_main.asm"
times 65536-($-$$) db 0