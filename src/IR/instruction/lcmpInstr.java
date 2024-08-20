package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;

public class lcmpInstr extends Instruction {

    public String op;
    public IREntity lhs, rhs;

    public lcmpInstr(IRBlock parent) {
        super(parent);
    }

    @Override
    public String toString(){
        return "  " + lhs.toString() + " = " + op + " " + rhs.toString() + "\n";
    }
}
