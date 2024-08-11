package AST.Expr;

import AST.ASTVisitor;
import Util.position;
import AST.Expr.Expression;

public class ArrayExpr extends Expression {
    public Expression baseType;
    public Expression size;

    public ArrayExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
