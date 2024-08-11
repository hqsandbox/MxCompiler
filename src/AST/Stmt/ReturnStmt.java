package AST.Stmt;

import AST.ASTVisitor;
import AST.Expr.Expression;
import Util.position;

public class ReturnStmt extends StmtNode {
    public Expression expr;

    public ReturnStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
