package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;

public class JumpInstr extends Instruction {
    public IRBlock target;

    public JumpInstr(IRBlock parent, IRBlock target) {
        super(parent);
        this.target = target;
    }

    @Override
    public String toString(){
        return "br label %" + target.name + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
