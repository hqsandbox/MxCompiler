package IR.instruction;

import IR.IRVisitor;
import IR.entity.IREntity;
import IR.IRBlock;
import Util.type.IRType;

public class StoreInstr extends Instruction {
    public IREntity ptr;
    public IREntity value;
    public IRType type;

    public StoreInstr(IRBlock parent) {
        super(parent);
    }
    public StoreInstr(IRBlock parent, IREntity ptr, IRType type, IREntity value) {
        super(parent);
        this.ptr = ptr;
        this.type = type;
        this.value = value;
    }

    @Override
    public String toString() {
        return "store " + type.toString() + " " + value.toString() + ", ptr " + ptr.toString() + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
