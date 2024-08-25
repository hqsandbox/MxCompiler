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
        for(IRClassDef irClass : irProgram.classDefMap.values()) {
            ret.append(irClass.toString());
        }
        for(IRFuncDef irFunction : irProgram.funcDefMap.values()) {
            ret.append(irFunction.toString());
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
        ret.append("declare ptr @string.copy(ptr)\n");
        ret.append("declare i32 @string.length(ptr)\n");
        ret.append("declare ptr @string.substring(ptr, i32, i32)\n");
        ret.append("declare i32 @string.parseInt(ptr)\n");
        ret.append("declare i32 @string.ord(ptr, i32)\n");
        ret.append("declare ptr @string.add(ptr, ptr)\n");
        ret.append("declare i1 @string.equal(ptr, ptr)\n");
        ret.append("declare i1 @string.notEqual(ptr, ptr)\n");
        ret.append("declare i1 @string.less(ptr, ptr)\n");
        ret.append("declare i1 @string.lessOrEqual(ptr, ptr)\n");
        ret.append("declare i1 @string.greater(ptr, ptr)\n");
        ret.append("declare i1 @string.greaterOrEqual(ptr, ptr)\n");
        ret.append("declare i32 @array.size(ptr)\n");
        ret.append("declare ptr @_malloc(i32)\n");
        ret.append("declare ptr @__alloca_helper(i32, i32)\n");
        ret.append("declare ptr @__array.alloca_inside(i32, i32, ptr, i32)\n");
        ret.append("declare ptr @__array.alloca(i32, i32, i32, ...)\n");
        ret.append("declare ptr @Int_toString(i32)\n");
        ret.append("declare ptr @Bool_toString(i1)\n");
        return ret.toString();
    }

    public void print() {
        System.out.println(printString());
    }

}
