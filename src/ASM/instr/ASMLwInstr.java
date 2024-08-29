package ASM.instr;

import ASM.section.ASMText;

public class ASMLwInstr extends ASMInstr {
    public String rd;
    public String rs1;
    public int offset;

    public ASMLwInstr(ASMText parent, String rd, String rs1, int offset) {
        super(parent);
        this.rd = rd;
        this.rs1 = rs1;
        this.offset = offset;
    }

    @Override
    public String toString() {
        if(offset <= 2000 && offset >= -2000){
            return "lw " + rd + ", " + offset + "(" + rs1 + ")";
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("li ").append("t3").append(", ").append(offset).append("\n");
            sb.append("add ").append("t3").append(", ").append(rs1).append(", ").append("t3").append("\n");
            sb.append("lw ").append(rd).append(", 0(t3)").append("\n");
            return sb.toString();
        }
    }
}
