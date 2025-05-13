org 0x07C00
bits 16

_start:
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    mov ah, 0x0B
    mov bh, 0x00
    mov bl, 1
    int 0x10
 
    mov si, bootmsg
    call _write

_write:
    lodsb
    or al, al

    je _done

    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10

    jmp _write

_done:
    jmp _halt

_halt:
    jmp _halt

bootmsg db 'Booting..', 0

times 510 - ($-$$) db 0
dw 0xAA5
