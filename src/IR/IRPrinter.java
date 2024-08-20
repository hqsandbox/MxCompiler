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
        for(IRFuncDef irFunction : irProgram.funcDefMap.values()) {
            ret.append(irFunction.toString());
        }
        for(IRClassDef irClass : irProgram.classDefMap.values()) {
            ret.append(irClass.toString());
        }
        for(IRGlobalVariDef irGlobal : irProgram.globalVarDefMap.values()) {
            ret.append(irGlobal.toString());
        }
        return ret.toString();
    }

    public void print() {
        System.out.println(printString());
    }

}
