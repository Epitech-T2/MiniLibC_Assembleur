BITS 64
SECTION .text
GLOBAL memcpy

memcpy:
        XOR     RAX, RAX
        XOR     RCX, RCX
loop:
        CMP     RCX, RDX
        JE      end
        MOV     AL, [RSI + RCX]
        MOV     BYTE[RDI + RCX], AL
        INC     RCX
        JMP     loop
end:
        MOV     RAX, RDI
        RET
