; clear - clears screen
; PARAM VOID
clear:
    mov ah, 0Fh  ; set video mode code
    int 10h      ; get video mode number
    mov ah, 00h  ; set video mode
    int 10h      ; set the video mode
    ret

; backgroundcolor - set background color
; PARAM
; background color      <= bl
; N/A                   =>
backgroundcolor:
    mov ah, 0Bh         ; edit background color code
    mov bh, 00h         ; ||
    int 10h             ; execute color change
    ret