package ASM.instr;

import ASM.section.ASMText;

public class ASMLiInstr extends ASMInstr {
    public String rd;
    public int imm;

    public ASMLiInstr(ASMText parent, String rd, int imm) {
        super(parent);
        this.rd = rd;
        this.imm = imm;
    }

    @Override
    public String toString() {
        return "li " + rd + ", " + imm;
    }
}
