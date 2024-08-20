package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;
import Util.type.IRType;

import java.util.ArrayList;

public class GeteleptrInstr extends Instruction {

    public IRVariable result;
    public IRType type;
    public ArrayList<IREntity> idxList = new ArrayList<>();

    public GeteleptrInstr(IRBlock parent) {
        super(parent);
    }

    @Override
    public String toString(){
        StringBuilder ret = new StringBuilder("  ");
        ret.append(result.toString()).append(" = getelementptr ").append(type.toString()).append(", ").append(type.toString());
        for (IREntity idx : idxList) {
            ret.append(", ").append(idx.toString());
        }
        ret.append("\n");
        return ret.toString();
    }
}
