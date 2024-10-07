package IR.instruction;

import IR.IRBlock;
import IR.IRVisitor;
import IR.entity.IRVariable;
import Util.type.IRType;

import java.util.ArrayList;

public class LoadInstr extends Instruction {

    public IRVariable ptr;
    public IRVariable result;
    public IRType type;

    public LoadInstr(IRBlock parent, IRVariable ptr, IRVariable result, IRType type) {
        super(parent);
        this.ptr = ptr;
        this.result = result;
        this.type = type;
    }

    @Override
    public String toString() {
        return result.toString() + " = load " + type.toString() + ", ptr " + ptr.toString() + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public ArrayList<String> getUse(){
        ArrayList<String> ans = new ArrayList<>();
        ans.add(ptr.toString());
        return ans;
    }

    @Override
    public String getDef(){
        return result.toString();
    }
}
