package Util.infor;

import Util.position;
import AST.Def.ClassTypeDef;
import Util.Type;
import java.util.ArrayList;
import java.util.HashMap;

public class ClassInfor {
    public String name;
    public HashMap<String, Type> variList = new HashMap<>();
    public HashMap<String, FuncInfor> funcList = new HashMap<>();

    public ClassInfor(ClassTypeDef it) {
        name = it.name;
        for(int i = 0; i < it.varList.size(); i++) {
            variList.put(it.varList.get(i).initVariablelist.get(0).name, it.varList.get(i).type);
        }
        for(int i = 0; i < it.funcList.size(); i++) {
            FuncInfor funcInfor = new FuncInfor(it.funcList.get(i));
            funcList.put(it.funcList.get(i).name, funcInfor);
        }
    }
    public ClassInfor(String name) {
        this.name = name;
    }
}
