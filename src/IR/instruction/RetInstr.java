package IR.instruction;

import IR.entity.IREntity;
import IR.IRBlock;

public class RetInstr extends Instruction {
    public IREntity retValue;

    public RetInstr(IRBlock parent) {
        super(parent);
    }

    public RetInstr(IRBlock parent, IREntity retValue) {
        super(parent);
        this.retValue = retValue;
    }

    @Override
    public String toString() {
        return "  ret " + retValue.toString() + "\n";
    }
}
