package AST.Expr;

import AST.ASTNode;
import Util.type.Type;
import AST.ASTVisitor;
import Util.position;


abstract public class Expression extends ASTNode {
    public Type type;
    public boolean isAssignable = false;

    public Expression(position pos) {
        super(pos);
    }

    @Override
    public abstract void accept(ASTVisitor visitor);
}
