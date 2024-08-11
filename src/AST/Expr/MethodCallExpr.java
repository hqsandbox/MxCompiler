package AST.Expr;

import java.util.ArrayList;
import AST.*;
import Util.position;

public class MethodCallExpr extends Expression {
    public Expression base;
    public String methodName;
    public ParallelExp callExpList;

    public MethodCallExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
