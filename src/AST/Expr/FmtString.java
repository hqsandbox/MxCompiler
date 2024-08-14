package AST.Expr;

import AST.Expr.Expression;
import Util.position;
import AST.ASTVisitor;
import java.util.ArrayList;

public class FmtString extends Expression {

    public ArrayList<String> stringList = new ArrayList<>();
    public ArrayList<Expression> exprList = new ArrayList<>();

    public FmtString(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
