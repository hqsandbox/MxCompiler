package AST.Stmt;

import AST.ASTNode;
import AST.ASTVisitor;
import Util.position;

public class ExprStmt extends StmtNode {
    public ASTNode expr;

    public ExprStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
