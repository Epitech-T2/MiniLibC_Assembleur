BITS 64
SECTION .text
GLOBAL strrchr

strrchr:
        XOR     RAX, RAX
loop:
        CMP     [RDI], SIL
        JE      end_found
next:
        CMP     BYTE[RDI], 0
        JE      end
        INC     RDI
        JMP     loop
end_found:
        MOV     RAX, RDI
        JMP     next
end:
        RET
