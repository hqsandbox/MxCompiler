package IR.definition;

import java.util.ArrayList;
import java.util.List;
import AST.Def.VariableDef;
import IR.IRVisitor;
import Util.type.IRType;

public class IRClassDef extends IRStatement {
    public String className;
    public ArrayList<IRType> variableTypeList = new ArrayList<>();
    public List<String> memberNameList = new ArrayList<>();
    public int classSize = 0;

    public IRClassDef(String className_) {
        className = "%class.." + className_;
    }

    @Override
    public String toString() {
        if(className.equals("%class..string")) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(className).append(" = type { ");
        for (int i = 0; i < memberNameList.size(); ++i) {
            if (i != 0) sb.append(", ");
            sb.append("i32");
        }
        sb.append(" }\n");
        return sb.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
