package IR;

import IR.definition.*;
import java.util.ArrayList;
import java.util.HashMap;

public class IRProgram {

    public ArrayList<IRFuncDef> funcDefs = new ArrayList<>();
    public HashMap<String, IRFuncDef> funcDefMap = new HashMap<>();
    public HashMap<String, IRClassDef> classDefMap = new HashMap<>();
    public HashMap<String, IRGlobalVariDef> globalVarDefMap = new HashMap<>();

}
