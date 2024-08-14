package AST.Expr;

import AST.ASTVisitor;
import Util.position;
import AST.Expr.Expression;
import java.util.ArrayList;

public class Arrayconst extends Expression {

    public ArrayList<Literal> literal = new ArrayList<>();

    public Arrayconst(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
