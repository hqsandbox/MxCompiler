package IR.definition;

import IR.IRBlock;
import Util.type.*;
import java.util.ArrayList;


public class IRFuncDef extends IRStatement {
    public IRType returnType;
    public String functionName;
    public ArrayList<IRType> parameterTypeList = new ArrayList<>();
    public ArrayList<String> parameterNameList = new ArrayList<>();
    public ArrayList<IRBlock> blockList = new ArrayList<>();

    public IRFuncDef(IRType returnType_) {
        returnType = returnType_;
    }
    public IRBlock addBlock(IRBlock block) {
        blockList.add(block);
        return block;
    }
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("define ").append(returnType.toString()).append(" @").append(functionName).append("(");
        for (int i = 0; i < parameterTypeList.size(); ++i) {
            if (i > 0) stringBuilder.append(", ");
            stringBuilder.append(parameterTypeList.get(i).toString()).append(" ").append(parameterNameList.get(i));
        }
        stringBuilder.append(") {\n");
        for (IRBlock block : blockList) {
            stringBuilder.append(block.toString());
        }
        stringBuilder.append("}\n");
        return stringBuilder.toString();
    }


}
