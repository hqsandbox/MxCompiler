package ASM.instr;

import ASM.section.ASMText;

public class ASMCallInstr extends ASMInstr {
    public String label;

    public ASMCallInstr(ASMText parent, String label) {
        super(parent);
        this.label = label;
    }

    @Override
    public String toString() {
        return "call " + label;
    }
}
