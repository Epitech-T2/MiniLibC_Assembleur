BITS 64
SECTION .text
GLOBAL strpbrk

strpbrk:
	    XOR 	RCX, RCX
        XOR     RDX, RDX
	    XOR	    R8, R8
loop:
	    MOV	    AL, BYTE[RDI + RCX]
	    CMP	    AL, 0
	    JE	    end_null
	    INC	    RCX
	    MOV	    RDX, 0
second_loop:
	    MOV	    R8B, BYTE[RSI + RDX]
	    CMP	    R8B, 0
	    JE	    loop
	    CMP	    AL, R8B
	    JE	    end
	    INC	    RDX
	    JMP	    second_loop
end:
	    SUB	    RCX, 1
	    ADD	    RDI, RCX
	    MOV	    RAX, RDI
	    RET
end_null:
	    MOV	    RAX, 0
	    RET