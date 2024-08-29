package IR.definition;

import IR.entity.IREntity;
import IR.entity.IRVariable;
import Util.type.IRType;
import IR.IRVisitor;

public class IRGlobalVariDef extends IRStatement {
    public IRType irType;
    public String varName;
    public IRFuncDef funcDef;
    public IREntity result;

    public IRGlobalVariDef(String varName) {
        this.varName = varName;
    }
    @Override
    public String toString() {
        if(varName.startsWith("@.str")){
            String myString = result.toString();
            if(myString.startsWith("\"") && myString.endsWith("\"")){
                myString = myString.substring(1, myString.length() - 1);
            }
            String tmp = myString.replace("\\\"", "\042");
            tmp = tmp.replace("\\n", "\012");
            tmp = tmp.replace("\\\\", "\134");
            myString = myString.replace("\\\"", "\\22");
            myString = myString.replace("\\n", "\\0A");
            myString = myString + "\\00";
            int size = tmp.length() + 1;
            return varName + " = " + "private unnamed_addr constant [" + size + " x i8] c\"" + myString + "\"\n";
        }
        if(irType.isPtr() && result.toString().equals("")){
            return varName + " = " + "global " + irType.toString() + " null\n";
        }
        return varName + " = " + "global " + irType.toString() + " " + result.toString() + "\n";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
