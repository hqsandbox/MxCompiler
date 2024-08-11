package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class PrimaryExpr extends Expression {
    public boolean isIdentifier = false;
    public boolean isThis = false;
    public boolean isNull = false;
    public boolean isTrue = false;
    public boolean isFalse = false;
    public boolean isIntLiteral = false;
    public boolean isStringLiteral = false;
    public boolean isFmtString = false;

    public String identifier = null;
    public String intLiteral = null;
    public String stringLiteral = null;
    public String fmtString = null;

    public PrimaryExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
