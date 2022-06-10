BITS 64
SECTION .text
GLOBAL strcspn

strcspn:
        XOR     RAX, RAX
        XOR     RCX, RCX
        XOR     RDX, RDX
loop:
        MOV     AL, BYTE[RDI + RCX]
        CMP	    AL, 0
        JE      end_null
        INC	    RCX
        MOV	    RDX, 0
second_loop:
        CMP	    AL, BYTE[RSI + RDX]
        JE      end
        CMP	    BYTE[RSI + RDX], 0
        JE      loop
        INC     RDX
        JMP     second_loop
end:
        SUB	    RCX, 1
        MOV	    RAX, RCX
	    RET
end_null:
        MOV	    RAX, RCX
	    RET
