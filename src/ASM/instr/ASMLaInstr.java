package ASM.instr;

import ASM.section.ASMText;

public class ASMLaInstr extends ASMInstr {
    public String toLabel;
    public String fromLabel;

    public ASMLaInstr(ASMText parent, String toLabel, String fromLabel) {
        super(parent);
        this.toLabel = toLabel;
        this.fromLabel = fromLabel;
    }

    @Override
    public String toString() {
        return "la " + toLabel + ", " + fromLabel;
    }
}
