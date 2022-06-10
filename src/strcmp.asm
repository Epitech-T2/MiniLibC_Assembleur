BITS 64
SECTION .text
GLOBAL strcmp

strcmp:
        XOR     RCX, RCX
        XOR     RAX, RAX
        XOR     R8, R8
loop:
        CMP     RDI, 0
        JE      end
        CMP     RSI, 0
        JE      end
        MOV     AL, BYTE[RDI + RCX]
        CMP     AL, BYTE[RSI + RCX]
        JNLE    end_pos
        JB      end_neg
        JE      end_eq
end_pos:
        MOV     RAX, 1
        RET
end_neg:
        MOV     RAX, -1
        RET
end_eq:
        CMP     AL, 0
        JE      end
        INC     RCX
        JMP     loop
end:
        MOV     RAX, 0
        RET
