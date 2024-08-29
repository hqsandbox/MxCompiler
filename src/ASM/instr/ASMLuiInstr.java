package ASM.instr;

import ASM.section.ASMText;

public class ASMLuiInstr extends ASMInstr {
    public String rd;
    public int imm;

    public ASMLuiInstr(ASMText parent, String rd, int imm) {
        super(parent);
        this.rd = rd;
        this.imm = imm;
    }

    @Override
    public String toString() {
        return "lui " + rd + ", " + imm;
    }
}
