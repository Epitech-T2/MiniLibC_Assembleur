BITS 64
SECTION .text
GLOBAL strstr

strstr:
        XOR     RAX, RAX
        XOR	    RCX, RCX
        XOR     RDX, RDX
        XOR     R8, R8
	    CMP	    RDI, 0
	    JE	    end_null
loop:
        MOV     RCX, R8
        ADD     RCX, RDX
        MOV     AL, BYTE[RDI + RCX]
        CMP     BYTE[RSI + RDX], 0
        JE      end
        CMP     BYTE[RDI + RCX], 0
        JE      end_null
        CMP     AL, [RSI + RDX]
        JNE     second_loop
        INC     RDX
        JMP     loop
second_loop:
        INC     R8
        MOV     RCX, 0
        JMP     loop
end_null:
	    MOV	    RAX, 0
        RET
end:
        ADD     RDI, R8
        MOV     RAX, RDI
        RET