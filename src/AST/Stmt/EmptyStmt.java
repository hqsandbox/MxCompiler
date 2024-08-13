package AST.Stmt;

import AST.ASTNode;
import AST.ASTVisitor;
import Util.position;

public class EmptyStmt extends StmtNode {

    public EmptyStmt(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
