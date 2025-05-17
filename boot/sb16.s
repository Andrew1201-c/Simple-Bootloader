org 0x07C00
bits 16

_start:
    hlt

_halt:
    jmp _halt

times 510 - ($-$$) db 0
dw 0xAA5
