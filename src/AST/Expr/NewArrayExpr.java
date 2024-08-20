package AST.Expr;

import Util.type.Type;
import AST.ASTVisitor;
import Util.position;
import java.util.ArrayList;

public class NewArrayExpr extends Expression {
    public Type baseType;
    public ArrayList<Expression> size = new ArrayList<>();
    public Arrayconst arrayconst = null;

    public NewArrayExpr(position pos) {
        super(pos);
        isAssignable = true;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
