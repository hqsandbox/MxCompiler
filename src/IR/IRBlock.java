package IR;

import IR.definition.*;
import java.util.ArrayList;
import IR.instruction.*;

public class IRBlock {

    public IRFuncDef parent;
    public String name;
    public ArrayList<Instruction> instructions = new ArrayList<>();

    public IRBlock(IRFuncDef parent, String name) {
        this.parent = parent;
        this.name = name;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(name).append(":\n");
        for (Instruction instruction : instructions) {
            stringBuilder.append(instruction.toString());
        }
        return stringBuilder.toString();
    }
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
