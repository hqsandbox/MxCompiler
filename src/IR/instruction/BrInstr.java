package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;

public class BrInstr extends Instruction {
    public IRVariable op;
    public IRBlock lhs, rhs;

    public BrInstr(IRBlock parent, IRVariable op, IRBlock lhs, IRBlock rhs) {
        super(parent);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public String toString() {
        return "br " + op + " " + lhs + ", " + rhs + "\n";
    }
}
