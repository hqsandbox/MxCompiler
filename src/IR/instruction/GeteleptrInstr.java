package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;
import Util.type.IRType;

import java.util.ArrayList;

public class GeteleptrInstr extends Instruction {

    public IRVariable result;
    public IRType type;
    public String className;
    public IREntity ptrValue;
    public ArrayList<IREntity> idxList = new ArrayList<>();

    public GeteleptrInstr(IRBlock parent, IRVariable result, String className, IREntity ptrValue, IRType type) {
        super(parent);
        this.result = result;
        this.className = className;
        this.ptrValue = ptrValue;
        this.type = type;
    }

    @Override
    public String toString(){
        StringBuilder ret = new StringBuilder();
        ret.append(result.toString()).append(" = getelementptr ");
        if(className.startsWith("%class..")) {
            ret.append(className);
        } else{
            ret.append(type.toString());
        }
        ret.append(", ptr ").append(ptrValue.toString());
        for (IREntity idx : idxList) {
            ret.append(", ").append(idx.type.toString()).append(" ").append(idx.toString());
        }
        ret.append("\n");
        return ret.toString();
    }
}
