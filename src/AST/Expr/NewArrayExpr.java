package AST.Expr;

import Util.Type;
import AST.ASTVisitor;
import Util.position;
import java.util.ArrayList;
import AST.Literal;

public class NewArrayExpr extends Expression {
    public Type baseType;
    public ArrayList<Expression> size = new ArrayList<>();
    public ArrayList<Literal> literal = new ArrayList<>();

    public NewArrayExpr(position pos) {
        super(pos);
        isAssignable = true;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
