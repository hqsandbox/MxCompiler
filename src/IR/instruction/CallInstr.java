package IR.instruction;

import IR.IRBlock;
import IR.entity.IREntity;
import IR.entity.IRVariable;
import Util.type.IRType;

import java.util.ArrayList;

public class CallInstr extends Instruction {

    public IRVariable result = null;
    public String funcName;
    public ArrayList<IRType> argTypes = new ArrayList<>();
    public ArrayList<IREntity> args = new ArrayList<>();

    public CallInstr(IRBlock parent, String funcName, IRVariable result) {
        super(parent);
        this.funcName = funcName;
        this.result = result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        if(!result.type.isVoid()){
            sb.append(result.toString()).append(" = ");
        }
        sb.append("call ").append(result.type.toString()).append(" ").append("@");
        sb.append(funcName).append("(");
        for (int i = 0; i < argTypes.size(); ++i) {
            if (i > 0) sb.append(", ");
            sb.append(argTypes.get(i).toString()).append(" ").append(args.get(i).toString());
        }
        sb.append(")");
        sb.append("\n");
        return sb.toString();
    }
}
