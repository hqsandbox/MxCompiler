package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;

import java.util.ArrayList;

public class CallInstr extends Instruction {

    public IRVariable result = null;
    public String funcName;
    public ArrayList<IREntity> args = new ArrayList<>();

    public CallInstr(IRBlock parent, String funcName) {
        super(parent);
        this.funcName = funcName;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("call ").append(funcName).append(" ");
        for (IREntity arg : args) {
            sb.append(arg).append(", ");
        }
        sb.deleteCharAt(sb.length() - 1);
        return sb.toString();
    }
}
