BITS 64
SECTION .text
GLOBAL memmove

memmove:
        XOR     RAX, RAX
        XOR     RCX, RCX
        XOR     R8, R8
loop:
        CMP     RCX, RDX
        JE      end
        MOV     R8, RDI
        SUB     R8, RSI
        CMP     R8, 0
        JLE     memcopy
copy:
        DEC     RDX
        MOV     AL, [RSI + RDX]
        MOV     BYTE[RDI + RDX], AL
        CMP     RDX, 0
        JE      end
        JMP     copy
memcopy:
        CMP     RDX, 0
        JE      end
        MOV     AL, [RSI + RCX]
        MOV     BYTE[RDI + RCX], AL
        DEC     RDX
        INC     RCX
        JMP     loop
end:
        MOV     RAX, RDI
        RET
