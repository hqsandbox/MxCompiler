package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;
import Util.type.IRType;
import java.util.ArrayList;

public class PhiInstr extends Instruction {

    public IRVariable result = null;
    public IRType irType;
    public ArrayList<IREntity> values = new ArrayList<>();
    public ArrayList<IRBlock> blocks = new ArrayList<>();

    public PhiInstr(IRBlock parent) {
        super(parent);
    }

    public void addBranch(IREntity value, IRBlock block) {
        values.add(value);
        blocks.add(block);
    }

    @Override
    public String toString() {
        StringBuilder ret = new StringBuilder("  ");
        ret.append(result.toString()).append(" = phi ").append(irType.toString()).append(" ");
        for (int i = 0; i < values.size(); i++) {
            ret.append("[ ").append(values.get(i).toString()).append(", ").append(blocks.get(i).toString()).append(" ]");
            if (i != values.size() - 1) {
                ret.append(", ");
            }
        }
        ret.append("\n");
        return ret.toString();
    }
}
