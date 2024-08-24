package IR;

import IR.definition.IRClassDef;
import IR.definition.IRFuncDef;
import IR.definition.IRGlobalVariDef;

public class IRPrinter {

    public IRProgram irProgram;

    public IRPrinter(IRProgram irProgram) {
        this.irProgram = irProgram;
    }

    public String printString() {
        StringBuilder ret = new StringBuilder();
        for(IRGlobalVariDef irGlobal : irProgram.globalVarDefMap.values()) {
            ret.append(irGlobal.toString());
        }
        for(IRFuncDef irFunction : irProgram.funcDefMap.values()) {
            ret.append(irFunction.toString());
        }
        for(IRClassDef irClass : irProgram.classDefMap.values()) {
            ret.append(irClass.toString());
        }
        ret.append(printDeclare());
        return ret.toString();
    }

    // example: declare i32 @println(ptr)
    public String printDeclare(){
        StringBuilder ret = new StringBuilder();
        ret.append("declare void @print(ptr)\n");
        ret.append("declare void @println(ptr)\n");
        ret.append("declare void @printInt(i32)\n");
        ret.append("declare void @printlnInt(i32)\n");
        ret.append("declare ptr @getString()\n");
        ret.append("declare i32 @getInt()\n");
        ret.append("declare ptr @toString(i32)\n");
        return ret.toString();
    }

    public void print() {
        System.out.println(printString());
    }

}
