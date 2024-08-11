package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class ConditionalExpr extends Expression {
    public Expression condition;
    public Expression trueBranch;
    public Expression falseBranch;

    public ConditionalExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
