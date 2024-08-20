package AST.Def;

import AST.ASTVisitor;
import java.util.ArrayList;
import AST.Stmt.Suite;
import Util.position;
import Util.type.Type;

public class FunctionDef extends Definition {
    public String name;
    public Type returnType;
    public ArrayList<Type> parameters = new ArrayList<>();
    public ArrayList<String> parameterNames = new ArrayList<>();
    public Suite body;

    public FunctionDef(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
