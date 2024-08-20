package IR.instruction;

import IR.IRBlock;

public abstract class Instruction {

    public IRBlock parent;

    public Instruction(IRBlock parent) {
        this.parent = parent;
    }

    public abstract String toString();
}
