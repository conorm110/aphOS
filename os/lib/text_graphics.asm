; puts - print string @ cursor loc
; PARAM
;   Input String <= BX
;   N/A          =>
puts:
    push ax
    push bx

    mov ah, 0x0e
    .Loop:
    cmp [bx], byte 0
    je .Exit
        mov al, [bx]
        int 0x10
        inc bx
        jmp .Loop
    .Exit:

    pop ax
    pop bx
    ret

; putc - print char @ cursor loc
; PARAM
;   Input Char   <= al
;   N/A          => 
putc:
    mov ah, 0x0e ; write character code
    int 0x10     ; write character
    ret
    
; nextline - move cursor to next line
; PARAM VOID
nextline:
    mov ah, 03h  ; get cursor pos code
    mov bh, 0h   ; page number 0
    inc dh       ; increment row number
    mov ah, 02h  ; cursor position code
    mov bh, 0h   ; page number 0
    mov dl, 0h   ; column number
    int 10h      ; move cursor to new line
    ret