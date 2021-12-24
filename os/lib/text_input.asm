; getc - get next character typed
; PARAM
;   N/A          <=
;   char         => al
getc:
    getc_pt0:
    mov ah, 00h ; get character code
    int 16h     ; get character
    cmp ah, 00h ; check if character was recieved
    je getc_pt0 ; if no char, repeat
    ret