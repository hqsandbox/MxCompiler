package IR;

import IR.definition.*;
import Util.infor.FuncInfor;
import Util.type.IRType;

import java.util.ArrayList;
import java.util.HashMap;

public class IRProgram {

    public HashMap<String, IRFuncDef> funcDefs = new HashMap<>();
    public HashMap<String, IRFuncDef> funcDefMap = new HashMap<>();
    public HashMap<String, IRClassDef> classDefMap = new HashMap<>();
    public HashMap<String, IRGlobalVariDef> globalVarDefMap = new HashMap<>();

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
