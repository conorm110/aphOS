init_drive:
    mov ah, 09h           ; init controller
    int 13h
    jc $                  ; jump if error
    cmp ah, 00h           ; compare ret to success
    jne $                 ; jump if not success
    mov ah, 10h           ; test if drive is ready
    int 13h
    cmp ah, 00h           ; check if ready
    jne $                 ; if not ready jump
    jmp init_drive_pt0
