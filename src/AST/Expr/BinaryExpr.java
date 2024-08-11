package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class BinaryExpr extends Expression {
    public String op;
    public Expression lhs, rhs;

    public BinaryExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
