package Util.infor;

import Util.type.Type;
import java.util.ArrayList;
import AST.Def.*;

public class FuncInfor {
    public String name;
    public Type returnType;
    public ArrayList<Type> paraTypeList = new ArrayList<>();

    public FuncInfor(FunctionDef it) {
        name = it.name;
        returnType = it.returnType;
        paraTypeList.addAll(it.parameters);
    }
    public FuncInfor(String name, String returnType, String paraType) {
        this.name = name;
        switch (returnType) {
            case "int":
                Type type = new Type();
                type.setInt();
                this.returnType = type;
                break;
            case "bool":
                Type type1 = new Type();
                type1.setBool();
                this.returnType = type1;
                break;
            case "string":
                Type type2 = new Type();
                type2.setString();
                this.returnType = type2;
                break;
            case "void":
                Type type3 = new Type();
                type3.setVoid();
                this.returnType = type3;
                break;
            default:
                throw new RuntimeException("unknown type");
        }
        switch (paraType) {
            case "int":
                Type type = new Type();
                type.setInt();
                paraTypeList.add(type);
                break;
            case "bool":
                Type type1 = new Type();
                type1.setBool();
                paraTypeList.add(type1);
                break;
            case "string":
                Type type2 = new Type();
                type2.setString();
                paraTypeList.add(type2);
                break;
            case "empty":
                break;
            default:
                throw new RuntimeException("unknown type");
        }

    }

}
