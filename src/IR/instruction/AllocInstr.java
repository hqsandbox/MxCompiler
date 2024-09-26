package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;
import IR.entity.IRVariable;
import Util.type.IRType;

public class AllocInstr extends Instruction {

    public IRType irType;
    public String varName;
    public IRVariable irVariable;
    public boolean isChecked = false;

    public AllocInstr(IRBlock parent, IRType irType_, IRVariable irVariable_) {
        super(parent);
        irType = irType_;
        irVariable = irVariable_;
        varName = irVariable.toString();
    }

    @Override
    public String toString() {
        return irVariable.toString() + " = alloca " + irType.toString() + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

}
