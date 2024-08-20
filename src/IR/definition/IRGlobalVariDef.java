package IR.definition;

import Util.type.IRType;

public class IRGlobalVariDef extends IRStatement {
    public IRType irType;
    public String varName;
    public IRFuncDef funcDef;

    public IRGlobalVariDef(String varName) {
        this.varName = varName;
    }
    @Override
    public String toString() {
        return "global " + irType.toString() + " " + varName + "\n";
    }
}
