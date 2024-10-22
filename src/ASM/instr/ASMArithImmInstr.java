package ASM.instr;

import ASM.section.ASMText;

public class ASMArithImmInstr extends ASMInstr {
    public String rd;
    public String rs1;
    public int imm;
    public String op;

    public ASMArithImmInstr(ASMText parent, String rd, String rs1, String op, int imm) {
        super(parent);
        this.rd = rd;
        this.rs1 = rs1;
        this.imm = imm;
        this.op = op;
    }
    @Override
    public String toString() {
        switch (op) {
            case "+" -> {return "addi " + rd + ", " + rs1 + ", " + imm;}
            case "^" -> {return "xori " + rd + ", " + rs1 + ", " + imm;}
            case "|" -> {return "ori " + rd + ", " + rs1 + ", " + imm;}
            case "&" -> {return "andi " + rd + ", " + rs1 + ", " + imm;}
            case "<<" -> {return "slli " + rd + ", " + rs1 + ", " + imm;}
            case ">>" -> {return "srai " + rd + ", " + rs1 + ", " + imm;}
            default -> {
                return "ERROR";
            }
        }
    }
}
