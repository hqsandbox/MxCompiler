package AST.Expr;

import java.util.ArrayList;
import AST.*;
import Util.position;

public class FuncCallExpr extends Expression {
    public String funcName;
    public ParallelExp callExpList;
    public FuncCallExpr(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
