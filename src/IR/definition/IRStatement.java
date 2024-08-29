package IR.definition;

import IR.IRVisitor;

public abstract class IRStatement {
    public abstract String toString();
    public abstract void accept(IRVisitor visitor);
}
