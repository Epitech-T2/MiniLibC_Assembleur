BITS 64
SECTION .text
GLOBAL memset

memset:
        XOR     RAX, RAX
        XOR     RCX, RCX
loop:
        CMP     RCX, RDX
        JE      end
        MOV     BYTE[RDI + RCX], SIL
        INC     RCX
        JMP     loop
end:
        MOV     RAX, RDI
        RET
