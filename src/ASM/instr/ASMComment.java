package ASM.instr;

import ASM.section.ASMText;
import IR.instruction.Instruction;

public class ASMComment extends ASMInstr {

    public Instruction instruction;

    public ASMComment(ASMText parent, Instruction instruction) {
        super(parent);
        this.instruction = instruction;
    }

    @Override
    public String toString() {
        return "# " + instruction.toString();
    }
}
