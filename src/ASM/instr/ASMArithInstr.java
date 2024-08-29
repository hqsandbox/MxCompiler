package ASM.instr;

import ASM.section.ASMText;

public class ASMArithInstr extends ASMInstr {
    public String rd;
    public String rs1;
    public String rs2;
    public String op;

    public ASMArithInstr(ASMText parent, String rs1, String rs2, String rd, String op) {
        super(parent);
        this.rs1 = rs1;
        this.rs2 = rs2;
        this.rd = rd;
        this.op = op;
    }
    @Override
    public String toString() {
        switch (op) {
            case "+" -> {return "add " + rd + ", " + rs1 + ", " + rs2;}
            case "-" -> {return "sub " + rd + ", " + rs1 + ", " + rs2;}
            case "*" -> {return "mul " + rd + ", " + rs1 + ", " + rs2;}
            case "/" -> {return "div " + rd + ", " + rs1 + ", " + rs2;}
            case "%" -> {return "rem " + rd + ", " + rs1 + ", " + rs2;}
            case "<<" -> {return "sll " + rd + ", " + rs1 + ", " + rs2;}
            case ">>" -> {return "sra " + rd + ", " + rs1 + ", " + rs2;}
            case "^" -> {return "xor " + rd + ", " + rs1 + ", " + rs2;}
            case "|" -> {return "or " + rd + ", " + rs1 + ", " + rs2;}
            case "&" -> {return "and " + rd + ", " + rs1 + ", " + rs2;}
            default -> {
                return "ERROR";
            }
        }
    }
}
