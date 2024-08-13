package Util;

import Util.error.semanticError;

import java.util.HashMap;
import Util.infor.*;

public class Scope {

    public HashMap<String, Type> variInfor = new HashMap<>();
    public HashMap<String, FuncInfor> funcInfor = new HashMap<>();
    public HashMap<String, ClassInfor> classInfor = new HashMap<>();

    public Scope parentScope;

    public Scope(Scope parentScope) {
        this.parentScope = parentScope;
    }

    public void addFuncInfo(String name, FuncInfor infor, position pos) {
        if (funcInfor.containsKey(name))
            throw new semanticError("multiple definition of " + name, pos);
        funcInfor.put(name, infor);
    }
    public void addClassInfo(String name, ClassInfor infor, position pos) {
        if(name.equals("main")){
            throw new semanticError("main function should not be defined", pos);
        }
        if (classInfor.containsKey(name))
            throw new semanticError("multiple definition of " + name, pos);
        classInfor.put(name, infor);
    }
    public FuncInfor getFuncInfo(String name) {
        if (funcInfor.containsKey(name)) return funcInfor.get(name);
        throw new semanticError("no such function: " + name, new position(0, 0));
    }
    public ClassInfor getClassInfo(String name) {
        if (classInfor.containsKey(name)) return classInfor.get(name);
        throw new semanticError("no such type: " + name, new position(0, 0));
    }

    public Scope parentScope() {
        return parentScope;
    }

    public void defineVariable(String name, Type t, position pos, boolean lookUpon) {
        // 错误：这里的 variable需要向上找
        if(lookUpon){
            if (containsVariable(name, true))
                throw new semanticError("Semantic Error: variable redefine", pos);
        } else{
            if (containsVariable(name, false))
                throw new semanticError("Semantic Error: variable redefine", pos);
        }
        variInfor.put(name, t);
    }
    public boolean containsVariable(String name, boolean lookUpon) {
        if (lookUpon) {
            if (variInfor.containsKey(name)) return true;
            if (parentScope != null) return parentScope.containsVariable(name, true);
            return false;
        }
        return variInfor.containsKey(name);
    }
    public Type getType(String name, boolean lookUpon) {
        if (variInfor.containsKey(name)) return new Type(variInfor.get(name));
        if (classInfor.containsKey(name)) return new Type(classInfor.get(name).name, 0);
        if (funcInfor.containsKey(name)) return new Type(funcInfor.get(name).name, 0);
        if (lookUpon) {
            if (parentScope != null) return parentScope.getType(name, true);
            return null;
        }
        return null;
    }
    public boolean containsClass(String name, boolean lookUpon) {
        if (lookUpon) {
            if (classInfor.containsKey(name)) return true;
            if (parentScope != null) return parentScope.containsClass(name, true);
            return false;
        }
        return classInfor.containsKey(name);
    }
    public boolean containsFunc(String name, boolean lookUpon) {
        if (lookUpon) {
            if (funcInfor.containsKey(name)) return true;
            if (parentScope != null) return parentScope.containsFunc(name, true);
            return false;
        }
        return funcInfor.containsKey(name);
    }
    public void visitInfunc(){
        addFuncInfo("print", new FuncInfor("print", "void", "string"), null);
        addFuncInfo("println", new FuncInfor("println", "void", "string"), null);
        addFuncInfo("printInt", new FuncInfor("printInt", "void", "int"), null);
        addFuncInfo("printlnInt", new FuncInfor("printlnInt", "void", "int"), null);
        addFuncInfo("getString", new FuncInfor("getString", "string", "empty"), null);
        addFuncInfo("getInt", new FuncInfor("getInt", "int", "empty"), null);
        addFuncInfo("toString", new FuncInfor("toString", "string", "int"), null);
    }
    public void visitInclass(){
        ClassInfor stringInfor = new ClassInfor("string");
        stringInfor.funcList.put("length", new FuncInfor("length", "int", "empty"));
        FuncInfor substringInfor = new FuncInfor("substring", "string", "int");
        substringInfor.paraTypeList.add(new Type("int", 0));
        stringInfor.funcList.put("substring", substringInfor);
        stringInfor.funcList.put("parseInt", new FuncInfor("parseInt", "int", "empty"));
        stringInfor.funcList.put("ord", new FuncInfor("ord", "int", "int"));
        addClassInfo("string", stringInfor, null);
    }
}
