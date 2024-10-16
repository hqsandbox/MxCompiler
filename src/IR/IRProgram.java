package IR;

import ASM.section.ASMText;
import IR.definition.*;
import Util.infor.FuncInfor;
import Util.type.IRType;
import org.antlr.v4.runtime.misc.Pair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class IRProgram {

    public HashMap<String, IRFuncDef> funcDefs = new HashMap<>();
    public HashMap<String, IRFuncDef> funcDefMap = new HashMap<>();
    public HashMap<String, IRClassDef> classDefMap = new HashMap<>();
    public HashMap<String, IRGlobalVariDef> globalVarDefMap = new HashMap<>();
    public HashMap<String, Integer> regMap = null; // 寄存器分配，用于记录变量的寄存器编号
    public List<Pair<IRBlock, IRBlock>> criticalEdge = new ArrayList<>();
    public HashMap<IRBlock, ASMText> blockTextMap = new HashMap<>();

    public void visitInfunc(){
        var paraType1 = new ArrayList<IRType>();paraType1.add(new IRType("ptr"));
        funcDefs.put("print", new IRFuncDef(new IRType("void"), "print", paraType1, new ArrayList<>()));
        var paraType2 = new ArrayList<IRType>();paraType2.add(new IRType("ptr"));
        funcDefs.put("println", new IRFuncDef(new IRType("void"), "println", paraType2, new ArrayList<>()));
        var paraType3 = new ArrayList<IRType>();paraType3.add(new IRType("int"));
        funcDefs.put("printInt", new IRFuncDef(new IRType("void"), "printInt", paraType3, new ArrayList<>()));
        var paraType4 = new ArrayList<IRType>();paraType4.add(new IRType("int"));
        funcDefs.put("printlnInt", new IRFuncDef(new IRType("void"), "printlnInt", paraType4, new ArrayList<>()));
        funcDefs.put("getString", new IRFuncDef(new IRType("string"), "getString", new ArrayList<>(), new ArrayList<>()));
        funcDefs.put("getInt", new IRFuncDef(new IRType("int"), "getInt", new ArrayList<>(), new ArrayList<>()));
        var paraType5 = new ArrayList<IRType>();paraType5.add(new IRType("int"));
        funcDefs.put("toString", new IRFuncDef(new IRType("string"), "toString", paraType5, new ArrayList<>()));
        var paraType6 = new ArrayList<IRType>();paraType6.add(new IRType("string"));
        funcDefs.put("string.copy", new IRFuncDef(new IRType("string"), "string.copy", paraType6, new ArrayList<>()));
        var paraType7 = new ArrayList<IRType>();paraType7.add(new IRType("string"));
        funcDefs.put("string.length", new IRFuncDef(new IRType("int"), "string.length", paraType7, new ArrayList<>()));
        var paraType8 = new ArrayList<IRType>();
        paraType8.add(new IRType("string"));paraType8.add(new IRType("int"));paraType8.add(new IRType("int"));
        funcDefs.put("string.substring", new IRFuncDef(new IRType("string"), "string.substring", paraType8, new ArrayList<>()));
        var paraType9 = new ArrayList<IRType>();paraType9.add(new IRType("string"));
        funcDefs.put("string.parseInt", new IRFuncDef(new IRType("int"), "string.parseInt", paraType9, new ArrayList<>()));
        var paraType10 = new ArrayList<IRType>();paraType10.add(new IRType("string"));paraType10.add(new IRType("int"));
        funcDefs.put("string.ord", new IRFuncDef(new IRType("int"), "string.ord", paraType10, new ArrayList<>()));
        var paraType11 = new ArrayList<IRType>();paraType11.add(new IRType("string"));paraType11.add(new IRType("string"));
        funcDefs.put("string.add", new IRFuncDef(new IRType("string"), "string.add", paraType11, new ArrayList<>()));
        var paraType12 = new ArrayList<IRType>();paraType12.add(new IRType("string"));paraType12.add(new IRType("string"));
        funcDefs.put("string.equal", new IRFuncDef(new IRType("bool"), "string.equal", paraType12, new ArrayList<>()));
        var paraType13 = new ArrayList<IRType>();paraType13.add(new IRType("string"));paraType13.add(new IRType("string"));
        funcDefs.put("string.notEqual", new IRFuncDef(new IRType("bool"), "string.notEqual", paraType13, new ArrayList<>()));
        var paraType14 = new ArrayList<IRType>();paraType14.add(new IRType("string"));paraType14.add(new IRType("string"));
        funcDefs.put("string.less", new IRFuncDef(new IRType("bool"), "string.less", paraType14, new ArrayList<>()));
        var paraType15 = new ArrayList<IRType>();paraType15.add(new IRType("string"));paraType15.add(new IRType("string"));
        funcDefs.put("string.lessOrEqual", new IRFuncDef(new IRType("bool"), "string.lessOrEqual", paraType15, new ArrayList<>()));
        var paraType16 = new ArrayList<IRType>();paraType16.add(new IRType("string"));paraType16.add(new IRType("string"));
        funcDefs.put("string.greater", new IRFuncDef(new IRType("bool"), "string.greater", paraType16, new ArrayList<>()));
        var paraType17 = new ArrayList<IRType>();paraType17.add(new IRType("string"));paraType17.add(new IRType("string"));
        funcDefs.put("string.greaterOrEqual", new IRFuncDef(new IRType("bool"), "string.greaterOrEqual", paraType17, new ArrayList<>()));
        var paraType18 = new ArrayList<IRType>();paraType18.add(new IRType("string"));
        funcDefs.put("array.size", new IRFuncDef(new IRType("int"), "array.size", paraType18, new ArrayList<>()));
        var paraType19 = new ArrayList<IRType>();paraType19.add(new IRType("int"));
        funcDefs.put("_malloc", new IRFuncDef(new IRType("ptr"), "_malloc", paraType19, new ArrayList<>()));
        var paraType20 = new ArrayList<IRType>();paraType20.add(new IRType("int"));paraType20.add(new IRType("int"));
        funcDefs.put("__alloca_helper", new IRFuncDef(new IRType("ptr"), "__alloca_helper", paraType20, new ArrayList<>()));
        var paraType21 = new ArrayList<IRType>();paraType21.add(new IRType("int"));paraType21.add(new IRType("int"));
        funcDefs.put("__array_alloca_inside", new IRFuncDef(new IRType("ptr"), "__array_alloca_inside", paraType21, new ArrayList<>()));
        var paraType22 = new ArrayList<IRType>();
        paraType22.add(new IRType("int"));paraType22.add(new IRType("int"));
        paraType22.add(new IRType("int"));paraType22.add(new IRType("int"));
        funcDefs.put("__array_alloca_inside", new IRFuncDef(new IRType("ptr"), "__array_alloca_inside", paraType22, new ArrayList<>()));
        var paraType23 = new ArrayList<IRType>();paraType23.add(new IRType("int"));
        funcDefs.put("Int_toString", new IRFuncDef(new IRType("string"), "Int_toString", paraType23, new ArrayList<>()));
        var paraType24 = new ArrayList<IRType>();paraType24.add(new IRType("bool"));
        funcDefs.put("Bool_toString", new IRFuncDef(new IRType("string"), "Bool_toString", paraType24, new ArrayList<>()));


//        void *__array_alloca(int size, int depth, int length, ...) {
//            va_list ap;
//            int *a = (int *)malloc(sizeof(int) * length);
//            va_start(ap, length);
//            for (int i = 0; i < length; i++) {
//                a[i] = va_arg(ap, int);
//            }
//            va_end(ap);
//            return __array_alloca_inside(size, depth, a, length);
//        }
    }

    public void visitInClass(){
        IRClassDef myClass = new IRClassDef("string");
        classDefMap.put("string", myClass);
//        classDefMap.put("array", new IRClassDef("array"));
    }

    public IRFuncDef getFuncDef(String name){
        if(funcDefMap.containsKey(name)) return funcDefMap.get(name);
        return funcDefs.get(name);
    }
    public IRClassDef getClassDef(String name){
        return classDefMap.get(name);
    }

}
