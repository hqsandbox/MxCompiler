package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;

public class BrInstr extends Instruction {
    public IREntity op;
    public IRBlock lhs, rhs;

    public BrInstr(IRBlock parent, IREntity op, IRBlock lhs, IRBlock rhs) {
        super(parent);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public String toString() {
        return "br i1 " + op + ", label %" + lhs.name + ", label %" + rhs.name + "\n";
    }
}
