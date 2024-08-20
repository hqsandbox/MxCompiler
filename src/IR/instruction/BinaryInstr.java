package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;

public class BinaryInstr extends Instruction {
    public String op;
    public IREntity lhs, rhs;

    public BinaryInstr(IRBlock parent, String op, IREntity lhs, IREntity rhs) {
        super(parent);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public String toString() {
        return "  " + lhs.toString() + " = " + op + " " + rhs.toString() + "\n";
    }

}
