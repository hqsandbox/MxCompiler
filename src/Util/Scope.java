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

    public void defineVariable(String name, Type t, position pos) {
        if (variInfor.containsKey(name))
            throw new semanticError("Semantic Error: variable redefine", pos);
        variInfor.put(name, t);
    }
    public boolean containsVariable(String name, boolean lookUpon) {
        if (variInfor.containsKey(name)) return true;
        else if (parentScope != null && lookUpon)
            return parentScope.containsVariable(name, true);
        else return false;
    }
    public Type getType(String name, boolean lookUpon) {
        if (variInfor.containsKey(name)) return variInfor.get(name);
        else if (parentScope != null && lookUpon)
            return parentScope.getType(name, true);
        return null;
    }
    public boolean containsClass(String name) {
        return classInfor.containsKey(name);
    }
    public boolean containsFunc(String name) {
        return funcInfor.containsKey(name);
    }
}
