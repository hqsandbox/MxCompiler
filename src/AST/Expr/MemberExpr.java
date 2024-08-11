package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class MemberExpr extends Expression {
    public Expression base;
    public String memberName;

    public MemberExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
