package AST.Expr;

import AST.ASTVisitor;
import Util.position;

public class Literal extends Expression {
    public boolean isString;
    public boolean isInt;
    public boolean isTrue;
    public boolean isFalse;
    public boolean isNull;
    public boolean isArrayConst;

    public String stringValue;
    public int intValue;
    public Arrayconst arrayconst = null;

    public Literal(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
