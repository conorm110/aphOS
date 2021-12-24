os_main:
    call clear
    mov bl, 1h          ; set blue color
    call backgroundcolor

    mov bx, osloadedstr ; load  str for puts
    call puts           ; print loaded str

    call nextline       ; move to next like
    os_main_pt0:        ; jump point

    call getc           ; read next character
    cmp al, 0Dh         ; check if it is enter
    jne os_main_pt1     ; if its not enter skip
    call nextline       ; go to next like
    os_main_pt1:        ; jump point

    call putc           ; write character to screen
    
    jmp os_main_pt0     ; loop the character read/write sequence

; Includes
%include "os/lib/text_graphics.asm"
%include "os/lib/text_input.asm"
%include "os/lib/graphics.asm"

; Variable Space
osloadedstr:
    db "OS Loaded",0