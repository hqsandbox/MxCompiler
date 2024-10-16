package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;

import java.util.ArrayList;

public class JumpInstr extends Instruction {
    public IRBlock target;

    public JumpInstr(IRBlock parent, IRBlock target) {
        super(parent);
        this.target = target;
    }

    public void replaceTarget(IRBlock oldTarget, IRBlock newTarget) {
        if (target == oldTarget) {
            target = newTarget;
        }
    }

    @Override
    public String toString(){
        return "br label %" + target.name + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public ArrayList<String> getUse(){
        return new ArrayList<>();
    }

    @Override
    public String getDef(){
        return null;
    }
}
