package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class AssignExpr extends Expression {
    public Expression lhs, rhs;

    public AssignExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
