package IR.Util;

import java.util.HashMap;

public class ReNamer {
    public ReNamer parent;
    public HashMap<String, Integer> varNames = new HashMap<>();

    public ReNamer(ReNamer parent) {
        this.parent = parent;
        if (parent != null) {
            this.varNames = parent.varNames;
        }
    }
    public ReNamer getParent() {
        return parent;
    }
    public int getVarNum(String name, boolean countGlobal) {
        if(!countGlobal && parent == null) return -1;
        if(varNames.containsKey(name)) return varNames.get(name);
        else return parent.getVarNum(name, countGlobal);
    }
    public void addVar(String name) {
        if(varNames.containsKey(name)) varNames.put(name, varNames.get(name) + 1);
        else varNames.put(name, 1);
    }
}
