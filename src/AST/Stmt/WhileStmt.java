package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.Expression;
import Util.position;

public class WhileStmt extends StmtNode {
    public StmtNode body;
    public Expression condition;

    public WhileStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
