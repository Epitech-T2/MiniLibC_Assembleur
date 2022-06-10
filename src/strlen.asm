BITS 64
SECTION .text
GLOBAL strlen

strlen:
        MOV     RAX, 0      ;XOR RAX, RAX;
loop:
        CMP     BYTE[RDI + RAX], 0
        JE      end_strlen

        ADD     RAX, 1      ;INC RAX
        JMP     loop
end_strlen:
        RET
