BITS 64
SECTION .text
GLOBAL strcasecmp

strcasecmp:
	    XOR	    RAX, RAX
	    XOR	    RCX, RCX
	    XOR	    R8, R8
loop:
	    MOV	    AL, BYTE [RDI + RCX]
	    MOV	    R8B, BYTE [RSI + RCX]
	    CMP	    RAX, 0
	    JE	    end
	    CMP	    R8, 0
	    JE	    end
	    CMP	    AL, 90
	    JLE	    lower
check_r8:
	    CMP	    R8B, 90
	    JLE	    lower_r8
check_diff:
	    CMP	    AL, R8B
	    JNE	    end
	    INC	    RCX
	    JMP	    loop
lower:
	    CMP	    AL, 65
	    JGE	    rax_to_lower
	    JMP	    check_r8
rax_to_lower:
	    ADD	    RAX, 32
	    JMP	    check_r8
lower_r8:
	    CMP	    R8B, 65
	    JGE	    r8_to_lower
	    JMP	    check_diff
r8_to_lower:
	    ADD	    R8, 32
	    JMP	    check_diff
end:
	    SUB	    AL, R8B
	    MOVSX	RAX, AL
	    RET
