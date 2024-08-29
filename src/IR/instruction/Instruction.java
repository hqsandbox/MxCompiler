package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;

public abstract class Instruction {

    public IRBlock parent;

    public Instruction(IRBlock parent) {
        this.parent = parent;
    }

    public abstract String toString();
    public abstract void accept(IRVisitor visitor);
}
