package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class PrefixExpr extends Expression {
    public String op;
    public Expression expr;

    public PrefixExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
