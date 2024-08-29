package ASM.instr;

import ASM.section.ASMText;

abstract public class ASMInstr {
    public ASMText parent;
    public ASMInstr(ASMText parent) {
        this.parent = parent;
    }
    abstract public String toString();
}
