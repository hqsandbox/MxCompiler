package ASM.instr;

import ASM.section.ASMText;

public class ASMBranchInstr extends ASMInstr {

    public String op = null;
    public String rs1, rs2;
    public String dest = null;

    public ASMBranchInstr(ASMText parent, String op, String rs1, String rs2, String dest) {
        super(parent);
        this.op = op;
        this.rs1 = rs1;
        this.rs2 = rs2;
        this.dest = dest;
    }

    @Override
    public String toString() {
        String tmp = switch (op) {
            case "==" -> "beq";
            case "!=" -> "bne";
            case "<" -> "blt";
            case ">" -> "bgt";
            case "<=" -> "ble";
            case ">=" -> "bge";
            default -> throw new RuntimeException("ASMBranchInst: unknown op: " + op);
        };
        if(rs2 == null){
            tmp += "z";
            return String.format("%-8s", tmp) + " " + rs1 + ", " + dest;
        } else{
            return String.format("%-8s", tmp) + " " + rs1 + ", " + rs2 + ", " + dest;
        }
    }
}
