package IR.Util;

import java.util.HashMap;

public class ReNamer {
    public ReNamer parent;
    public HashMap<String, Integer> totalVarNames = new HashMap<>();
    public HashMap<String, Integer> varNames = new HashMap<>();

    public ReNamer(ReNamer parent) {
        this.parent = parent;
        if (parent != null) {
            this.varNames = new HashMap<>();
            this.varNames.putAll(parent.varNames);
            this.totalVarNames = parent.totalVarNames;
        }
    }
    public ReNamer getParent() {
        return parent;
    }

    // 定义时使用，表示实际上有过几个该变量
    public int getTotalVarNum(String name) {
        return totalVarNames.getOrDefault(name, -1);
    }

    // 使用时使用，表示当前作用域内该变量的序号
    public int getCurrentVarNum(String name, boolean countGlobal) {
        if(!countGlobal && parent == null) return -1;
        if(varNames.containsKey(name)) return varNames.get(name);
        else return parent.getCurrentVarNum(name, countGlobal);
    }

    // 增加变量，只在 initVariable中使用
    public void addVar(String name) {
//        if(varNames.containsKey(name)) varNames.put(name, varNames.get(name) + 1);
//        else varNames.put(name, 1);
        if(totalVarNames.containsKey(name)){
            totalVarNames.put(name, totalVarNames.get(name) + 1);
            varNames.put(name, totalVarNames.get(name));
        }
        else {
            totalVarNames.put(name, 1);
            varNames.put(name, 1);
        }
    }
}
