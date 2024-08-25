package IR.definition;

import IR.entity.IREntity;
import IR.entity.IRVariable;
import Util.type.IRType;

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
            int size = myString.length();
            myString = myString + "\\00";
            size++;
            return varName + " = " + "private unnamed_addr constant [" + size + " x i8] c\"" + myString + "\"\n";
        }
        if(irType.isPtr() && result.toString().equals("")){
            return varName + " = " + "global " + irType.toString() + " null\n";
        }
        return varName + " = " + "global " + irType.toString() + " " + result.toString() + "\n";
    }
}
