BITS 64
SECTION .text
GLOBAL strchr

strchr:
        XOR     RAX, RAX
loop:
        CMP     [RDI], SIL
        JE      end_found
        CMP     BYTE[RDI], 0
        JE      end_not_found
        INC     RDI
        JMP     loop
end_found:
        MOV     RAX, RDI
        RET
end_not_found:
        MOV     RAX, 0
        RET
