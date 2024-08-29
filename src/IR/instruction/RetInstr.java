package IR.instruction;

import IR.IRVisitor;
import IR.entity.IREntity;
import IR.IRBlock;
import Util.type.IRType;

public class RetInstr extends Instruction {
    public IREntity retValue;
    public IRType retType;

    public RetInstr(IRBlock parent) {
        super(parent);
    }

    public RetInstr(IRBlock parent, IREntity retValue, IRType retType) {
        super(parent);
        this.retValue = retValue;
        this.retType = retType;
    }

    @Override
    public String toString() {
        if(retType.isVoid()) return "ret void\n";
        return "ret " + retType.toString() + " " + retValue.toString() + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
