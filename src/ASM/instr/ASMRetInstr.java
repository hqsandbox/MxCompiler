package ASM.instr;

import ASM.section.ASMText;

public class ASMRetInstr extends ASMInstr {

    public ASMRetInstr(ASMText parent) {
        super(parent);
    }

    @Override
    public String toString() {
        return "ret";
    }
}
