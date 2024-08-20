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
    public int getVarNum(String name) {
        if(varNames.containsKey(name)) return varNames.get(name);
        else return parent == null ? -1 : parent.getVarNum(name);
    }
    public void addVar(String name) {
        if(varNames.containsKey(name)) varNames.put(name, varNames.get(name) + 1);
        else varNames.put(name, 1);
    }
}
