package AST.Def;

import AST.ASTVisitor;
import java.util.ArrayList;
import Util.position;
import Util.Scope;


public class ClassTypeDef extends Definition {
    public String name;
    public ArrayList<VariableDef> varList = new ArrayList<>();
    public ArrayList<FunctionDef> funcList = new ArrayList<>();

    public ClassTypeDef(String name, position pos) {
        super(pos);
        this.name = name;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
