package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;
import IR.entity.IREntity;
import IR.entity.IRVariable;

import java.util.ArrayList;

public class BrInstr extends Instruction {
    public IREntity op;
    public IRBlock lhs, rhs;

    public BrInstr(IRBlock parent, IREntity op, IRBlock lhs, IRBlock rhs) {
        super(parent);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    public void replaceTarget(IRBlock oldTarget, IRBlock newTarget) {
        if(lhs == oldTarget) lhs = newTarget;
        if(rhs == oldTarget) rhs = newTarget;
    }

    @Override
    public String toString() {
        return "br i1 " + op + ", label %" + lhs.name + ", label %" + rhs.name + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public ArrayList<String> getUse(){
        ArrayList<String> ans = new ArrayList<>();
        if(op instanceof IRVariable irVariable && !isInt(irVariable.toString())){
            ans.add(irVariable.toString());
        }
        return ans;
    }

    @Override
    public String getDef() {
        return null;
    }
}
