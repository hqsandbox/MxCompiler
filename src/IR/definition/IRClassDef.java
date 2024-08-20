package IR.definition;

import java.util.ArrayList;
import java.util.List;
import AST.Def.VariableDef;

public class IRClassDef extends IRStatement {
    public String className;
    public int classMemNum;
    public ArrayList<Boolean> isPtrList = new ArrayList<>();
    public ArrayList<VariableDef> variableDefList = new ArrayList<>();

    public IRClassDef(String className_) {
        className = "%class-" + className_;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(className).append(" = type { ");
        for (int i = 0; i < classMemNum; ++i) {
            if (i != 0) sb.append(", ");
            if (isPtrList.get(i)) sb.append("i8*");
            else sb.append("i32");
        }
        sb.append(" }\n");
        return sb.toString();
    }
}
