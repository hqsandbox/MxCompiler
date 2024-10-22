package ASM.instr;

import ASM.section.ASMText;

public class ASMMvInstr extends ASMInstr {
    public String rd;
    public String rs;

    public ASMMvInstr(ASMText parent, String rd, String rs) {
        super(parent);
        this.rd = rd;
        this.rs = rs;
    }

    @Override
    public String toString() {
        if(rd.equals(rs)) return "";
        return "mv " + rd + ", " + rs;
    }
}
