; boot.asm

; Assembly code to boot a simple operating system
; that displays "Hello" on the screen.

[bits 16]                   ; 16-bit code
[org 0x7c00]                ; code will be loaded at memory address 0x7c00

; Print "Hello" to screen

mov bx, hello_string        ; load character from hello_string
mov ah, 0x0e                ; function to print character

hello:
    mov al, [bx]            ; load character from bx
    cmp al, 0               ; end of string?
    je end                  ; if so, end
    int 0x10                ; otherwise, print character
    inc bx                  ; move to next character
    jmp hello               ; repeat

hello_string:
    db 'Hello World!', 0    ; string to display

end:
    jmp $                   ; Infinite loop to avoid fallback to BIOS

; Fill up the rest of the boot sector with 0s

times 510-($-$$) db 0

; Add boot signature

dw 0xaa55