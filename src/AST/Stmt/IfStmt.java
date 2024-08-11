package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.Expression;
import Util.position;

public class IfStmt extends StmtNode {
    public StmtNode thenStmt, elseStmt;
    public Expression condition;

    public IfStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
