package Util;

import java.util.HashMap;

public class Type {
    public boolean isInt = false, isBool = false;
    public boolean isString = false, isNull = false, isVoid = false;
    public boolean isClass = false;
    public String typeName = null;
    public int dim = 0;

    public Type(){
        isInt = false;
        isBool = false;
        isString = false;
        isNull = false;
        isVoid = false;
        isClass = false;
        typeName = null;
        dim = 0;
    }

    public Type(String typeName, int dim) {
        this.typeName = typeName;
        this.dim = dim;
        if (typeName.equals("int")) {
            isInt = true;
        } else if (typeName.equals("bool")) {
            isBool = true;
        } else if (typeName.equals("string")) {
            isString = true;
        } else if (typeName.equals("void")) {
            isVoid = true;
        } else if (typeName.equals("null")) {
            isNull = true;
        } else {
            isClass = true;
        }
    }

    public Type(Type type) {
        this.isInt = type.isInt;
        this.isBool = type.isBool;
        this.isString = type.isString;
        this.isNull = type.isNull;
        this.isVoid = type.isVoid;
        this.isClass = type.isClass;
        this.typeName = type.typeName;
        this.dim = type.dim;
    }

    public boolean equals(Type other) {
        if (other.isNull) {
            if (isNull) return true;
            if (isVoid) return false;
            if (dim > 0) return true;
            return isClass;
        }
        if (isVoid && other.isVoid) return true;
        return !isVoid && !other.isVoid && typeName.equals(other.typeName) && dim == other.dim;
    }

    public void setInt() {
        isInt = true;
        isBool = false;
        isString = false;
        isNull = false;
        isVoid = false;
        isClass = false;
        typeName = "int";
        dim = 0;
    }

    public void setBool() {
        isInt = false;
        isBool = true;
        isString = false;
        isNull = false;
        isVoid = false;
        isClass = false;
        typeName = "bool";
        dim = 0;
    }

    public void setString() {
        isInt = false;
        isBool = false;
        isString = true;
        isNull = false;
        isVoid = false;
        isClass = false;
        typeName = "string";
        dim = 0;
    }

    public void setVoid() {
        isInt = false;
        isBool = false;
        isString = false;
        isNull = false;
        isVoid = true;
        isClass = false;
        typeName = "void";
        dim = 0;
    }

    public void setNull() {
        isInt = false;
        isBool = false;
        isString = false;
        isNull = true;
        isVoid = false;
        isClass = false;
        typeName = "null";
        dim = 0;
    }

    public void setClass(String className) {
        isInt = false;
        isBool = false;
        isString = false;
        isNull = false;
        isVoid = false;
        isClass = true;
        typeName = className;
        dim = 0;
    }

    public void setDim(int dim) {
        this.dim = dim;
    }

    public boolean equalType(Type type) {
        if (isBool && type.isBool && dim == type.dim) return true;
        if (isInt && type.isInt && dim == type.dim) return true;
        if (isString && type.isString && dim == type.dim) return true;
        if (isNull && type.isNull) return true;
        if (isVoid && type.isVoid) return true;
        return isClass && type.isClass && typeName.equals(type.typeName) && dim == type.dim;
    }

    // TODO
    // 参数里面的 type赋值给 this
    public boolean canAssign(Type type) {
        if (isBool && type.isBool && dim == type.dim) return true;
        if (isInt && type.isInt && dim == type.dim) return true;
        if (isString && type.isString && dim == type.dim) return true;
        if (isNull && type.isNull) return true;
        if (dim > 0 && type.isNull) return true;
        if (isVoid && type.isVoid) return true;
        return isClass && type.isClass && typeName.equals(type.typeName) && dim == type.dim;
    }

    public void setArray(Type typeBase) {
        isInt = typeBase.isInt;
        isBool = typeBase.isBool;
        isString = typeBase.isString;
        isNull = typeBase.isNull;
        isVoid = typeBase.isVoid;
        isClass = typeBase.isClass;
        typeName = typeBase.typeName;
    }
}
