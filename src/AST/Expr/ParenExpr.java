package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class ParenExpr extends Expression {
    public Expression expr;

    public ParenExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
