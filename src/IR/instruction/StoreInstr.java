package IR.instruction;

import IR.IRVisitor;
import IR.entity.IREntity;
import IR.IRBlock;
import IR.entity.IRVariable;
import Util.type.IRType;

import java.util.ArrayList;

public class StoreInstr extends Instruction {
    public IREntity ptr;
    public IREntity value;
    public IRType type;

    public StoreInstr(IRBlock parent) {
        super(parent);
    }
    public StoreInstr(IRBlock parent, IREntity ptr, IRType type, IREntity value) {
        super(parent);
        this.ptr = ptr;
        this.type = type;
        this.value = value;
    }

    @Override
    public String toString() {
        return "store " + type.toString() + " " + value.toString() + ", ptr " + ptr.toString() + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public ArrayList<String> getUse(){
        ArrayList<String> ans = new ArrayList<>();
        // 全局变量不能算进去
        if(ptr instanceof IRVariable && ptr.toString().charAt(0) == '%') ans.add(ptr.toString());
        if(value instanceof IRVariable) ans.add(value.toString());
        return ans;
    }

    @Override
    public String getDef(){
        return null;
    }
}
