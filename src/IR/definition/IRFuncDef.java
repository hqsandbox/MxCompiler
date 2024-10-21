package IR.definition;

import IR.IRBlock;
import IR.IRVisitor;
import IR.instruction.Instruction;
import Util.type.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;


public class IRFuncDef extends IRStatement {
    public IRType returnType;
    public String functionName;
    public ArrayList<IRType> parameterTypeList = new ArrayList<>();
    public ArrayList<String> parameterNameList = new ArrayList<>();
    public ArrayList<IRBlock> blockList = new ArrayList<>();
    public HashMap<String, Integer> regMap = new HashMap<>();

    // useless
    public HashMap<String, String> paraMap = new HashMap<>(); // a0-a7
    public HashMap<String, Integer> offsetMap = new HashMap<>(); // paras more than 8

    public int stackSize = 0;
    public HashMap<String, Integer> nameMap = new HashMap<>();

    public IRFuncDef(IRType returnType_) {
        returnType = returnType_;
    }
    public IRFuncDef(IRType returnType_, String functionName_, ArrayList<IRType> parameterTypeList_, ArrayList<String> parameterNameList_) {
        returnType = returnType_;
        functionName = functionName_;
        parameterTypeList = parameterTypeList_;
        parameterNameList = parameterNameList_;
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
            stringBuilder.append("\n");
        }
        stringBuilder.append("}\n");
        return stringBuilder.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
    public int getPlace(String name) {
        if (nameMap.containsKey(name)) return nameMap.get(name);
        else {
            System.exit(0);
            throw new RuntimeException("getPlace error");
        }
    }

    public HashSet<String> getDef(){
        HashSet<String> def = new HashSet<>();
        for (IRBlock block : blockList) {
            for(Instruction instruction : block.instructions){
                def.add(instruction.getDef());
            }
        }
        return def;
    }
}
