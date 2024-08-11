package Util.infor;

import Util.Type;
import java.util.ArrayList;
import AST.Def.*;

public class FuncInfor {
    public String name;
    public Type returnType;
    public ArrayList<Type> paraTypeList;

    public FuncInfor(FunctionDef it) {
        name = it.name;
        returnType = it.returnType;
        paraTypeList = new ArrayList<>();
        paraTypeList.addAll(it.parameters);
    }

}
