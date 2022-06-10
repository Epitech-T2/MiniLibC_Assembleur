BITS 64
SECTION .text
GLOBAL strncmp

strncmp:
        XOR     RCX, RCX
        XOR     RAX, RAX
        XOR     R8, R8
.loop:
        CMP     RDX, RCX
        JE      end

        MOV     AL, BYTE[RDI + RCX]
        MOV     R8B, BYTE[RSI + RCX]

        CMP     RAX, 0
        JE      end

        CMP     R8, 0
        JE      end

        CMP     AL, R8B
        JNE     end

        INC     RCX
        JMP     .loop
end:
        SUB     AL, R8B
        MOVSX   RAX, AL
        RET
