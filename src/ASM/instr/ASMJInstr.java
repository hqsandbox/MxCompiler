package ASM.instr;

import ASM.section.ASMText;

public class ASMJInstr extends ASMInstr {
    public String label;

    public ASMJInstr(ASMText parent, String label) {
        super(parent);
        this.label = label;
    }

    @Override
    public String toString() {
        return "j " + label;
    }
}
