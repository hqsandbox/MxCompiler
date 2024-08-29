package ASM.instr;

import ASM.section.ASMText;

public class ASMCmpInstr extends ASMInstr {
    public String rs1;
    public String rs2;
    public String op;

    public ASMCmpInstr(ASMText parent, String rs1, String rs2, String op) {
        super(parent);
        this.rs1 = rs1;
        this.rs2 = rs2;
        this.op = op;
    }

    @Override
    public String toString() {
        switch (op){
            case "==" -> {return "seq " + rs1 + ", " + rs2;}
            case "!=" -> {return "sne " + rs1 + ", " + rs2;}
            case "<" -> {return "slt " + rs1 + ", " + rs2;}
            case "<=" -> {return "sle " + rs1 + ", " + rs2;}
            default -> {throw new RuntimeException("Invalid operator: " + op);}
        }
    }
}
