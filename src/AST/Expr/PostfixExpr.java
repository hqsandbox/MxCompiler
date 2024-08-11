package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class PostfixExpr extends Expression {
    public Expression expr;
    public String op;

    public PostfixExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
